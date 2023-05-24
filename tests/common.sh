#!/usr/bin/env bash

export TEST_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export MEDIA_DIR="$TEST_DIR/media"
export SETUP_DIR="$TEST_DIR/setup"

export OC_HOST_DEFAULT=http://localhost:8080
export OC_HOST_ORCA=http://ingest.orca.educast.internal-cloud
export OC_ORGANIZATION=mh_default_org
export OC_USERNAME=opencast
export OC_PASSWORD=opencast

export OC_ACL_BASE="
  ROLE_ADMIN read
  ROLE_ADMIN write
  ROLE_ADMIN annotate
  ROLE_ADMIN annotate-admin
"

export OC_ACL_PUBLIC="
  $OC_ACL_BASE

  ROLE_ANONYMOUS read

  ROLE_USER read
  ROLE_USER annotate
"

export OC_ACL_ORGANIZATION="
  $OC_ACL_BASE

  ROLE_GROUP_EDUCAST_MH_DEFAULT_ORG_USERS read
  ROLE_GROUP_EDUCAST_MH_DEFAULT_ORG_USERS annotate
"

export OC_ACL_PRIVATE="
  $OC_ACL_BASE

  ROLE_EDUCAST_PRIVATE read
"



########### Logging ###########

EDUCAST_DEBUG=${EDUCAST_DEBUG:false}

log()       { >&2 echo "$(date +%Y-%m-%dT%T) | $*"; }
log_debug() { [ "$EDUCAST_DEBUG" != "true" ] || log "DEBUG | $*"; }
log_info()  { log "INFO  | $*"; }
log_warn()  { log "WARN  | $*"; }
log_error() { log "ERROR | $*"; }
log_fatal() { log "FATAL | $*"; exit 1; }



########### HTTP ###########

oc_http() {
  local http_host
  local http_path="$1"
  shift

  case "$OC_ORGANIZATION" in
    orca) http_host=$OC_HOST_ORCA    ;;
    *)    http_host=$OC_HOST_DEFAULT ;;
  esac

  log_debug "HTTP call: $oc_http_method $http_host$http_path"

  curl -s -f -X "$oc_http_method" \
    --digest -u "$OC_USERNAME:$OC_PASSWORD" \
    -H "X-Requested-Auth: Digest" \
    "$http_host$http_path" \
    "$@"
}

oc_http_get()    { oc_http_method=GET    oc_http "$@"; }
oc_http_put()    { oc_http_method=PUT    oc_http "$@"; }
oc_http_post()   { oc_http_method=POST   oc_http "$@"; }
oc_http_delete() { oc_http_method=DELETE oc_http "$@"; }



########### Media Package ###########

oc_mediapackage_create() {
  local mp="$(mktemp)"

  log_info "Create mediapackage"
  oc_http_get "/ingest/createMediaPackage" -o "$mp"
  echo "$mp"
}

oc_mediapackage_create_with_id() {
  local mp="$(mktemp)"
  local id=$1

  log_info "Create mediapackage with id $id"
  oc_http_put "/ingest/createMediaPackageWithID/$id" -o "$mp"
  echo "$mp"
}

oc_mediapackage_add_attachment() {
  local mp="$1"
  local flavor="$2"
  local attachment="$3"

  log_info "Add attachment with flavor $flavor"
  oc_http_post "/ingest/addAttachment" \
    -F "mediaPackage=<$mp" \
    -F "flavor=$flavor" \
    -F "Body=@$attachment" \
    -o "$mp"
}

oc_mediapackage_add_catalog() {
  local mp="$1"
  local flavor="$2"
  local catalog="$3"

  log_info "Add catalog with flavor $flavor"
  oc_http_post "/ingest/addCatalog" \
    -F "mediaPackage=<$mp" \
    -F "flavor=$flavor" \
    -F "Body=@$catalog" \
    -o "$mp"
}

oc_mediapackage_add_track() {
  local mp="$1"
  local flavor="$2"
  local track="$3"

  log_info "Add track with flavor $flavor"
  oc_http_post "/ingest/addTrack" \
    -F "mediaPackage=<$mp" \
    -F "flavor=$flavor" \
    -F "Body=@$track" \
    -o "$mp"
}

oc_mediapackage_ingest() {
  local mp="$1"
  local wf="$2"
  shift 2

  wf_args=""
  wf_args_log=""
  while (( "$#" )); do
    local key=$1
    local val=$2
    shift 2
    wf_args="$wf_args -F $key=$val"
    wf_args_log="$wf_args_log $key=$val"
  done

  log_info "Ingest mediapackage using workflow $wf with configuration $wf_args_log"
  oc_http_post "/ingest/ingest/$wf" \
    --data-urlencode "mediaPackage=$(cat "$mp")" \
    $wf_args
}



########### Series ###########

oc_series_create() {
  local series=$1
  local acl=$2

  log_info "Create series"
  oc_http_post "/series" \
    -F "series=<$series" \
    -F "acl=<$acl" \
    -F "override=false"
}



########### ACL ###########

oc_acl_generate() {
  local acl="$(mktemp)"

  echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' > "$acl"
  echo '<acl xmlns="http://org.opencastproject.security">' >> "$acl"
  while (( "$#" )); do
    local role=$1
    local action=$2
    shift 2
    cat >> "$acl" <<EOF
  <ace>
    <role>${role}</role>
    <action>${action}</action>
    <allow>true</allow>
  </ace>
EOF
  done
  echo '</acl>' >> "$acl"

  echo "$acl"
}

oc_acl_generate_generic_public()       { oc_acl_generate $OC_ACL_PUBLIC; }
oc_acl_generate_generic_organization() { oc_acl_generate $OC_ACL_ORGANIZATION; }
oc_acl_generate_generic_private()      { oc_acl_generate $OC_ACL_PRIVATE; }



########### XACML ###########

oc_xacml_generate() {
  local acl="$(mktemp)"

  echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' > "$acl"
  echo '<Policy PolicyId="mediapackage-1" Version="2.0" RuleCombiningAlgId="urn:oasis:names:tc:xacml:1.0:rule-combining-algorithm:permit-overrides" xmlns="urn:oasis:names:tc:xacml:2.0:policy:schema:os">' >> "$acl"
  while (( "$#" )); do
    local role=$1
    local action=$2
    shift 2
    cat >> "$acl" <<EOF
  <Rule RuleId="${role}_${action}_Permit" Effect="Permit">
    <Target>
      <Actions>
        <Action>
          <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
            <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">${action}</AttributeValue>
            <ActionAttributeDesignator AttributeId="urn:oasis:names:tc:xacml:1.0:action:action-id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
          </ActionMatch>
        </Action>
      </Actions>
    </Target>
    <Condition>
      <Apply FunctionId="urn:oasis:names:tc:xacml:1.0:function:string-is-in">
        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">${role}</AttributeValue>
        <SubjectAttributeDesignator AttributeId="urn:oasis:names:tc:xacml:2.0:subject:role" DataType="http://www.w3.org/2001/XMLSchema#string"/>
      </Apply>
    </Condition>
  </Rule>
EOF
  done
  echo '  <Rule RuleId="DenyRule" Effect="Deny"/>' >> "$acl"
  echo '</Policy>' >> "$acl"

  echo "$acl"
}

oc_xacml_generate_generic_public()       { oc_xacml_generate $OC_ACL_PUBLIC; }
oc_xacml_generate_generic_organization() { oc_xacml_generate $OC_ACL_ORGANIZATION; }
oc_xacml_generate_generic_private()      { oc_xacml_generate $OC_ACL_PRIVATE; }



########### DC Catalog ###########

oc_catalog_generate() {
  local dc="$(mktemp)"
  local rootElemName="$1"
  local rootNS="$2"
  local termsNS="$3"
  shift 3

  echo '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' > "$dc"
  echo "<$rootElemName xmlns=\"$rootNS\" xmlns:terms=\"$termsNS\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">" >> "$dc"
  while (( "$#" )); do
    local key=$1
    local value=$2
    shift 2
    if [ $key = "duration" ] || [ $key = "extent" ]; then
      echo "<terms:extent xsi:type=\"terms:ISO8601\">$value</terms:extent>" >> "$dc"
    elif [ $key = "startDate" ] || [ $key = "temporal" ]; then
      echo "<terms:temporal xsi:type=\"terms:Period\">$value</terms:temporal>" >> "$dc"
    else
      echo "<terms:$key>$value</terms:$key>" >> "$dc"
    fi
  done
  echo "</$rootElemName>" >> "$dc"

  echo "$dc"
}

oc_dc_catalog_generate() {
  oc_catalog_generate "dublincore" "http://www.opencastproject.org/xsd/1.0/dublincore/" "http://purl.org/dc/terms/" "$@"
}

oc_educast_orca_oer_catalog_generate() {
  oc_catalog_generate "metadata" "https://schemas.educast.nrw/metadata/1.0/" "https://schemas.educast.nrw/metadata-educast-orca-oer/1.0/" "$@"
}

oc_educast_orca_oer_private_catalog_generate() {
  oc_catalog_generate "metadata" "https://schemas.educast.nrw/metadata/1.0/" "https://schemas.educast.nrw/metadata-educast-orca-oer-private/1.0/" "$@"
}

oc_dc_catalog_generate_generic_episode_full() {
  local start="$( date -d "1 min" --utc +%FT%TZ 2> /dev/null || date -u -v+1M +%FT%TZ )"
  local end="$(   date -d "2 min" --utc +%FT%TZ 2> /dev/null || date -u -v+2M +%FT%TZ )"

  oc_dc_catalog_generate \
    title         "Test :: $SETUP_ID" \
    subject       "educast.nrw,tests,workflows" \
    description   "$(curl -sL http://metaphorpsum.com/paragraphs/3/7)" \
    creator       "Prof. Dr. $(curl -sL https://www.pseudorandom.name)" \
    contributor   "$(curl -sL https://www.pseudorandom.name)" \
    publisher     "educast.nrw" \
    language      "deu" \
    rightsHolder  "educast.nrw" \
    license       "ALLRIGHTS" \
    spatial       "Audimax" \
    source        "8018b5af-c519-4a0d-b140-2183e91b16f6" \
    isPartOf      "educast-nrw-tests-series" \
    created       "$start" \
    duration      "PT0H1M00.000S" \
    temporal      "start=$start; end=$end; scheme=W3C-DTF;"
}

oc_dc_catalog_generate_generic_series_full() {
  oc_dc_catalog_generate \
    identifier    "educast-nrw-tests-series" \
    title         "educast.nrw :: Test" \
    subject       "educast.nrw,tests,workflows" \
    description   "$(curl -sL http://metaphorpsum.com/paragraphs/3/7)" \
    creator       "Prof. Dr. $(curl -sL https://www.pseudorandom.name)" \
    contributor   "$(curl -sL https://www.pseudorandom.name)" \
    publisher     "educast.nrw" \
    language      "deu" \
    rightsHolder  "educast.nrw" \
    license       "ALLRIGHTS"
}

oc_educast_orca_oer_private_catalog_generate_generic_full() {
  oc_educast_orca_oer_private_catalog_generate \
    contact-name  "$(curl -sL https://www.pseudorandom.name)" \
    contact-email "user@example.com" \
    comment       "$(curl -sL http://metaphorpsum.com/paragraphs/2/1)"
}

oc_dc_catalog_generate_episode_educast_orca_oer() {
  oc_dc_catalog_generate isPartOf "orca-oer"
}

oc_dc_catalog_generate_series_educast_orca_oer() {
  oc_dc_catalog_generate \
    identifier    "orca-oer" \
    title         "ORCA.nrw OER" \
    publisher     "educast.nrw"
}

oc_educast_orca_oer_catalog_generate_generic_funded_full() {
  oc_educast_orca_oer_catalog_generate \
    meta_language                 "de" \
    type                          "LearningResource" \
    type                          "VideoObject" \
    learningResourceType_id       "https://w3id.org/orca.nrw/medientypen/video" \
    learningResourceType_id       "https://w3id.org/orca.nrw/medientypen/slide" \
    name                          "Test :: $SETUP_ID" \
    description                   "$(curl -sL http://metaphorpsum.com/paragraphs/2/7)" \
    about_id                      "https://w3id.org/kim/hochschulfaechersystematik/n079" \
    about_id                      "https://w3id.org/kim/hochschulfaechersystematik/n105" \
    inLanguage                    "de" \
    inLanguage                    "en" \
    license_id                    "https://creativecommons.org/licenses/by/4.0/" \
    creator_1_type                "Person" \
    creator_1_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_1_honoricPrefix       "Prof." \
    creator_1_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_1_affiliation_id      "https://ror.org/00pd74e08" \
    creator_2_type                "Person" \
    creator_2_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_2_honoricPrefix       "Dr." \
    creator_2_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_2_affiliation_id      "https://ror.org/00pd74e08" \
    creator_3_type                "Person" \
    creator_3_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_3_honoricPrefix       "" \
    creator_3_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_3_affiliation_id      "https://ror.org/00pd74e08" \
    creator_4_type                "Person" \
    creator_4_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_4_honoricPrefix       "" \
    creator_4_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_4_affiliation_id      "https://ror.org/00pd74e08" \
    creator_5_type                "Person" \
    creator_5_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_5_honoricPrefix       "" \
    creator_5_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_5_affiliation_id      "https://ror.org/00pd74e08" \
    creator_6_type                "Person" \
    creator_6_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_6_honoricPrefix       "" \
    creator_6_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_6_affiliation_id      "https://ror.org/00pd74e08" \
    creator_7_type                "Person" \
    creator_7_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_7_honoricPrefix       "" \
    creator_7_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_7_affiliation_id      "https://ror.org/00pd74e08" \
    creator_8_type                "Person" \
    creator_8_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_8_honoricPrefix       "" \
    creator_8_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_8_affiliation_id      "https://ror.org/00pd74e08" \
    creator_9_type                "Person" \
    creator_9_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_9_honoricPrefix       "" \
    creator_9_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_9_affiliation_id      "https://ror.org/00pd74e08" \
    creator_10_type                "Person" \
    creator_10_id                  "https://orcid.org/0000-0002-7523-2549" \
    creator_10_honoricPrefix       "" \
    creator_10_name                "$(curl -sL https://www.pseudorandom.name)" \
    creator_10_affiliation_id      "https://ror.org/00pd74e08" \
    contributor_1_type            "Person" \
    contributor_1_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_1_honoricPrefix   "Prof." \
    contributor_1_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_1_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_2_type            "Person" \
    contributor_2_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_2_honoricPrefix   "Dr." \
    contributor_2_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_2_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_3_type            "Person" \
    contributor_3_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_3_honoricPrefix   "" \
    contributor_3_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_3_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_4_type            "Person" \
    contributor_4_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_4_honoricPrefix   "" \
    contributor_4_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_4_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_5_type            "Person" \
    contributor_5_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_5_honoricPrefix   "" \
    contributor_5_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_5_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_6_type            "Person" \
    contributor_6_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_6_honoricPrefix   "" \
    contributor_6_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_6_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_7_type            "Person" \
    contributor_7_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_7_honoricPrefix   "" \
    contributor_7_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_7_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_8_type            "Person" \
    contributor_8_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_8_honoricPrefix   "" \
    contributor_8_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_8_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_9_type            "Person" \
    contributor_9_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_9_honoricPrefix   "" \
    contributor_9_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_9_affiliation_id  "https://ror.org/00rcxh774" \
    contributor_10_type            "Person" \
    contributor_10_id              "https://orcid.org/0000-0002-1175-2668" \
    contributor_10_honoricPrefix   "" \
    contributor_10_name            "$(curl -sL https://www.pseudorandom.name)" \
    contributor_10_affiliation_id  "https://ror.org/00rcxh774" \
    funder_name                   "OERContent.nrw" \
    keywords                      "orca.nrw" \
    keywords                      "educast.nrw" \
    keywords                      "oer" \
    keywords                      "test" \
    oersi-unlist                  "false"
}

oc_dc_catalog_generate_episode_educast_orca_oer_funded() {
  oc_dc_catalog_generate isPartOf "orca-oer-funded"
}

oc_dc_catalog_generate_series_educast_orca_oer_funded() {
  oc_dc_catalog_generate \
    identifier    "orca-oer-funded" \
    title         "ORCA.nrw OER gefördert" \
    publisher     "educast.nrw"
}
