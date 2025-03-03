spark.sql("""
CREATE OR REPLACE TEMP VIEW discount_analysis_new AS
SELECT
category,
CASE
WHEN discount_percentage <= 0.1 THEN '0-10%'
WHEN discount_percentage > 0.1 AND discount_percentage <= 0.2 THEN '10-20%'
WHEN discount_percentage > 0.2 AND discount_percentage <= 0.3 THEN '20-30%'
WHEN discount_percentage > 0.3 AND discount_percentage <= 0.4 THEN '30-40%'
WHEN discount_percentage > 0.4 AND discount_percentage <= 0.5 THEN '40-50%'
ELSE '50%+'
END AS DiscountRange,
AVG(NormalizedSalesVolume) AS AvgNormalizedSalesVolume,
AVG(NormalizedInventoryPerformance) AS AvgNormalizedInventoryPerformance,
AVG(rating) AS AvgRating,
AVG(discount_percentage) AS AvgDiscountPercentage,
AVG(NormalizedRevenue) AS AvgNormalizedRevenue
FROM amazon_sales
GROUP BY category, DiscountRange
""").show()