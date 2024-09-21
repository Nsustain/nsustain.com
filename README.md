---

<p align="center">
  <a href="https://nsustain.com">
    <img alt="logo" src="https://raw.githubusercontent.com/Nsustain/.github/main/logo/logo-github.png" width="350">
  </a>
</p>


---

<p align="center">
  <a href="https://github.com/Nsustain/nsustain.com/graphs/contributors">
    <img alt="List of contributors page" src="https://img.shields.io/github/contributors/Nsustain/nsustain.com">
  </a>
  <a href="https://github.com/Nsustain/nsustain.com/blob/main/LICENSE">
    <img alt="MIT License" src="https://user-images.githubusercontent.com/19341857/206869035-bccdfab1-a825-4ec1-b598-78bf668b7917.svg">
  </a>
</p>

---

<br>
<br>
<br>

<p align="center">
  <b>
    Source code for
    <a href="https://nsustain.com">Nsustain.com</a>
  </b>
</p>

This repository shows you how to run it and
how it works. Read the whole documentation
if you'd like to get an overall understanding of
how Nsustain works. If you just want to
spin up a development server as soon as
possible, just read the first section ⚡

<br>
<br>

## Getting Started
[1.](#1-how-to-spin-up-a-developmental-server) How to spin up a development server<br>
[2.](#2-how-to-set-up-a-production-server) How to set up a production server<br>

<br>
<br>

## 1. How to spin up a developmental server

***Install***<br>
```bash
sudo dnf install -y git
git clone https://github.com/Nsustain/nsustain.com.git

# Install Docker Compose.
# If your OS isn't Fedora, follow Docker's documentation:
#   https://docs.docker.com/compose/install/
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo \
  https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

<br>

***Run***<br>
```bash
cd nsustain.com/src/docker
docker compose build
docker compose up
```

We know that the server is ready when it prints out:

> [INFO] Starting php-fpm...<br>
> [INFO] Starting nginx

That's it! 🥳 Open
[http://127.0.0.1](http://127.0.0.1)

<img alt="Development server screenshot" src="https://user-images.githubusercontent.com/19341857/198815641-1be1e42a-242d-4a0b-a1fd-25ce39ff0423.png" width="520">

<br>

> [!IMPORTANT]  
> The default admin ID is `nim3594`, and the password is `369FQUv4eS`.
> These are baked inside [`flarum.Dockerfile`](https://github.com/Nsustain/nsustain.com/blob/main/src/docker/flarum.Dockerfile).
> and [`mariadb.Dockerfile`](https://github.com/Nsustain/nsustain.com/blob/main/src/docker/mariadb.Dockerfile).
> For production, ensure that these default passwords are changed.

<br>

***How to stop***<br>
```bash
# Press <Ctrl + c> to exit from your Docker Compose process

# Then, shut down docker compose
docker compose down
```

<br>

***How to restart***<br>
```bash
cd nsustain.com/src/docker
docker compose up -d
```

<br>

***Workflows we use***<br>
```bash

# How to start a shell inside nsustain/flarum container
docker compose exec -it flarum sh

# How to start a shell inside nsustain/mariadb container
docker compose exec -it maraidb sh

# How to check all environment variables injected
env

# How to look inside the database
docker compose exec -it flarum sh
mariadb -h $DB_HOST -u $DB_USER -p$DB_PASS

# How to extract a file from container
docker ps  # Suppose <CONTAINER ID> is 1b332ed2d10e
docker cp 1b332:/path/to/file ./

# How to reset all data and restart with fresh volumes
docker compose down
alias dockervrm="docker volume ls -q | xargs docker volume rm"
dockervrm
docker compose up -d

# How to renew letsencrypt certificate
docker compose exec -it flarum sh
certbot renew
```

<br>
<br>

## 2. How to set up a production server

<!--
There are two options for setting up a
production server: (a) the Docker Compose
method and (b) the Kubernetes method.
You can choose either one depending
on your preference, but we generally
recommend Docker Compose.

If you want your website to be highly
available and are willing to set up
multiple servers to host it, Kubernetes
would be a good choice. On the other hand,
if you only need to run your website on a
single host, Docker Compose may be a better
option because it is typically faster to
deploy and easier to maintain due to fewer
configuration requirements compared to
Kubernetes.

<br>
-->

First, we have to override the default environmental variables.
Otherwise, your website's admin credentials will be using
ID: `nim3594` and PW: `369FQUv4eS`
because these are baked inside as default env variables.

<br>

***Override the default env variables at `.envflarum` and `.envmariadb`***<br>
```bash
cd nsustain.com/src/docker
cp exampleenvflarum .envflarum
vim .envflarum
#<Edit the values of the env variables>

cp exampleenvmariadb .envmariadb
vim .envmariadb
#<Edit the values of the env variables>
```

<br>

***Enable `.envflarum` and `.envmariadb`***<br>
```bash
vim compose.yaml
```
```yaml
    # Uncomment to override env variables for flarum
    #env_file:
    #  - .envflarum

    # It should look like this now:
    env_file:
      - .envflarum

    # Uncomment to override env variables for mariadb
    #env_file:
    #  - .envmariadb

    # It should look like this now:
    env_file:
      - .envmariadb
```

Any environment variables defined in the `.envflarum` and `.envmariadb`
files will be used within the server. It is important to set secure
passwords for the admin password, MariaDB root password, and database
password. We recommend using.

<br>

***Run***<br>
```bash
docker compose up -d
```

<br>

<!--
HOW TO SET UP SSL CERTIFICATE
# Run a shell inside the docker container
docker compose exec -it flarum sh

# Run certbot. It automatically generates a certificate for you
certbot

# Change flarum setting
cd /var/www/html/flarum
vim config.php
<Change 'uri' => 'http://nsustain.com' to 'uri' => 'https://nsustain.com'>
<Ctrl + d in order to log out of the docker exec session>
cd /nsustain.com/src/docker
vim .envflarum
<Change FORUM_URL="http://nsustain.com" => FORUM_URL="https://nsustain.com">

# Reset flarum
php flarum cache:clear
php flarum assets:publish

How to renew the certificate:
https://eff-certbot.readthedocs.io/en/stable/using.html#renewing-certificates
-->

<!--

Cloudflare Tunnel
https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/

```bash
cd nsustain.com/src/k8s
vim cloudflared.yaml
```
```yaml
    # CHANGE TO YOUR TUNNEL NAME.
    # Other than the tunnel name and the ingress rules at the bottom,
    # you don't have to change any other config.
    tunnel: nsustain

    # CHANGE TO YOUR DOMAIN NAME.
    # Don't change http://flarum:80 to your domain name
    # because it refers to Kubernetes service name, not your domain name.
    # Only change hostname: nsustain.com
    ingress:
    - hostname: nsustain.com
      service: http://flarum:80
```
```bash
kubectl apply -f ../k8s
```

<br>

***How to stop***<br>
```bash
kubectl delete -f ../k8s
```

<br>

***Workflows we use***<br>
```bash
# How to find the name of all pods running
kubectl get pods  # Suppose you want flarum-84b6484cd-vj6gl

# How to get all available information of a pod
kubectl describe pods flarum-84b6484cd-vj6gl

# How to read logs
kubectl logs -f flarum-84b6484cd-vj6gl

# How to run a shell inside the flarum container
kubectl exec -it flarum-84b6484cd-vj6gl -- sh

# How to extract a file from a container
kubectl cp flarum-84b6484cd-vj6gl:/path/to/file ./file
```

-->

<br>
<br>
<br>
