-- Total number of items purchased based on rewardsReceiptStatus
SELECT
    rewardsReceiptStatus,
    SUM(purchasedItemCount) AS total_items_purchased
FROM
    Receipts
WHERE
    rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY
    rewardsReceiptStatus;
