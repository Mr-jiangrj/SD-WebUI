初始化

```shell
docker images -q | xargs docker rmi -f
sudo rm -rf /var/lib/docker/overlay2/*
sudo rm -rf /opt/hostedtoolcache/*
sudo swapoff -a
sudo rm -rf /mnt/*
sudo umount /dev/sda1
mkdir -p ./data
sudo mount /dev/sda1 ./data
bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --skip-torch-cuda-test
```

构建镜像

```shell
registry="registry.cn-hangzhou.aliyuncs.com"
image="registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-webui"
docker build -t $image:latest .
docker tag $image:latest $image:$(date +'%Y-%m-%d')
docker login --username=1326890495@qq.com $registry
docker push $image:latest
docker push $image:$(date +'%Y-%m-%d')
```

Dockerfile

```dockerfile
FROM bash
WORKDIR /app
COPY stable-diffusion-webui ./stable-diffusion-webui
CMD ["cp","-r","/app/stable-diffusion-webui","/data/stable-diffusion-webui"]
```

运行

```shell
./webui.sh --skip-torch-cuda-test --enable-insecure-extension-access --use-cpu=all --no-half --listen --share --api
```

