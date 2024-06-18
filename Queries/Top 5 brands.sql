-- Considering most recent month as last month 


-- Top 5 brands based on total sales
SELECT 
    b.id AS brand_id,
    b.name AS brand_name,
    SUM(ri.finalPrice) AS total_sales
FROM 
    Receipts r
JOIN 
    ReceiptItems ri ON r.id = ri.receiptId
JOIN 
    Brands b ON ri.brandId = b.id
WHERE 
    r.dateScanned >= DATE_FORMAT(NOW() - INTERVAL 1 MONTH, '%Y-%m-01')
    AND r.dateScanned < DATE_FORMAT(NOW(), '%Y-%m-01')
GROUP BY 
    b.id, b.name
ORDER BY 
    total_sales DESC
LIMIT 5;


-- Top 5 brands based on quantity of items sold                                        
SELECT 
    b.id AS brand_id,
    b.name AS brand_name,
    SUM(ri.quantityPurchased) AS total_items
FROM 
    Receipts r
JOIN 
    ReceiptItems ri ON r.id = ri.receiptId
JOIN 
    Brands b ON ri.brandId = b.id
WHERE 
    r.dateScanned >= DATE_FORMAT(NOW() - INTERVAL 1 MONTH, '%Y-%m-01')
    AND r.dateScanned < DATE_FORMAT(NOW(), '%Y-%m-01')
GROUP BY 
    b.id, b.name
ORDER BY 
    total_items DESC
LIMIT 5;
