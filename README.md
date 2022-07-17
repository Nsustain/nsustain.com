---

<p align="center">
  <a href="https://nsustain.com">
    <img src="https://raw.githubusercontent.com/Nsustain/.github/main/logo/logo_github.png" width="350">
  </a>
</p>


---

<p align="center">
  <a href="https://github.com/Nsustain/nsustain.com/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/Nsustain/nsustain.com">
  </a>
  <a href="https://github.com/Nsustain/nsustain.com/blob/main/LICENSE">
    <img src="https://badgen.net/github/license/nsustain/nsustain.com">
  </a>
</p>

---

<br>
<br>
<br>

<p align="center">
  <b>
    [<a href="https://nsustain.com">Nsustain.com</a>]
  </b>
</p>

***Who are we?***<br>
What do we do?
What will we do? Why?
What we needed. How our website
attempts to meet our need.
Why we work hard on this website.
Why we believe in this.
Why we believe you might
find this helpful, too.

<!---
Exaplanation on the need we had:

It's like farmers / environmentalists
are the frontline soldiers of environmental
problems, and coders are a regiment of
long-range support. For artilary, for instance,
we need spotters that tell them where
the problem lies.

Our philosophy:

We're not trying to optimize our website
so that users stay on our website as much
as possible. No, we don't want you to
spend all of your time on website.
Go write codes, for example.

The goal of our website is to help
you find a project that really touches
your heart, something that is worth
your devotion. We'll try to make
that process as smooth and enjoyable
as possible, but we don't do anything sneaky.
We don't store suspicious cookies on your computer.
In fact, we don't even try to know your
name, email, or any other personal information.

-->

***How do we keep maintaining our server?***<br>
We don't have any ad revenue,
and we'll never put ads.
Our website was created to be a
place for the open-source community.
As such, Nsustain
will always be an open-source project,
and we will never commercialize our website.
We do this because we genuinly wanted
to help make the e***n***vironment ***sustain***able :)

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

<p align="center">
  <b>How we made our website</b>
</p>

Here are the exact steps we took to
make our website from ground-up,
so that you can make your own website
relatively easily if you'd like to.
This will be helpful if you'd like
to become a contributor and become
one of us, too.

<br>
<br>

<!--
By the way, the white space in front of [1.1] and [1.2]
is the unicode em space: (  )
-->
## Steps
[1.](#1-web-programming) Web programming<br>
  [A.](#back-end) Back-end<br>
  [B.](#front-end) Front-end<br>
[2.](#2-containerizing-the-website) Containerizing the website<br>
[3.](#3-deploying-a-container-orchestration-system) Deploying a container orchestration system<br>
[4.](#4-getting-a-domain-name) Getting a domain name<br>
[5.](#5-getting-a-server) Getting a server

<br>
<br>

# 1. Web programming

**Writing codes on a version-control system**<br>
Techs used:
`git`
`GitHub`

Create a `GitHub` repository because
version control ...

## Back-end

**Building the website's database**<br>
Techs used:
`SQLite`
`IBM Databases for etcd`

Blabla ...

```bash
# ...
...
```

## Front-end

**Building the front-end**<br>
Techs used:
`javascript`
`react.js`
`next.js`

Create the website ...

```bash
# ...
...
```

<br>
<br>

# 2. Containerizing the website
Techs used:
`Docker`

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
Techs used:
`Kubernetes`
`K3s`

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
Techs used:
`Google Domains`

Our domain name
**[[Nsustain.com](nsustain.com)]**
costs $12 per year.

**(Optional) Setting up a custom-domain email forwarding service**<br>
[Original article by Forward Email](https://forwardemail.net/en/faq#how-do-i-get-started-and-set-up-email-forwarding)<br>
Techs used:
`ForwardEmail.net`

One way of doing this would be setting up an
email server on the VPS we just got, but
we didn't need such complexity. We didn't
need to have multiple email accounts.
We could just use one email account.
All our email needs were such that just using an email
forwarding service would solve all of them.

**Setting up remote caching and DDoS protection**<br>
[Original article by Prutser Rutger](https://blog.prutser.net/2021/01/20/how-to-securely-self-host-a-website-or-web-app/)<br>
Techs used:
`Cloudflare`

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

**Getting a Virtual Private Server (VPS)**<br>
Techs used:
`DigitalOcean`
`Ubuntu Server`

Get a VPS. Around $6 per month.

```bash
# ...
...
```

**Running a VPS**<br>
[Original article by Joe Morgan](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-react-application-with-nginx-on-ubuntu-20-04)<br>
Techs used:
`nginx`

Blabla ...

```bash
# ...
...
```

<br>
<br>

<p align="center">
  <b>Server maintenance workflow</b>
</p>

We most often ...

```bash
# ...
...
```

<br>
<br>

<p align="center">
  <b>What next?</b>
</p>

You could go to Nsustain
and see if there's any project
you'd love to invest your time in,
or you can become a contributor
to our website by forking this repository.
Email soobinrho@nsustain.com
if you have any question.

Please email security@nsustain.com
if you find any security hole.
Thank you for making Nsustain more secure!
Your findings make a huge positive difference
for us. If you'd like, your name
will be added to
[the hall of frame](./HALL_OF_FRAME.md).

<!---
  Insert YouTube intro video here.
-->

<br>
<br>
<br>


