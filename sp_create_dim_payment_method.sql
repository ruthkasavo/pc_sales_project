CREATE OR ALTER PROCEDURE sp_create_dim_payment_method
AS
BEGIN
--create if not exist
IF OBJECT_ID('computer_std.dbo.dim_payment_method', 'U') IS NOT NULL
    DROP TABLE computer_std.dbo.dim_payment_method;
CREATE TABLE computer_std.dbo.dim_payment_method (
    Payment_Method_ID INT IDENTITY(1,1) PRIMARY KEY,
    [Payment Method] VARCHAR(50) NULL
);
--insert data into the table
INSERT INTO computer_std.dbo.dim_payment_method 
	([Payment Method])
SELECT DISTINCT 
	[Payment Method]
FROM computer_std.dbo.pc_data;
END;