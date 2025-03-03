spark.sql("""
CREATE OR REPLACE TEMP VIEW amazon_new AS
SELECT
product_id,
product_name,
category,
CAST(REGEXP_REPLACE(discounted_price, '[₹,]', '') AS FLOAT) AS discounted_price,
CAST(REGEXP_REPLACE(actual_price, '[₹,]', '') AS FLOAT) AS actual_price,
CAST(REGEXP_REPLACE(discount_percentage, '[%]', '') AS FLOAT) AS discount_percentage,
CAST(REGEXP_REPLACE(rating_count, '[,]', '') AS FLOAT) AS rating_count,
rating
FROM Amazon
""").show()