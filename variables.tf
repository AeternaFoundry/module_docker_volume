variable "volumes" {
  description = <<EOT
Map of volumes, attributes below
Optional:
    - driver
    - driver_opts
    - name
    - cluster (block):
        - availability (optional)
        - group (optional)
        - limit_bytes (optional)
        - required_bytes (optional)
        - scope (optional)
        - sharing (optional)
        - topology_preferred (optional)
        - topology_required (optional)
        - type (optional)
    - labels (block):
        - label (required)
        - value (required)
EOT

  type = map(object({
    driver      = optional(string)
    driver_opts = optional(map(string))
    name        = optional(string)
    cluster = optional(object({
      availability       = optional(string)
      group              = optional(string)
      limit_bytes        = optional(string)
      required_bytes     = optional(string)
      scope              = optional(string)
      sharing            = optional(string)
      topology_preferred = optional(string)
      topology_required  = optional(string)
      type               = optional(string)
    }))
    labels = optional(list(object({
      label = string
      value = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.volumes : (
        v.cluster == null || (v.cluster.scope == null || (contains(["single", "multi"], v.cluster.scope)))
      )
    ])
    error_message = "must be one of: \"single\", \"multi\""
  }
  validation {
    condition = alltrue([
      for k, v in var.volumes : (
        v.cluster == null || (v.cluster.sharing == null || (contains(["none", "readonly", "onewriter", "all"], v.cluster.sharing)))
      )
    ])
    error_message = "must be one of: \"none\", \"readonly\", \"onewriter\", \"all\""
  }
  validation {
    condition = alltrue([
      for k, v in var.volumes : (
        v.cluster == null || (v.cluster.type == null || (contains(["mount", "block"], v.cluster.type)))
      )
    ])
    error_message = "must be one of: \"mount\", \"block\""
  }
  validation {
    condition = alltrue([
      for k, v in var.volumes : (
        v.cluster == null || (v.cluster.availability == null || (contains(["active", "pause", "drain"], v.cluster.availability)))
      )
    ])
    error_message = "must be one of: \"active\", \"pause\", \"drain\""
  }
}

