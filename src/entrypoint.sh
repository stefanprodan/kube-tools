#!/usr/bin/env bash

set -e
set -o pipefail

KUBECTL_VER=${2}
if [[ "${KUBECTL_VER}" != "" ]]; then
  curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl \
  -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
fi

KUSTOMIZE_VER=${3}
if [[ "${KUSTOMIZE_VER}" != "" ]]; then
  curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz | \
  tar xz && mv kustomize /usr/local/bin/kustomize
fi

HELM_VER=${4}
if [[ "${HELM_VER}" != "" ]]; then
  curl -sL https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz | \
  tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64
fi

HELM3_VER=${5}
if [[ "${HELM3_VER}" != "" ]]; then
  curl -sL https://get.helm.sh/helm-v${HELM3_VER}-linux-amd64.tar.gz | \
  tar xz && mv linux-amd64/helm /usr/local/bin/helmv3 && rm -rf linux-amd64
fi

KUBESEAL_VER=${6}
if [[ "${KUBESEAL_VER}" != "" ]]; then
  curl -sL https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VER}/kubeseal-linux-amd64 \
  -o /usr/local/bin/kubeseal && chmod +x /usr/local/bin/kubeseal
fi

KUBEVAL_VER=${7}
if [[ "${KUBEVAL_VER}" != "" ]]; then
  curl -sL https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VER}/kubeval-linux-amd64.tar.gz | \
  tar xz && mv kubeval /usr/local/bin/kubeval
fi

CONFTEST_VER=${8}
if [[ "${CONFTEST_VER}" != "" ]]; then
  wget -O conftest https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST_VER}/conftest_${CONFTEST_VER}_Linux_x86_64.tar.gz -q
  tar xzf conftest && mv conftest /usr/local/bin
fi

KUBECONFORM_VER=${9}
if [[ "${KUBECONFORM_VER}" != "" ]]; then
  curl -sSL https://github.com/yannh/kubeconform/releases/download/v${KUBECONFORM_VER}/kubeconform-linux-amd64.tar.gz | \
  tar xz && mv kubeconform /usr/local/bin/kubeconform
fi

YQ_VER=${10}
if [[ "${YQ_VER}" != "" ]]; then
  curl -sL https://github.com/mikefarah/yq/releases/download/v${YQ_VER}/yq_linux_amd64 \
  -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq
fi

KYVERNO_VER=${11}
if [[ "${KYVERNO_VER}" != "" ]]; then
  curl -sSL https://github.com/kyverno/kyverno/releases/download/v${KYVERNO_VER}/kyverno-cli_v${KYVERNO_VER}_linux_x86_64.tar.gz | \
  tar xz && mv kyverno /usr/local/bin/kyverno
fi

echo ">>> Executing command <<<"
echo ""
echo ""

bash -c "set -e;  set -o pipefail; $1"
