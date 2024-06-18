WITH recent_users AS (
    SELECT _id
    FROM Users
    WHERE createdDate >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
)

SELECT 
    b.name AS brand_name,
    COUNT(DISTINCT ri.receiptId) AS transaction_count
FROM 
    ReceiptItems ri
JOIN 
    Receipts r ON ri.receiptId = r.id
JOIN 
    Brands b ON ri.brandId = b.id
JOIN 
    recent_users ru ON r.userId = ru._id
WHERE 
    r.rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY 
    b.id, b.name
ORDER BY 
    transaction_count DESC
LIMIT 1;
