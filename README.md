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
&#160;&#160;&#160;&#160;[A.](#docker-compose-way) Docker Compose way<br>
&#160;&#160;&#160;&#160;[B.](#kubernetes-way) Kubernetes way<br>
[3.](#3-open-source-projects-we-rely-on) Open-source projects we rely on

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
[nsustain/flarum](https://hub.docker.com/r/nsustain/flarum)
and
[nsustain/mariadb](https://hub.docker.com/r/nsustain/mariadb)
images automatcially. FYI, this takes our eight-years-old laptop
around 50 seconds to complete.
After the first time, however,
it takes only 3 seconds. This is because all persistent files
are mounted as Docker volumes and are used every time we rerun.

We know that the server is ready when it
prints out:

> [INFO] Starting php-fpm8<br>
> [INFO] Starting nginx

That's it! 🥳 Open
[http://127.0.0.1](http://127.0.0.1)

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

### Docker Compose way

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

Any environment variables defined in the
`.envflarum` and `.envmariadb` files will be
used within the server. It is important
to set strong, unique passwords for
all sensitive information, such as the
admin password, MariaDB root password,
and database password. We recommend using
a password manager to generate completely
random passwords, or using long,
non-dictionary words if a password
manager is not available. It is crucial
to change these passwords before
deploying the server in a
production environment.

<br>

***Run***<br>
```bash
docker compose up -d
```

<br>

<!--

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

Usually, people expose their microservices in Kubernetes using
LoadBalancer, NodePort, or Ingress, but we found it just more
convinient to use IBM Cloud Kubernetes Service (IKS)
and Cloudflare Tunnel.

What we did was to first get IBM Cloud CLI from
https://cloud.ibm.com/docs/cli?topic=cli-getting-started
and then

```bash
ibmcloud login

# Get ibmcloud Kubernetes configs so that we can run
# kubectl from our own computer.
ibmcloud ks cluster ls  # Suppose your cluster name is nsustain
ibmcloud ks cluster config --cluster nsustain --admin
```

After that, we were able to expose [Nsustain.com](https://nsustain.com)
to the internet - without having to configure LoadBalancer, NodePort, or Ingress
ourselves -
by installing Cloudflare Tunnel to proxy everything for us.
This is generally more secure than directly
exposing our microservices to the internet
because the server is hidden behind
Cloudflare Tunnel.
We followed the installation guide at
https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/

<br>

***Run***<br>
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

<br>
<br>

## 3. Open-source projects we rely on

Nsustain is not a work of few men and women.
Instead, it's built on top of the shoulders
of open-source giants.
Without the contributions and support
of these wonderful open-source projects,
Nsustain would not have been possible.
We are deeply grateful to everyone who
has contributed to and supported
these projects, as their efforts have
allowed Nsustain to exist.

<br>

| Project | Link |
| ------- | ---- |
| **Flarum** | https://github.com/flarum |
| **Docker Compose** | https://github.com/docker/compose |
| **Kompose** | https://github.com/kubernetes/kompose |
| **Kubernetes** | https://github.com/kubernetes |

 - Flarum is a web forum framework that consists of both the front-end and the back-end itself.
 What you see on [Nsustain.com](https://nsustain.com) is largely thanks to Flarum.
 As you can see, it's beautiful. It has smooth UI's and cool functionalities.
 If you liked Nsustain, go check out Flarum's own forum-development discussion forum at https://discuss.flarum.org

 - The first thing we did when we started Nsustain was to choose a web framework, and as you can see,
 we chose Flarum, which turned out to be the best possible framework for us. The next thing we did
 was to containerize Flarum with Docker. We also used Docker Compose to make deployment
 as nice as possible for Nsustain's future contributors 😍

 - Next, we went just one step further. What if our server can't handle big surges of traffic?
 We wanted to be able to serve as many people as possible. So, we used Kompose to convert
 our `compose.yaml` file into Kubernetes resource files.
Kompose looks at the compose file and then automatically
converts the compose file into Kubernetes `.yaml` resource files,
including the definitions of the container image, volume bindings,
and exposed ports.
 ```bash
 # FYI, this is how we used Kompose in order to
 # convert `compose.yaml` into K8s resource files.
 cd nsustain.com/src/docker
 mkdir ../k8s
 cp compose.yaml ../k8s/docker-compose.yaml
 cd ../k8s
 kompose convert
 ```

<br>
<br>
<br>

<p align="center">
  <b>What next?</b>
</p>

If you have any questions, don't hesitate
to contact Soobin Rho
&lt;soobinrho@nsustain.com&gt;.
If you're interested in contributing,
[Contribution Guidelines](https://github.com/Nsustain/nsustain.com/blob/main/.github/CONTRIBUTING.md)
would be a good starting point.

The [Security Hall of Fame](./HALL_OF_FAME.md)
recognizes individuals who have helped improve
the security of Nsustain.
If you've discovered a vulnerability,
please report it to security@nsustain.com.
Your contribution is greatly appreciated
and will help make Nsustain a safer place
for everyone ❤️

<br>
<br>
<br>
