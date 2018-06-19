#!/bin/bash
echo "# get the curl and install it"
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
echo "# change permission of the docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
echo "# check the docker-compose version"
docker-compose version
