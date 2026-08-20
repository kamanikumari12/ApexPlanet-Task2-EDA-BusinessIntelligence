# ApexPlanet-Task2-EDA-BusinessIntelligence
Exploratory Data Analysis, SQL Queries, and Dashboard Mock-up for Task 2.
# Exploratory Data Analysis (EDA) & Business Intelligence — Task 2

This repository contains the complete solution for **Task 2: Exploratory Data Analysis (EDA) & Business Intelligence**. The analysis is performed on a retail dataset containing 1,000 transaction records spanning 2025.

---

## 📌 Project Overview

* **Objective:** Uncover key spending patterns, regional trends, and product performance using Python and SQL to drive business growth.
* **Dataset:** 1,000 orders across 8 cities and 5 product categories (`ApexPlanet_DataAnalytics_Dataset.xlsx`).
* **Total Revenue Analyzed:** ₹139,399,439.65
* **Average Order Value (AOV):** ₹139,399.44

---

## 📊 Key Findings & Insights

* **Category Performance:** **Electronics** is the dominant revenue generator, contributing **₹50.78M** (~36.4% of total revenue). **Education** ranks second at **₹25.03M**.
* **Top Cities:** Revenue is evenly distributed across major metro hubs, led by **Patna (₹19.29M)**, **Kolkata (₹18.88M)**, and **Bengaluru (₹18.77M)**.
* **Demographics:** Customer age ranges from 18 to 65 (mean age: 41.4 years). Correlation between age and total spend is negligible ($r = 0.00$), showing that purchasing power is uniform across age groups.
* **Price & Volume Impact:** Sales volume is strongly driven by unit price ($r = 0.69$) and order quantity ($r = 0.65$).

---

## 🛢️ SQL Business Queries & Results

Below are the key SQL queries written for the dataset schema (`Sales_Dataset`):

### Query 1: Top Product Categories by Revenue
```sql
SELECT 
    Category, 
    SUM(Total_Sales) AS Revenue
FROM Sales_Dataset
GROUP BY Category
ORDER BY Revenue DESC;
