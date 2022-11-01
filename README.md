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
[3.](#3-open-source-projects-we-used) Open-source projects we used

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

We have two ways of setting up a production server:
(a) Docker Compose way and (b) Kubernetes way.
You can use either way if you have a preference of one over the other,
but we generally recommend to use Docker Compose.

If you want your website to be highly available and
therefore are willing to provision two or more servers
to host it, then Kubernetes would be perfect for you.
If you're trying to run your website on a single host,
then we personally like Docker Compose because it just
feels faster tp deploy, easier to maintain.
Docker Compose tends to have less configs to take care of.

<br>

### Docker Compose way

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
-->


### Kubernetes way

***Expose Nsustain to the internet with Cloudflare Tunnel***<br>
```bash
# Source:
#   https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/
```


<br>
<br>

## 3. Open-source projects we used

Nsustain is not a work of few men and women.
Instead, it's built on top of the shoulders
of open-source giants. We'd never have been able
to create Nsustain, were it not for these
wonderful open-source projects.
We sincerely thank everyone who contributed
and supported these open-source projects
and therefore made Nsustain possible.

<br>

| Project | Link |
| ------- | ----------- |
| **Flarum** | https://github.com/flarum |
| **Docker Compose** | https://github.com/docker/compose |
| **Kompose** | https://github.com/kubernetes/kompose |
| **Kubernetes** | https://github.com/kubernetes |

<br>

 - Flarum is a web forum framework that handles both the front-end and the back-end itself.
 What you see on [Nsustain.com](https://nsustain.com) is mainly thanks to Flarum.
 As you can see, it's beautiful. It has cool interfaces and functionalities.
 If you liked Nsustain, go check out Flarum's own forum-development discussion forum at https://discuss.flarum.org
 
 - So, the first thing we did when we started Nsustain was to choose a web framework, and as you can see,
 we chose Flarum, which turned out to be the best possible framework for Nsustain. The next thing we did
 was to containerize Flarum with Docker. We also used Docker Compose to make deployment
 as easy as possible for not only ourselves, but also for future possible contriutors 😍
 
 - Next, we went just one step further. What if our server can't handle big surges of traffic?
 We wanted to be able to serve as many people as possible. So, we used Kompose to convert
 our `compose.yaml` file into Kubernetes resource files. `kompose convert` was 98% all we needed
 to make the files that we have now. Kompose looks at the compose file and then
 automatcally converts everything including container image declarations, ports, volume bindings
 to Kubernetes `.yaml` files for us.
 ```bash
 # How to convert the compose file into K8s resource files
 cd nsustain.com/src/docker
 mkdir ../k8s
 cp compose.yaml ../k8s/docker-compose.yaml
 cd ../k8s
 kompose convert
 ```

<br>
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
