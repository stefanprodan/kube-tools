# kube-tools

![CI](https://github.com/stefanprodan/kube-tools/workflows/CI/badge.svg)
[![Docker](https://img.shields.io/badge/Docker%20Hub-stefanprodan%2Fkube--tools-blue)](https://hub.docker.com/r/stefanprodan/kube-tools)

Github Action with Kubernetes tools:

* kubectl
* yq
* kustomize
* helm
* kubeseal
* kubeval
* conftest
* kubeaudit
* kubeconform
* kyverno

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
      - uses: actions/checkout@v2
      - name: Run Kubernetes tools
        uses: stefanprodan/kube-tools@v1
        with:
          kubectl: 1.23.0
          kustomize: 4.4.1
          helm: 3.7.2
          kubeseal: 0.16.0
          kubeval: 0.16.1
          conftest: 0.28.3
          kubeconform: 0.4.12
       - run: |
            echo "Run conftest"
            kustomize build test/kustomize | conftest test -p test/policy -
            echo "Run kubeval"
            helmv3 template ./charts/test | kubeval --strict
```
