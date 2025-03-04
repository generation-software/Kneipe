---
title: React CI/CD Pipeline
---

```yaml
---
name: CI/CD

"on":
  pull_request:
  push:
    branches:
      - master

jobs:
  ci-cd:
    uses: paion-data/hashistack/.github/workflows/react-ci-cd.yaml@master
    secrets: inherit
    with:
      use-custom-lycheeignore-file: true
      user-name: QubitPi
      user-email: jack20220723@gmail.com
      cname: alexandria.paion-data.com
```
