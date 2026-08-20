output "proxmox" {
  value = {
    securemesh = {
      id = odule.securemesh-v2-site.id
      name = odule.securemesh-v2-site.name
    }
  }
  sensitive = true
}
