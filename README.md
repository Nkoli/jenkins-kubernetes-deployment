# Jenkins CI/CD pipeline

This basic Django application was containerized with Docker and deployed to Kubernetes via minikube. Also implements a Jenkins CI/CD pipeline to handle autodeployments.

#### Requirements

- Ubuntu Host System
- Minikube (latest)
- Virtualbox
- Helm
- Dockerhub account
- Github account

#### Project Setup Instructions

- Install minikube and enable the following addons:
  - helm-tiller
  - ingress-dns
- Install the official jenkins chart named `stable/jenkins` using helm install command.
- Install Kubernetes, Docker jenkins plugins from within the Jenkins dashboard.
- Check that you can connect to Kubernetes from jenkins system settings section.
- Generate an access token in Dockerhub and add it as a jenkins security credential.
- Use the fabric8-rbac.yaml to create a cluster role and bind the default user to that role, adjust to meet your permission targets.
- Run `minikube tunnel` to allow the created service to get an external ip address when created.

#### Deployment

- Use the guide provided in the jenkinsfile to test that the pipeline runs a docker image build and handles deployment correctly. Switch values and credentials.
- The following files should also be adjusted to your workflow:

  - deployment.yaml & service.yaml. These files create a deployment and creates the service which exposes the deployment.

- In dashboard, check the allocated external ip for the created service and click to see your app.
