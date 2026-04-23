--create if not exist
IF OBJECT_ID('computer_std.dbo.dim_location', 'U') IS NOT NULL
    DROP TABLE computer_std.dbo.dim_location;

CREATE TABLE computer_std.dbo.dim_location (
    Location_ID INT IDENTITY(1,1) PRIMARY KEY,
    Continent VARCHAR(250),
    [Country or State] VARCHAR(250),
    [Province or City] VARCHAR(250)
);

-- insert data into the table
INSERT INTO computer_std.dbo.dim_location 
	(Continent, [Country or State], [Province or City])
SELECT DISTINCT 
	Continent, [Country or State], [Province or City]
FROM computer_std.dbo.pc_data;

--3. select all the data from dim table
SELECT * FROM computer_std.dbo.dim_location 