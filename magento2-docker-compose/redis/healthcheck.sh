#!/bin/bash

redis-cli ping 2>&1 | grep -o '^PONG$' > /dev/null || exit 1