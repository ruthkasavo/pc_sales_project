CREATE OR ALTER PROCEDURE sp_create_dim_customer
AS
BEGIN
--create if not exist
IF OBJECT_ID('computer_std.dbo.dim_customer', 'U') IS NOT NULL
    DROP TABLE computer_std.dbo.dim_customer;

CREATE TABLE computer_std.dbo.dim_customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY, 
    [Customer Name] VARCHAR(250),
    [Customer Surname] VARCHAR(250),
    [Customer Contact Number] NVARCHAR(250),
    [Customer Email Address] VARCHAR(250)
);
--2. insert data into the table
INSERT INTO computer_std.dbo.dim_customer 
    ([Customer Name], [Customer Surname], [Customer Contact Number], [Customer Email Address])
SELECT DISTINCT 
    [Customer Name], [Customer Surname], [Customer Contact Number], [Customer Email Address]
FROM computer_std.dbo.pc_data;
END;