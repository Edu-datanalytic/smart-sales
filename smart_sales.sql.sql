select *
from order_items
where quantity <= 0;

select * 
from products
where unit_price <0;

select * 
from order_items
where discount_pct < 0 or discount_pct > 1;

select count (*) as descuentos_invalidos 
from order_items
where discount_pct < 0 or discount_pct > 1;

select * 
from order_items
left join orders on order_items.order_id = orders.order_id
where orders.order_id is null;

select strftime('%Y-%m', orders.order_date) as mes,
       sum(quantity * unit_price * (1 - discount_pct)) as ventas_netas
from order_items
join orders on order_items.order_id = orders.order_id
group by mes
order by mes;

select order_date, strftime ('%Y-%m', order_date) as mes
from orders
limit 5;

select strftime('%Y-%m', orders.order_date) as mes,
       sum(quantity * unit_price * (1 - discount_pct)) as ventas_netas
from order_items
join orders on order_items.order_id = orders.order_id
where product_id = 'P005'
group by mes
order by mes;

SELECT product_id,
       strftime('%Y-%m', orders.order_date) AS mes,
       SUM(quantity * unit_price * (1 - discount_pct)) AS ventas_netas
FROM order_items
JOIN orders ON order_items.order_id = orders.order_id
WHERE strftime('%Y-%m', orders.order_date) IN ('2025-07', '2025-12')
GROUP BY product_id, mes
ORDER BY product_id, mes;

SELECT product_id,
       strftime('%Y-%m', orders.order_date) AS mes,
       SUM(quantity * unit_price * (1 - discount_pct)) AS ventas_netas
FROM order_items
JOIN orders ON order_items.order_id = orders.order_id
WHERE strftime('%Y-%m', orders.order_date) between '2025-07' and '2025-12'
GROUP BY product_id, mes
ORDER BY product_id, mes;

select product_id,
SUM(quantity * unit_price * (1 - discount_pct)) AS ventas_netas
from order_items
group by product_id
order by ventas_netas desc;

select product_id,
SUM(quantity * unit_price * (1 - discount_pct)) AS facturacion_neta 
from order_items
group by product_id
having facturacion_neta >= 10000
order by facturacion_neta desc;

select product_id,
SUM(quantity * unit_price * (1 - discount_pct)) AS facturacion_neta 
from order_items
group by product_id
order by facturacion_neta desc
limit 3;

select products.product_name,
SUM(
order_items.quantity *
        order_items.unit_price *
        (1 - order_items.discount_pct)
         )AS facturacion_neta 
from order_items
join products
on order_items.product_id = products.product_id
group by products.product_name
order by facturacion_neta desc;

select products.category,
SUM(
order_items.quantity *
        order_items.unit_price *
        (1 - order_items.discount_pct)
         )AS facturacion_neta 
         from order_items
         join products
on order_items.product_id = products.product_id
group by products.category
order by facturacion_neta desc;
  
 select customers.customer_id,
SUM(
        order_items.quantity *
        order_items.unit_price *
        (1 - order_items.discount_pct)
    ) AS facturacion_neta
from orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
group by customers.customer_id
order by facturacion_neta desc;    

select customers.customer_id,
SUM(
order_items.quantity *
        order_items.unit_price *
        (1 - order_items.discount_pct)
         )AS facturacion_neta 
 from orders
 join customers
 on orders.customer_id = customers.customer_id
 JOIN order_items
 ON orders.order_id = order_items.order_id
 group  by customers.customer_id
 having facturacion_neta > 5000
 order  by facturacion_neta desc;   
 
 select orders.customer_id,
 count(orders.order_id) as total_pedidos
 from orders
 group by orders.customer_id
 having total_pedidos > 5
 order by total_pedidos desc;