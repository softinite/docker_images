CREATE USER 'apiuser'@'localhost' IDENTIFIED BY 'apimanager';

CREATE USER 'regadmin'@'localhost' IDENTIFIED BY 'regadmin';

create database regdb;
GRANT ALL ON regdb.* TO regadmin IDENTIFIED BY "regadmin";

create database apimgt;
create database registry;

grant all on apimgt.* TO apiuser identified by "apimanager";
grant all on registry.* TO apiuser identified by "apimanager";
FLUSH PRIVILEGES;


create database userstore;

grant all on userstore.* TO apiuser identified by "apimanager"; 
FLUSH PRIVILEGES;


 SHOW VARIABLES LIKE 'sql_mode' 
 
 SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SET GLOBAL sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';