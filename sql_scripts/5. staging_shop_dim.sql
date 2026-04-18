--create if not exist
DROP TABLE computer_std.dbo.dim_shop;
CREATE TABLE computer_std.dbo.dim_shop (
    Shop_ID INT IDENTITY(1,1) PRIMARY KEY,
    [Shop Name] VARCHAR(250) NULL,
    [Shop Age] INT NULL
);


--insert data into the table
INSERT INTO computer_std.dbo.dim_shop 
	([Shop Name], [Shop Age])
SELECT DISTINCT 
	[Shop Name], [Shop Age]
FROM computer_std.dbo.pc_data;

--select all data from the dim table
SELECT * FROM computer_std.dbo.dim_shop;

WITH ShopCleaner AS (
    SELECT 
        Shop_ID, 
        [Shop Name],
        ROW_NUMBER() OVER (
            PARTITION BY [Shop Name] 
            ORDER BY Shop_ID
        ) AS RowNum
    FROM computer_std.dbo.dim_shop
)
DELETE FROM ShopCleaner 
WHERE RowNum > 1;