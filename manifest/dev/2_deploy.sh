#!/bin/bash
CURRENT_DIR=$(dirname $0)
docker stack deploy -c "$CURRENT_DIR/docker-compose.yml" app

COUNTER=0
while (($COUNTER < 60)); do
    COUNTER=$((COUNTER+1))
    echo "Waiting for mysql server attempt $COUNTER"
    if (($COUNTER > 1)); then
        echo "Could not connect to mysql-server will try again in 10 seconds"
        sleep 10
    fi
    MYSQL_SERVER_CONTAINER="$(docker container ls -a -q -f name=app_app-mysql-server -f status=running)"
    if [ ! -z "$MYSQL_SERVER_CONTAINER" ]; then
        if docker exec $MYSQL_SERVER_CONTAINER sh -c '/usr/bin/mysql -u user -ppass app_database -e "show databases"' | grep "app_database"; then
            echo "mysql server ready"
            docker exec $MYSQL_SERVER_CONTAINER sh -c '/usr/bin/mysql -u user -ppass app_database < /var/dev_db/db_schema.sql'
            docker exec $MYSQL_SERVER_CONTAINER sh -c '/usr/bin/mysql -u user -ppass app_database < /var/dev_db/db_data.sql'
            COUNTER=1000
        fi
    fi
done

echo "Restarting web server"
sleep 5
WEB_SERVER_CONTAINER="$(docker container ls -a -q -f name=dnw_web-server -f status=running)"
docker service scale dnw_web-server=2
docker container stop $WEB_SERVER_CONTAINER
docker container rm $WEB_SERVER_CONTAINER
docker service scale dnw_web-server=1
