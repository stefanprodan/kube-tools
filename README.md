# kube-tools

![CI](https://github.com/stefanprodan/kube-tools/workflows/CI/badge.svg)

Github Action with Kubernetes tools: kubectl, kustomize, helm, kubeval, conftest, jq, yq

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
        uses: stefanprodan/kube-tools@master
        with:
          kubectl: 1.16.2
          kustomize: 3.2.3
          helm: 2.14.3
          command: |
            kubectl version --client
            kustomize version
            helm version --client
            helmv3 version
            kubeval --version
            conftest --version
            yq --version
            jq --version
```
