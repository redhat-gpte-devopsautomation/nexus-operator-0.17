#!/bin/bash
# Update latest Roles
rm -rf roles
mkdir roles
git clone https://github.com/redhat-gpte-devopsautomation/ansible-operator-roles
cp -R ansible-operator-roles/roles/nexus-ocp ./roles
cp ansible-operator-roles/playbooks/nexus.yaml ./playbook.yml
rm -rf ansible-operator-roles

# Now build the Operator
operator-sdk build quay.io/wkulhanek/nexus-operator:v0.8.1
docker push quay.io/wkulhanek/nexus-operator:v0.8.1
