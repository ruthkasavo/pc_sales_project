# PC Sales Data Engineering Project

## Project Overview
This project demonstrates a complete End-to-End Data Engineering workflow, transforming messy, flat retail data into a professional, normalized **Star Schema** using SQL Server. The goal was to ensure data integrity, eliminate duplicates, and prepare the dataset for high-performance analytical querying.

## Repository Structure
- **`raw_data/`**: Contains the original CSV/Excel files representing flat transaction data (10,000 records).
- **`sql_scripts/`**: Comprehensive SQL scripts covering Data Definition (DDL) and Data Manipulation (DML). 
    - Table creation with identity keys.
    - Data cleaning (handling hidden spaces and case sensitivity).
    - Dimension and Fact table population.
- **`data_modelling/`**: Contains the logical design and architectural drawings of the database.

## Data Model (Star Schema)
The project utilizes a Star Schema to optimize query performance and reduce data redundancy. 

![Star Schema Diagram](./data_modelling/star_schema.png)

### Dimensions:
- **`dim_customer`**: Unique customer profiles.
- **`dim_product`**: Product specifications (normalized to handle variations in models).
- **`dim_location`**: Geographic sales data.
- **`dim_sales_person`**,
- **`dim_shop`**,
- **`dim_channel`**,
- **`dim_payment_method`**,
- **`dim_priority`**.

### Fact Table:
- **`Fact_PC_Sales`**: Centralized table containing quantitative measures and foreign keys to all dimensions.

## Key Engineering Challenges Solved
- **Data Integrity:** Resolved row-multiplication issues (Cartesian products) caused by many-to-many relationships in uncleaned dimensions.
- **Data Cleaning:** Implemented `TRIM()`, `UPPER()`, and `GROUP BY` logic to handle inconsistent naming conventions (e.g., "chromebook" vs "Chromebook").
- **Referential Integrity:** Successfully mapped 10,000 raw records into a normalized schema with exactly 10,000 Fact rows, ensuring a 1:1 transaction match.

## Tools Used
- **SQL Server (T-SQL)**: For data transformation and storage.
- **Draw.io**: For architectural schema design.
- **GitHub**: For version control and documentation.
