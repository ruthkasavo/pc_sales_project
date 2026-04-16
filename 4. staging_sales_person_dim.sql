--create if not exist
DROP TABLE computer_std.dbo.dim_sales_person;
CREATE TABLE computer_std.dbo.dim_sales_person (
    Sales_Person_ID INT IDENTITY(1,1) PRIMARY KEY,
    [Sales Person Name] VARCHAR(250) NULL,
    [Sales Person Department] VARCHAR(250) NULL
);

--insert data into the table
INSERT INTO computer_std.dbo.dim_sales_person 
	([Sales Person Name], [Sales Person Department])
SELECT DISTINCT 
	[Sales Person Name], [Sales Person Department]
FROM computer_std.dbo.pc_data;


--3. select all the data from dim table
SELECT * FROM computer_std.dbo.dim_sales_person;