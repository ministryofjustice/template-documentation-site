#!/usr/bin/env bash

set -e

# Install Lychee
echo "Installing Lychee"

lycheeLatestVersion=$(curl --silent https://api.github.com/repos/lycheeverse/lychee/releases/latest | jq -r '.tag_name')

mkdir /tmp/lychee

curl --silent --fail-with-body --location "https://github.com/lycheeverse/lychee/releases/download/${lycheeLatestVersion}/lychee-$(uname --machine)-unknown-linux-gnu.tar.gz" \
  --output "/tmp/lychee/lychee-aarch64-unknown-linux-gnu.tar.gz"

tar --extract --gzip --file=/tmp/lychee/lychee-aarch64-unknown-linux-gnu.tar.gz --directory=/tmp/lychee

sudo mv /tmp/lychee/lychee /usr/local/bin/lychee

rm --force --recursive /tmp/lychee

lychee --version
