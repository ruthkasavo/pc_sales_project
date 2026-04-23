
IF OBJECT_ID('computer_std.dbo.Fact_PC_Sales', 'U') IS NOT NULL
    DROP TABLE computer_std.dbo.Fact_PC_Sales;

CREATE TABLE computer_std.dbo.Fact_PC_Sales (
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

WITH dim_customer_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY [Customer Name], [Customer Surname]
               ORDER BY Customer_ID
           ) AS rn
    FROM computer_std.dbo.dim_customer
),
dim_sales_person_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY [Sales Person Name], [Sales Person Department]
               ORDER BY Sales_Person_ID
           ) AS rn
    FROM computer_std.dbo.dim_sales_person
),
dim_product_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY [PC Model], [PC Make]
               ORDER BY Product_ID
           ) AS rn
    FROM computer_std.dbo.dim_product
),
dim_location_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Continent, [Country or State]
               ORDER BY Location_ID
           ) AS rn
    FROM computer_std.dbo.dim_location
),
dim_shop_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY [Shop Name]
               ORDER BY Shop_ID
           ) AS rn
    FROM computer_std.dbo.dim_shop
),
dim_channel_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Channel
               ORDER BY Channel_ID
           ) AS rn
    FROM computer_std.dbo.dim_channel
),
dim_payment_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY [Payment Method]
               ORDER BY Payment_Method_ID
           ) AS rn
    FROM computer_std.dbo.dim_payment_method
),
dim_priority_clean AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Priority
               ORDER BY Priority_ID
           ) AS rn
    FROM computer_std.dbo.dim_priority
),
source_dedup AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY 
                   [Customer Name], [Customer Surname],
                   [Sales Person Name], [Sales Person Department],
                   [PC Model], [PC Make],
                   Continent, [Country or State],
                   [Shop Name], Channel,
                   [Payment Method], Priority,
                   [Purchase Date], [Sale Price]
               ORDER BY [Purchase Date]
           ) AS rn
    FROM computer_std.dbo.pc_data
)

INSERT INTO computer_std.dbo.Fact_PC_Sales (
    Customer_ID, Sales_Person_ID, Product_ID, Location_ID, 
    Channel_ID, Shop_ID, Payment_Method_ID, Priority_ID, 
    [Cost Price], [Sale Price], [Discount Amount], 
    [Purchase Date], [Ship Date], [Credit Score], 
    [Cost of Repairs], [PC Market Price]
)
SELECT 
    cust.Customer_ID,
    sp.Sales_Person_ID,
    prod.Product_ID,
    loc.Location_ID,
    chan.Channel_ID,
    ds.Shop_ID,
    pay.Payment_Method_ID,
    prio.Priority_ID,
    pd.[Cost Price],
    pd.[Sale Price],
    pd.[Discount Amount],
    TRY_CAST(pd.[Purchase Date] AS DATE),
    TRY_CAST(pd.[Ship Date] AS DATE),
    pd.[Credit Score],
    pd.[Cost of Repairs],
    pd.[PC Market Price]
FROM source_dedup pd
LEFT JOIN dim_customer_clean cust 
    ON pd.[Customer Name] = cust.[Customer Name]
   AND pd.[Customer Surname] = cust.[Customer Surname]
   AND cust.rn = 1
LEFT JOIN dim_sales_person_clean sp 
    ON pd.[Sales Person Name] = sp.[Sales Person Name]
   AND pd.[Sales Person Department] = sp.[Sales Person Department]
   AND sp.rn = 1
LEFT JOIN dim_product_clean prod 
    ON pd.[PC Model] = prod.[PC Model]
   AND pd.[PC Make] = prod.[PC Make]
   AND prod.rn = 1
LEFT JOIN dim_location_clean loc 
    ON pd.Continent = loc.Continent
   AND pd.[Country or State] = loc.[Country or State]
   AND loc.rn = 1
LEFT JOIN dim_shop_clean ds 
    ON pd.[Shop Name] = ds.[Shop Name]
   AND ds.rn = 1
LEFT JOIN dim_channel_clean chan 
    ON pd.Channel = chan.Channel
   AND chan.rn = 1
LEFT JOIN dim_payment_clean pay 
    ON pd.[Payment Method] = pay.[Payment Method]
   AND pay.rn = 1
LEFT JOIN dim_priority_clean prio 
    ON pd.Priority = prio.Priority
   AND prio.rn = 1
WHERE pd.rn = 1;

SELECT (SELECT COUNT(*) FROM computer_std.dbo.Fact_PC_Sales) AS FactCount,
       (SELECT COUNT(*) FROM computer_std.dbo.pc_data) AS RawCount;