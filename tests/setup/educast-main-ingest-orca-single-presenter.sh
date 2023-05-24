#!/usr/bin/env bash

OC_ORGANIZATION=orca

ACL_SERIES=$(oc_acl_generate_generic_public)
DC_SERIES=$(oc_dc_catalog_generate_series_educast_orca_oer_funded)

oc_series_create "$DC_SERIES" "$ACL_SERIES" > /dev/null

MP=$(oc_mediapackage_create_with_id "$SETUP_ID")
ACL=$(oc_xacml_generate_generic_public)
DC=$(oc_dc_catalog_generate_episode_educast_orca_oer_funded)
META_OER=$(oc_educast_orca_oer_catalog_generate_generic_funded_full)
META_OER_PRIV=$(oc_educast_orca_oer_private_catalog_generate_generic_full)

oc_mediapackage_add_catalog     "$MP"  dublincore/episode                 "$DC"
oc_mediapackage_add_catalog     "$MP"  metadata/educast-orca-oer          "$META_OER"
oc_mediapackage_add_catalog     "$MP"  metadata/educast-orca-oer-private  "$META_OER_PRIV"
oc_mediapackage_add_track       "$MP"  presenter/source                   "$MEDIA_DIR/short-big-buck-bunny.mp4"
oc_mediapackage_add_attachment  "$MP"  security/xacml+episode             "$ACL;filename=acl.xml;type=text/xml"
oc_mediapackage_ingest          "$MP"  educast-main-ingest-orca > /dev/null
