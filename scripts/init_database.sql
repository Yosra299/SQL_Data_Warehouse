/*
This script creates new databse called "UD_data_warehouse"
then create 3 schemas in it : bronze ,silver and gold

*/


USE master;

CREATE DATABASE UD_data_warehouse

use UD_data_warehouse;
Go

----Create schema  
create SCHEMA bronze;
GO
create SCHEMA silver;
GO
create SCHEMA gold;
GO
