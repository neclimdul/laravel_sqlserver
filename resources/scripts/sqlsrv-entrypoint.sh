#!/bin/sh

/opt/mssql/bin/sqlservr.sh &

sleep 10
echo "Running setup"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P isheeChaiv5osh1aighi <<EOL
IF OBJECT_ID('homestead') IS NULL
	CREATE DATABASE [homestead]
GO
EOL

wait
