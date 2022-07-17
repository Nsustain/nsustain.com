<!---
Vim commands
/search-term  |   n   |   shift + n   |   Search
:%s/search-term/replaceterm/gc   |   Search and replace
visual-mode-selection + :s/^/#   |   Comment block
ctrl + v + shift + i   |   Visual block mode

-->

# To Do List

### Short Term To Do

- design the backend such that the
  oAuth doesn't take any user information
  other than the authentication itself,
  so that the database doesn't store any
  user data because - well - we don't need
  any user data! We use oAuth just for
  giving users the permission to post
  or edit their posts.

### Long Term To Do

- add explanation for the main gist
- add tags to the `about` section on GitHub
- turn on CloudFlare's developing mode to disable caching
- make the deployment process as automated as possible
  so that the whole process can be written in scripts.
  Then, migrating the server in case of failure
  will be faster. Down-time will be minimized.
- on the last week of October, register a credit card
  to IBM to get the $200 free credit.
  A Kubernetes cluster with 2vCPU, 4GB RAM, 25GB SSD
  for primary disk, and 100GB SSD for secondary disk
  costs $82.08 per month.
- switch back Cloudflare's SSL setting to `Full`
- optimize the codes.
  https://gtmetrix.com/put-javascript-at-bottom.html
- document about the folder structure.
  What files are where, and what & why
- include why set minimum SSL protocol to
  TLS 1.2 and drop TLS 1.0 and TLS 1.1
  https://blog.qualys.com/product-tech/2018/11/19/grade-change-for-tls-1-0-and-tls-1-1-protocols?_ga=2.51170793.1984962975.1657484991-1435314446.1657484991
- after lunch, the first post should say,
  "hello, is anyone here?"
  and then the body says
  Hi! I'm not a regular user.
  I'm Soobin, the developer
  of this website :)
  You might be wondering if
  anybody uses this website.
  So far, we have only you
  and my team, but who knows?
  More people might start using
  our website. So, you could
  just make a post, if you happen
  to know any environmental problem
  that needs eager programmers to solve..."

### Feature Specifications
- storing necessary cookies with
  compliance to U.S. and Europian
  data protection laws; or even
  not storing cookies at all, if possible.
- servers = production systems;
  my laptop = test environment
- able to be deployed just by cloning
  this repository and running a few commands.
  Both for the K8s control plane and worker nodes.
- send an email to the moderator whenever a new
  post is made.
- whenever the moderator removes a post,
  the post goest to the trash box,
  and the user gets auto-generated message:
  "Your post was deleted by ..."


<br>
<br>
<br>
