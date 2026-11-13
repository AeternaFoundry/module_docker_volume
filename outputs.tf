output "volumes_id" {
  description = "Map of id values across all volumes, keyed the same as var.volumes"
  value       = { for k, v in docker_volume.volumes : k => v.id }
}
output "volumes_cluster" {
  description = "Map of cluster values across all volumes, keyed the same as var.volumes"
  value       = { for k, v in docker_volume.volumes : k => one(v.cluster) }
}
output "volumes_driver" {
  description = "Map of driver values across all volumes, keyed the same as var.volumes"
  value       = { for k, v in docker_volume.volumes : k => v.driver }
}
output "volumes_driver_opts" {
  description = "Map of driver_opts values across all volumes, keyed the same as var.volumes"
  value       = { for k, v in docker_volume.volumes : k => v.driver_opts }
}
output "volumes_labels" {
  description = "Map of labels values across all volumes, keyed the same as var.volumes"
  value       = { for k, v in docker_volume.volumes : k => v.labels }
}
output "volumes_mountpoint" {
  description = "Map of mountpoint values across all volumes, keyed the same as var.volumes"
  value       = { for k, v in docker_volume.volumes : k => v.mountpoint }
}
output "volumes_name" {
  description = "Map of name values across all volumes, keyed the same as var.volumes"
  value       = { for k, v in docker_volume.volumes : k => v.name }
}

