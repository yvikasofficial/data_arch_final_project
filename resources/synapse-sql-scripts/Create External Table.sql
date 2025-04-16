
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Admin1234!';

CREATE DATABASE SCOPED CREDENTIAL sqladminuser
WITH
IDENTITY = 'Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
LOCATION = 'https://publicprojectdetails.dfs.core.windows.net/silver',
CREDENTIAL = sqladminuser
)


CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
LOCATION = 'https://publicprojectdetails.dfs.core.windows.net/gold',
CREDENTIAL = sqladminuser
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
FORMAT_TYPE = PARQUET
)

DROP EXTERNAL TABLE gold.extprojects;

CREATE EXTERNAL TABLE gold.extprojects
WITH
(
LOCATION = 'extprojects',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.projects

SELECT * FROM gold.extprojects
