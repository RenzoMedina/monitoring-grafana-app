output "my_ip_public" {
  value = azurerm_linux_virtual_machine.my-vm.public_ip_address
}