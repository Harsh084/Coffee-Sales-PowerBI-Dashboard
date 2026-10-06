# ☕ Coffee Sales Analysis Dashboard | Power BI

## 📊 Project Overview

This project focuses on analyzing coffee sales data and building an interactive **Power BI dashboard** to understand sales performance, product performance, store-level performance, and time-based sales trends.

The project follows an end-to-end data analytics workflow, starting from raw sales data and transforming it into meaningful business insights through data cleaning, analysis, data modeling, DAX calculations, and interactive visualizations.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Analyze overall coffee sales performance
* Identify top-performing products
* Compare sales across different store locations
* Analyze sales trends over time
* Understand product/category performance
* Identify peak sales periods
* Create interactive KPIs and visualizations
* Provide actionable business insights using Power BI

---

## 🛠️ Tools & Technologies

| Tool            | Purpose                               |
| --------------- | ------------------------------------- |
| **Power BI**    | Dashboard development & visualization |
| **Power Query** | Data cleaning & transformation        |
| **DAX**         | Measures and calculations             |
| **SQL**         | Data analysis and exploration         |
| **Excel / CSV** | Data source and data preparation      |

---

## 🔄 Project Workflow

```text
Raw Sales Data
      ↓
Data Cleaning
      ↓
Data Transformation
      ↓
SQL Analysis
      ↓
Power Query
      ↓
Data Modeling
      ↓
DAX Measures
      ↓
Power BI Dashboard
      ↓
Business Insights
```

---

## 📁 Project Structure

```text
Coffee-Sales-PowerBI-Dashboard/
│
├── 📄 README.md
│
├── 📊 Coffee_Sales_Dashboard.pbix
│
├── 📁 Dashboard
│   ├── Dashboard.png
│   ├── Sales_Analysis.png
│   └── Product_Analysis.png
│
├── 📁 SQL
│   └── Coffee_Sales_Analysis.sql
│
└── 📁 Dataset
    └── coffee_sales.csv
```

---

# 📈 Dashboard

The Power BI dashboard provides an interactive view of coffee sales performance.

### Key Dashboard Components

* Total Revenue
* Total Sales / Transactions
* Average Revenue
* Store Location Analysis
* Product Performance
* Product Category Analysis
* Monthly Sales Trends
* Daily Sales Trends
* Hourly Sales Analysis
* Top-Selling Products
* Interactive Slicers

---

# 🎯 Key KPIs

The dashboard includes important business KPIs such as:

### 💰 Total Revenue

Shows the overall revenue generated from coffee sales.

### 🧾 Total Transactions

Shows the total number of sales transactions.

### ☕ Total Quantity Sold

Shows the total quantity of products sold.

### 📊 Average Transaction Value

Measures the average revenue generated per transaction.

---

# 📍 Store Location Analysis

The dashboard allows sales performance to be compared across different store locations.

This helps identify:

* Highest-performing stores
* Lowest-performing stores
* Revenue contribution by location
* Transaction volume by location

---

# ☕ Product Analysis

Product-level analysis helps identify:

* Best-selling products
* Products generating the highest revenue
* Products with lower sales performance
* Product/category contribution to overall sales

---

# 📅 Time-Based Analysis

The dashboard analyzes sales across different time periods, including:

* Monthly sales
* Daily sales
* Day-of-week performance
* Hourly sales
* Peak sales hours

This helps identify when customer demand is highest.

---

# 🔎 Interactive Filters

The dashboard includes interactive slicers to allow users to explore the data dynamically.

Examples include:

* 📍 Store Location
* ☕ Product Category
* 🥤 Product Type
* 📅 Date / Month

The slicers allow users to filter the dashboard and analyze specific portions of the sales data.

---

# 🧮 DAX Measures

Some of the key measures used in the dashboard include:

```DAX
Total Revenue =
SUM(CoffeeSales[Revenue])
```

```DAX
Total Transactions =
DISTINCTCOUNT(CoffeeSales[Transaction_ID])
```

```DAX
Total Quantity =
SUM(CoffeeSales[Quantity])
```

```DAX
Average Transaction Value =
DIVIDE(
    [Total Revenue],
    [Total Transactions],
    0
)
```

> Replace column names if your actual dataset uses different names.

---

# 🧹 Data Preparation

The dataset was cleaned and transformed before creating the dashboard.

The preparation process included:

* Removing unnecessary columns
* Handling missing values
* Correcting data types
* Creating calculated columns where required
* Checking duplicate records
* Formatting date fields
* Creating time-related columns
* Preparing data for Power BI analysis

---

# 🗄️ SQL Analysis

SQL was used to perform exploratory analysis before building the Power BI dashboard.

Examples of analysis included:

* Total sales
* Total revenue
* Product-level sales
* Store-level sales
* Monthly sales
* Daily sales
* Top-selling products
* Peak sales periods

---

# 💡 Business Insights

The dashboard can help answer questions such as:

1. Which store generates the highest revenue?
2. Which products are the best sellers?
3. Which product category contributes the most revenue?
4. Which month has the highest sales?
5. What are the peak sales hours?
6. Which days generate the most transactions?
7. Which products have relatively low sales?
8. How does sales performance vary across store locations?

---

# 📊 Dashboard Preview

### Main Dashboard

![Coffee Sales Dashboard](Dashboard/Dashboard.png)

### Sales Analysis

![Sales Analysis](Dashboard/Sales_Analysis.png)

### Product Analysis

![Product Analysis](Dashboard/Product_Analysis.png)

---

# 🚀 Key Learnings

Through this project, I strengthened my practical knowledge of:

* Power BI
* Power Query
* DAX
* SQL
* Data Cleaning
* Data Modeling
* Data Visualization
* Business Intelligence
* Dashboard Design
* Exploratory Data Analysis

---

# 👨‍💻 Project Author

**Harsh Patel**

Aspiring Data Analyst | Power BI | SQL | Excel

---

## ⭐ If you find this project useful

Feel free to explore the repository and connect with me on LinkedIn.

#PowerBI #DataAnalytics #DataAnalyst #SQL #DAX #Excel #BusinessIntelligence #DataVisualization #PowerBIDashboard
