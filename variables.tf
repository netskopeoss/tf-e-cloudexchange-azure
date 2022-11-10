variable "vnet_rg_name" {
  type        = string
  description = "The vnet Resource Group Name."
}

variable "vnet_name" {
  type        = string
  description = "The name of the vnet name where CE will be deployed."
}

variable "snet_name" {
  type        = string
  description = "Name of the subnet where CE interface will be attached."
}
variable "env_prefix" {
  type        = string
  description = "Environment prefix to use to label resources in cloud deployment."
  default     = "PRD"
}

variable "vm_prefix" {
  type        = string
  description = "The vm Prefix details of the VM."
  default     = "CE"
}

variable "vm_size" {
  description = "The Virtual Machine Size for the CE VM deployment."
  default     = "Standard_D2ds_v5"
}

variable "admin_username" {
  type        = string
  description = "The Virtual Machine default local admin username for the NVAs deployment."
  default     = ""
}

variable "trusted_ip" {
  type        = string
  description = "IP address allowed for the configuration and NSG rules."
}

variable "img_sku" {
  type        = string
  description = "Azure Marketplace default image sku"
  default     = "20_04-lts"
}

variable "img_version" {
  type        = string
  description = "Ubuntu version by default the 'latest' available version in the Azure Marketplace is selected"
  default     = "latest"
}

variable "admin_ssh_key" {
  type        = string
  description = "File Path for the admin public SSH key used to connect to the CE virtual machine, whose format is required to be the openSSH key format with optional comment."
  default     = ""
}

variable "own_cert" {
  type        = string
  description = "Do you want to use your own SSL certificate?"
  default     = "No"
  validation {
    condition     = contains(["Yes", "No"], (var.own_cert))
    error_message = "Do you want to use your own SSL certificate from a Public CA or an inhouse enterprise CA issued SSL certitifcate to use with CE for Web UI access?"
  }
}

variable "tenant_name" {
  type        = string
  description = "Netskope Tenant Name (Exclude .goskope.com), e.g. Enter 'demo' if Netskope Tenant URL is https://demo.goskope.com. Leave to default value of 'test' if you do not have any Netskope tenant."
  default     = "test"
}

variable "ssl_cert" {
  type        = string
  description = "Your Own SSL Certificate File name."
  default     = "cte_cert.crt"
}

variable "ssl_key" {
  type        = string
  description = "Your Own SSL Certificate Private Key File name."
  default     = "cte_cert_key.key"
}

variable "ui_port" {
  type        = string
  description = "Port number to use for the CE web interface."
  default     = "443"
}

variable "jwt_secret" {
  type        = string
  description = "Enter password that will be used for docker services."
  default     = ""
}

variable "maintenance_password" {
  type        = string
  description = "Enter maintenance password that will be used for docker services. This password can be set only once."
  default     = ""
}
