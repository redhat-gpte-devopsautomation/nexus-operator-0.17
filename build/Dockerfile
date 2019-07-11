FROM quay.io/operator-framework/ansible-operator:v0.8.1

COPY roles/ ${HOME}/roles/
COPY watches.yaml ${HOME}/watches.yaml
COPY playbook.yml ${HOME}/playbook.yml
COPY client/oc /usr/local/bin/
