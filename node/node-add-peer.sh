#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: node-add-peer.sh <enode 1>"
    exit 1
fi

args="\""

for (( i = 1; i <= $#; i++ )); do
    args+="${!i}\", \""
done

args="${args%, \"}"

curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":['"$args"'],"id":1}' http://127.0.0.1:8545