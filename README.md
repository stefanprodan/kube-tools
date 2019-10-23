# kube-tools

![CI](https://github.com/stefanprodan/kube-tools/workflows/CI/badge.svg)
[![Docker](https://img.shields.io/badge/Docker%20Hub-stefanprodan%2Fkube--tools-blue)](https://hub.docker.com/r/stefanprodan/kube-tools)

Github Action with Kubernetes tools: kubectl, kustomize, helm, kubeval, conftest, jq, yq, go, bash

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
        uses: stefanprodan/kube-tools@1.0.0
        with:
          kubectl: 1.16.2
          kustomize: 3.2.3
          helm: 2.14.3
          command: |
            echo "Run conftest"
            kustomize build test/kustomize | conftest test -p test/policy -
            echo "Run kubeval"
            kustomize build test/kustomize | kubeval --strict --ignore-missing-schemas
```

CircleCI example:

```yaml
version: 2.1
jobs:
  test:
    docker:
      - image: stefanprodan/kube-tools:1.0.0
    steps:
      - checkout
      - run:
          name: Run Kubernetes tools
          command: |
            kubectl version --client
            kustomize version
            helm version --client
            helmv3 version
            kubeval --version
            conftest --version
            yq --version
            jq --version
            go version
``` 
