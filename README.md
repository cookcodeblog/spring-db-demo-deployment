# Helm chart deployment for spring-db-demo

Code repository:
[spring-db-demo](https://github.com/cookcodeblog/spring-db-demo)

```bash
# Create a new Helm chart
helm create spring-db-demo

# Create a new OpenShift project 
oc new-project william-helm-spring

# Check Helm chart syntax
helm lint spring-db-demo

# Helm dry run
helm install --dry-run --debug spring-db-demo ./spring-db-demo

# Get Helm rendered yaml
helm get manifest spring-db-demo > spring-db-demo.yaml

# Helm install
helm install --debug spring-db-demo ./spring-db-demo

# Helm upgrade and set replicas as 3
helm upgrade --debug spring-db-demo ./spring-db-demo --set replicas=3

```