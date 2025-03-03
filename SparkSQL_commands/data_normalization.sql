spark.sql("""
CREATE OR REPLACE TEMP VIEW amazon_normalised_data AS
SELECT
product_id,
category,
discounted_price,
actual_price,
discount_percentage,
rating,
rating_count,
Sales_volume,
revenue,
(Sales_volume - MIN(Sales_volume) OVER ()) / 
(MAX(Sales_volume) OVER () - MIN(Sales_volume) OVER ()) AS NormalizedSalesVolume,
(revenue - MIN(revenue) OVER ()) / 
(MAX(revenue) OVER () - MIN(revenue) OVER ()) AS NormalizedRevenue,
(inventory_performance - MIN(inventory_performance) OVER ()) / 
FROM amazon_sales
""").show()