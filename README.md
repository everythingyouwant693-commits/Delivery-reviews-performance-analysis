#  Quick Commerce Operations & Performance Analytics

An end-to-end data analytics project evaluating operational efficiency, service-level agreement (SLA) breaches, product availability, and customer satisfaction across major quick-commerce platforms (**Blinkit, Zepto, Swiggy Instamart, JioMart**).

---

##  Project Overview

This project simulates a real-world analytics pipeline:
1. **Data Cleaning & EDA (Python):** Handled missing values, standardized string formats, and performed distribution checks.
2. **Database Management & Complex Querying (MySQL):** Ingested processed datasets and engineered aggregation queries, error rate metrics, regional breakdowns, and CTE-based ranking functions.
3. **Executive Dashboarding (Power BI):** Developed an interactive dashboard with custom DAX measures, KPI cards, and operational failure breakdown visuals.

---

## Tech Stack & Tools

* **Programming Language:** Python (Pandas, NumPy, Matplotlib, Seaborn)
* **Database:** MySQL Workbench (SQL Aggregations, CASE Statements, CTEs, Window Functions)
* **BI & Visualization:** Power BI Desktop (DAX Modeling, Dynamic Filters, Custom KPI Cards)
* **Version Control:** Git & GitHub


##  Key Business Insights

1. **Delivery SLA Breaches:** Identified high delayed delivery rates (>45 mins) concentrated in specific metro regions, requiring localized partner realignment.
2. **Product Availability:** Out-of-stock (OOS) occurrences accounted for significant user drop-offs, directly impacting customer service ratings.
3. **Platform Performance:** Benchmarked speed vs. accuracy tradeoffs—platforms with lower delivery times did not always yield higher customer satisfaction due to accuracy errors.

---

##  Repository Structure

```text
├── cleaned_fast_delivery_reviews.csv   # Cleaned dataset ready for modeling
├── eda_fast_delivery.ipynb             # Python data cleaning & exploratory analysis
├── mysql_queries.sql                   # SQL scripts (Schema, Aggregations, CTEs)
├── quick_commerce_dashboard.pbix       # Interactive Power BI report file
└── README.md                           # Project documentation
