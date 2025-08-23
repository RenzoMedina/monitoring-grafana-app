variable "region" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "eastus"
}

variable "resource_name" {
  description = "Base name for resources"
  type        = string
  default     = "MyVirtualMachine"
}

variable "ssh_key_name" {
  description = "Name of the SSH key to be created"
  type        = string
  default     = "my-azure-ssh"
}

variable "vm-name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "vm-demo"
}