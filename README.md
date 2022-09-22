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
    About<br>
    [<a href="https://nsustain.com">Nsustain.com</a>]
  </b>
</p>

<br>
<br>

***Who are we?***<br>
We are a bunch of
open-source developers
who were trying to find
an idea we can work on in order to
help the envrionment,
an idea that touches our heart,
an idea that's worth our time and devotion,
but couldn't.

It was such a tragedy
that - although we wanted to help -
we couldn't find a specific problem
on sustainability. They certainly exist.
We all know that there are a lot of
environmental problems that need solutions.
It was just that we didn't know
where to find them.

<br>

***Why do we do what we do?***<br>
So, we made exactly what we
wanted and needed. Nsustain
is an open-source community, where
front-line environmental workers -
e.g. farmers and scientists - can
post specific problems they've noticed
in the world. Coders looking for
a meaningful project that's really worth it
now has one.

The goal of our website is to help
you find a project that really touches
your heart, something that you truly find worthwhile.
We will always try to make that process
as smooth and enjoyable as possible for you.

At the same time, we don't do anything sneaky.
Security is our top-most priority, and
we aren't interested in any of your personal information.
We don't store suspicious cookies tracking everything you do.
We don't optimize our website such that you
stay on our website as long as possible.
No, we don't want you to spend all day on Nsustain.
Go help the environment. Write codes.
Whatever you think is the best for the
e[**n**]vironment & [***sustain***]ability.

<br>

***What does Nsustain mean?***<br>
An open-source community for the
e[<b>n</b>]vironment &
[<b>sustain</b>]ability.

<br>

***How do we keep maintaining our server?***<br>
We don't do ads.
Our website was created to be a
place for the open-source community.
As such, Nsustain
will always be an open-source project,
and we will never commercialize our website.
We do this because we genuinly wanted
to help make the e[**n**]vironment [**sustain**]able.

<!--
***How did this all begin?***<br>
Soobin Rho and Mariam Wisaal started
this project for
*2022 Call for Code Global Challenge*,
which was an environmental initiative
inviting "developers and problem solvers
around the world to build and contribute
to sustainable open source technology projects."
Soobin and Mariam were college sophomores
at Augustana University at that time,
and the challenge was held for six months
from May, 2022 to October, 2022.
-->

<br>
<br>
<br>

<!--

# How we deploy Nsustain.com

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


##########################################
# To be uncommented later.
##########################################

-->

<p align="center">
  <b>How to deploy Nsustain.com for testing / development</b>
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
[1.](#1-) programming<br>
&#160;&#160;&#160;&#160;[A.](#back-end) Back-end<br>
&#160;&#160;&#160;&#160;[B.](#front-end) Front-end<br>
[2.](#2-getting-a-server) Getting a server

<br>
<br>

# 1. Installing the back-end

> We use Fedora, so all installation
> commands below are written for Fedora.
> If you're using a different OS,
> you'll need extra web searching to
> figure out how it's different for your OS.

**Installing Nginx [[Source](https://fedoraproject.org/wiki/Nginx)]**

```bash
# Install Nginx
sudo dnf install -y nginx

# Start Nginx automatically at startup
sudo systemctl enable nginx.service

# Run Nginx
sudo systemctl start nginx.service
```

**Installing PHP [[Source](https://developer.fedoraproject.org/tech/languages/php/php-installation.html)]**

```bash
# Install PHP
sudo dnf install -y php-cli
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
mv composer.phar /usr/local/bin/composer
```


<br>
<br>
<br>


<p align="center">
  <b>How we developed Nsustain.com</b>
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


