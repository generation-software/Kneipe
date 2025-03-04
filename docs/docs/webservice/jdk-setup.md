---
title: Setting up JDK in GitHub Actions
---

Installing JDK 17
-----------------

The standard [actions/setup-java](https://github.com/actions/setup-java) requires us to specify JDK distributions other
than JDK version. Looking up JDK distributions wastes user's time and gives opportunities to error.

We offer a no-config action that installs JDK 17 by default. The usage is as follows:

```yaml
name: CI/CD

"on":
  pull_request:
  push:
    branches:
      - master

jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - name: Set up JDK
        uses: paion-data/hashistack/.github/actions/jdk-setup@master
```
