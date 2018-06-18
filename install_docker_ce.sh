echo "# First, let us remove the old docker version"
sudo yum remove -y docker \
                   docker-client \
                   docker-client-latest \
                   docker-common \
                   docker-latest \
                   docker-latest-logrotate \
                   docker-logrotate \
                   docker-selinux \
                   docker-engine-selinux \
                   docker-engine
echo "# Second, let us add docker repo and enable the repo"
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-edge
echo "# Third, let us install the container-selinux package"
sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.42-1.gitad8f0f7.el7.noarch.rpm
echo "# Then, Install the docker-ce"
sudo yum install -y docker-ce
echo "# Finally, check the docker version"
docker version
