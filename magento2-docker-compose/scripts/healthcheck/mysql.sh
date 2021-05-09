#!/bin/bash

export $(xargs < `dirname $0`/../../.env)

mysqladmin ping -h localhost -p --password=${MYSQL_ROOT_PASSWORD} 2>&1 | grep -o '^mysqld is alive$' > /dev/null || exit 1
