# /src

This source code directory ...

# How to ...

```
# Change directory into the src folder
# of this repository.
cd src

# Run the docker image called nginx,
# name it server, and
# mount the current directory into
# the image's nginx/html folder.
sudo docker run --name server -d -v $(pwd):/usr/share/nginx/html -p 80:80 nginx
```
