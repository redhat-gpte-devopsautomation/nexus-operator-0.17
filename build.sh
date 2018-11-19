#!/bin/bash
operator-sdk build quay.io/wkulhanek/nexus-operator:v0.0.1
docker push quay.io/wkulhanek/nexus-operator:v0.0.1
