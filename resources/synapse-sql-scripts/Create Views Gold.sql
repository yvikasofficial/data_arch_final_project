CREATE VIEW gold.projects
AS SELECT *
FROM
OPENROWSET(
BULK 'https://publicprojectdetails.blob.core.windows.net/silver/sources/',
FORMAT = 'PARQUET'
) as QUER1