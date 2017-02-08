This Project aims to provide an "straight-forward" way to create a swarm-cluster with Portworx (px-dev) as Volume-Driver for the Swarm.
Portworx enables Cluster aware Volumes in an hyper-converged way.

Advice: For DEV Env!


#### Req:
- 3 VMs (unformated disk on each VM) - Recommand: Scaleway VC1M
- Docker V1.13




## Create the Swarm
On the first Node:
```
docker swarm init
docker swarm join-token manager
```
Execute the Output on the other nodes to join the Cluster.




## Setup

```
git clone https://github.com/Berndinox/swarm_portworx && cd swarm_portworx
sh start_px_init.sh
```




PS: PX-Dev Conatiner will take some time on the first startup




## Start using
```
ln -s /opt/pwx/bin/pxctl /bin/pxctl
pxctl status
```
More: http://docs.portworx.com/create-manage-storage-volumes.html
