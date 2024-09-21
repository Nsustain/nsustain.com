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

> [!IMPORTANT]
> Install Docker Compose:
>   https://docs.docker.com/compose/install/


```bash
# Download the repository.
git clone https://github.com/Nsustain/nsustain.com.git
cd nsustain.com/src/docker
cp .env_flarum.example .env_flarum
cp .env_mariadb.example .env_mariadb
cp configs_nginx/nginx.conf.example configs_nginx/.nginx.conf

# Run.
docker compose build
docker compose up
```

We know that the server is ready when it prints out:

> [INFO] Starting php-fpm...

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

Ensure that you set secure passwords.

***Override the default env variables at `.env_flarum` and `.env_mariadb`***<br>
```bash
cd nsustain.com/src/docker
vim .env_flarum
#<Change the default passwords>

vim .env_mariadb
#<Change the default passwords>
```

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
vim .env_flarum
<Change FORUM_URL="http://nsustain.com" => FORUM_URL="https://nsustain.com">

# Reset flarum
php flarum cache:clear
php flarum assets:publish

How to renew the certificate:
https://eff-certbot.readthedocs.io/en/stable/using.html#renewing-certificates

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
