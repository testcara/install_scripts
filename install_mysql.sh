# The following steps are refered to the doc https://blog.csdn.net/luyiming_ben/article/details/81741548
# Here I download the mysql bundler directly which contain all mysql related rpms
# Step 2: install the following packages
# sudo rpm -ivh mysql-community-libs-8.0.12-1.el7.x86_64.rpm
# sudo rpm -ivh mysql-community-common-8.0.12-1.el7.x86_64.rpm
# sudo rpm -ivh mysql-community-client-8.0.12-1.el7.x86_64.rpm
# sudo rpm -ivh mysql-community-server-8.0.12-1.el7.x86_64.rpm
# sudo rpm -ivh mysql-community-devel-8.0.12-1.el7.x86_64.rpm
# Step3: start the service but I get the following failure
# “systemd: Failed at step USER spawning /usr/sbin/opendkim: No such process” 

# Finally, I recheck the manual guaidance from https://dev.mysql.com/doc/mysql-getting-started/en/#mysql-getting-started-installing
# And remove the mysql dir then try again the it works.
# Step 1: download and install repo. refer to the doc https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/
sudo yum local install mysql80-community-release-el7.noarch.rpm
sudo yum repolist all | grep mysql
sudo yum repolist enabled | grep mysql
# When you make sure that your mysql repo works well, you can move on
# Step 2: install mysql-server service
sudo yum install mysql-community-server
# Step 3: start the service
sudo systemctl start mysqld.service
# When you can start your service without error, then you can move on
# Step 4: set up your root account and password of mysql
sudo grep 'temporary password' /var/log/mysqld.log
# Here you will get one random password for root
mysql -uroot -p
# input that random password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
# change your password
# Step 5: set up the security of your mysql service
mysql_secure_installation
