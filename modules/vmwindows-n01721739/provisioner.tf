resource "null_resource" "display_hostname" {
  count = var.vm_count

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]

    connection {
      type     = "winrm"
      host     = azurerm_windows_virtual_machine.windows_vm[count.index].public_ip_address
      user     = var.admin_username
      password = var.admin_password
      use_ntlm = true
      insecure  = true
    }
  }

  depends_on = [
    azurerm_windows_virtual_machine.windows_vm
  ]
}
