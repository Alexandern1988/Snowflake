<b>Introduction</b>

The motivation for this project is to develop an ETL process using Snowflake's streams to create a DWH.
Sparkify is an OLTP music app, we want to collect the data, transform it and load it into an analytical db.
The final aim is to give the analytical team a db for their analytical needs.

<b>Project Description </b>

In this project, I have to model data with SQL and build and ETL pipeline using pipe's, streams and tasks. ETL pipeline would transfer data from the original OLTP db using 2 schemas for each stage, staging and production, using file foramts, extenal stages and a storage integration.
The original db was converted to json files and loaded to s3.

<b>Schema for Song Play Analysis</b>

<b>Fact Table</b>

<b> FACT_SONGPLAYS: </b> Records in the log of the app


<b>Dimension Tables</b>

<b> DIM_USERS: </b> Descries the users on the app

<b> DIM_SONGS: </b> Describes all the available songs on the app

<b> DIM_ARTISTS: </b> Describes all the performers

<b> DIM_TIME: </b> Date and time dimention


<b>Project Design</b>

The goal of the database design is to create an optimized db for the analysis needs of the oranization.
 

<b>Files Description</b>

<b>*</b> UDACITY_00 - Create WH, DB & Schemas - Create a virtual warehouse, Database and Schemas.

<b>*</b> UDACITY_01 - Create File Format, Storage Integration & External Stages - Creating a json file format, Storage integration to connect to s3, and an external stage.

<b>*</b> UDACITY_02 - Create Raw Tables for Unstructured Data & Define Pipelines.

<b>*</b> UDACITY_03 - Create Raw Staging Tables & Create Streams for Raw Data.

<b>*</b> UDACITY_04 - Create Production Tables & Streams for Staging data.

<b>*</b> UDACITY_05 - Create Merge Statements Into Production Tables.

<b>*</b> UDACITY_06 - Original Udacity Bucket Data.


<b>**</b> This project is from the Udacity Data engineer program, file 06 describes the original data source used in the program.
    