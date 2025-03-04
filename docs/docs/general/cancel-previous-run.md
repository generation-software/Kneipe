---
title: Cancel Previous Action Run
---

For long-running CI/CD, it is often needed to immediately abort the run against the obsolete code. GitHub imposes a
limit such that, if CI/CD logics are complicated and running for a long time, the CI/CD for the newest code commit
cannot run until the obsolete ones finishes. This action cancels all previous GitHub Action runs so that the newest
commit could be served with immediate CI/CD resources.

Example Usage:

```yaml
name: CI/CD

"on":
  pull_request:

jobs:
  cancel-previous:
    uses: paion-data/hashistack/.github/workflows/cancel-previous-run.yaml@master
    secrets: inherit
```

:::warning

Note that this works for _pull request_ only.

:::
