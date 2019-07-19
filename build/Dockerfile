FROM quay.io/operator-framework/ansible-operator:v0.9.0

COPY roles/ ${HOME}/roles/
COPY watches.yaml ${HOME}/watches.yaml
COPY playbook.yml ${HOME}/playbook.yml
COPY client/oc /usr/local/bin/
