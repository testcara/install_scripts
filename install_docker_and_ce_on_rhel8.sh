dnf install docker-ce docker-ce-cli containerd.io   --allowerasing   
systemctl enable --now docker
firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --reload
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker wlin
docker run hello-world
