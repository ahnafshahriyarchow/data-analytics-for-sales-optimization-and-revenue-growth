# 💡 Big Data Project: Leveraging Data Analytics for Sales Optimization and Revenue Growth

## 📌 Problem Statement
In the competitive landscape of e-commerce, businesses like Amazon need to understand which product features drive sales performance. This project explores the impact of price, rating, product category, and discount percentage on sales. The goal is to:
* Identify the key features that influence sales success.
* Optimize discount strategies to maximize customer ratings and sales volume across product categories.

---

## 📂 Dataset
**Source:** [Amazon Sales Dataset on Kaggle](https://www.kaggle.com/datasets/ahmedsayed564/amazon-sales-dataset)  

**Derived Attributes:**
* `sales_volume` = `rating * rating_count`
* `revenue` = `discounted_price * sales_volume`
* `discount_effectiveness` = `(actual_price - discounted_price) / actual_price`
* Normalized versions of the above for fair comparison across products

---

## 🛠️ Tools and Technologies Used

| **Tool/Tech**       | **Purpose**                          |
|---------------------|--------------------------------------|
| *Apache NiFi*       | Data ingestion from local to HDFS    |
| *HDFS*              | Distributed storage                  |
| *PySpark*           | Data cleaning, transformation, EDA   |
| *Hive*              | SQL-based querying over big data     |
| *Kibana*            | Visualization and insights           |

---

## 🔁 Workflow

1. **Data Ingestion with Apache NiFi:**
   * `GetFile` processor reads CSV file
   * `PutHDFS` processor moves data to HDFS
   * Visual workflow tracking through NiFi dashboard

2. **Storage with HDFS:**
   * Ingested data stored under `/user/root/project`
   * Ensures scalability and integration with Spark

3. **Processing with PySpark:**
   * Cleaning: removed symbols and converted values (e.g. %, ₹)
   * Derived Metrics: `sales_volume`, `revenue`, `discount_effectiveness`
   * Normalization: min-max scaling using Spark SQL window functions
   * Analysis: category, discount range, rating-based aggregations

4. **Querying with Hive:**
   * SQL-like queries for top categories by rating, revenue, discount, etc.
   * Used `amazon_norm_data_2024` table

5. **Visualization with Kibana:**
   * Imported CSV to Elasticsearch
   * Created dashboards for product popularity, pricing trends, etc.

---

## 📊 Key Insights

* **Top-Selling Categories:**
  * USB Cables and Smart Watches are high in demand
* **Revenue Drivers:**
  * External SSDs and Smartphones bring in the highest revenue
* **Optimal Discount Range:**
  * 20–30% discounts generate highest revenue and sales
* **Ratings vs Revenue:**
  * Higher-rated products (4.1–5.0) correlate with higher revenue
* **Price-Rating Trends:**
  * Higher-priced products often align with high ratings





