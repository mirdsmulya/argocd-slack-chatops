
# convert to yaml
yq eval -P argocd-*.json -oy > argocd-*.yaml

# convert to json
yq eval -j argocd-*.yaml > argocd-*.json