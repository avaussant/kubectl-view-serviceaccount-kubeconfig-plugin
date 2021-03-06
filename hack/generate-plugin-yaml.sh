#!/usr/bin/env bash

set -e -o pipefail; [[ -n "$DEBUG" ]] && set -x

export VERSION="$(./hack/git-version.sh)"
export DARWIN_SHA256="$(cat ./_dist/kubectl-view_serviceaccount_kubeconfig-darwin-amd64.zip.sha256)"
export LINUX_SHA256="$(cat ./_dist/kubectl-view_serviceaccount_kubeconfig-linux-amd64.zip.sha256)"

printf "cat <<EOL\n$(cat ./hack/plugin-template.yaml)\nEOL" | sh
