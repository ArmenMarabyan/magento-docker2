#!/bin/sh

export $(xargs < ../.env)

list_of_containers="${PREFIX}_${CONTAINER4} ${PREFIX}_${CONTAINER5} ${PREFIX}_${CONTAINER7} ${PREFIX}_${CONTAINER8} ${PREFIX}_${CONTAINER9}"
containers=`docker ps -f status=running --format "{{.Names}}"`
for container in $list_of_containers
do

  if echo $containers | grep -q $container
    then  echo "$container online "
  else echo "$container offline"
#    exit 1
  fi
done
exit 0