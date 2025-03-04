select category, avg(discount_percentage) AS avg_discount_percentage from amazon_norm_data_2024 
group by category order by avg_discount_percentage DESC limit 15;