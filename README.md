---

<p align="center">
  <a href="https://codersforearth.com">
    <img src="https://user-images.githubusercontent.com/19341857/177931363-78818959-f91c-427d-a4bf-8d550dbdae78.svg" width="350">
  </a>
</p>

---

<p align="center">
  <a href="https://github.com/CodersForEarth/codersforearth.com/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/CodersForEarth/codersforearth.com">
  </a>
  <a href="https://github.com/CodersForEarth/codersforearth.com/blob/main/LICENSE">
    <img src="https://badgen.net/github/license/CodersForEarth/codersforearth.com">
  </a>
</p>

---

<br>
<br>
<br>

<p align="center">
  <b>About</b>
</p>

***Who are we?*** What do we do?
What will we do? Why?
What we needed. How our website
attempts to meet our need.
Why we work hard on this website.
Why we believe in this.
Why we believe you might 
find this helpful, too.

***How do we keep maintaining our server?***
We don't have any ad revenue,
and we'll never put ads on our website.
We do this because we genuinly wanted
to help make the environment more sustainable :)

***How did this all begin?***
Soobin Rho and Mariam Wisaal started
this project for 
*2022 Call for Code Global Challenge*,
which was an environmental initiative
inviting "developers and problem solvers
around the world to build and contribute 
to sustainable open source technology projects."
[[Official Website](https://callforcode.org)]

<br>
<br>

<p align="center">
  <b>How we made our website</b>
</p>

Here are the exact steps we took to
make [CodersForEarth.com](https://codersforearth.com)

We documented each step from ground-up,
so that you can replicate it 
relatively easily if you'd like to
make another website based on our website
or become a contributor to our project.

<br>
<br>

<!--
By the way, the white space in front of [1.1] and [1.2]
is the unicode em space: (  )
-->
## Steps
[1.](#1-designing-the-website) Designing the website<br>
  [1.1](#back-end) Back-end<br>
  [1.2](#front-end) Front-end<br>
[2.](#2-containerizing-the-website) Containerizing the website<br>
[3.](#3-deploying-a-container-orchestration-system) Deploying a container orchestration system<br>
[4.](#4-getting-a-domain-name) Getting a domain name<br>
[5.](#5-getting-a-server) Getting a server

<br>
<br>

# 1. Designing the website

**Writing codes on a version-control system**<br>
Techs used:
`git`
`GitHub`

## Back-end

**Building the website's database**<br>
Techs used:
`SQLite`
`IBM Databases for etcd`

Blabla ...

## Front-end

Create a `GitHub` repository because
version control ...

**Building the front-end**<br>
Techs used:
`javascript`
`react.js`
`next.js`

Create the website ...

<br>
<br>

# 2. Containerizing the website
Techs used:
`Docker`

Make our website into a Docker image.
Why containerize and why not else.

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

<br>
<br>

# 4. Getting a domain name
Techs used:
`Google Domains`

Our domain name *CodersForEarth.com*
costs $12 per year.

**(Optional) Setting up a custom-domain email forwarding service**<br>
[[Original article by Forward Email](https://forwardemail.net/en/faq#how-do-i-get-started-and-set-up-email-forwarding)]<br>
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
[[Original article by Prutser Rutger](https://blog.prutser.net/2021/01/20/how-to-securely-self-host-a-website-or-web-app/)]<br>
Techs used:
`Cloudflare`

https://blog.prutser.net/2021/01/20/how-to-securely-self-host-a-website-or-web-app/
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
Techs used:
`DigitalOcean`
`Ubuntu Server`

Get a VPS. Around $6 per month.

**Hosting a Virtual Private Server**<br>
[[Original article by Joe Morgan](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-react-application-with-nginx-on-ubuntu-20-04)]<br>
Techs used:
`nginx`

Blabla ...

<br>
<br>

<p align="center">
  <b>What next?</b>
</p>

You could go to
[CodersForEarth.com](https://codersforearth.com)
and see if there's any project
you'd love to invest your time in,
or you could even become a contributor
by forking this repository.

<br>
<br>
<br>

<!---

To Do:
- make a Docker image of the coming soon page





# Long Term
- add descriptions on the organization setting
- add explanation for the main gist
- add tags to the `about` section on GitHub
- turn on CloudFlare's developing mode to disable caching
- make the deployment process as automated as possible
  so that the whole process can be written in scripts.
  Then, migrating the server in case of failure
  will be faster. Down-time will be minimized.
- On the last week of October, register a credit card
  to IBM to get the $200 free credit. 
  A Kubernetes cluster with 2vCPU, 4GB RAM, 25GB SSD
  for primary disk, and 100GB SSD for secondary disk
  costs $82.08 per month.
- Servers = production systems
  My laptop = test environment
- Switch back Cloudflare's SSL setting to `Full`
- Optimize the codes.
  https://gtmetrix.com/put-javascript-at-bottom.html
- document about the folder structure. 
  What files are where, and what & why
- include why set minimum SSL protocol to
  TLS 1.2 and drop TLS 1.0 and TLS 1.1
  https://blog.qualys.com/product-tech/2018/11/19/grade-change-for-tls-1-0-and-tls-1-1-protocols?_ga=2.51170793.1984962975.1657484991-1435314446.1657484991


-->
