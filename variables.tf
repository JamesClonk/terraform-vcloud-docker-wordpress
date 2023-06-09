# ======================================================================================================================
# vCloud Director settings
# ======================================================================================================================
variable "vcd_api_url" {
  description = "vCD API URL"
  # This is the URL of the vCloud Director API.
  # For Swisscom DCS+ see this documentation:
  # https://dcsguide.scapp.swisscom.com/ug3/vcloud_director.html#cloud-director-api
  # Example: https://vcd-pod-charlie.swisscomcloud.com/api
}
variable "vcd_api_username" {
  description = "vCD API username"
  # The API username for vCloud Director access.
  # For Swisscom DCS+ see this documentation:
  # https://dcsguide.scapp.swisscom.com/ug3/dcs_portal.html#cloud-director-api-user
}
variable "vcd_api_password" {
  description = "vCD API password"
  # The API password for vCloud Director access.
  # For Swisscom DCS+ see this documentation:
  # https://dcsguide.scapp.swisscom.com/ug3/dcs_portal.html#cloud-director-api-user
}

variable "vcd_logging_enabled" {
  description = "Enable logging of vCD API interaction"
  default     = false
  # If enabled it will log API debug output into "go-vcloud-director.log"
}

variable "vcd_org" {
  description = "vCD Organization"
  # The organization in vCloud Director.
  # For Swisscom DCS+ this is your Contract Id / PRO-Number (PRO-XXXXXXXXX)
}

variable "vcd_vdc" {
  description = "vCD Virtual Data Center"
  # The VDC in vCloud Director.
  # For Swisscom DCS+ this is your "Dynamic Data Center", see this documentation:
  # https://dcsguide.scapp.swisscom.com/ug3/dcs_portal.html#dynamic-data-center
}

variable "vcd_edgegateway" {
  description = "vCD VDC Edge Gateway"
  # The edge gateway / virtual router of your VDC networks, necessary for internet access.
  # For Swisscom DCS+ see this documentation:
  # https://dcsguide.scapp.swisscom.com/ug3/vcloud_director.html#edges
}

variable "vcd_catalog" {
  description = "Catalog name"
  default     = ""
  # The vCD catalog to use for your vApp templates. This is where the new Ubuntu OS image will be stored in.
  # If not specified or left empty it will use the ${dns_hostname}.
  # For Swisscom DCS+ see this documentation:
  # https://dcsguide.scapp.swisscom.com/ug3/vcloud_director.html#catalogs
}
variable "vcd_template" {
  description = "vCD vApp template name"
  default     = ""
  # The vApp template to use for your virtual machines. This is the name under which the new Ubuntu OS image will be stored.
  # If not specified or left empty it will use a generated name based on ${dns_hostname}.
  # For Swisscom DCS+ see this documentation:
  # https://dcsguide.scapp.swisscom.com/ug3/vcloud_director.html#vapp-templates
}

# ======================================================================================================================
# network settings
# ======================================================================================================================
variable "dns_hostname" {
  description = "DNS hostname of your wordpress deployment"
  # The DNS "A" entry of your wordpress deployment's external edge gateway / loadbalancer IP.
  # Please make sure to set an appropriate DNS entry after creating the edge gateway.
}

variable "network_cidr" {
  description = "IP range for Kubernetes node network in CIDR notation"
  default     = "10.10.0.0/24"
}

# ======================================================================================================================
# virtual machine definitions
# ======================================================================================================================
variable "vm_memory" {
  description = "Memory of virtual machine (in MB)"
  default     = 2048
}
variable "vm_cpus" {
  description = "CPUs of virtual machine (in MB)"
  default     = 2
}
variable "vm_disk_size" {
  description = "Disk size of virtual machine (in MB)"
  default     = 51200
}

# ======================================================================================================================
# lets encrypt settings
# ======================================================================================================================
variable "lets_encrypt_server" {
  description = "ACME server for Let's Encrypt"
  default     = "https://acme-v02.api.letsencrypt.org/directory"
  # https://cert-manager.io/docs/concepts/issuer/
  # The default value is set to the production server.
  # Only set this to the staging environment if you want to do frequent development or testing.
  # See https://letsencrypt.org/docs/staging-environment/
}

# ======================================================================================================================
# docker images
# ======================================================================================================================
variable "docker_image_mariadb" {
  description = "Docker image to use for MariaDB container"
  default     = "mariadb:10-jammy"
}

variable "docker_image_wordpress" {
  description = "Docker image to use for WordPress container"
  default     = "wordpress:6-apache"
}

variable "docker_image_nginx" {
  description = "Docker image to use for Nginx container"
  default     = "nginx:1.23"
}
