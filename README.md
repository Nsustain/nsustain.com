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
    <img alt="Apache License 2.0" src="https://user-images.githubusercontent.com/19341857/184765929-fec61d10-d714-488e-94c7-153e00070a2d.svg">
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
&#160;&#160;&#160;&#160;[A.](#docker-compose-way) Docker Compose way<br>
&#160;&#160;&#160;&#160;[B.](#kubernetes-way) Kubernetes way<br>
[3.](#3-how-nsustain-works) How Nsustain works

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
docker compose up
```

Now, Docker Compose runs a development server
by pulling Docker Hub
[nsustain/flarum](https://hub.docker.com/repository/docker/nsustain/flarum)
and
[nsustain/mariadb](https://hub.docker.com/repository/docker/nsustain/mariadb)
images automatcially. FYI, this takes our eight-years-old laptop
around 50 seconds to complete.
After the first time, however,
it takes only 3 seconds. This is because all persistent files
are mounted as Docker volumes and are used every time we rerun.

We know that the server is ready when it
prints out:

> [INFO] Starting php-fpm8<br>
> [INFO] Starting nginx

Open your web browser and then type in
`http://127.0.0.1`. That's it! 🥳

<img alt="Development server screenshot" src="https://user-images.githubusercontent.com/19341857/198815641-1be1e42a-242d-4a0b-a1fd-25ce39ff0423.png" width="520">

<br>

***Default admin ID and password***<br>
The default admin ID is `nim3594` and
the password `369FQUv4eS`.

These are baked inside
[`flarum.Dockerfile`](https://github.com/Nsustain/nsustain.com/blob/main/src/docker/flarum.Dockerfile).
Likewise, the default MariaDB passwords
are baked inside
[`mariadb.Dockerfile`](https://github.com/Nsustain/nsustain.com/blob/main/src/docker/mariadb.Dockerfile).

We bake default configs inside
our Docker images such that
we can spin up a development server
fast without any extra configuration.

For production servers, however, we have to make changes
to the configurations so that your own passwords are used
instead of the default passwords, and
this is exactly what the next section
[How to set up a production server](#2-how-to-set-up-a-production-server)
will talk about.

<br>

***How to stop***<br>
```bash
# Press <Ctrl + c> to exit your docker compose process

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

***Debugging workflows we often find useful***<br>
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
```

<br>
<br>

## 2. How to set up a production server

***Difference between the development server and [Nsustain.com](https://nsustain.com)***<br>
Default env variables...


```bash
# HOW TO OVERRIDE THE ENV VARIABLES WITH YOUR OWN
cd nsustain.com/src/docker
cp exampleenvflarum .envflarum
cp exampleenvmariadb .envmariadb
#<On this file, uncomment "env_file: - .envflarum">
#<On this file, uncomment "env_file: - .envmariadb">
```

Now, every env varialble you write on .envflarum and .envmariadb
will be used inside your server when you "docker compose up -d"
To deter brute-force attacks, we recommend you to set every
password with lengthy, non-dictionary words.

Never run your server without
first changing the admin password,
MariaDB root password, and database password.

***How to change the admin password, MariaDB root password, and database password***<br>
```bash
# ... Be simple and concise!
```

<br>

### Docker Compose way

***Override default env variables***<br>
```bash
# We use vim, but you can use any code editor
cd nsustain.com/src/docker
vim compose.yaml
```
```yaml
    # Uncomment to override env variables for flarum
    #env_file:
    #  -\# .envflarum

    # It should look like this now:
    env_file:
      - .envflarum

    # Uncomment to override env variables for mariadb
    #env_file:
    #  -\# .envmariadb

    # It should look like this now:
    env_file:
      - .envmariadb
```

<br>
<br>

### Kubernetes way

<br>
<br>

## 3. How Nsustain works

Nsustain is not a work of few men and women.
Instead, it's built on top of the shoulders
of open-source giants. We'd never have been able
to create Nsustain, were it not for these
wonderful open-source projects.
We sincerely thank everyone who contributed
and supported these open-source projects
and therefore made Nsustain possible.

| Project | Link |
| ------- | ----------- |
| **Flarum** | https://github.com/flarum |
| **Docker Compose** | https://github.com/docker/compose |
| **Kompose** | https://github.com/kubernetes/kompose |
| **Kubernetes** | https://github.com/kubernetes |

List the reason why each stack or framework was
chosen.

<br>


---

Read this section if you'd like to get a
general big picture of how Nsustain works.

Flarum, php, Mithrill.js,
MariaDB, PHP-FPM, Nginx, and
Flarum extensions

How we started from DigitalOcean
Droplet with Docker Compose, but then
decided to migrate to IBM Cloud
Kubernetes. How we used Kompose to
convert our
`nsustain.com/src/docker/compose.yaml`
into Kubernetes objects.

How we used IBM Cloud load balancer and
Cloudflare tunnels to connect our Kubernetes
load balancer to our domain name Nsustain.com

<br>
<br>

<!--

We run Nsustain on Kubernetes, but
you can slow run Nsustain on
Docker Compose. If your host is
a single computer, then
Docker Compose is better suited.
If you want to use two or more
hosts, then run on Kubernetes.

# ----------------
# October 24, 2022
1. How to spin up a development server
2. How to host your production server

2.1 if you're using only one server host:
Docker Compose Method
General description of this method

2.2 if you're using two or more servet hosts:
Kubernetes Method
Describe what this method looks like and
my personal explanation of this method

3. How we deploy [Nsustain.com](https://Nsustain.com)
We got the domain name nsustain.com from Google Domains.
When we first started, we hosted on a DigitalOcean droplet:
 - Ubuntu 22.04 (LTS) x64, 1 vCPU, 1GB RAM, 10GB SSD ($6 per month)
 - Backups service on ($1.2 per month)

Since ... We then migrated to IBM Cloud Kubernetes because ...
 - Two worker nodes, each containing 2 vCPU, 4GB RAM, and 125GB SSD ($166 per month but first for the first month because of the $200 sign-ups credit)

*. Explanation on how it works
 - where does it begin and where does it end
 - folder structure and how everything works with each other
# ----------------

1.1 ...
### Install Docker
Source: https://docs.docker.com/compose/install/linux/#install-using-the-repository

We use Fedora Linux. If you're using any other opearting system,
Docker installation guide for outher operating systems is at
https://docs.docker.com/compose/install/linux/#install-using-the-repository
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
         --add-repo \
         https://download.docker.com/linux/fedora/docker-ce.repo

1. 2 if you're setting up SSL:


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


1.1.2 How to add Flarum extension
cd nsustain.com/src/docker
docker compose exec -it flarum sh
composer require fof/sitemap
-->




**Getting a domain from a domain registrar**<br>

Our domain name
**[[Nsustain.com](nsustain.com)]**
costs $12 per year.

**(Optional) Setting up a custom-domain email forwarding service
[[Source](https://forwardemail.net/en/faq#how-do-i-get-started-and-set-up-email-forwarding)]**<br>

One way of doing this would be setting up an
email server on the VPS we just got, but
we didn't need such complexity. We didn't
need to have multiple email accounts.
We could just use one email account.
All our email needs were such that just using an email
forwarding service would solve all of them.

**Setting up remote caching and DDoS protection
[[Source](https://blog.prutser.net/2021/01/20/how-to-securely-self-host-a-website-or-web-app/)]**

It also takes care of issuing SSL certificates.

The traffic between the user and Cloudflare
is automatically SSL encrypted, but the traffic
between Cloudflare and our server needs one
extra step to be SSL encrypted -- i.e.
download the "Cloudflare-issued SSL certificate"
on their settings and install it in our server.

<br>
<br>

<p align="center">
  <b>Repository Folder Structure</b>
</p>

```bash
# This output, by the way, can be obtained
# with Bash `tree` command
├──                       #
├──                       #
├──                       #
├──                       #
├── LICENSE               # details on our Apache License
├── NOTICE.md             # `...`'s MIT License
└── README.md             # file you're reading now. Documentation goes here
```

Explanation of every folder

<br>
<br>
<br>

<p align="center">
  <b>What next?</b>
</p>

If you have a question, please reach out
to Soobin Rho &lt;soobinrho@nsustain.com&gt;.
If you'd like to contribute,
[Contribution Guidelines](https://github.com/Nsustain/nsustain.com/blob/main/.github/CONTRIBUTING.md)
would be a good starting point.

[Security Hall of Fame](./HALL_OF_FAME.md)
is dedicated for those who helped us
make Naustain a better, safer place ❤️
If you discover a vulnerability,
please email security@nsustain.com

<br>
<br>
<br>

<!-- Summary example
<details>
<summary>lsp finder</summary>

<div align='center'>
<img
src="https://user-images.githubusercontent.com/41671631/181253960-cef49f9d-db8b-4b04-92d8-cb6322749414.png" />
</div>
</details>
-->
