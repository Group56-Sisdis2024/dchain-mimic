#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: node-add-allowlist.sh <enode 1> <enode2> ... <enode-n>"
    exit 1
fi

args="\""

for (( i = 1; i <= $#; i++ )); do
    args+="${!i}\", \""
done

args="${args%, \"}"

curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[['"$args"']], "id":1}' http://127.0.0.1:8545