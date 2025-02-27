---
sidebar_position: 4
title: UI Unit Test
---

The UI unit test action runs unit tests and assumes the **yarn** package manager and requires a `test` script to be
defined in projects `package.json` file. For example, the following uses [Jest] as the unit test runner:

```json
{
  "scripts": {
    "test": "jest"
  }
}
```

To use this action, import it in the following way:

```yaml
name: CI/CD

"on":
  pull_request:
  push:
    branches:
      - master

  unit-tests:
    name: Unit Tests
    uses: paion-data/hashistack/.github/workflows/ui-unit-test.yml@master
    with:
      node-version: 22
```

:::tip

In the example above, the node 22 and the most recent stable yarn version is used in the CI/CD project.

:::

:::tip

The example above uses Node version 18, which is specified in `NODE_VERSION`
[environment variable](https://docs.github.com/en/actions/learn-github-actions/variables#defining-environment-variables-for-a-single-workflow)

:::

[Jest]: https://jestjs.io/
