#!/bin/bash
# Initialize a credential helper to protect docker password storage.
set -ex

curl -fsSL "https://github.com/docker/docker-credential-helpers/releases/download/v0.6.3/docker-credential-pass-v0.6.3-amd64.tar.gz" | tar zxv
chmod +x $(pwd)/docker-credential-pass
sudo mv $(pwd)/docker-credential-pass /usr/bin

$keypass=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20 ; echo '')

gpg --batch --gen-key <<-EOF
%echo Generating a standard key
%no-protection
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: FAKEME
Name-Email: fake@me.local
Expire-Date: 0
%commit
%echo done
EOF

pass init FAKEME

mkdir -p ~/.docker

cat > ~/.docker/config.json <<-EOF
{
  "credsStore" : "pass"
}
EOF
