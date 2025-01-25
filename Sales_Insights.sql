SELECT * FROM sales.date;

SELECT d.year, SUM(t.sales_amount) AS revenue
FROM transactions AS t
JOIN sales.date AS d ON t.order_date = d.date
GROUP BY d.year
ORDER BY d.year;

SELECT d.year, SUM(t.sales_amount) AS revenue
FROM transactions AS t
JOIN sales.date AS d ON t.order_date = d.date
WHERE d.year = 2020
GROUP BY d.year
ORDER BY d.year;
 
SELECT SUM(t.sales_amount) AS total_revenue
FROM transactions AS t
JOIN sales.date AS d ON t.order_date = d.date
WHERE d.year = 2020 AND MONTH(d.date) = 1;


select sum(t.sales_amount) as total_reve from transactions t join markets as m on
t.market_code=m.markets_code
where year(t.order_date)=2020 and m.markets_name='chennai';

SELECT d.year, SUM(Sales_Amount)
FROM sales.transactions as t
JOIN sales.date as d
ON t.Order_Date = d.date
WHERE d.year = '2019'
UNION
SELECT d.year, SUM(Sales_Amount)
FROM sales.transactions as t
JOIN sales.date as d
ON t.Order_Date = d.date
WHERE d.year = '2020';

SELECT currency, COUNT(currency)
FROM sales.transactions
GROUP BY currency;


SELECT 
    m.markets_name,
    t.market_code,
    t.product_code,
    t.order_date,
    SUM(t.sales_qty) as Sales_Quantity
FROM
    sales.markets m
        JOIN
    sales.transactions t ON m.markets_code = t.market_code
        JOIN
    sales.products p ON p.product_code = t.product_code
GROUP BY m.markets_name, 
    t.market_code, 
    t.product_code, 
	t.order_date;



SELECT 
    t.market_code, SUM(t.sales_amount) as Total_sales_amount
FROM
    sales.markets m
        JOIN
    sales.transactions t ON m.markets_code = t.market_code
GROUP BY t.market_code;


SELECT 
    m.markets_name,
    t.market_code,
    t.order_date,
    SUM(t.sales_qty) as Sales_Quantity
FROM
    sales.markets m
        JOIN
    sales.transactions t ON m.markets_code = t.market_code
        JOIN
    sales.products p ON p.product_code = t.product_code
GROUP BY t.market_code,t.order_date
order by t.market_code;