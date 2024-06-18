-- Check for null values in important columns
SELECT COUNT(*) AS null_user_ids FROM Users WHERE _id IS NULL;
SELECT COUNT(*) AS null_brand_ids FROM Brands WHERE id IS NULL;
SELECT COUNT(*) AS null_receipt_ids FROM Receipts WHERE id IS NULL;
SELECT COUNT(*) AS null_receipt_item_ids FROM ReceiptItems WHERE id IS NULL;

-- Check for duplicate values in unique key columns
SELECT _id, COUNT(*) AS count FROM Users GROUP BY _id HAVING COUNT(*) > 1;
SELECT id, COUNT(*) AS count FROM Brands GROUP BY id HAVING COUNT(*) > 1;
SELECT id, COUNT(*) AS count FROM Receipts GROUP BY id HAVING COUNT(*) > 1;
SELECT id, COUNT(*) AS count FROM ReceiptItems GROUP BY id HAVING COUNT(*) > 1;

-- Check for invalid or inconsistent data types
SELECT * FROM Users WHERE _id NOT LIKE '%-%' ESCAPE '#'; -- Check for non-UUID values in _id column
SELECT * FROM Receipts WHERE createdDate > CURRENT_TIMESTAMP; -- Check for future dates in createdDate column

-- Check for referential integrity violations
SELECT ri.id, ri.receiptId
FROM ReceiptItems ri
LEFT JOIN Receipts r ON ri.receiptId = r.id
WHERE r.id IS NULL;

