resource "null_resource" "display_hostname" {
  for_each = var.vm_config

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]

    connection {
      type        = "ssh"
      host        = azurerm_linux_virtual_machine.linux_vm[each.key].public_ip_address
      user        = var.admin_username
      private_key = file(var.private_key_path)
    }
  }

  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]
}
