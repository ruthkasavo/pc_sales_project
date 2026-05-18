USE computer_std;

-- 1. Drop the Fact Table FIRST to release the "lock" on dimensions
DROP TABLE IF EXISTS dbo.sales_fact_table;

-- 2. Now run your dimension procedures (these will now drop/create successfully)
EXEC dbo.sp_create_dim_customer;
EXEC dbo.sp_create_dim_location;
EXEC dbo.sp_create_dim_product;
EXEC dbo.sp_create_dim_shop;
EXEC dbo.sp_create_dim_channel; -- This will now work!
EXEC dbo.sp_create_dim_payment_method;
EXEC dbo.sp_create_dim_priority;
EXEC dbo.sp_create_dim_sales_person;

-- 3. Recreate the Fact Table last
EXEC dbo.sp_create_sales_fact_table;

