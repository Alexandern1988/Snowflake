USE SCHEMA MANAGE;


// Create file format
CREATE OR REPLACE FILE FORMAT THEVOICE.MANAGE.PARQUET_FILE_FORMAT
    TYPE = PARQUET;
    
SHOW FILE FORMATS;

--------------------------------------------------------------------
// Create S3 storage integration
CREATE OR REPLACE STORAGE INTEGRATION S3
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    ENABLED = TRUE          
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::#####:role/snowflake-the-voice'
    STORAGE_ALLOWED_LOCATIONS = ('s3://the-voice-project/')
    COMMENT = "Storage integration for TheVoice data files";

DESC INTEGRATION S3;

SHOW STORAGE INTEGRATIONS;

--------------------------------------------------------------------

// Create a general stage
CREATE OR REPLACE STAGE THEVOICE.MANAGE.GENERAL
    URL = 's3://the-voice-project/'
    STORAGE_INTEGRATION = S3
    FILE_FORMAT = THEVOICE.MANAGE.PARQUET_FILE_FORMAT;
    
LIST @THEVOICE.MANAGE.GENERAL;

                      
SHOW STAGES;

// Query from stage
SELECT * FROM @THEVOICE.MANAGE.GENERAL/dim_date;    


