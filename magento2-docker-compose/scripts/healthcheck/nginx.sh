#!/bin/bash

curl -s -w "%{http_code}" localhost:80 | grep -o '^200$' > /dev/null || exit 1;

#service nginx status || exit 1
#if service nginx status; then
#    echo 0
#else
#    echo 1
#fi