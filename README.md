trying to migrate https://github.com/Berndinox/docker_webstack to compose_v3 and make ready for the swarm.


#### ! This Project is under dev


REQ:
- 3x Scaleway VM
- OVH Public Cloud ObjectStore



### Prepare Host:


#### Storage Config

You need an Account on:
> https://www.ovh.de/cloud/storage/object-storage.xml

OVH Storage is cheap and located in EU (France, like Scaleway VMs), it enables shared Volumes across the Swarm Cluster and is HA.
In addition we do install the volume-driver plugin "local-persist", thanks to https://github.com/CWSpear/local-persist, to persist our data.
```
apt-get update && apt-get upgrade -y
rm /etc/apt/apt.conf.d/50unattended-upgrades.ucf-dist
apt-get -f install fuse ruby -y
wget https://github.com/ovh/svfs/releases/download/v0.9.1/svfs_0.9.1_amd64.deb
dpkg -i svfs_0.9.1_amd64.deb
wget https://horizon.cloud.ovh.net/project/access_and_security/api_access/openrc/
. *-openrc.sh
mount -t svfs -o username=$OS_USERNAME,password=$OS_PASSWORD,tenant=$OS_TENANT_NAME,region=$OS_REGION_NAME docker /mnt
curl -fsSL https://raw.githubusercontent.com/CWSpear/local-persist/master/scripts/install.sh | sudo bash
```


#### Create the Swarm
```
docker swarm init
docker swarm join-token manager
```
Execute the Output on the 2 other node to join the Cluster (3 Manager Nodes)


#### Setup Network for our Proxy
```
docker network create --driver overlay proxy
```
