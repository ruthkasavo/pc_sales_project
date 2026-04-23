--create if not exist
IF OBJECT_ID('computer_std.dbo.dim_shop', 'U') IS NOT NULL
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
