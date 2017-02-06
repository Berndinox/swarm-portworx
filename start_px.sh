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
