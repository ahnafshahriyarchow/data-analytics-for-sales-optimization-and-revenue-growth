select category, cast(avg(revenue) as bigint) AS avg_revenue from amazon_norm_data_2024 
group by category order by avg_revenue DESC limit 10;