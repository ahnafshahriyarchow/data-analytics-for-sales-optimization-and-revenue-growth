select category, avg(discounted_price) AS avg_discounted_price from amazon_norm_data_2024 
group by category order by avg_discounted_price DESC limit 15;