---

<p align="center">
  <a href="https://nsustain.com">
    <img src="https://raw.githubusercontent.com/Nsustain/.github/main/logo/logo-github.png" width="350">
  </a>
</p>

---

<p align="center">
  <a href="https://github.com/Nsustain/nsustain.com">
    <img alt="nsustain.com" src="https://img.shields.io/badge/GitHub-nsustain.com-brightgreen">
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
    Contribution Guidelines
  </b><br>
  We appreciate your efforts in improving
  Nsustain! While these guidelines are not
  strict rules, we recommend following them
  to make maintenance easier for everyone
  who contributes to Nsustain. However, if
  you think breaking these guidelines will
  lead to better results, feel free to do so.
  Ultimately, the goal is to make Nsustain
  the best it can be. Thank you for your
  contributions!
</p>

<br>
<br>
<br>

If you are new to
open-source, GitHub's
[Open Source Guides](https://opensource.guide/)
is a great place to start.

```bash
# Go to the directory you store your projects in.
cd ~/projects

# Clone this repository.
git clone https://github.com/Nsustain/nsustain.com.git

# Create a new branch.
git checkout -b branch-name

# Now, all your commits will be made to this branch.
```

Branch Name Do's:
- [&check;] `fix-typos`
- [&check;] `add-oauth-capability`

Branch Name Do not's:
- [&cross;] `NewBranch`
- [&cross;] `Branch2.`

<br>
<br>

## Contributing
[1.](#1-naming-conventions) Naming Conventions<br>
[2.](#2-commit-messages) Commit Messages<br>
[3.](#3-pull-requests) Pull Requests<br>
[4.](#4-reporting-bugs) Reporting Bugs<br>
[5.](#5-reporting-security-vulnerability) Reporting Security Vulnerability<br>
#
<br>
<br>

# 1. Naming Conventions

It is recommended to use hyphens (-) as word
separators in folder names and file names,
rather than underscores (_). For example,
we prefer using "docker-images" rather than
"Docker_Images." This is because Google SEO
treats hyphens as word separators, but not
underscores. However, this convention may
be overridden by language-specific conventions.

<br>

# 2. Commit Messages

We follow
[Tim Pope's guidelines on commit messages](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).

Do's:
- [&check;] `Make documentation more concise`
- [&check;] `Add whitespace for readability`
- [&check;] `Fix notifications overflow`

Do not's:
- [&cross;] `updates.`
- [&cross;] `fixes.`

<br>

Plus, all commits should be signed with the
[Developer Certificate of Origin](https://github.com/apps/dco)
in order to verify the author.
You can sign your commits by using
`git commit -s -m 'Commit message'`,
which appends the DCO
to the end of your commit message:

```bash
# Sign your commit with the DCO.
git commit -s -m 'Commit message'

# Now, you commit message is signed with the DCO,
# which is basically your name and email. Example:
# Signed-off-by: Soobin Rho <soobinrho@nsustain.com>
```

Some of the maintainers personally use git's alias
command to make an alias of `git commit -s`
so that we can use a shorter command.

```bash
# Setting up a git alias is optional,
# but this could save your time.
# Register a git alias.
git config --global alias.c 'commit -s'

# Now, you can commit with
git c -am'Commit message'
```

<br>

# 3. Pull Requests

There are two branches in the Nsustain
repository: `nsustain.com/main` and
`nsustain.com/develop`. We ask that all
pull requests be made to the develop branch.
All new features on the develop branch are
tested in the maintainers' test environment
before being merged into the main branch.

When you submit a pull request, GitHub will
automatically notify the maintainers via email.
We will try to review and respond to pull
requests within one day if we are online.
If we are offline, please allow for a review
period of up to one week.

<br>

# 4. Reporting Bugs

The preferred method for reporting bugs
is to use the
[issues tracker](https://github.com/Nsustain/nsustain.com/issues)
on GitHub.
If you do not have a GitHub account, you can also email soobinrho@nsustain.com to report any issues you encounter.

<br>

# 5. Reporting Security Vulnerability

If you discover a security vulnerability,
please send an email to security@nsustain.com

<br>
<br>

<p align="center">
  <b>Thank You Note From the Maintainers</b>
</p>

We are grateful for your contributions
to Nsustain and appreciate the time and
effort you have dedicated to improving it.
Your contributions are greatly valued and
make a significant difference. Thank you!

<br>
<br>
<br>
