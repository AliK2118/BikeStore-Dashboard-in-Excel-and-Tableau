SELECT 
  ord.order_id,
  CONCAT(cus.first_name, ' ', 
  cus.last_name) AS customer_name,
  cus.city,
  cus.state,
  ord.order_date,
  SUM(ite.quantity) AS 'total_units',
  SUM(ite.quantity * ite.list_price) AS revenue,
  p.product_name,
  pbr.brand_name,
  cat.category_name,
  sto.store_name,
  CONCAT(sta.first_name, ' ', sta.last_name) AS sales_rep
FROM sales.orders ord 
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products p 
ON ite.product_id = p.product_id 
JOIN production.categories cat
ON p.category_id = cat.category_id
Join sales.stores sto 
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
JOIN production.brands pbr
ON pbr.brand_id = p.brand_id
GROUP BY
  ord.order_id,
  CONCAT(cus.first_name, ' ', cus.last_name),
  cus.city,
  cus.state,
  ord.order_date,
  p.product_name,
  pbr.brand_name,
  cat.category_name, 
  sto.store_name,
  CONCAT(sta.first_name, ' ', sta.last_name)
