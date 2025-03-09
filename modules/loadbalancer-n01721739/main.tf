resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Basic"
  frontend_ip_configuration {
    name                 = "PublicFrontend"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
  tags = var.tags
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.lb_name}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Basic"
  tags                = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.lb_name}-backend-pool"
}

resource "azurerm_lb_probe" "health_probe" {
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "${var.lb_name}-health-probe"
  protocol            = "Http"
  port                = 80
  request_path        = "/health"
  interval_in_seconds = 10
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "load_balancer_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "${var.lb_name}-http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicFrontend"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.health_probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_pool" {
  count                   = length(var.vm_nic_ids)
  network_interface_id    = var.vm_nic_ids[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  ip_configuration_name   = "internal"
}
