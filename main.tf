resource "docker_volume" "volumes" {
  for_each = var.volumes

  driver      = each.value.driver
  driver_opts = each.value.driver_opts
  name        = each.value.name

  dynamic "cluster" {
    for_each = each.value.cluster != null ? [each.value.cluster] : []
    content {
      availability       = cluster.value.availability
      group              = cluster.value.group
      limit_bytes        = cluster.value.limit_bytes
      required_bytes     = cluster.value.required_bytes
      scope              = cluster.value.scope
      sharing            = cluster.value.sharing
      topology_preferred = cluster.value.topology_preferred
      topology_required  = cluster.value.topology_required
      type               = cluster.value.type
    }
  }

  dynamic "labels" {
    for_each = each.value.labels != null ? each.value.labels : []
    content {
      label = labels.value.label
      value = labels.value.value
    }
  }
}

