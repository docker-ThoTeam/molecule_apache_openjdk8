#!/bin/bash
# Initialize a credential helper to protect docker password storage.
set -ex

curl -fsSL "https://github.com/docker/docker-credential-helpers/releases/download/v0.6.3/docker-credential-pass-v0.6.3-amd64.tar.gz" | tar zxv
chmod + $(pwd)/docker-credential-pass

gpg --batch --gen-key <<-EOF
%echo Generating a standard key
Key-Type: DSA
Key-Length: 1024
Subkey-Type: ELG-E
Subkey-Length: 1024
Name-Real: Docker Thoteam
Name-Email: ThoTeam@spamstinks.com
Expire-Date: 0
# Do a commit here, so that we can later print "done" :-)
%commit
%echo done
EOF

key=$(gpg --no-auto-check-trustdb --list-secret-keys | grep ^sec | cut -d/ -f2 | cut -d" " -f1)
pass init $key

sed -i '0,/{/s/{/{\n\t"credsStore": "pass",/' ~/.docker/config.json