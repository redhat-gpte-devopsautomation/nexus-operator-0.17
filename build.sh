#!/bin/bash
SDK_RELEASE=v0.17.1
MINOR_RELEASE=0
OCP_CLIENT_RELEASE=4.4.8

# Update latest Roles
rm -rf roles
mkdir roles
git clone https://github.com/redhat-gpte-devopsautomation/ansible-operator-roles

cp -R ansible-operator-roles/roles/nexus-ocp ./roles
cp ansible-operator-roles/playbooks/nexus.yaml ./playbook.yml
rm -rf ansible-operator-roles

# Get OpenShift Client
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_CLIENT_RELEASE}/openshift-client-linux-${OCP_CLIENT_RELEASE}.tar.gz
mkdir client
tar xzf openshift-client-linux-${OCP_CLIENT_RELEASE}.tar.gz -C client
rm -f openshift-client-linux-${OCP_CLIENT_RELEASE}.tar.gz

# Now build the Operator
operator-sdk build quay.io/gpte-devops-automation/nexus-operator:${SDK_RELEASE}.${MINOR_RELEASE}
docker tag quay.io/gpte-devops-automation/nexus-operator:${SDK_RELEASE}.${MINOR_RELEASE} quay.io/gpte-devops-automation/nexus-operator:latest
docker tag quay.io/gpte-devops-automation/nexus-operator:${SDK_RELEASE}.${MINOR_RELEASE} quay.io/gpte-devops-automation/nexus-operator:${SDK_RELEASE}
docker push quay.io/gpte-devops-automation/nexus-operator:${SDK_RELEASE}.${MINOR_RELEASE}
docker push quay.io/gpte-devops-automation/nexus-operator:${SDK_RELEASE}
docker push quay.io/gpte-devops-automation/nexus-operator:latest

rm -fr client
