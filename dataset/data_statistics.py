from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("AmazonDataStatistics").getOrCreate()
df_amazon = spark.read.format('csv').options(header='true', inferSchema='true').load('/user/root/project/amazonv2_normalised.csv')
columns_to_summarize = [
    "actual_price", "discounted_price", "discount_percentage", "rating",
    "rating_count", "Sales_volume", "revenue", "discount_effectiveness",
    "inventory_performance", "NormalizedSalesVolume", "NormalizedRevenue"
]
for col in columns_to_summarize:
    print(f"Statistics for {col}:")
    df_amazon.select(col).summary("count", "mean", "stddev", "min", "max").show()

spark.stop()
