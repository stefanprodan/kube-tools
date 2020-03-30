# kube-tools

![CI](https://github.com/stefanprodan/kube-tools/workflows/CI/badge.svg)
[![Docker](https://img.shields.io/badge/Docker%20Hub-stefanprodan%2Fkube--tools-blue)](https://hub.docker.com/r/stefanprodan/kube-tools)

Github Action with Kubernetes tools:
kubectl, kustomize, helm, kubeval, conftest, jq, yq, go.
See the [release](https://github.com/stefanprodan/kube-tools/releases)
page for the list of available tools and versions.

GitHub Workflow example:

```yaml
name: CI

on: [push, pull_request]

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Run Kubernetes tools
        uses: stefanprodan/kube-tools@v1
        with:
          kubectl: 1.18.0
          kustomize: 3.4.0
          helm: 2.16.5
          helmv3: 3.1.2
          command: |
            echo "Run conftest"
            kustomize build test/kustomize | conftest test -p test/policy -
            echo "Run kubeval"
            kustomize build test/kustomize | kubeval --strict
```

