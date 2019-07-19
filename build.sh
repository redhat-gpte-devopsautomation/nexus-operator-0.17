#!/bin/bash
# Update latest Roles
rm -rf roles
mkdir roles
git clone https://github.com/redhat-gpte-devopsautomation/ansible-operator-roles
cp -R ansible-operator-roles/roles/nexus-ocp ./roles
cp ansible-operator-roles/playbooks/nexus.yaml ./playbook.yml
rm -rf ansible-operator-roles
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.1.6/openshift-client-linux-4.1.6.tar.gz
mkdir client
tar xzf openshift-client-linux-4.1.6.tar.gz -C client
rm -f openshift-client-linux-4.1.6.tar.gz

# Now build the Operator
operator-sdk build quay.io/gpte-devops-automation/nexus-operator:v0.8.1
docker push quay.io/gpte-devops-automation/nexus-operator:v0.8.1

rm -fr client
