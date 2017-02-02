### swarm_webstack
trying to migrate https://github.com/Berndinox/docker_webstack to compose_v3 and make ready for the swarm.

### This Project is under dev



### Prepare Host:

###### Use OVH OpenStack Swift as Storage
OVH Storage is cheap and locate in EU, it also enables shared Volumes across the Swarm Cluster and is HA
```
wget https://github.com/ovh/svfs/releases/download/v0.9.1/svfs_0.9.1_amd64.deb
dpkg -i svfs_0.9.1_amd64.deb
apt-get -f install -y
dpkg -i svfs_0.9.1_amd64.deb
rm /etc/apt/apt.conf.d/50unattended-upgrades.ucf-dist
wget https://horizon.cloud.ovh.net/project/access_and_security/api_access/openrc/
nano *-openrc.sh
chmod +x mynumber-openrc.sh
. mynumber-openrc.sh
mount -t svfs -o username=$OS_USERNAME,password=$OS_PASSWORD,tenant=$OS_TENANT_NAME,region=$OS_REGION_NAME docker /mnt
```
