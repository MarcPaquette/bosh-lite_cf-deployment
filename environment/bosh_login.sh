#!/bin/bash -exu
source ./environment/bosh_env.sh

bosh alias-env $BOSH_ENV_ALIAS -e 192.168.50.6 --ca-cert <(bosh int $DEPLOYMENT_DIRECTORY/creds.yml --path /director_ssl/ca)
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=`bosh int $DEPLOYMENT_DIRECTORY/creds.yml --path /admin_password`

