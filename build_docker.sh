docker build -t registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-webui:latest .
docker tag registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-webui:latest registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-webui:$(date +'%Y-%m-%d')
docker login --username=1326890495@qq.com registry.cn-hangzhou.aliyuncs.com
docker push registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-webui:latest
docker push registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-webui:$(date +'%Y-%m-%d')
