select category, count(product_id) AS count_of_products_sold from amazon_norm_data_2024 
group by category order by count_of_products_sold DESC limit 10;