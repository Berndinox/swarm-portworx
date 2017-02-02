trying to migrate https://github.com/Berndinox/docker_webstack to compose_v3 and make ready for the swarm.

#### ! This Project is under dev

REQ:
- 3x Scaleway VM
- OVH Public Cloud ObjectStore

### Prepare Host:

#### Use OVH OpenStack Swift as Storage
> https://www.ovh.de/cloud/storage/object-storage.xml

OVH Storage is cheap and locate in EU, it also enables shared Volumes across the Swarm Cluster and is HA
```
wget https://github.com/ovh/svfs/releases/download/v0.9.1/svfs_0.9.1_amd64.deb
dpkg -i svfs_0.9.1_amd64.deb
apt-get -f install -y
dpkg -i svfs_0.9.1_amd64.deb
rm /etc/apt/apt.conf.d/50unattended-upgrades.ucf-dist
wget https://horizon.cloud.ovh.net/project/access_and_security/api_access/openrc/
chmod +x *-openrc.sh
. *-openrc.sh
mount -t svfs -o username=$OS_USERNAME,password=$OS_PASSWORD,tenant=$OS_TENANT_NAME,region=$OS_REGION_NAME docker /mnt
```

#### Create the Swarm
```
docker swarm init
docker swarm join-token manager
```
Execute the Output on the 2 other node to join the Cluster (3 Manager Nodes)
