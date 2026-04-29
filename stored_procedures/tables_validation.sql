SELECT [Customer Name], [Customer Surname], COUNT(*) AS cnt
FROM computer_std.dbo.dim_customer
GROUP BY [Customer Name], [Customer Surname]
HAVING COUNT(*) > 1;

SELECT [Sales Person Name], [Sales Person Department], COUNT(*)
FROM computer_std.dbo.dim_sales_person
GROUP BY [Sales Person Name], [Sales Person Department]
HAVING COUNT(*) > 1;

SELECT [PC Model], [PC Make], COUNT(*)
FROM computer_std.dbo.dim_product
GROUP BY [PC Model], [PC Make]
HAVING COUNT(*) > 1;