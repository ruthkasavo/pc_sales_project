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
    shop.Shop_ID,
    pay.Payment_Method_ID,
    prio.Priority_ID,
    pc.[Cost Price],
    pc.[Sale Price],
    pc.[Discount Amount],
    TRY_CAST(pc.[Purchase Date] AS DATE),
    TRY_CAST(pc.[Ship Date] AS DATE),
    pc.[Credit Score],
    pc.[Cost of Repairs],
    pc.[PC Market Price]

FROM computer_std.dbo.pc_data pc

INNER JOIN computer_std.dbo.dim_customer cust
    ON pc.[Customer Name] = cust.[Customer Name]
   AND pc.[Customer Surname] = cust.[Customer Surname]
   AND pc.[Customer Contact Number]= cust.[Customer Contact Number]
   AND pc.[Customer Email Address] = cust.[Customer Email Address]

INNER JOIN computer_std.dbo.dim_sales_person sp
    ON pc.[Sales Person Name] = sp.[Sales Person Name]
   AND pc.[Sales Person Department] = sp.[Sales Person Department]

INNER JOIN computer_std.dbo.dim_product prod
    ON pc.[PC Model] = prod.[PC Model]
   AND pc.[PC Make] = prod.[PC Make]
   AND pc.[Storage Capacity] = prod.[Storage Capacity]
   AND pc.[RAM] = prod.[RAM]
   AND pc.[Storage Type] = prod.[Storage Type]

INNER JOIN computer_std.dbo.dim_location loc
    ON pc.Continent = loc.Continent
   AND pc.[Country or State] = loc.[Country or State]
   AND pc.[Province or City] = loc.[Province or City]

INNER JOIN computer_std.dbo.dim_shop shop
    ON pc.[Shop Name] = shop.[Shop Name]
    AND pc.[Shop Age] = shop.[Shop Age]

INNER JOIN computer_std.dbo.dim_channel chan
    ON pc.Channel = chan.Channel

INNER JOIN computer_std.dbo.dim_payment_method pay
    ON pc.[Payment Method] = pay.[Payment Method]

INNER JOIN computer_std.dbo.dim_priority prio
    ON pc.Priority = prio.Priority;



SELECT (SELECT COUNT(*) FROM computer_std.dbo.Fact_PC_Sales) AS FactCount,
       (SELECT COUNT(*) FROM computer_std.dbo.pc_data) AS RawCount;

