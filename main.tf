resource "random_id" "xc-mcn-random-id" {
  byte_length = 2
}

resource "random_string" "password" {
  length      = 10
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}



####################################
# xc resource definitions

# xc smsv2 site
resource "volterra_securemesh_site_v2" "xc-mcn-smsv2-appstack" {
  name      = local.smsv2-site-name
  namespace = "system"
  block_all_services      = false
  logs_streaming_disabled = true
  enable_ha               = false

  labels = {
    "ves.io/provider"     = "ves-io-KVM"
  }

  re_select {
    geo_proximity = true
  }

  kvm {
    not_managed {
    }
  }
}

# xc ce initialization token 
resource "volterra_token" "xc-mcn-sitetoken" {
  name      = "${var.prefix}-token-${random_id.xc-mcn-random-id.hex}"
  namespace = "system"
  type = "1"
  site_name = local.smsv2-site-name
  depends_on = [volterra_securemesh_site_v2.xc-mcn-smsv2-appstack]
}



####################################
# proxmox ce resource definitions

