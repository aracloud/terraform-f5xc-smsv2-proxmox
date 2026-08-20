output "proxmox" {
  value = {
    secure_mesh_single_nic = {
      id = volterra_securemesh_site_v2.site.id
      name = volterra_securemesh_site_v2.site.name
    }
    master_vm = {
      id = proxmox_vm_qemu.master-vm.id
      name = proxmox_vm_qemu.master-vm.name
    }
  }
  sensitive = true
}
