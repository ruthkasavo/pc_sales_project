-- computer_std.dbo.dim_channel definition

-- Drop table

DROP TABLE computer_std.dbo.dim_channel;

CREATE TABLE computer_std.dbo.dim_channel (
	Channel_ID INT IDENTITY(1,1) PRIMARY KEY,
	Channel varchar(50)
);

DROP TABLE computer_std.dbo.dim_customer;

CREATE TABLE computer_std.dbo.dim_customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY, 
    [Customer Name] VARCHAR(50),
    [Customer Surname] VARCHAR(50),
    [Customer Contact Number] NVARCHAR(50),
    [Customer Email Address] VARCHAR(50)
);

DROP TABLE  computer_std.dbo.dim_location;
CREATE TABLE computer_std.dbo.dim_location (
    Location_ID INT IDENTITY(1,1) PRIMARY KEY,
    Continent VARCHAR(50) NULL,
    [Country or State] VARCHAR(50) NULL,
    [Province or City] VARCHAR(64) NULL
);

DROP TABLE  computer_std.dbo.dim_payment_method;
CREATE TABLE computer_std.dbo.dim_payment_method (
    Payment_Method_ID INT IDENTITY(1,1) PRIMARY KEY,
    [Payment Method] VARCHAR(50) NULL
);

DROP TABLE computer_std.dbo.dim_priority;
CREATE TABLE computer_std.dbo.dim_priority (
    Priority_ID INT IDENTITY(1,1) PRIMARY KEY,
    Priority VARCHAR(50) NULL
);

DROP TABLE computer_std.dbo.dim_product;
CREATE TABLE computer_std.dbo.dim_product (
    Product_ID INT IDENTITY(1,1) PRIMARY KEY,
    [PC Make] VARCHAR(50) NULL,
    [PC Model] VARCHAR(50) NULL,
    [Storage Type] VARCHAR(50) NULL,
    [Storage Capacity] NVARCHAR(50) NULL,
    RAM NVARCHAR(50) NULL
);


DROP TABLE computer_std.dbo.dim_sales_person;
CREATE TABLE computer_std.dbo.dim_sales_person (
    Sales_Person_ID INT IDENTITY(1,1) PRIMARY KEY,
    [Sales Person Name] VARCHAR(50) NULL,
    [Sales Person Department] VARCHAR(50) NULL
);

DROP TABLE computer_std.dbo.dim_shop;
CREATE TABLE computer_std.dbo.dim_shop (
    Shop_ID INT IDENTITY(1,1) PRIMARY KEY,
    [Shop Name] VARCHAR(50) NULL,
    [Shop Age] INT NULL
);

CREATE TABLE computer_std.dbo.Fact_PC_Sales (
    Sales_ID INT IDENTITY(1,1) PRIMARY KEY, 
    Customer_ID INT,
    Sales_Person_ID INT,
    Product_ID INT,
    Location_ID INT,
    Channel_ID INT,
    Shop_ID INT,
    Payment_Method_ID INT,
    Priority_ID INT,
    [Cost Price] DECIMAL(18,2),
    [Sale Price] DECIMAL(18,2),
    [Discount Amount] DECIMAL(18,2),
    [Purchase Date] DATE,
    [Ship Date] DATE,
    [Credit Score] INT,
    [Cost of Repairs] DECIMAL(18,2),
    [PC Market Price] DECIMAL(18,2)
);
