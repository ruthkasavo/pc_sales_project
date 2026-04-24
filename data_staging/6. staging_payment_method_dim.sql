--create if not exist
DROP TABLE  computer_std.dbo.dim_payment_method;
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


--3. select all the data from dim table
SELECT * FROM computer_std.dbo.dim_payment_method;