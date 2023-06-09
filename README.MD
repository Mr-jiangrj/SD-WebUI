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

  sd-auto-cpu:
    image: registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-auto-cpu
    container_name: sd-auto-cpu
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
