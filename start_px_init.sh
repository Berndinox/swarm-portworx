# create consul cluster on each node
if [[ "$(docker service ls | grep 123consul 2> /dev/null)" == "" ]]; then
  docker network create --driver overlay --subnet 172.20.0.0/24 consul
  docker service create --network=consul --name=consul -e CONSUL_BIND_INTERFACE='eth0' -e 'CONSUL_LOCAL_CONFIG={"leave_on_terminate": true}' --mode global -p 8500:8500 consul agent -server -ui -client=0.0.0.0 -bootstrap-expect 3 -retry-join 172.20.0.3 -retry-join 172.20.0.4 -retry-join 172.20.0.5 -retry-interval 5s
fi

# copy PC-Dev Config
mkdir /etc/pwx
cp config.json /etc/pwx/

# fire up px container
docker run --restart=always --name px -d --net=host \
                 --privileged=true \
                 -v /run/docker/plugins:/run/docker/plugins \
                 -v /var/lib/osd:/var/lib/osd \
                 -v /dev:/dev \
                 -v /etc/pwx:/etc/pwx \
                 -v /opt/pwx/bin:/export_bin \
                 -v /var/run/docker.sock:/var/run/docker.sock \
                 -v /var/cores:/var/cores \
                 -v /usr/src:/usr/src \
                 -v /lib/modules:/lib/modules \
                 --ipc=host \
                portworx/px-dev
