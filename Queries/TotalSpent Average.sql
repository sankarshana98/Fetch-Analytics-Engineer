-- Average of totalspent based on the rewardsReceiptStatus
SELECT
    rewardsReceiptStatus,
    AVG(totalSpent) AS average_spent
FROM
    Receipts
WHERE
    rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY
    rewardsReceiptStatus;
