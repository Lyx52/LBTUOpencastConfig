#!/usr/bin/env bash

ACL_SERIES=$(oc_acl_generate_generic_public)

DC_SERIES=$(oc_dc_catalog_generate identifier "$(uuidgen)" title "$SETUP_ID")
oc_series_create "$DC_SERIES" "$ACL_SERIES" > /dev/null
