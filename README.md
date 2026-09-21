# Supply Chain & Inventory Analytics

## Project Overview

**Supply Chain & Inventory Analytics** is an end-to-end data analytics project built to analyze sales, profitability, customers, products, markets, shipping performance, and order activity.

The project uses:

- **Python** — data cleaning and exploratory analysis
- **MySQL** — SQL-based business analysis
- **Power BI** — interactive dashboard and visualization

### Workflow

**Raw Dataset → Python Data Cleaning → MySQL SQL Analysis → Power BI Dashboard → Business Insights**

---

## Business Objectives

The project focuses on:

1. Understanding overall sales and profitability
2. Analyzing customer segments and markets
3. Identifying high-performing product categories and products
4. Understanding shipping and delivery performance
5. Analyzing customer and order activity
6. Building an interactive Power BI dashboard
7. Creating a simple, investigation-oriented view of supply-chain performance

---

## Dataset

**Dataset:** DataCo Supply Chain Dataset

The cleaned dataset contains:

- **180,519 rows**
- **45 columns**
- **0 duplicate rows**
- **0 missing values after cleaning**

Main business fields include:

- Sales
- Order Profit Per Order
- Customer ID
- Customer Segment
- Product Name
- Category Name
- Market
- Shipping Mode
- Shipping Delay
- Delivery Status
- Order Status
- Order Date
- Shipping Date

---

# 1. Python Data Cleaning & EDA

Python was used first to prepare the dataset before SQL analysis and dashboard development.

### Cleaning performed

The following unnecessary/personal fields were removed:

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

### Data quality checks

- Duplicate rows: **0**
- Missing values after cleaning: **0**
- Negative order quantities: **0**
- Negative shipping days: **0**

The cleaned dataset was saved as:

`DataCoSupplyChain_Cleaned.csv`

---

# 2. MySQL Analysis

The cleaned CSV was imported into MySQL.

### Database

`Supply_chain_analytics`

### Main table

`supply_chain`

### Import validation

- Rows imported: **180,519**
- Import warnings: **0**

### Key SQL Metrics

| Metric | Result |
|---|---:|
| Total Sales | **36,784,734.31** |
| Total Profit | **3,966,902.97** |
| Total Orders | **65,752** |
| Total Customers | **20,652** |
| Total Products | **118** |
| Profit Margin | **~10.78%** |
| Average Shipping Delay | **~0.57 days** |

> **Note:** Sales is calculated using `SUM(Sales)` at the dataset row/line-item level. Orders and customers are counted using distinct IDs.

---

## SQL Analysis Performed

The project includes beginner-friendly SQL queries for:

### Sales Analysis
- Total Sales
- Sales by Customer Segment
- Sales by Market
- Sales by Shipping Mode
- Sales by Category
- Top 10 Products by Sales
- Top 10 Customers by Sales

### Profit Analysis
- Total Profit
- Profit Margin
- Profit by Customer Segment
- Profit by Shipping Mode

### Delivery Analysis
- Average Shipping Delay
- Delivery Status Distribution
- Delivery Status Percentage

### Order Analysis
- Order Status and Sales

The complete SQL script is available in:

`Supply_Chain_Analytics_SQL.sql`

---

---

# 4. Power BI Dashboard

The cleaned dataset was imported into Power BI and used to build a three-page interactive dashboard.

## Dashboard Preview

### Page 1 — Executive Overview

![Executive Overview](screenshots/executive-overview.png)

### Page 2 — Sales & Customer Analysis

![Sales & Customer Analysis](screenshots/sales-customer-analysis.png)

### Page 3 — Profit & Delivery Analysis

![Profit & Delivery Analysis](screenshots/profit-delivery-analysis.png)

# 5. Power BI DAX Measures

The dashboard uses simple DAX measures such as:

```DAX
Total Sales = SUM(DataCoSupplyChain_Cleaned[Sales])
```

```DAX
Total Profit = SUM(DataCoSupplyChain_Cleaned[Order Profit Per Order])
```

```DAX
Total Orders = DISTINCTCOUNT(DataCoSupplyChain_Cleaned[Order Id])
```

```DAX
Total Customers = DISTINCTCOUNT(DataCoSupplyChain_Cleaned[Customer Id])
```

```DAX
Total Products = DISTINCTCOUNT(DataCoSupplyChain_Cleaned[Product Name])
```

```DAX
Profit Margin = DIVIDE([Total Profit], [Total Sales])
```

```DAX
Average Shipping Delay =
AVERAGE(DataCoSupplyChain_Cleaned[Shipping Delay])
```

---

# 6. Repository Structure

```text
Supply-Chain-Inventory-Analytics/
│
├── DataCoSupplyChain_Cleaned.csv
├── Supply_Chain_Analytics_SQL.sql
├── Supply Chain_Analytics_Dashboard.pbix
├── Python_EDA.ipynb
└── README.md
```

---

# 7. Tools & Technologies

- Python
- Pandas
- Google Colab
- MySQL
- MySQL Workbench
- Power BI
- DAX
- Excel/CSV

---

# 8. Project Limitations

- The dataset represents historical supply-chain transactions.
- Delivery status percentages are based on dataset records/line items unless explicitly calculated at unique-order level.
- Customer IDs are used for customer-level analysis because customer names were removed during data cleaning.
- The analysis identifies business patterns and operational indicators; it does not confirm the cause of delivery delays or other operational issues.

---

# 9. Conclusion

This project demonstrates an end-to-end data analytics workflow:

**Python → MySQL → Power BI**

Python was used for data preparation and exploratory analysis, MySQL was used for structured business analysis, and Power BI was used to present the results through an interactive dashboard.

The project demonstrates practical skills in:

- Data cleaning
- Exploratory data analysis
- SQL
- Business KPI analysis
- Power BI
- DAX
- Data visualization
- Business insight generation

---

## Author

**Ramana Pitla**

Data Analytics Portfolio Project
