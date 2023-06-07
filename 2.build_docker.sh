registry="registry.cn-hangzhou.aliyuncs.com"
image="registry.cn-hangzhou.aliyuncs.com/jiangrj/sd-webui"
docker build -t $image:latest .
docker tag $image:latest $image:$(date +'%Y-%m-%d')
docker login --username=1326890495@qq.com $registry
docker push $image:latest
docker push $image:$(date +'%Y-%m-%d')
