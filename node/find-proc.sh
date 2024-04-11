#!/bin/bash

lsof -n -i :8545 | grep LISTEN
lsof -n -i :30303 | grep LISTEN
