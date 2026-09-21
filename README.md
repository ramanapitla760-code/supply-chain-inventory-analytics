# Supply Chain & Inventory Analytics

## 📊 Project Overview

**Supply Chain & Inventory Analytics** is an end-to-end data analytics project built to analyze sales, profitability, customers, products, markets, shipping performance, and order activity.

The project follows a practical analytics workflow:

**Python → MySQL → Power BI → Business Insights**

### Tools Used

- Python
- Pandas
- Google Colab
- MySQL
- MySQL Workbench
- Power BI
- DAX

---

## 🎯 Business Objectives

The project focuses on:

- Understanding overall sales and profitability
- Analyzing customer segments and markets
- Identifying high-performing products and categories
- Analyzing shipping and delivery performance
- Understanding customer and order activity
- Identifying important business patterns
- Building an interactive Power BI dashboard
- Presenting insights in an easy-to-understand format

---

# 📁 Dataset

The project uses the **DataCo Supply Chain Dataset**.

### Dataset Details

- Rows: **180,519**
- Columns after cleaning: **44**
- Duplicate rows: **0**
- Missing values after cleaning: **0**

### Main Business Fields

- Sales
- Order Profit Per Order
- Order Id
- Customer Id
- Customer Segment
- Product Name
- Category Name
- Market
- Region
- Shipping Mode
- Shipping Delay
- Delivery Status
- Order Status
- Order Date
- Shipping Date

The original dataset contained unnecessary personal and non-analytical fields. These were removed during Python data cleaning.

---

# 1️⃣ Python Data Cleaning & EDA

Python was used to prepare and validate the dataset before performing SQL analysis and building the Power BI dashboard.

### Data Cleaning

The following unnecessary fields were removed:

- Customer Email
- Customer Password
- Customer Fname
- Customer Lname
- Customer Street
- Customer Zipcode
- Order Zipcode
- Product Description
- Product Image

Date columns were converted to proper datetime format:

- `order date (DateOrders)`
- `shipping date (DateOrders)`

### Data Quality Checks

- Duplicate rows: **0**
- Missing values after cleaning: **0**
- Negative order quantities: **0**
- Negative shipping days: **0**

The cleaned dataset was used for both MySQL analysis and Power BI.

> The cleaned CSV is not included in this GitHub repository because it exceeds GitHub's browser upload size limit.

---

# 2️⃣ MySQL Analysis

The cleaned dataset was imported into MySQL for structured business analysis.

### Database

`Supply_chain_analytics`

### Main Table

`supply_chain`

### Import Validation

- Rows imported: **180,519**
- Import warnings: **0**

### Key SQL Metrics

| Metric | Result |
|---|---:|
| Total Sales | 36,784,734.31 |
| Total Profit | 3,966,902.97 |
| Total Orders | 65,752 |
| Total Customers | 20,652 |
| Total Products | 118 |
| Profit Margin | ~10.78% |
| Average Shipping Delay | ~0.57 days |

> Sales and profit are calculated at the dataset row/line-item level. Orders and customers are calculated using distinct IDs where applicable.

### SQL Analysis Performed

#### Sales Analysis

- Total Sales
- Sales by Customer Segment
- Sales by Market
- Sales by Shipping Mode
- Top 10 Products by Sales
- Top 10 Customers by Sales

#### Profit Analysis

- Total Profit
- Profit by Customer Segment
- Profit by Shipping Mode

#### Delivery Analysis

- Average Shipping Delay
- Delivery Status Distribution

#### Order Analysis

- Order Status
- Sales by Order Status

The complete SQL script is available here:

**`Supply_Chain_Analytics_SQL.sql`**

---

# 3️⃣ Power BI Dashboard

The cleaned dataset was imported into Power BI and used to create a three-page dashboard.

## Page 1 — Executive Overview

The first page provides a high-level overview of the business.

### KPIs

- Total Sales
- Total Profit
- Total Orders
- Total Products
- Total Customers

### Visuals

- Monthly Sales Trend
- Sales by Category
- Sales by Customer Segment
- Sales by Market

### Dashboard Preview

![Executive Overview Dashboard](screenshots/Executive%20Overview%20Dashboard.png)

---

# Page 2 — Sales & Customer Analysis

This page focuses on product, customer, regional, and shipping-related sales analysis.

### Visuals

- Sales by Region
- Top 10 Products by Sales
- Sales by Customer Country
- Sales by Shipping Mode
- Top 10 Customers by Sales

### Dashboard Preview

![Sales & Customer Analysis](screenshots/Sales%20%26%20Customer%20Analysis.png)

---

# Page 3 — Profit & Delivery Analysis

This page focuses on profitability and delivery performance.

### KPIs

- Total Profit
- Profit Margin
- Average Shipping Delay

### Visuals

- Profit by Customer Segment
- Delivery Status Distribution
- Profit by Shipping Mode
- Monthly Profit Trend

### Dashboard Preview

![Profit & Delivery Analysis](screenshots/Profit%20%26%20Delivery%20Analysis.png)

---

# 4️⃣ Power BI DAX Measures

The dashboard uses simple DAX measures.

### Total Sales

```DAX
Total Sales =
SUM(DataCoSupplyChain_Cleaned[Sales])
Total Profit =
SUM(DataCoSupplyChain_Cleaned[Order Profit Per Order])
Total Orders =
DISTINCTCOUNT(DataCoSupplyChain_Cleaned[Order Id])
Total Customers =
DISTINCTCOUNT(DataCoSupplyChain_Cleaned[Customer Id])
Total Products =
DISTINCTCOUNT(DataCoSupplyChain_Cleaned[Product Name])
Profit Margin =
DIVIDE([Total Profit], [Total Sales])
Average Shipping Delay =
AVERAGE(DataCoSupplyChain_Cleaned[Shipping Delay])
