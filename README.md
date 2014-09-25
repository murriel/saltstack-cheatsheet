saltstack-cheatsheet
====================

SaltStack Cheat Sheet .. My collection of often used commands on my Salt master.

This list is partly inspired by the fine lists on:
* http://www.xenuser.org/saltstack-cheat-sheet/
* https://github.com/saltstack/salt/wiki/Cheat-Sheet

# Minion status

Check the status of my minions.

```
salt-run manage.status  # What is the status of all my minions? (both up and down)
salt-run manage.up      # Any minions that are up?
salt-run manage.down    # Any minions that are down?
```

You can also use other commands to check if minions are alive and kicking but I prefer the manage.status.

```
salt \* test.ping
```

# Jobs in Salt

Some jobs operations that are often used. ( http://docs.saltstack.com/en/latest/topics/jobs/ )
```
salt-run jobs.active      # get list of active jobs
salt-run jobs.list_jobs   # get list of historic jobs
salt-run jobs.lookup_jid <job id number>  # get details of this specific job
```

# Salt Cloud

Salt Cloud is used to provision virtual machines in the cloud. (surprise!) ( http://docs.saltstack.com/en/latest/topics/cloud/ )

```salt-cloud -p profile_do my-vm-name -l debug``` - Provision using profile_do as profile and my-vm-name as the virtual machine name while using the debug option.

```salt-cloud -d my-vm-name``` - destroy the my-vm-name virtual machine.

```salt-cloud -u``` - Update salt-bootstrap to the latest develop version on GitHub.

# Sysadmin specific

Some stuff that is specifically of interest for sysadmins.

```
salt \* pkg.list_upgrades             # get a list of packages that need to be upgrade

salt \* pkg.version bash              # get current version of the bash package
salt \* pkg.install bash              # install or upgrade bash package
salt \* pkg.install bash refresh=True # install or upgrade bash package but
                                      # refresh the package database before installing.
```

# Documentation

## Documentation on the system

```
salt \* sys.doc         # output sys.doc (= all documentation)
salt \* sys.doc pkg     # only sys.doc for pkg module
salt \* sys.doc network # only sys.doc for network module
salt \* sys.doc system  # only sys.doc for system module
```

## Documentation on the web

- SaltStack documentation: http://docs.saltstack.com/en/latest/
- Salt-Cloud: http://docs.saltstack.com/en/latest/topics/cloud/
- Jobs: http://docs.saltstack.com/en/latest/topics/jobs/