#################################### 
# define local varaiables

locals {
  smsv2-site-name = "${var.prefix}-ce-kvm-${random_id.xc-mcn-random-id.hex}"
  today-timestamp = timestamp()
}


####################################
# define planet wide vars :-)

variable "prefix" {
  description = "prefix for created objects"
  type = string
}


####################################
# define proxmox wide vars :-)

variable "proxmox_api_url" {
        type = string
}

variable "proxmox_api_token_id" {
        type = string
        sensitive = true
}

variable "proxmox_api_token_secret" {
        type =  string
        sensitive = true
}


# ce node user
variable "ce-node-user" {
  description = "ce user"
  type = string
}


####################################
# XC lb related vars

# tenant
variable "xc_tenant" {
  type = string
}

# site reference
#variable "xc_tenant_site" {
#  type = string
#  default = ${local.smsv2-site-name}
#}

# namespace
variable "xc_namespace" {
  type = string
}

# pool name
#variable "xc_origin_pool" {
#  type = string
#  default = ${local.smsv2-site-name}
#}

# pool member backend ip address
variable "xc_origin_ip1" {
  type = string
}

# origin pool service port
variable "xc_pub_app_port" {
  type = string
}

# origin pool no tls
variable "xc_pub_app_no_tls" {
  type = string
}

# application domain
variable "xc_app_domain" {
  type = string
}

