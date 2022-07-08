Here are the exact steps we took to
make codeforearth.org

...

## 1. Designing the web
`git`
`GitHub`

Create a `GitHub` repository because
version control ...



`javascript`
`react.js`
`next.js`

Create the website.

...

#### Building the website's database
`SQLite`
`IBM Databases for etcd`

...

## 2. Web Server
`nginx` <br>
[[Original article by Joe Morgan](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-react-application-with-nginx-on-ubuntu-20-04)]

...

## 3. Containerization
`Docker`

Make our website into a `Docket` image.

## 4. Virtual Private Server
`DigitalOcean`
`Ubuntu Server`

Get a VPS. Around $6 per month.

## 5. Container Orchestration System
`Kubernetes`
`K3s`

Explanation on high availability.

Install `K3s`.

Configure the `K3s` to pull our website
in the form of a `Docker` image.

Note: The reason why we use `Kubernetes`.
When our website gains more popularity,
server capability can be upscaled by
getting another VPS and then adding it
on our `K3s` as a worker node.

Even when we deploy a new node or when
we update our website, our website never
goes offline thanks to `Kubernetes`.
