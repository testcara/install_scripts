# Step 1: prepare the hypervisor for minishift.
# I refer to the following guidance:
# https://docs.okd.io/latest/minishift/getting-started/setting-up-virtualization-environment.html#setting-up-kvm-driver
# install the related virtual tech packages
yum install -y libvirt qemu dnsmasq ebtables
# add yourself to the libvirt group
sudo usermod -a -G kvm,libvirt <username>
# update your libvirt settings
# But I have not used it in my step, for there is no qemu.conf on my host
# sudo sed -ri 's/.?group\s?=\s?".+"/group = "kvm"/1' /etc/libvirt/qemu.conf
# update the session to apply the libvirt changes
newgrp libvirt
# check and start the libvirt service
systemctl is-active libvirtd
# start the libvirt service
sudo systemctl start libvirtd
# Configure libvirt networking
# Check your network status
sudo virsh net-list --all
# Start the default libvirt network
sudo virsh net-start default
# Now mark the default network as autostart
sudo virsh net-autostart default
# Step 2: install the minishift
# I refer to the following guidance:
# https://docs.okd.io/latest/minishift/getting-started/installing.html
# download the minishift
sudo wget https://github.com/minishift/minishift/releases/download/v1.22.0/minishift-1.22.0-linux-amd64.tgz
# install the minishift
sudo tar -xvf minishift-1.22.0-linux-amd64.tgz 
# change the openshift dir and export the path
sudo mv minishift-1.22.0-linux-amd64 minishift-1.22.0
export PATH=${PATH}:/opt/minishift-1.22.0
# Step 3: start the minishift
# I refer to the following guidance
# https://docs.okd.io/latest/minishift/getting-started/quickstart.html
minishift start
# When you see the following log, at the most situation, it means the command returns success.
#Using public hostname IP 192.168.42.139 as the host IP
#Using 192.168.42.139 as the server IP
#Starting OpenShift using openshift/origin:v3.9.0 ...
#OpenShift server started.
#
#The server is accessible via web console at:
#    https://192.168.42.139:8443
#
#You are logged in as:
#    User:     developer
#    Password: <any value>
#
#To login as administrator:
#    oc login -u system:admin
#
#
#-- Exporting of OpenShift images is occuring in background process with pid 6361.
minishift ip
# If one ip like below is returned, it means all work well
# 192.168.42.139
# using minishift to add oc to the path
minishift oc-env
# You will get one similar response
#export PATH="/home/wlin/.minishift/cache/oc/v3.9.0/linux:$PATH"
# Run this command to configure your shell:
# eval $(minishift oc-env)
# configure my shell now
eval $(minishift oc-env)
# Now the minishift installation has been finished
