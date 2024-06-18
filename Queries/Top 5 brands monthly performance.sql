-- Top 5 brands performance based on recent month compare to the ranking for the previous month based on total sales


WITH recent_month AS (
    SELECT 
        b.name AS brand_name,
        SUM(ri.finalPrice) AS total_sales,
        ROW_NUMBER() OVER (ORDER BY SUM(ri.finalPrice) DESC) AS recent_month_rank
    FROM 
        Receipts r
    JOIN 
        ReceiptItems ri ON r.id = ri.receiptId
    JOIN 
        Brands b ON ri.brandId = b.id
    WHERE 
        DATE_TRUNC('month', r.dateScanned) = DATE_TRUNC('month', CURRENT_DATE)
    GROUP BY 
        b.name
),
previous_month AS (
    SELECT 
        b.name AS brand_name,
        SUM(ri.finalPrice) AS total_sales,
        ROW_NUMBER() OVER (ORDER BY SUM(ri.finalPrice) DESC) AS previous_month_rank
    FROM 
        Receipts r
    JOIN 
        ReceiptItems ri ON r.id = ri.receiptId
    JOIN 
        Brands b ON ri.brandId = b.id
    WHERE 
        DATE_TRUNC('month', r.dateScanned) = DATE_TRUNC('month', CURRENT_DATE - INTERVAL 1 MONTH)
    GROUP BY 
        b.name
)
SELECT 
    COALESCE(rm.brand_name, pm.brand_name) AS brand_name,
    COALESCE(recent_month_rank, 0) AS recent_month_rank,
    COALESCE(previous_month_rank, 0) AS previous_month_rank
FROM 
    recent_month rm
FULL OUTER JOIN 
    previous_month pm ON rm.brand_name = pm.brand_name
ORDER BY 
    COALESCE(recent_month_rank, 0)
LIMIT 5;
