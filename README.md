# Mike-ntrt_infra
Mike-ntrt Infra repository

### HW Lec 6 - Cloud Testapp

testapp_IP = 178.154.231.190  
testapp_port = 9292  

#### install Testapp manualy by scripts

copy scripts to YC VM  
```
scp ./deploy.sh yc-user@84.201.135.197:/home/yc-user
scp ./install_ruby.sh yc-user@84.201.135.197:/home/yc-user
scp ./install_mongodb.sh yc-user@84.201.135.197:/home/yc-user
```
connect to YC VM via ssh and start scripts one-by-one  

#### install Testapp while create YC VM - startup script

use `yc compute instance create` command with metadata in YML file:  
```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=2 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --preemptible \
  --core-fraction=5 \
  --metadata-from-file user-data=./metadata.yml
```

metadata.yml contais Cloud Init modeles user and runcmd  
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
