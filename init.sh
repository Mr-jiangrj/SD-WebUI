su - root

docker images -q | xargs docker rmi -f
rm -rf /var/lib/docker/overlay2/*
rm -rf /opt/hostedtoolcache/*
swapoff -a
rm -rf /mnt/*
chown runner:runner -R /mnt

su - runner

bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --skip-torch-cuda-test
