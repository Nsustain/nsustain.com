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
    How we deploy
    <a href="https://nsustain.com">Nsustain.com</a>
  </b>
</p>

Here are the exact steps we take
to build and deploy Nsustain.com
for testing / development.
We wrote this section for those
who would like to contribute.
This will be helpful also if you'd like
to make your own website
based on Nsustain.

<br>
<br>

## Steps
[1.](#1-installing-the-back-end) Installing the back-end<br>
&#160;&#160;&#160;&#160;[A.](#temp) Subsection<br>
&#160;&#160;&#160;&#160;[B.](#temp) Subsection<br>
[2.](#2-) Second step<br>
[3.](#3-) Third step

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

# 1. Installing the back-end

**Installing Nginx [[Source](https://fedoraproject.org/wiki/Nginx)]**

```bash
# Install Nginx
sudo dnf install -y nginx

# Start Nginx automatically at startup
sudo systemctl enable nginx.service

# Run Nginx
sudo systemctl start nginx.service
```

**Installing PHP [[Source](https://computingforgeeks.com/how-to-install-php-74-on-fedora/)]**

```bash
# Install PHP. Although the latest version is not PHP 7.4,
# we need this version for compatibility with Flarum.
sudo dnf install -y https://rpms.remirepo.net/fedora/remi-release-35.rpm
sudo dnf config-manager --set-enabled remi
sudo dnf module reset php
sudo dnf module install php:remi-7.4
sudo dnf install -y php74-php-cli php74-php-fpm php74-php-curl php74-php-dom php74-php-fileinfo php74-php-gd php74-php-json php74-php-mbstring php74-php-openssl php74-php-pdo_mysql php74-php-tokenizer php74-php-zip
```

**Installing MariaDB [[Source](https://docs.fedoraproject.org/en-US/quick-docs/installing-mysql-mariadb/)]**

```bash
# Install MariaDB
sudo dnf install -y mariadb-server

# Start MariaDB automatically at startup
sudo systemctl enable mariadb

# Run MariaDB
sudo systemctl start mariadb
```

**Installing Composer [[Source](https://getcomposer.org/download/)]**

```bash
# Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Move the Composer to PATH
sudo mv composer.phar /usr/local/bin/composer
```
<!--

Flarum as a git submodule because ...
need to get updates from Flarum,
so ... have to be kept seperate ...

No modifications to Flarum, so that
it doesn't diverge

```bash
# `--recurse-submodules` option is used
# because Nsustain uses Flarum as
# a git submodule, which is good because ...
# Without this option, this ... happens ...
# and we have to manually run
# git submodule update --init --recursive
git clone --recurse-submodules https://github.com/Nsustain/nsustain.com.git

```

Plus, automatic pull for submodule:

```bash
git config --global submodule.recurse true
```

https://git-scm.com/book/en/v2/Git-Tools-Submodules


########################### SAMPLE
**(Optional) Setting up a custom-domain email forwarding service**<br>
[Original article by Forward Email](https://forwardemail.net/en/faq#how-do-i-get-started-and-set-up-email-forwarding)
#################################

-->

<br>
<br>
<br>

<p align="center">
  <b>
    How we developed
    <a href="https://nsustain.com">Nsustain.com</a>
  </b>
</p>

We documented how we created Nsustain.com
in case you'd like to understand how it was made 👍

<br>
<br>

<!--
By the way, the white space in front of [1.1] and [1.2]
is the unicode em space: (  )
-->

## Steps
[1.](#1-web-programming) Web programming<br>
&#160;&#160;&#160;&#160;[A.](#back-end) Back-end<br>
&#160;&#160;&#160;&#160;[B.](#front-end) Front-end<br>
[2.](#2-containerizing-the-website) Containerizing the website<br>
[3.](#3-deploying-a-container-orchestration-system) Deploying a container orchestration system<br>
[4.](#4-getting-a-domain-name) Getting a domain name<br>
[5.](#5-getting-a-server) Getting a server

<br>
<br>

<!--

This whole section is just a sample. Whole section has to
be rewriten.

-->

# 1. Web programming

**Writing codes on a version-control system**

Create a `GitHub` repository because
version control ...

Plus, storing API keys bast practices:

[Original article by freeCodeCamp](https://www.freecodecamp.org/news/how-to-securely-store-api-keys-4ff3ea19ebda)<br>

## Back-end

**Building the website's database**

Blabla ...

```bash
# ...
...
```

## Front-end

**Building the front-end**

Create the website ...

```bash
# ...
...
```

<br>
<br>

# 2. Containerizing the website

Make our website into a Docker image.
Why containerize and why not else.

```bash
# ...
...
```

<!--- Installing docker
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04

Using docker compose
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
-->

<br>
<br>

# 3. Deploying a container orchestration system

Explanation on high availability.
Why K3s and not else, showing
the how and why behind
our design & architecture choices.

Install K3s.

Configure the K3s to pull our website
in the form of a Docker image.

Note: The reason why we use Kubernetes.
When our website gains more popularity,
server capability can be upscaled by
getting another VPS and then adding it
on our K3s as a worker node.

Even when we deploy a new node or when
we update our website, our website never
goes offline thanks to Kubernetes.

```bash
# ...
...
```

<br>
<br>

# 4. Getting a domain name

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

# 5. Getting a server

**Getting a Virtual Private Server (VPS)**

Get a VPS. Free trial for ...

```bash
# ...
...
```

**Running a VPS
[[Source](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-react-application-with-nginx-on-ubuntu-20-04)]**

Blabla ...

```bash
# ...
...
```

<br>
<br>

## Repository Layout

```bash
# tree
├──                       #
├──                       #
├──                       #
├──                       #
├── LICENSE               # details on our Apache License
├── NOTICE.md             # `...`'s MIT License
└── README.md             # file you're reading now. Documentation goes here
```

<br>
<br>
<br>

<p align="center">
  <b>Server maintenance workflow</b>
</p>

We most often ...

```bash
#
...
```

<br>
<br>

<p align="center">
  <b>What next?</b>
</p>

You can go to Nsustain and see
if there's any project that's worth
your ♥
or you can become a contributor.
**[[Contribution Guidelines](https://github.com/Nsustain/nsustain.com/blob/main/.github/CONTRIBUTING.md)]**
Email soobinrho@nsustain.com
if you have any question for us.
We'll reply as promptly as possible.
We appreciate your feedback,
always and forever!

Please email security@nsustain.com
if you've discovered any vulnerability on Nsustain.
**[[Security Hall of Frame](./HALL-OF-FRAME.md)]**

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
