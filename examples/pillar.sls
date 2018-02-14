# Examples for common pillar configurations
Build Id:

pillar.sls
===
build: 1.0
==
in state file, use:
  {{ pillar.build }}
  {{ pillar['build'] }}
  {{ salt['pillar.get']('build') }}
      anywhere to return "1.0"

===

pillar2.sls
===
build:
  id: 1.0

{{ pillar['build.id'] }} ---?


^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
this broke because I specified a pattern match for the pillar.

ie. {% if grains['id'] == '*dev*' %} did NOT WORK
{% if grains['id'] == 'dev-03' %} DID work




===
#Setting up GPG Renderer

mkdir -p /etc/salt/gpgkeys
chmod 0700 /etc/salt/gpgkeys
gpg --gen-key --homedir /etc/salt/gpgkeys
gpg --homedir /etc/salt/gpgkeys --list-keys

#Encrypting Secrets. REPLACE "saltserver" with the "real name" used for the GPG Key in the keyring
echo -n "supersecret" | gpg --armor --batch --trust-model always --encrypt -r "saltserver"
cat ssh-private.key | gpg --armor --encrypt -r "saltserver"

#Accessing the data
===
passwords.sls
---
#!jinja|yaml|gpg

test-secret: |
  -----BEGIN PGP MESSAGE-----
    <encrypted data here>
  -----END PGP MESSAGE-----
===
lookup.sls
===
mysql:
  lookup:
    name: testerdb
    password: sometestpassword
    user: frank
    host: localhost

#to use lookup pillar for mysql - lookup - name to return value:
testdb:
  mysql_database.present:
    - name: {{ salt['pillar.get']('mysql:lookup:name') }}


References:
  - https://fabianlee.org/2016/10/18/saltstack-keeping-salt-pillar-data-encrypted-using-gpg/
