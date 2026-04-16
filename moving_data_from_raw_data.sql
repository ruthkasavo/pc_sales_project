--creating location dimension table
SELECT DISTINCT pd.Continent, pd.[Country or State], pd.[Province or City] 
into computer_std.dbo.dim_location
FROM computer_std.dbo.pc_data pd;

--creating customer dimension table
SELECT DISTINCT pd.[Customer Name], pd.[Customer Surname], pd.[Customer Contact Number], pd.[Customer Email Address] 
into computer_std.dbo.dim_customer
FROM computer_std.dbo.pc_data pd;

--creating product dimension table
SELECT DISTINCT pd.[PC Make], pd.[PC Model], pd.[Storage Type], pd.[Storage Capacity], pd.RAM 
into computer_std.dbo.dim_product
FROM computer_std.dbo.pc_data pd;

--creating priority dimension table
SELECT DISTINCT pd.Priority 
into computer_std.dbo.dim_priority
FROM computer_std.dbo.pc_data pd;

--creating sales person dimension table
SELECT DISTINCT pd.[Sales Person Name], pd.[Sales Person Department] 
into computer_std.dbo.dim_sales_person
FROM computer_std.dbo.pc_data pd;

--creating channel dimension table
SELECT DISTINCT pd.Channel 
into computer_std.dbo.dim_channel
FROM computer_std.dbo.pc_data pd;

--creating payment method dimension table
SELECT DISTINCT pd.[Payment Method] 
into computer_std.dbo.dim_payment_method
FROM computer_std.dbo.pc_data pd;

--creating date dimension table
SELECT DISTINCT pd.[Purchase Date], pd.[Ship Date]  
into computer_std.dbo.dim_date
FROM computer_std.dbo.pc_data pd;
