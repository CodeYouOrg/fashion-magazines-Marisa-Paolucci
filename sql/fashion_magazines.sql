SELECT 
    customers.customer_name AS 'Customer',
    CONCAT('$', PRINTF('%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length))) AS 'Amount Due'
--Selecting my two columns: Customers (changing customer_name column to Customers) and Amount Due (using CONCAT to add $ symbol and PRINTF to format with two decimal places.)
FROM customers 
JOIN orders
   ON customers.customer_id = orders.customer_id --creating join between customers and orders tables
JOIN subscriptions --creating join between orders and subscriptions tables
   ON orders.subscription_id = subscriptions.subscription_id
WHERE 
    orders.order_status = 'unpaid' 
    AND subscriptions.description = 'Fashion Magazine'
--using a WHERE clause to choose only the unpaid subscriptions from the orders table and only the Fashion Magazines from the subscription table. 
GROUP BY 
    customers.customer_name;
--using GROUP BY to group each customer's subscriptions into one row per customer.

