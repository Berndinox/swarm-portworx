> trying to migrate https://github.com/Berndinox/docker_webstack to compose_v3 and make ready for the swarm.


## ! This Project is under dev


#### Create the Swarm
```
docker swarm init
docker swarm join-token manager
```
Execute the Output on the 2 other node to join the Cluster (3 Manager Nodes)


#### Setup Networks
```
docker network create --driver overlay proxy
docker network create --driver overlay consul --attachable
```
