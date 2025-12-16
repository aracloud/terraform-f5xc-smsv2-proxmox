#cloud-config
#This definition is used to configure the CE host
#Only values that need to be inserted are token and cluster name. 
#Insert as is without parenthesis
write_files:
- path: /etc/vpm/user_data
  permissions: 0644
  owner: root
  content: |
    token: ${token}
    #slo_ip: Un-comment and set Static IP/mask for SLO if needed.
    #slo_gateway: Un-comment and set default gateway for SLO when static IP is  needed.
runcmd:
  - [ sh, -c, test -e /usr/bin/fsextend  && /usr/bin/fsextend || true ]