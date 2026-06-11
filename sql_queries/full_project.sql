-- ============================================
-- CUSTOMER REVENUE INTELLIGENCE PROJECT (SQL)
-- ============================================

-- ============================================
-- STEP 1: DATA CLEANING
-- ============================================

-- Remove NULL Customer IDs
SELECT *
FROM sales
WHERE CustomerID IS NOT NULL;

-- Fix CustomerID format (remove .0)
UPDATE sales
SET CustomerID = REPLACE(CustomerID, '.0', '');

-- Remove invalid transactions
SELECT *
FROM sales
WHERE Quantity > 0 AND UnitPrice > 0;


-- ============================================
-- STEP 2: CREATE CLEAN DATASET
-- ============================================

CREATE TABLE clean_sales AS
SELECT *
FROM sales
WHERE CustomerID IS NOT NULL
  AND Quantity > 0
  AND UnitPrice > 0;


-- ============================================
-- STEP 3: CUSTOMER BASE METRICS
-- ============================================

SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS Total_Spent,
    COUNT(DISTINCT InvoiceNo) AS Purchase_Frequency
FROM clean_sales
GROUP BY CustomerID;


-- ============================================
-- STEP 4: CUSTOMER SEGMENTATION
-- ============================================

SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS Total_Spent,
    COUNT(DISTINCT InvoiceNo) AS Purchase_Frequency,

    CASE 
        WHEN SUM(Quantity * UnitPrice) > 5000 
             AND COUNT(DISTINCT InvoiceNo) > 10 
        THEN 'VIP Customer'

        WHEN SUM(Quantity * UnitPrice) > 5000 
        THEN 'High Value - Low Frequency'

        WHEN COUNT(DISTINCT InvoiceNo) > 10 
        THEN 'Frequent Buyer'

        ELSE 'Regular Customer'
    END AS Customer_Segment

FROM clean_sales
GROUP BY CustomerID;


-- ============================================
-- STEP 5: REVENUE ANALYSIS (TOP CUSTOMERS)
-- ============================================

SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS Total_Spent
FROM clean_sales
GROUP BY CustomerID
ORDER BY Total_Spent DESC;


-- ============================================
-- STEP 6: PARETO ANALYSIS (80/20 RULE)
-- ============================================

SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS Total_Spent,

    SUM(SUM(Quantity * UnitPrice)) OVER (
        ORDER BY SUM(Quantity * UnitPrice) DESC
    ) AS Running_Revenue,

    SUM(Quantity * UnitPrice) / 
    SUM(SUM(Quantity * UnitPrice)) OVER () * 100 AS Revenue_Percentage

FROM clean_sales
GROUP BY CustomerID;
