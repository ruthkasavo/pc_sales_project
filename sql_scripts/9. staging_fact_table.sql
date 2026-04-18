
TRUNCATE TABLE computer_std.dbo.Fact_PC_Sales;


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
FROM computer_std.dbo.pc_data pd
LEFT JOIN computer_std.dbo.dim_customer cust ON pd.[Customer Name] = cust.[Customer Name] 
	AND pd.[Customer Surname] = cust.[Customer Surname]
LEFT JOIN computer_std.dbo.dim_sales_person sp ON pd.[Sales Person Name] = sp.[Sales Person Name] 
	AND pd.[Sales Person Department] = sp.[Sales Person Department]
LEFT JOIN computer_std.dbo.dim_product prod ON pd.[PC Model] = prod.[PC Model] 
	AND pd.[PC Make] = prod.[PC Make] 
LEFT JOIN computer_std.dbo.dim_location loc ON pd.Continent  = loc.Continent 
	AND pd.[Country or State] = loc.[Country or State] 
LEFT JOIN computer_std.dbo.dim_shop ds ON pd.[Shop Name] = ds.[Shop Name]
LEFT JOIN computer_std.dbo.dim_channel chan ON pd.Channel = chan.Channel
LEFT JOIN computer_std.dbo.dim_payment_method pay ON pd.[Payment Method] = pay.[Payment Method]
LEFT JOIN computer_std.dbo.dim_priority prio ON pd.Priority = prio.Priority;