# bosh-lite_cf-deployment

### Summary

This is a script that deploys a bosh-lite instance onto Vbox.  Once that's setup, it will deploy a Cloud Foundry deployment that uses cf-deployment. Finally it will run the smoke tests, then log you into the cf cli

It requires the following:
* [BOSH v2 cli](https://bosh.io/docs/cli-v2.html)
* [cf cli](https://docs.cloudfoundry.org/cf-cli)
* [vbox](https://www.virtualbox.org/wiki/Downloads)
* [xcode (if you are installing from OSX)](https://developer.apple.com/xcode/)

You will also need to modify routes on line 54 in cf_deployment_warden (iproute2 is used) for the `cf login` to work:
```bash
$ sudo route add -net 10.244.0.0/16     192.168.56.6 # Mac OS X
$ sudo ip route add   10.244.0.0/16 via 192.168.56.6 # Linux (using iproute2 suite)
$ sudo route add -net 10.244.0.0/16 gw  192.168.56.6 # Linux (using DEPRECATED route command)
$ route add           10.244.0.0/16     192.168.56.6 # Windows
```
NOTE: ip route is not permanently added, it need to be added before start vbox after a computer is shut down.

It's been tested under Manjaro Linux, but should work other places as well.

### Usage
To deploy a Bosh Lite Director and then install Cloud Foundry on it:
```bash
./cf_deployment_warden
```

To source the environment so bosh and cf cli works use: 
```bash
source set_env.sh
```

The files in the environment directory do the following:
bosh_env.sh
  Setup the bosh and deployment directories
bosh_login.sh
  Log into the bosh director once it's been deployed
cf_env.sh
  Log into the Cloud Foundry foundation as the administrator user.

### Notes
Takes about 2 hours to deploy on my 2017 Macbook Pro. (@MarcPaquette)

### VBox attach disk fix
To have access, again, to cf in vbox use option "SavedState" when you "Close" VM. Before runnig VM again, change this:
```bash
cd /path/to/vbox/vm/vm-saved/vm-saved.vox
vim vm-saved.vom
```
Change the hotpluggable for port 2, from false to true
```bosh
<AttachedDevice type="HardDisk" hotpluggable="false" port="2" device="0">
```
to
```
<AttachedDevice type="HardDisk" hotpluggable="true" port="2" device="0">
```
Save and exit. Start VM.


