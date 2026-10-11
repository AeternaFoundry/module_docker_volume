output "volumes_id" {
  description = "Map of id values across all volumes, keyed the same as var.volumes except keys with no id are omitted"
  value       = { for k, v in docker_volume.volumes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "volumes_cluster" {
  description = "Map of cluster values across all volumes, keyed the same as var.volumes except keys with no cluster are omitted"
  value       = { for k, v in docker_volume.volumes : k => one(v.cluster) if v.cluster != null && length(v.cluster) > 0 }
}
output "volumes_driver" {
  description = "Map of driver values across all volumes, keyed the same as var.volumes except keys with no driver are omitted"
  value       = { for k, v in docker_volume.volumes : k => v.driver if v.driver != null && length(v.driver) > 0 }
}
output "volumes_driver_opts" {
  description = "Map of driver_opts values across all volumes, keyed the same as var.volumes except keys with no driver_opts are omitted"
  value       = { for k, v in docker_volume.volumes : k => v.driver_opts if v.driver_opts != null && length(v.driver_opts) > 0 }
}
output "volumes_labels" {
  description = "Map of labels values across all volumes, keyed the same as var.volumes except keys with no labels are omitted"
  value       = { for k, v in docker_volume.volumes : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "volumes_mountpoint" {
  description = "Map of mountpoint values across all volumes, keyed the same as var.volumes except keys with no mountpoint are omitted"
  value       = { for k, v in docker_volume.volumes : k => v.mountpoint if v.mountpoint != null && length(v.mountpoint) > 0 }
}
output "volumes_name" {
  description = "Map of name values across all volumes, keyed the same as var.volumes except keys with no name are omitted"
  value       = { for k, v in docker_volume.volumes : k => v.name if v.name != null && length(v.name) > 0 }
}

