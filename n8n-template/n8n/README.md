# N8N Helm Chart

This Helm chart allows you to deploy and customize the N8N platform, an automation and integration tool.

## Prerequisites

- Kubernetes cluster
- Helm 3.x installed

## Configuration

The following parameters can be customized in the `values.yaml` file:

### Image

- `repository`: Docker image repository for N8N.
- `pullPolicy`: Image pull policy.
- `tag`: Docker image tag for N8N.

### General

- `fullnameOverride`: Override the full name of the resources.

### Service Account

- `roles`: Define roles for the Service Account to manage rollouts.

### Service

- `type`: Kubernetes service type for N8N.
- `port`: Service port for N8N.

### Persistent Volume Claim (PVC)

- `storage`: Size of the PVC for N8N.

### Ingress

- `enabled`: Enable/disable Ingress.
- `className`: Ingress class name (if applicable).
- `annotations`: Additional annotations for the Ingress.
- `hosts`: List of hosts for the Ingress.
- `tls`: TLS configuration for the Ingress.

### Istio Ingress

- `enabled`: Enable/disable Istio Ingress.
- `hostname`: Hostname for Istio Ingress.

### Resources

- `requests`: Resource requests for N8N pods.
- `limits`: Resource limits for N8N pods.

### Node Selector, Tolerations, and Affinity

- `nodeSelector`: Node selector for N8N pods.
- `tolerations`: Tolerations for N8N pods.
- `affinity`: Affinity rules for N8N pods.

### Database (PostgreSQL)

- `resources`: Resource requests and limits for the PostgreSQL database.
- `pvc`: Persistent Volume Claim configuration for the PostgreSQL database.

## Example Usage

To install N8N with specific configurations, you can create a `values.yaml` file and provide the desired values. For instance:

```yaml
image:
  repository: my-n8n-repo/n8n
  pullPolicy: Always
  tag: "v1.0.0"

fullnameOverride: my-n8n-platform

service:
  type: LoadBalancer

pvc:
  storage: 20Gi

ingress:
  enabled: true
  className: "nginx"
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
    - host: my-n8n.mydomain.com
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls:
    - hosts:
        - my-n8n.mydomain.com

resources:
  requests:
    memory: 2Gi
    cpu: 200m
  limits:
    memory: 4Gi
```

### Database

By default, this chart deploys a PostgreSQL database as the backend for N8N. The database configuration can be customized in the values.yaml file.