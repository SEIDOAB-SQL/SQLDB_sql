#!/bin/bash


#Only on macOS ensure rosetta2 is installed on your M1 or M2 machine to emulate x86
softwareupdate --install-rosetta


#Only on Windows11 ensure you have last version of WindowsLinuxSubsystem installed
wsl --update
#Alternative if you do not have wsl installed
wsl --install

#pull the container image to my computer
docker pull mcr.microsoft.com/mssql/server:2022-latest

#install and run the container 
#Note that I change the SQL Server port from 1433 to 14333 by using -p 14333:143  - this is to avoid conflict with 
#already installed sql servers
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=skYhgS@83#aQ" -p 14333:1433 --name sql2022container1 --hostname sql2022 -d mcr.microsoft.com/mssql/server:2022-latest


#Connection string example docker
"SQLServer-goodfriendsefc-docker": "Data Source=localhost,14333;Initial Catalog=goodfriendsefc;Persist Security Info=True;User ID=sa;Pwd=skYhgS@83#aQ;Encrypt=False;",

#Connection string example SqlExpress
"SQLServer-goodfriendsefc-sqlex": "Data Source=localhost\\SQLEXPRESS;Initial Catalog=goodfriendsefc;Integrated Security=SSPI;Encrypt=False;",
