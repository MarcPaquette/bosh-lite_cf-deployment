#!/bin/bash -ex

#log into the cf deployment after it's been setup.
#set env vars for cf logins
#if this fails, you didn't set your routes 99% of the time

cf login -a https://api.bosh-lite.com --skip-ssl-validation -u admin  -p `bosh int $DEPLOYMENT_DIRECTORY/cf-deployment/deployment-vars.yml  --path /cf_admin_password`

