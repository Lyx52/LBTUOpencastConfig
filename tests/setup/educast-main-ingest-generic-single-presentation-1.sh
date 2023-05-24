#!/usr/bin/env bash

ACL_SERIES=$(oc_acl_generate_generic_public)
DC_SERIES=$(oc_dc_catalog_generate_generic_series_full)

oc_series_create "$DC_SERIES" "$ACL_SERIES" > /dev/null

MP=$(oc_mediapackage_create_with_id "$SETUP_ID")
ACL=$(oc_xacml_generate_generic_public)
DC=$(oc_dc_catalog_generate_generic_episode_full)

oc_mediapackage_add_catalog     "$MP"  dublincore/episode      "$DC"
oc_mediapackage_add_track       "$MP"  presentation-1/source   "$MEDIA_DIR/short-big-buck-bunny.mp4"
oc_mediapackage_add_attachment  "$MP"  security/xacml+episode  "$ACL;filename=acl.xml;type=text/xml"
oc_mediapackage_ingest          "$MP"  educast-main-ingest-generic > /dev/null
