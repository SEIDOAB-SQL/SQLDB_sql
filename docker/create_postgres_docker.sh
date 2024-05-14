#!/bin/bash

#pull the container image to my computer
docker pull postgres

# create a database container and run the docker 
docker run --name postgrescontainer -e POSTGRES_PASSWORD=skYhgS@83#aQ -d -p 5432:5432 postgres

#to access inside docker terminal:
#psql -U postgres
docker exec -it postgrescontainer psql -U postgres

#in postgres-#
#\l                                     list all databases
#\c database-name                       to connect to database
#drop database database-name;           to remove a database, you have to be connected to another database, e.g postgres

#Connection string example
"Postgres-goodfriendsefc-docker": "Server=localhost;Port=5432;Database=goodfriendsefc;User Id=postgres;Password=skYhgS@83#aQ;",
