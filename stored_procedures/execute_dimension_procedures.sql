-- Switch to database
USE computer_std;
    -- 1. Load all Dimensions
EXEC dbo.sp_create_dim_customer;
EXEC dbo.sp_create_dim_location;
EXEC dbo.sp_create_dim_product;
EXEC dbo.sp_create_dim_shop;
EXEC dbo.sp_create_dim_channel;
EXEC dbo.sp_create_dim_payment_method;
EXEC dbo.sp_create_dim_priority;
EXEC dbo.sp_create_dim_sales_person;
    -- 2. Load the Fact Table 
EXEC dbo.sp_create_sales_fact_table;

