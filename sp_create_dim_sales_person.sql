CREATE OR ALTER PROCEDURE sp_create_dim_sales_person
AS
BEGIN
 --create if not exist
IF OBJECT_ID('computer_std.dbo.dim_sales_person', 'U') IS NOT NULL
    DROP TABLE computer_std.dbo.dim_sales_person;

CREATE TABLE dbo.dim_sales_person (
Sales_Person_ID INT IDENTITY(1,1) PRIMARY KEY,
[Sales Person Name] VARCHAR(250) NULL,
[Sales Person Department] VARCHAR(250) NULL
    );
--insert data into the table
INSERT INTO dbo.dim_sales_person ([Sales Person Name], [Sales Person Department])
    SELECT DISTINCT TRIM([Sales Person Name]), TRIM([Sales Person Department])
    FROM computer_std.dbo.pc_data;
--Keep only one ID per Name/Department combo
--    WITH SPCleaner AS (
--        SELECT Sales_Person_ID, 
--        ROW_NUMBER() OVER (PARTITION BY [Sales Person Name], [Sales Person Department] ORDER BY Sales_Person_ID) as rn
--        FROM dbo.dim_sales_person
--    )
--    DELETE FROM SPCleaner WHERE rn > 1;
END;