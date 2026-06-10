# Customer Revenue Intelligence & Segmentation System (SQL)

## Project Overview

This project analyzes retail transaction data to understand customer purchasing behavior, measure revenue contribution, and segment customers based on their value to the business.

It simulates a real-world customer analytics system used in retail, e-commerce, and CRM environments to support data-driven decision-making.

---

## Objectives

- Clean and structure raw sales data  
- Calculate customer-level revenue metrics  
- Analyze purchase frequency patterns  
- Segment customers based on behavior and value  
- Identify revenue concentration using Pareto (80/20) analysis  

---

## Data Preparation

The dataset was cleaned and transformed by:

- Removing invalid and missing CustomerID values  
- Standardizing numeric fields (Quantity, UnitPrice)  
- Filtering incorrect or inconsistent records  
- Creating a clean analytical dataset for processing  

---

## Tools & Technologies

- SQL (MySQL)  
- MySQL Workbench  
- Window Functions  
- Aggregation Functions  
- Data Cleaning Techniques  
- Business Intelligence Concepts  

---

## Key Analyses Performed

### 1. Customer Revenue Analysis

Calculated total spending per customer using:

SUM(Quantity * UnitPrice)

This helps identify how much revenue each customer generates.

---

### 2. Purchase Frequency Analysis

Measured how often customers purchase using:

COUNT(DISTINCT InvoiceNo)

This helps identify loyal and frequent buyers.

---

### 3. Customer Segmentation

Customers were grouped into business-relevant segments:

- VIP Customers  
- High Value - Low Frequency  
- Frequent Buyers  
- Regular Customers  

This was implemented using SQL CASE WHEN logic.

---

### 4. Revenue Concentration (Pareto Analysis)

Applied the 80/20 rule to determine:

- Which customers contribute most of the revenue  
- How revenue is distributed across the customer base  
- Dependency on top-performing customers  

---

## Key Insights

- A small percentage of customers contribute a large portion of total revenue  
- High-value customers are not always frequent buyers  
- Customer segmentation helps identify strategic marketing targets  
- Revenue concentration risk can be measured using cumulative analysis  

---

## Business Value

This analysis can help companies:

- Improve customer retention strategies  
- Target high-value customers for marketing campaigns  
- Optimize loyalty programs  
- Understand revenue dependency risks  
- Improve decision-making in CRM systems  

---

## Project Structure

sql_queries/   -> SQL scripts (cleaning, analysis, segmentation)
datasets/      -> Raw and cleaned datasets
outputs/       -> Final result tables
screenshots/   -> Query outputs and results
insights/      -> Business interpretation
docs/          -> Project documentation

---

## Key Skills Demonstrated

- SQL Data Analysis  
- Data Cleaning & Transformation  
- Customer Segmentation  
- Revenue Analysis  
- Window Functions  
- Business Intelligence Thinking  
- Pareto (80/20) Analysis  
