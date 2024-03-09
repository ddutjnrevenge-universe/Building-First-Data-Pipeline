# Building Robust Data Pipelines for Modern Data Engineering
## Objective: 
Implementing a data pipeline using Spark DBT and any cloud platform, following the Medallion architecture with bronze, silver, and gold layers for data transformation.
## Tools/Technologies Used: 
Azure Data Factory, Azure Data Lake, Azure Gen2 services, Apache Spark, Data Bricks, DBT (Data Build Tool)
## Project Overview:
1. Infrastructure Setup:
Creation of resource group and Gen2 Azure Data Lake Storage account.
Establishment of access keys in Azure Key Vault and connection in data factory.
2. SQL Database Setup:
Creation of SQL database in Azure, populating it with Adventure Works sample database.
3. Data Ingestion and Transformation:
Transfer of data into bronze layer using Azure Data Factory, dynamically fetching table names and creating pipelines with lookups.
Loading data into bronze layer and troubleshooting errors.
4. DBT Setup and Transformation:
Configuration of DBT for data transformation.
Debugging issues related to project setup and connecting to Data Bricks.
5. Data Pipeline Testing and Debugging:
Testing data pipeline connections, creating databases and tables in Data Bricks.
Loading data into bronze layer, setting up DBT for data transformation, and debugging errors.
6. Data Transformation and Visualization:
Creation of materialized tables from existing data sources in Delta Lake format.
Selecting and transforming data for storage in gold layer.
Documentation and visualization of data transformations using DBT.

Special thanks to the tutorial video of CodeWithYu: https://youtu.be/divjURi-low?list=PL_Ct8Cox2p8UlTfHyJc3RDGuGktPNs9Q3 
