# Mike-ntrt_infra
Mike-ntrt Infra repository

### HW Lec 5 - Cloud Bastion

bastion_IP = 84.201.175.59  
someinternalhost_IP = 10.130.0.15    

#### ssh
ssh connect oneline through Jumphost(option `-J`):  
`ssh -i .ssh/appuser -A -J appuser@84.201.175.59 appuser@10.130.0.15`

ssh connect via alias: 
add ssh config file (~/.ssh/config):
```
Host bastion
    Hostname 84.201.175.59
    User appuser
    IdentityFile ~/.ssh/appuser

Host someinternalhost
    Hostname 10.130.0.15
    User appuser
    IdentityFile ~/.ssh/appuser
    ProxyJump bastion
```
ProxyJump is a short alias for ProxyCommand in the new versions of OpenSSH

connection string:  
`ssh someinternalhost`

#### pritunl

we need to install iptables into ubuntu 16.04 for pritunl
'sudo apt install iptables'
sslip.io resolve `<ip>.sslip.io` into ip address  
install Lets Encrypt tls certificate:  
https://84.201.175.59 -> settings -> Lets Encrypt Domain -> 84.201.175.59.sslip.io

we use Tunnelblick to connect to pritunel server  
connection to the Internalhost string:  
`ssh -i ~/.ssh/appuser appuser@10.130.0.15`
