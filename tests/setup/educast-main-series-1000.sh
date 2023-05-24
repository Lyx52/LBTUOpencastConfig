#!/usr/bin/env bash

ACL_SERIES=$(oc_acl_generate_generic_public)

for i in {1..1000}; do
  DC_SERIES=$(oc_dc_catalog_generate identifier "$(uuidgen)" title "Test $i")
  oc_series_create "$DC_SERIES" "$ACL_SERIES" > /dev/null
done
