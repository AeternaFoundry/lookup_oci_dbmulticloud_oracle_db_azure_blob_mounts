data "oci_dbmulticloud_oracle_db_azure_blob_mounts" "dbmulticloud_oracle_db_azure_blob_mounts_lookup" {
  for_each = var.dbmulticloud_oracle_db_azure_blob_mounts_lookup

  compartment_id                    = each.value.compartment_id
  display_name                      = each.value.display_name
  oracle_db_azure_blob_container_id = each.value.oracle_db_azure_blob_container_id
  oracle_db_azure_blob_mount_id     = each.value.oracle_db_azure_blob_mount_id
  oracle_db_azure_connector_id      = each.value.oracle_db_azure_connector_id
  state                             = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

