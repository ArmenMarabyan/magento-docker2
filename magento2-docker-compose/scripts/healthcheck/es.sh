#!/bin/bash

curl -s http://localhost:9200/_cat/health?h=status | grep -o '^green$' > /dev/nul || exit 1;