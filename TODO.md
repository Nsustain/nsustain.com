<!---
Vim commands
/search-term  |   n   |   shift + n   |   Search
:%s/search-term/replaceterm/gc   |   Search and replace
visual-mode-selection + :s/^/#   |   Comment block
ctrl + v + shift + i   |   Visual block mode

-->

# To Do List

### Long Term To Do

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
  In other words, don't be embarrased
  of our new website having no user for now.
  Just own up to it and be honest about it!
  No need to create dummy posts to make it
  look populated.
  Users will appreciate us being honest.

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
- no username so that we can minimize
  storage of user data. The best way
  to prevent hacking is to have nothing
  to be hacked in the first place.
  Instead of having a user name,
  whenever the original poster makes
  a comment on his/her post,
  it shows as OP.
  Plus, other users can select their
  their identification as either
  "coder," "reviwer," or "other"
  The naming will be such that
  "coder A," "coder B," incrementing...
  In other words, no permanent identification
  across the website, but only post-specific ones.

  There will be four possible id's.
  For every post, there will be only one OP though.

  In other words, the reason why there's an
  oAuth using Google and GitHub is only because
  the OP should be able to edit, and also
  we should prevent bots form making comments.

- Only two pages. Main, which has no label since
  it's the default page, and about page.
  About page, however, just links to our
  https://github.com/Nsustain/nsustain.com
  Maybe using 302 redirect.

- Try not to do all things mediocrely, but
  do one thing the best. What does our website to?
  Help people who know the environment find
  programmers who can solve the problem.
  Help programmers who want to find a project
  that touches their heart.

- encourage users to avoid posting a duplicate
  problem, for which the problem already exists,
  but no problem at all. Just encourage users to
  be kind and point the post to that existing project.

- for search function, just use custom google search.
  No need to reinvent the wheel. Also, Google
  custom search does it better anyways.

- for each post, the OP has the option to
  upload a slack channel url to the post.
  Slack or discord or anything.
  I'd like this to be like Call for Code
  project page's fields, but with
  more freedom to choose any platform.

- email logs@nsustain.com whenever
  an ssh connection with an outside-whitelist
  IP address occurs. If possible, email also
  when port other than SSH, HTTPS are used,
  even though they are already blocked on the firewall.

<br>
<br>
<br>
