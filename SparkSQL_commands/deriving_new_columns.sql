spark.sql("""
CREATE OR REPLACE TEMP VIEW amazonv2_derived_columns AS
SELECT *,
(rating * rating_count) AS Sales_volume,
(discounted_price * (rating * rating_count)) AS revenue,
FROM amazon_sales_update
""").show()