# kube-tools

The kube-tools GitHub Action has been deprecated in favor of
[Arkade](https://github.com/alexellis/arkade) which offers overs 100 CLI tools.

To migrate your workflows from kube-tools to Arkade,
you can use the [arkade-get](https://github.com/alexellis/arkade-get)
GitHub Action as a drop-in replacement.

Example:

```yaml
    - uses: alexellis/setup-arkade@v1
    - uses: alexellis/arkade-get@master
      with:
        kubectl: latest
        kustomize: latest
        kubeconform: latest
        helm: latest
        jq: latest
        yq: latest
```
