<b>Introduction</b>

The motivation for this project is to develop an ETL process using Snowflake's stored procedures to create a DWH.
TheVoice is an OLTP call center db, we want to collect the data, transform it and load it into an analytical db.
The final aim is to give the analytical team a db for their analytical needs.

<b>Project Description </b>

In this project, I have to model data with SQL and build and ETL pipeline using pipe's, stored proedures and tasks. On the database side, I have to define fact and dimension tables for a Star Schema for a specific focus according to our S2T mapping. On the other hand, ETL pipeline would transfer data from the original OLTP db using 3 schemas for each stage MRR, STG and finally DWH, and a manage schema for file foramt, stage and storage integration.
The original db was converted to parquet files and loaded to s3.

<b>Schema for Song Play Analysis</b>

<b>Fact Table</b>

<b> FactUsage: </b> Records in the log of calling center

<b>Dimension Tables</b>

<b> DimCallTypes: </b> Descries call types

<b> DimCountries: </b> Describes Origin\Target countries

<b> DimPackageCatalog: </b> Describes packages offered

<b> DimDate: </b> Date dimention

<b> DimOperators: </b> Describes all providng operators

<b> DimCustomers: </b> Customer information

<b> DimCallOriginType: </b> Describes origin


<b>Project Design</b>

The goal of the database design is to create an optimized db for the analysis needs of the oranization.
 
<b>Files Description</b>

<b>*</b> TheVoice_01 - Create WH, DB & Schemas - Create a virtual warehouse, Database and Schemas.

<b>*</b> TheVoice_02 - Create File Format, Storage Integration & External Stages - Creating a parquet file format, Storage integration to connect to s3, and an external stage.

<b>*</b> TheVoice_03 - MRR Procedures - Use stored procedures to mirror the data from the OLTP db.

<b>*</b> TheVoice_04 - STG Procedures - Use stored procedures to perform all the transformations according to S2T mapping.

<b>*</b> TheVoice_05 - PROD Procedures - stored procedures to perform inceremental load.

<b>**</b> The process is automated using a task to run all the stored procedures, each stage has a stored procedure calling all procedures in the stage which is the run by the task. 