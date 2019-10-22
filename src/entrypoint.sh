#!/usr/bin/env bash

set -o errexit

KUBECTL_VER=$2
if [[ "${KUBECTL_VER}" != "" ]]; then
  curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl \
  -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
fi

KUSTOMIZE_VER=$3
if [[ "${KUSTOMIZE_VER}" != "" ]]; then
  curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_kustomize.v${KUSTOMIZE_VER}_linux_amd64 \
  -o /usr/local/bin/kustomize && chmod +x /usr/local/bin/kustomize
fi

HELM_VER=$4
if [[ "${HELM_VER}" != "" ]]; then
  curl -sL https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz | \
  tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64
fi

echo ">>> Executing command <<<"
echo ""
echo ""

bash -c "set -e;  set -o pipefail; $1"
