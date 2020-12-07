# Helm chart deployment for spring-db-demo

Code repository:
[spring-db-demo](https://github.com/cookcodeblog/spring-db-demo)

```bash
# Create a new Helm chart
helm create spring-db-demo

# Check Helm chart syntax
helm lint spring-db-demo

# Get rendered Helm template yaml
helm template --debug spring-db-demo ./spring-db-demo > spring-db-demo.yaml

# Helm dry run
helm install --dry-run --debug spring-db-demo ./spring-db-demo

# Get Helm rendered yaml
helm get manifest spring-db-demo > spring-db-demo.yaml

# Create a new OpenShift project 
oc new-project william-helm-spring

# Helm install
helm install --debug spring-db-demo ./spring-db-demo

# Helm upgrade and set replicas as 3
helm upgrade --debug spring-db-demo ./spring-db-demo --set replicas=3

```