#################################### 
# define local varaiables

locals {
  smsv2-site-name = "${var.prefix}-ce-azure-${random_id.xc-mcn-random-id.hex}"
  today-timestamp = timestamp()
}


####################################
# define planet wide vars :-)

variable "prefix" {
  description = "prefix for created objects"
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

