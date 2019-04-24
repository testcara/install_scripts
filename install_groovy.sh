#!/bin/bash

set -euxo pipefail

echo "---> The script has to run with root role, checking roles ..."
if [[ "$(whoami)" == "root" ]]
then
	echo "---> Login as root and ready to install groovy now ..."
else
	echo "---> Please change to root or run it with sudo ..."
	exit 1
fi

echo "---> Step 1: mkdir /user/groovy ..."
cd /usr && mkdir groovy && cd groovy
# 在http://dl.bintray.com/groovy/maven/页面挑选自己向下载的版本

echo "---> Step 2: download and install the groovy files ..."
wget http://dl.bintray.com/groovy/maven/apache-groovy-binary-2.5.0.zip
unzip apache-groovy-binary-2.5.0.zip
rm -rf apache-groovy-binary-2.5.0.zip 
ln -s groovy-2.5.0/ ./latest

echo "---> Step 3: configure the groovy path to /etc/profile ..."
# 在/etc/profile文件中添加如下两行
tee -a /etc/profile << END
export GROOVY_HOME=/usr/groovy/latest
export PATH=\$PATH:\$GROOVY_HOME/bin
END
source /etc/profile

echo "---> Step 4: Test the groovy is installed successfully ..."
# 则进行测试groovy安装完成
groovy -e 'println("Hello, world")'