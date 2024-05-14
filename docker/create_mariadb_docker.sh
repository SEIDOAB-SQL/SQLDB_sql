#!/bin/bash

#pull the container image to my computer
docker pull mariadb

# create a database container and run the docker 
docker run --name mariadbcontainer -e MYSQL_ROOT_PASSWORD=skYhgS@83#aQ -p 3306:3306 -d mariadb

#Connection string example
"MariaDb-goodfriendsefc-docker": "server=localhost;uid=root;pwd=skYhgS@83#aQ;database=goodfriendsefc;",
