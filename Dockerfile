FROM bash

LABEL Version="1.0"
MAINTAINER jiangrj 1326890495@qq.com
WORKDIR /app

COPY stable-diffusion-webui ./stable-diffusion-webui

RUN mkdir -p /data

CMD ["cp","-r","/app/stable-diffusion-webui","/data/stable-diffusion-webui"]
