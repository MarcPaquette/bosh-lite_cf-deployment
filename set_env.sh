#!/bin/bash -ex 

#set up env for all environments

#Set up bosh env
source ./environment/bosh_env.sh

#log into bosh env
source ./environment/bosh_login.sh

#log into cloud foundry via cli
source ./environment/cf_env.sh
