初始化数据

```shell
docker images -q | xargs docker rmi -f
sudo rm -rf /var/lib/docker/overlay2/*
sudo rm -rf /opt/hostedtoolcache/*
bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --skip-torch-cuda-test
```

打包上传

```shell
tar cvf stable-diffusion-webui.tar stable-diffusion-webui
wget https://github.com/tickstep/aliyunpan/releases/download/v0.2.7/aliyunpan-v0.2.7-linux-amd64.zip
unzip aliyunpan-v0.2.7-linux-amd64.zip
mv stable-diffusion-webui.tar aliyunpan-v0.2.7-linux-amd64/
cd aliyunpan-v0.2.7-linux-amd64/
bash aliyunpan
login
upload stable-diffusion-webui.tar /
```

运行

```shell
apt install wget git python3 python3-venv python3-pip
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip install --upgrade pip
pip install -r 
./webui.sh --skip-torch-cuda-test --enable-insecure-extension-access --use-cpu=all --no-half --listen --share --api
```
