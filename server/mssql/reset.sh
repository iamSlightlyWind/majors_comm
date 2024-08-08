sqlcmd -S localhost -U sa -P 123 -i ./server/mssql/reset.sql -C
sqlcmd -S localhost -U sa -P 123 -i ./server/mssql/table.sql -C
sqlcmd -S localhost -U sa -P 123 -i ./server/mssql/procedure.sql -C
sqlcmd -S localhost -U sa -P 123 -i ./server/mssql/insert.sql -C