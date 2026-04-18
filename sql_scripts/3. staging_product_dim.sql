--create if not exist
DROP TABLE computer_std.dbo.dim_product;
CREATE TABLE computer_std.dbo.dim_product (
    Product_ID INT IDENTITY(1,1) PRIMARY KEY,
    [PC Make] VARCHAR(250) NULL,
    [PC Model] VARCHAR(250) NULL,
    [Storage Type] VARCHAR(250) NULL,
    [Storage Capacity] NVARCHAR(250) NULL,
    RAM NVARCHAR(50) NULL
);

-- insert data into the table
INSERT INTO computer_std.dbo.dim_product 
	([PC Make], [PC Model], [Storage Type], [Storage Capacity], RAM)
SELECT DISTINCT 
	[PC Make], [PC Model], [Storage Type], [Storage Capacity], RAM
FROM computer_std.dbo.pc_data;

--3. select all the data from dim table
SELECT * FROM computer_std.dbo.dim_product;



WITH ChromebookCleanup AS (
    SELECT TOP 100 * -- Just to be safe
    FROM computer_std.dbo.dim_product
    WHERE [PC Model] = 'Chromebook'
)
DELETE FROM ChromebookCleanup 
WHERE Product_ID NOT IN (SELECT MIN(Product_ID) FROM ChromebookCleanup);