CREATE ROLE [db_apiETL]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'db_apiETL', N'svcssbrp'
GO
GRANT CREATE TABLE TO [db_apiETL]
GRANT REFERENCES TO [db_apiETL]
GRANT VIEW DEFINITION TO [db_apiETL]
