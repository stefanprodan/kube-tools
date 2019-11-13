# kube-tools

![CI](https://github.com/stefanprodan/kube-tools/workflows/CI/badge.svg)
[![Docker](https://img.shields.io/badge/Docker%20Hub-stefanprodan%2Fkube--tools-blue)](https://hub.docker.com/r/stefanprodan/kube-tools)

Github Action with Kubernetes tools: kubectl, kustomize, helm, kubeval, conftest, jq, yq, go. See the [release](https://github.com/stefanprodan/kube-tools/releases) page for the list of avaible tools and versions.

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
          kubectl: 1.16.2
          kustomize: 3.4.0
          helm: 2.16.1
          helmv3: 3.0.0
          command: |
            echo "Run conftest"
            kustomize build test/kustomize | conftest test -p test/policy -
            echo "Run kubeval"
            kustomize build test/kustomize | kubeval --strict
```

CircleCI example:

```yaml
version: 2.1
jobs:
  test:
    docker:
      - image: stefanprodan/kube-tools:v1
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
