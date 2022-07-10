# /src

This source code directory ...

# How to ...

**Running Nginx with the Coming Soon page**<br>
[[Original article by Peter Mckee](https://www.docker.com/blog/how-to-use-the-official-nginx-docker-image/)]<br>
Techs used: `Docker`

```
# Change directory into the src folder
# of this repository.
cd src

# Run the docker image called nginx,
# name it `webserver`, and
# mount the current directory into
# the image's `nginx/html` folder.
sudo docker run --name webserver -d -v $(pwd):/usr/share/nginx/html -p 80:80 nginx
```
