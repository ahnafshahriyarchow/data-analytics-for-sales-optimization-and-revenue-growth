select category, avg(rating) AS average_rating from amazon_norm_data_2024 group by category 
order by average_rating DESC limit 15;