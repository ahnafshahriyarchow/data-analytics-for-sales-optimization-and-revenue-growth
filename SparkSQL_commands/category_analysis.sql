spark.sql("""
CREATE OR REPLACE TEMP VIEW category_analysis AS
SELECT
category,
AVG(NormalizedSalesVolume) AS AvgNormalizedSalesVolume,
AVG(NormalizedRevenue) AS AvgNormalizedRevenue,
AVG(NormalizedInventoryPerformance) AS AvgNormalizedInventoryPerformance,
AVG(rating) AS AvgRating,
AVG(discount_percentage) AS AvgDiscountPercentage
FROM amazon_sales
GROUP BY category
""").show()