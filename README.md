# Fetch Analytics Model
This repository contains a data model and SQL queries for analyzing receipt data. The data model is designed to handle various business requirements and data quality issues.

### The data model consists of the following tables:
- Users
- Brands
- Receipts
- ReceiptItems
- Items

### Key Points

1. ReceiptItems:
   - Added brandID column to reference Brands table and allow easy association of items with brands.
   - This table does not have a separate surrogate key (id). Instead, it relies on the combination of receiptId and itemId to uniquely identify each receipt item, maintaining the relationship with the Receipts table and avoiding unnecessary duplication.
2. Items: This table is optional and includes the itemID column to track individual items for future analytics. 

### Queries 
- What are the top 5 brands by receipts scanned for most recent month?

- How does the ranking of the top 5 brands by receipts scanned for the recent month compare to the ranking for the previous month?
  
- When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
  
- When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
  
- Which brand has the most spend among users who were created within the past 6 months?
  
- Which brand has the most transactions among users who were created within the past 6 months?

