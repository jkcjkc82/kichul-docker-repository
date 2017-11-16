# Kichul's Dockerfile repository

This project is to store the instruction of docker images that I build. All of the history(instruction) will be saved.

```bash
# to build in 
docker build -t $(cd .. ; basename "$PWD"):$(basename "$PWD") .

# to remove none images
docker rmi -f $(docker images -f "dangling=true" -q)

# to rename image name
docker tag zeromq:v1 jkcjkc82/zeromq:v1

# to push to docker hub
docker push jkcjkc82/zeromq:v1
```
