docker images -q | xargs docker rmi -f
sudo rm -rf /var/lib/docker/overlay2/*
sudo rm -rf /opt/hostedtoolcache/*
sudo swapoff -a
sudo rm -rf /mnt/*
sudo chown runner:runner -R /mnt
bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --skip-torch-cuda-test
