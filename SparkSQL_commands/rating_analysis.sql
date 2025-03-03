spark.sql("""
CREATE OR REPLACE TEMP VIEW rating_analysis AS
SELECT
category,
CASE
WHEN rating <= 2 THEN 'Low Ratings (1.0-2.0)'
WHEN rating > 2 AND rating <= 4 THEN 'Medium Ratings (2.1-4.0)'
ELSE 'High Ratings (4.1-5.0)'
END AS RatingRange,
COUNT(*) AS ProductCount,
AVG(NormalizedSalesVolume) AS AvgNormalizedSalesVolume,
AVG(NormalizedRevenue) AS AvgNormalizedRevenue,
AVG(NormalizedInventoryPerformance) AS AvgNormalizedInventoryPerformance,
AVG(discount_percentage) AS AvgDiscountPercentage
FROM amazon_sales
GROUP BY category, RatingRange
""").show()