---
sidebar_position: 7
title: Cancel Previous Action Run
---

Example Usage:

```yaml
name: CI/CD

"on":
  pull_request:
  push:
    branches:
      - master

jobs:
  cancel-previous:
    uses: ./.github/workflows/cancel-previous-run.yaml
    secrets: inherit
```

Note that this works for pull request only.
