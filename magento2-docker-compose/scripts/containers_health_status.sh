#!/bin/sh

export $(xargs < `dirname $0`/../.env)

#list_of_containers="${PREFIX}_${CONTAINER1} ${PREFIX}_${CONTAINER2} ${PREFIX}_${CONTAINER3} ${PREFIX}_${CONTAINER4} ${PREFIX}_${CONTAINER5} ${PREFIX}_${CONTAINER6} ${PREFIX}_${CONTAINER7} ${PREFIX}_${CONTAINER8} ${PREFIX}_${CONTAINER9}"
list_of_containers="${PREFIX}_${CONTAINER4} ${PREFIX}_${CONTAINER5} ${PREFIX}_${CONTAINER7} ${PREFIX}_${CONTAINER8} ${PREFIX}_${CONTAINER9}"
##mail -s "text" "${NOTIF_EMAIL}"
unhealth_containers=`docker ps -f status=running --filter="health=healthy"`

for container in $list_of_containers
do
  if echo $unhealth_containers | grep -q $container
    then  :
  else echo "Restarting $container $(date '+%Y-%m-%d %H:%M:%S')"
    docker restart $container
  fi
done
exit 0
