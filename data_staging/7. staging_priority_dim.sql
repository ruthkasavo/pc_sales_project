--create if not exist
DROP TABLE computer_std.dbo.dim_priority;
CREATE TABLE computer_std.dbo.dim_priority (
    Priority_ID INT IDENTITY(1,1) PRIMARY KEY,
    Priority VARCHAR(250) NULL
);


--insert data into the table
INSERT INTO computer_std.dbo.dim_priority 
	([Priority])
SELECT DISTINCT 
	[Priority]
FROM computer_std.dbo.pc_data;

--3. select all the data from dim table
SELECT * FROM computer_std.dbo.dim_priority;