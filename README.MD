Docker Compose 一键部署

```yaml
version: "3"

services:

  sd-data:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-data
    container_name: sd-data
    volumes:
      - /opt/sd:/data
    networks:
      - SD-NET

  sdwebui:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu
    container_name: sdwebui
    ports:
      - 80:7860
    stop_signal: SIGINT
    environment:
      - "CLI_ARGS=--use-cpu=all --no-half --allow-code --enable-insecure-extension-access --share --api"
      # - "CLI_ARGS=--no-half --precision full --allow-code --enable-insecure-extension-access --api"
    networks:
      - SD-NET
    volumes:
      - /opt/sd/data:/data
      - /opt/sd/output:/output

networks:
  SD-NET:
    driver: bridge

```

Docker 手动部署

```shell
# 安装 Docker-CE
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# 拉取 Stable-Diffusion 镜像
docker pull registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-data
docker pull registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu

# 创建 Stable-Diffusion 数据
docker run -it --rm -v /opt/sd:/data registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-data

# 创建 Stable-Diffusion WebUI
docker run -dit --name sdwebui --hostname sdwebui --restart always \
    -p 80:7860 --stop_signal=SIGINT -v /opt/sd/data:/data -v /opt/sd/output:/output \
    -e "CLI_ARGS=--use-cpu=all --no-half --allow-code --enable-insecure-extension-access --share --api" \
    registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu

```

###### 基于 Windows/Linux 手动部署

> Github仓库添加国内可用代理前缀：https://ghproxy.com/
> 
> 含Github仓库的文件：stable-diffusion-webui/modules/launch_utils.py、stable-diffusion-webui/modules/models/diffusion/ddpm_edit.py
> 
> 查找合适的torch和torchvision：https://download.pytorch.org/whl/
> 
> 自动安装方式：pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118
> 
> 手动安装torch：pip install https://download.pytorch.org/whl/cu118/torch-2.0.1%2Bcu118-cp39-cp39-win_amd64.whl
> 
> 手动安装torchversion：pip install https://download.pytorch.org/whl/cu118/torchvision-0.15.2%2Bcu118-cp39-cp39-win_amd64.whl

###### PIP 加速配置 ~/.pip/pip.conf

```conf

[global]
index-url=https://pypi.tuna.tsinghua.edu.cn/simple/
extra-index-url=
        http://mirrors.aliyun.com/pypi/simple/
        http://pypi.douban.com/simple
        http://pypi.mirrors.ustc.edu.cn/simple/

[install]
trusted-host=
        pypi.tuna.tsinghua.edu.cn
        mirrors.aliyun.com
        pypi.douban.com
        pypi.mirrors.ustc.edu.cn

```

###### Conda 加速配置 ~/.condarc

```conf

channels:
  - defaults
show_channel_urls: true
channel_alias: http://mirrors.tuna.tsinghua.edu.cn/anaconda
default_channels:
  - http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
  - http://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: http://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud

```


###### 扩展

> 中文扩展1：[https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN](https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN)
> 
> 中文扩展2：[https://github.com/VinsonLaro/stable-diffusion-webui-chinese](https://github.com/VinsonLaro/stable-diffusion-webui-chinese)
> 
> 中英对照扩展：[https://github.com/journey-ad/sd-webui-bilingual-localization](https://github.com/journey-ad/sd-webui-bilingual-localization)
> 
> 安装路径：扩展 -> 从网址安装 -> 输入git网址 -> 安装

###### 更多模型

| 序号 | 写实风格                                                     |
| :--: | ------------------------------------------------------------ |
|  1   | [Stable Diffusion：https://huggingface.co/stabilityai/stable-diffusion-2-1](https://huggingface.co/stabilityai/stable-diffusion-2-1) |
|  2   | [Chilloutmix：https://civitai.com/models/6424/chilloutmix](https://civitai.com/models/6424/chilloutmix) |
|  3   | [Deliberate：https://civitai.com/models/4823/deliberate](https://civitai.com/models/4823/deliberate) |

| 序号 | 动漫风格                                                     |
| :--: | ------------------------------------------------------------ |
|  1   | [Anything：https://huggingface.co/andite/anything-v4.0](https://huggingface.co/andite/anything-v4.0) |
|  2   | [Waifu Diffusion：https://huggingface.co/hakurei/waifu-diffusion-v1-4](https://huggingface.co/hakurei/waifu-diffusion-v1-4) |
|  3   | [Hentai Diffusion：https://github.com/Delcos/Hentai-Diffusion](https://github.com/Delcos/Hentai-Diffusion) |
|  4   | [DreamShaper：https://civitai.com/models/4384/dreamshaper](https://civitai.com/models/4384/dreamshaper) |
|  5   | [OrangeMix3：https://huggingface.co/WarriorMama777/OrangeMixs](https://huggingface.co/WarriorMama777/OrangeMixs) |

> 模型路径：/data/StableDiffusion（更多路径可进入容器检查：ls -l /stable-diffusion-webui/）

###### 其它模型参考
[细数【SD-WEBUI】的模型：谁是最适合的模型从哪里找到它们](http://wed.xjx100.cn/news/148980.html?action=onClick)
<br>
[查找模型：https://huggingface.co/models](https://huggingface.co/models)
