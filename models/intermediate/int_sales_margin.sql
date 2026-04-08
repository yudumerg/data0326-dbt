SELECT
	s.products_id,
	s.date_date,
	s.orders_id,
	s.revenue,
	s.quantity,
	p.purchase_price,
    -- satın alma maliyeti
	ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
    -- marj
	ROUND(s.revenue - s.quantity*p.purchase_price, 2) AS margin
FROM {{ref("stg_raw__sales")}}  as s
LEFT JOIN {{ref("stg_raw__product")}} as p
	USING (products_id)