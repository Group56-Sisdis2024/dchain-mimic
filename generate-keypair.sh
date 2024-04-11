#!/bin/bash

shopt -s expand_aliases
source /etc/.bash_aliases

besu operator generate-blockchain-config --config-file=ibftConfig.json --to=networkFiles --private-key-file-name=key

PRIVKEY=$(cat networkFiles/keys/*/key)
PUBKEY=$(cat networkFiles/keys/*/key.pub)

echo Private key: $PRIVKEY
echo Public key: $PUBKEY

echo Moving files to node...

mv networkFiles/keys/* node/data/

echo Files moved! Your node is now ready with new key pair.

rm -rf networkFiles