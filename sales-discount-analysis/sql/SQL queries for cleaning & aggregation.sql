-- Check the columns of the data set clean_sales_data
select*
from clean_sales_data;

-- convert Order_Date into Date type
SELECT STR_TO_DATE(Order_Date, '%d/%m/%Y') AS order_dt
FROM clean_sales_data;

ALTER TABLE clean_sales_data
  ADD COLUMN order_date_dt DATETIME;
  
UPDATE clean_sales_data
SET order_date_dt = STR_TO_DATE(Order_Date, '%d/%m/%Y')
WHERE order_date_dt IS NULL;
  
-- verify that the new column Oder_Date_dt had been added
select*
from clean_sales_data;

-- Revenue by  Product_category
select Product_Category, sum(Revenue) as Total_Revenue
from clean_sales_data
group by Product_Category
order by Total_Revenue DESC;

-- Average Discount by Product Category
select Product_Category, avg(Discount_clean) as Avg_Discount
from clean_sales_data
group by Product_Category
order by Avg_Discount DESC;

-- Monthly Sales Trend
select month(Order_Date_dt) as Month, sum(Revenue) as Monthly_Total_Revenue
from clean_sales_data
group by Month 
order by Monthly_Total_Revenue;

