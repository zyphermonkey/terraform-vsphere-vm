variable "vm" {
  type = map(object({
    vmname           = string
    vmtemp           = string
    dc               = string
    vmrp             = string
    vmfolder         = string
    datastore        = string
    is_windows_image = bool
    instances        = number
    network          = map(list(string))
    vmgateway        = string
    dns_servers      = list(string)
    data_disk        = map(map(string))
  }))
}

module "example-server-basic" {
  source           = "../../"
  for_each         = var.vm
  vmtemp           = each.value.vmtemp
  is_windows_image = each.value.is_windows_image
  instances        = each.value.instances
  vmname           = each.value.vmname
  vmrp             = each.value.vmrp
  vmfolder         = each.value.vmfolder
  network          = each.value.network
  vmgateway        = each.value.vmgateway
  dc               = each.value.dc
  datastore        = each.value.datastore
  data_disk        = each.value.data_disk
}