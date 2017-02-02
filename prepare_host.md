wget https://github.com/ovh/svfs/releases/download/v0.9.1/svfs_0.9.1_amd64.deb
dpkg -i svfs_0.9.1_amd64.deb
apt-get -f install -y
dpkg -i svfs_0.9.1_amd64.deb
rm /etc/apt/apt.conf.d/50unattended-upgrades.ucf-dist

# wget openstack rc file
wget https://horizon.cloud.ovh.net/project/access_and_security/api_access/openrc/
nano *-openrc.sh
# change the password
chmod +x mynumber-openrc.sh
# run it
. mynumber-openrc.sh

# mount it
mount -t svfs -o username=$OS_USERNAME,password=$OS_PASSWORD,tenant=$OS_TENANT_NAME,region=$OS_REGION_NAME docker /mnt
