#!/bin/sh

export $(xargs < ../.env)

#list_of_containers="${PREFIX}_${CONTAINER1} ${PREFIX}_${CONTAINER2} ${PREFIX}_${CONTAINER3} ${PREFIX}_${CONTAINER4} ${PREFIX}_${CONTAINER5} ${PREFIX}_${CONTAINER6} ${PREFIX}_${CONTAINER7} ${PREFIX}_${CONTAINER8} ${PREFIX}_${CONTAINER9}"
list_of_containers="${PREFIX}_${CONTAINER4} ${PREFIX}_${CONTAINER5} ${PREFIX}_${CONTAINER7} ${PREFIX}_${CONTAINER8} ${PREFIX}_${CONTAINER9}"
#mail -s "$list_of_containers" "a.marabyan@studio-one.am"
containers=`docker ps -f status=running --format "{{.Names}}"`
for container in $list_of_containers
do
  cont_health = `docker inspect --format='{{json .State.Health.Status}}' $container`
  echo $cont_health
  if echo $cont_health | grep -q 'healthy'
    then  echo "$container online "
  else echo "$container offline"
    exit 1
  fi
done
exit 0