---
slug: pin-action
title: Why Should We Pin Our GitHub Actions by commit-hash
authors:
  - name: Rafael Gonzaga
    title: Principal Open Source Engineer at NodeSource and Node.js
    url: https://rafaelgss.dev/
    image_url: https://avatars.githubusercontent.com/u/26234614?v=4
    socials:
      x: _rafaelgss
      github: RafaelGSS
tags: [CI/CD, GitHub]
---

Supply chain attacks are not something new; we have heard about them extensively, and the maximum we can do is mitigate
them as best as we can. However, it is crucial to acknowledge that these types of attacks will always exist. With that
in mind, it is important to understand all the attack vectors and take the necessary steps to secure our environment.

One of the initiatives planned by the Node.js Security WG (Working Group) for 2023 is to enhance the OSSF Scorecard.
This task requires changing all Node.js actions to be pinned by commit-hash. The reason for this approach is quite
simple: commit-hash provides immutability, unlike tags which do not.

For instance, it is quite common to include the following action as part of our application's CI pipeline:

```yaml
jobs:
  build:
    name: Build, push
    runs-on: ubuntu-latest
    steps:
    - name: Checkout master
      uses: actions/checkout@v3.5.2
```

Many developers rely on tools like Dependabot or Renovatebot to ensure that these actions stay up-to-date. However,
using the release tag can pose a risk to our environment.

Looking at a Scenario Where a Malicious Actor Gets Control
----------------------------------------------------------

Let's consider a scenario where a malicious actor gains control over the `actions/checkout` package. This compromised
package can now potentially manipulate the entire CI process. It can access environment variables used by other jobs,
write to a shared directory that subsequent jobs process, make remote calls, inject malicious code into the production
binary, and perform other malicious activities

What many developers assume is that once they pin an action using a release tag, such as v3.5.2, they are safe because
any new changes would require a new release. However, this assumption is fundamentally incorrect. Release tags are
__mutable__, and a malicious actor can override them. To illustrate this point, I have created two repositories for
educational purposes:

1. [bad-action](https://github.com/RafaelGSS/bad-action) - This repository contains a GitHub action that simulates
   someone taking over the package.
2. [using-bad-action](https://github.com/RafaelGSS/using-bad-action) - This repository demonstrates a project that
   utilizes the aforementioned action, as the name suggests.

In the `.github/workflows/main.yml` file of the latter repository, the `bad-action` is being used in version v1.0.1:

```yaml
on:
  workflow_dispatch:

jobs:
  example_job:
    runs-on: ubuntu-latest
    steps:
      - uses: RafaelGSS/bad-action@v1.0.1
```

For this practical example, `workflow_dispatch` will be used, but the same applies to `on: [push, pull_request]`
processes and so on.

As a result, when the action is executed, it prints “Hello world” in the console.

![](./1.png)

Now, let's consider the scenario where a bad actor takes over the repository and modifies the "Hello world" message to
"Hello darkness my old friend" without creating a new release. Instead, the actor overrides the existing v1.0.1 release
using the following commands:

```shell
echo "echo \"Hello darkness my old friend\"" > run.sh
git add run.sh
git commit -m "dangerous commit"
git push origin :refs/tags/v1.0.1
git tag -fa v1.0.1
git push origin main --tags
```

Consequently, if the action is executed again without any changes made to the source code, it will print "Hello darkness
my old friend". This demonstrates how our environment can be exploited by manipulating release tags.

![](./2.png)

Solution
--------

Pinning an action to a full-length commit SHA is currently the only method to ensure the use of an action as an
immutable release.

:::note[Quoting the OSSF Scorecard]

Pinned dependencies help reduce various security risks:

- They guarantee that checking and deployment are performed with the same software, minimizing deployment risks,
  simplifying debugging, and enabling reproducibility.
- They can help mitigate compromised dependencies from compromising the project's security. By evaluating the pinned
  dependency and being confident that it is not compromised, we can prevent the use of a later version that may be
  compromised.
- Pinned dependencies are a way to counter dependency confusion (or substitution) attacks. In these attacks, an
  application uses multiple feeds to acquire software packages (a “hybrid configuration”), and attackers trick the user
  into using a malicious package from an unexpected feed.

:::

With that in mind, fixing or securing the action is a straightforward process:

```yaml
on:
  workflow_dispatch:

jobs:
  example_job:
    runs-on: ubuntu-latest
    steps:
      - uses: RafaelGSS/bad-action@e20fd1d81b3f403df56f5f06e2aa9653a6a60763  # v1.0.1
```

Adding a comment referring to the tag enables automated dependency updates, such as Dependabot or Renovatebot, to update it whenever a new release is detected. [We can see an example of this in action in the Node.js Security WG repository](https://github.com/nodejs/security-wg/pull/1009).

![](./3.png)

There are open-source tools like [StepSecurity](https://www.stepsecurity.io/) that can assist us in addressing these
concerns. It generates automated pull requests for our codebase based on the configuration specified on their website.
