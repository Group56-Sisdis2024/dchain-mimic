#!/bin/bash

shopt -s expand_aliases
source /etc/.bash_aliases

besu --data-path=data --genesis-file=../genesis.json --permissions-nodes-config-file-enabled --permissions-accounts-config-file-enabled --rpc-http-enabled --rpc-http-api=ADMIN,ETH,NET,PERM,IBFT --host-allowlist="*" --rpc-http-cors-origins="*" --rpc-http-host="0.0.0.0"
