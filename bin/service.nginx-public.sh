#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )

if [[ -z "$1" ]]; then
    echo "usage $0 [start|stop]"
    exit 1
fi

case $1 in
start)
    $DIR/nginx/sbin/nginx -c ${SNAP_COMMON}/config.runtime/nginx/nginx.conf
    ;;
post-start)
    timeout 5 /bin/bash -c 'until echo > /dev/tcp/localhost/80; do sleep 1; done'
    ;;
reload)
    $DIR/nginx/sbin/nginx -c ${SNAP_COMMON}/config.runtime/nginx/nginx.conf -s reload
    ;;
stop)
    $DIR/nginx/sbin/nginx -c ${SNAP_COMMON}/config.runtime/nginx/nginx.conf -s stop
    ;;
*)
    echo "not valid command"
    exit 1
    ;;
esac


