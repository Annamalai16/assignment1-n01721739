locals {
  extensions_for_each_vm = flatten([
    for idx in range(var.vm_count) : [
      for extension in var.vm_extensions : {
        vm_name   = "${var.vm_name}${idx + 1}"
        extension = extension
      }
    ]
  ])
}
resource "azurerm_availability_set" "availability_set" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.rg_name
  managed                      = true
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = var.tags
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "${var.vm_name}${count.index + 1}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Basic"
  domain_name_label   = "${var.dns_prefix}${count.index + 1}"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name}${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count                 = var.vm_count
  name                  = "${var.vm_name}${count.index + 1}"
  location              = var.location
  resource_group_name   = var.rg_name
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  availability_set_id   = azurerm_availability_set.availability_set.id
  os_disk {
    name                 = "${var.vm_name}${count.index + 1}-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  winrm_listener {
    protocol = "Http"
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "extensions" {
  for_each = {
    for idx, ext in local.extensions_for_each_vm : idx => ext
  }
  name                 = each.value.extension.name
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm[each.key].id
  publisher            = each.value.extension.publisher
  type                 = each.value.extension.type
  type_handler_version = each.value.extension.type_handler_version
  settings = jsonencode({
    "AntimalwareEnabled" : true,
    "RealtimeProtectionEnabled" : true,
    "ScheduledScanSettings" : {
      "isEnabled" : true,
      "day" : 1,
      "time" : 120,
      "scanType" : "Full"
    }
  })
  depends_on = [azurerm_windows_virtual_machine.windows_vm]
  tags       = var.tags
}