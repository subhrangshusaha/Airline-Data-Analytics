USE [data-marts]
GO

CREATE OR ALTER PROC CreateSQLServerlessViews_datamarts @ViewName nvarchar(100)
AS
BEGIN

DECLARE @statement VARCHAR(MAX)
    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT *
        FROM OPENROWSET(
            BULK ''https://airlinedatasubho.dfs.core.windows.net/gold/gold_dbo_db/' + @ViewName + '/'',
            FORMAT = ''DELTA''
        ) AS [result]
    '

EXEC (@statement)

END
GO