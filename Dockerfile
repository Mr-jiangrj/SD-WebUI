FROM bash

LABEL Version="1.0"
MAINTAINER jiangrj 1326890495@qq.com
WORKDIR /stable-diffusion-webui

COPY stable-diffusion-webui ./stable-diffusion-webui

CMD ["cp","-r","/stable-diffusion-webui","/data/stable-diffusion-webui"]
