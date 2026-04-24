--create if not exist
DROP TABLE computer_std.dbo.dim_channel;
CREATE TABLE computer_std.dbo.dim_channel (
	Channel_ID INT IDENTITY(1,1) PRIMARY KEY,
	Channel varchar(250)
);

-- insert data into the dim table 
INSERT INTO computer_std.dbo.dim_channel ([Channel])
SELECT DISTINCT [Channel]
FROM computer_std.dbo.pc_data;

--3. select all the data from dim table
SELECT * FROM computer_std.dbo.dim_channel;