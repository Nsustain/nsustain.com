---

<p align="center">
  <a href="https://nsustain.com">
    <img src="https://raw.githubusercontent.com/Nsustain/.github/main/logo/logo_github.png" width="350">
  </a>
</p>

---

<p align="center">
  <a href="https://github.com/Nsustain/nsustain.com">
    <img alt="nsustain.com" src="https://img.shields.io/badge/GitHub-nsustain.com-brightgreen">
  </a>
  <a href="https://github.com/Nsustain/nsustain.com/blob/main/LICENSE">
    <img src="https://badgen.net/github/license/Nsustain/.github">
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
  Thank you for making Nsustain better!
  These are guidelines, not rules.
  Thus, feel free to break these guidelines
  if you think that'd be better.
  However, fully understanding these
  guidelines will benefit everyone
  and code maintainability.
</p>

<br>
<br>

## Contributing
[1.](#1-coding-conventions) Coding Conventions<br>
  [A.](#naming-conventions) Naming Conventions<br>
  [B.](#html--css) HTML & CSS<br>
  [C.](#typescript) TypeScript<br>
[2.](#2-commit-messages) Commit Messages<br>
[3.](#3-pull-requests) Pull Requests<br>
[4.](#4-reporting-bugs) Reporting Bugs<br>
[5.](#5-Reporting-security-vulnerability) Reporting Security Vulnerability<br>

<br>
<br>

# 1. Coding Conventions

If you are new to
open-source, GitHub's
[Open Source Guides](https://opensource.guide/)
is a great place to start.

```bash
# Go to the directory you store
# your projects in.
cd ~/projects

# Clone this repository.
git clone https://github.com/Nsustain/nsustain.com.git

# Create a new branch.
git checkout -b branch-name

# Now, all your commits will be made
# to this branch.
```

Branch Name Do's:
- [&check;] `fix-typos`
- [&check;] `add-oauth-capability`

Branch Name Do not's:
- [&cross;] `NewBranch`
- [&cross;] `Branch2.`

<br>

## Naming Conventions

...

<br>

## HTML & CSS

...

<br>

## TypeScript

...

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

We have two branches:
`nsustain.com/main` and
`nsustain.com/develop`.
Make pull requests to
`develop`. All features on the
`develop` are tested
in the maintainers'
test environment first.
After all the tests are passed, all commits
on `develop` will be merged to `main`.

When you make a PR,
GitHub automatically sends an email
to the maintainers.
If we are online,
we try to finish the review under a day.
If we are offline, however,
please expect the reviewing process
to take around one week.

<br>

# 4. Reporting Bugs

Preferred method of reporting bugs
is writing on the
[issues tracker](https://github.com/Nsustain/nsustain.com/issues).
However, if you don't have a GitHub
account, you can email to
soobinrho@nsustain.com

<br>

# 5. Reporting Security Vulnerability

Please send an email to security@nsustain.com

<br>
<br>

<p align="center">
  <b>A Note From the Maintainers</b>
</p>

You're contribution means a lot for
everyone at Nsustain.
We'll always appreciate your time and effort
to make Nsustain better. Thank you!


<br>
<br>
<br>
