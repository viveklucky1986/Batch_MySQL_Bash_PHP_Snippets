### Truncate Multiple Tables from Database with Condition ###
```sql
DECLARE @delimiter CHAR(1),
        @tableList VARCHAR(MAX),
        @tableName VARCHAR(20),
        @currLen INT

SET @delimiter = ','

-- SET @tableList = 'table1,table2,table3'
SELECT @tableList := GROUP_CONCAT(`table_name`) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '[DatabaseName]' AND TABLE_NAME LIKE '%order%' OR TABLE_NAME LIKE '%product%'

WHILE LEN(@tableList) > 0
BEGIN
    SELECT @currLen =
    (
        CASE charindex( @delimiter, @tableList )
            WHEN 0 THEN len( @tableList  )
            ELSE ( charindex( @delimiter, @tableList  ) -1 )
        END
    )

    SELECT @tableName = SUBSTRING (@tableList,1,@currLen )

    TRUNCATE TABLE @tableName

    SELECT tableList =
    (
        CASE ( len( @tableList ) - @currLen  )
            WHEN 0 THEN ''
            ELSE right( @tableList, len( @tableList ) - @currLen  - 1 )
        END
    )
END;
```
