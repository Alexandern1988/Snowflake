// PROD DimCallType
CREATE OR REPLACE TABLE THEVOICE.PROD.DimCallType (
            KeyCallType                int primary key
            ,DescCallTypeCode          varchar(100)
            ,DescCallType              varchar(100)
            ,DescFullCallType          varchar(100)
            ,DescCallTypePriceCategory varchar(100)
            ,DescCallTypeCategory      varchar(100)
        );
        


CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_DimCallType()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.DimCallType AS T
        USING THEVOICE.STG.DimCallType AS S
            ON T.KeyCallType = S.KeyCallType
        WHEN NOT MATCHED THEN 
        INSERT (T.KeyCallType,T.DescCallTypeCode ,T.DescCallType ,T.DescFullCallType,T.DescCallTypePriceCategory,T.DescCallTypeCategory)
        VALUES (S.KeyCallType,S.DescCallTypeCode ,S.DescCallType ,S.DescFullCallType,S.DescCallTypePriceCategory,S.DescCallTypeCategory);
        
        RETURN 'PROD DimCallType LOADED SUCCESSFULLY';
    END;
$$;


// PROD DimCountries
CREATE OR REPLACE TABLE THEVOICE.PROD.DimCountries (
    KeyCountry   int primary key
    ,DescCountry varchar(100)
    ,DescRegion	 varchar(100)
    ,DescArea    varchar(100)
);
 

CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_DimCountries()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.DIMCOUNTRIES AS T
        USING THEVOICE.STG.DIMCOUNTRIES AS S
            ON T.KeyCountry = S.KeyCountry
        WHEN NOT MATCHED THEN
        INSERT (T.KeyCountry,T.DescCountry,T.DescRegion,T.DescArea)
        VALUES (S.KeyCountry,S.DescCountry,S.DescRegion,S.DescArea); 
        
        RETURN 'PROD DimCountries LOADED SUCCESSFULLY';
    END;
$$;


// PROD DimPackageCatalog
CREATE OR REPLACE TABLE THEVOICE.PROD.DimPackageCatalog (
     KeyPackage	               INT primary key
    ,DescPackage               VARCHAR(120)
    ,DatePackageCreation       DATE
    ,DatePackageEnd	           DATE
    ,DescPackageStatus         VARCHAR(100)
    ,CodePackageActivitiesDays INT
);


CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_DimPackageCatalog()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.DimPackageCatalog AS T
        USING THEVOICE.STG.DimPackageCatalog AS S
            ON T.KeyPackage = S.KeyPackage
        WHEN NOT MATCHED THEN 
        INSERT (T.KeyPackage,T.DescPackage,T.DatePackageCreation,T.DatePackageEnd,T.DescPackageStatus,T.CodePackageActivitiesDays)
        VALUES (S.KeyPackage,S.DescPackage,S.DatePackageCreation,S.DatePackageEnd,S.DescPackageStatus,S.CodePackageActivitiesDays);
        
        RETURN 'PROD DimPackageCatalog LOADED SUCCESSFULLY';
    END;
$$;


// PROD DimOperators
CREATE OR REPLACE TABLE THEVOICE.PROD.DimOperators (
     KeyOperator	INT primary key
    ,DescOperator   VARCHAR(50)
    ,DescKeyPrefix  VARCHAR(3)
);

MERGE INTO THEVOICE.PROD.DimOperators AS T
USING THEVOICE.STG.DimOperators AS S
    ON T.KeyOperator = S.KeyOperator
WHEN NOT MATCHED THEN 
INSERT (T.KeyOperator,T.DescOperator,T.DescKeyPrefix)
VALUES (S.KeyOperator,S.DescOperator,S.DescKeyPrefix);


CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_DimOperators()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.DimOperators AS T
        USING THEVOICE.STG.DimOperators AS S
            ON T.KeyOperator = S.KeyOperator
        WHEN NOT MATCHED THEN 
        INSERT (T.KeyOperator,T.DescOperator,T.DescKeyPrefix)
        VALUES (S.KeyOperator,S.DescOperator,S.DescKeyPrefix);
        
        RETURN 'PROD DimOperators LOADED SUCCESSFULLY';
    END;
$$;


// PROD CUSTOMERS
CREATE OR REPLACE TABLE THEVOICE.PROD.DimCustomers(
    KeyCustomer              INT primary key,
    OperatorCode             INT,
    CountryCode              INT,
    DescCustomerLineOperator VARCHAR(50),
    DescCustomerLineCountry  VARCHAR(100),
    DescCustomerName         VARCHAR(100),
    DescCustomerAddress      VARCHAR(100),
    DescCusomterPackage      VARCHAR(100)
);


CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_DimCustomers()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.DimCustomers AS T
        USING THEVOICE.STG.DimCustomers AS S
            ON T.KeyCustomer = S.KeyCustomer
        WHEN NOT MATCHED THEN 
        INSERT (T.KeyCustomer,T.OperatorCode,T.CountryCode,T.DescCustomerLineOperator,T.DescCustomerLineCountry,T.DescCustomerName,T.DescCustomerAddress,T.DescCusomterPackage)
        VALUES (S.KeyCustomer,S.OperatorCode,S.CountryCode,S.DescCustomerLineOperator,S.DescCustomerLineCountry,S.DescCustomerName,S.DescCustomerAddress,S.DescCusomterPackage);
        
        RETURN 'PROD DimCustomers LOADED SUCCESSFULLY';
    END;
$$;


// PROD DimCallOriginType
CREATE OR REPLACE TABLE THEVOICE.PROD.DimCallOriginType(
    KeyCallOriginType  INT PRIMARY KEY,
    DescCallOriginType VARCHAR(50)
);


CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_DimCallOriginType()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.DimCallOriginType AS T
        USING THEVOICE.STG.DimCallOriginType AS S
            ON T.KeyCallOriginType = S.KeyCallOriginType
        WHEN NOT MATCHED THEN
        INSERT (T.KeyCallOriginType ,T.DescCallOriginType)
        VALUES (S.KeyCallOriginType ,S.DescCallOriginType);
        
        RETURN 'PROD DimCallOriginType LOADED SUCCESSFULLY';
    END;
$$;



// PROD DIM_DATE
CREATE OR REPLACE TABLE THEVOICE.PROD.Dim_Date(
     FullDate       DATETIME
     ,KeyDate       INT primary key
     ,KeyMonth      INT
     ,CodeYear      INT
     ,CodeQuarter   INT
     ,CodeMonth     INT
     ,DescMonth     VARCHAR(10)
     ,CodeDayInWeek INT
     ,DescDayInWeek VARCHAR(10)
);



MERGE INTO THEVOICE.PROD.Dim_Date AS T
USING THEVOICE.STG.Dim_Date AS S
    ON T.KeyDate = S.KeyDate
WHEN NOT MATCHED THEN
INSERT (T.FullDate,T.KeyDate,T.KeyMonth,T.CodeYear,T.CodeQuarter,T.CodeMonth,T.DescMonth,T.CodeDayInWeek,T.DescDayInWeek)
VALUES (S.FullDate,S.KeyDate,S.KeyMonth,S.CodeYear,S.CodeQuarter,S.CodeMonth,S.DescMonth,S.CodeDayInWeek,S.DescDayInWeek);

CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_Dim_Date()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.Dim_Date AS T
        USING THEVOICE.STG.Dim_Date AS S
            ON T.KeyDate = S.KeyDate
        WHEN NOT MATCHED THEN
        INSERT (T.FullDate,T.KeyDate,T.KeyMonth,T.CodeYear,T.CodeQuarter,T.CodeMonth,T.DescMonth,T.CodeDayInWeek,T.DescDayInWeek)
        VALUES (S.FullDate,S.KeyDate,S.KeyMonth,S.CodeYear,S.CodeQuarter,S.CodeMonth,S.DescMonth,S.CodeDayInWeek,S.DescDayInWeek);
        
        RETURN 'PROD Dim_Date LOADED SUCCESSFULLY';
    END;
$$;



// PROD FACT_USAGE
CREATE OR REPLACE TABLE THEVOICE.PROD.FACT_USAGE(
     CallId	                 INT primary key
    ,KeyCustomer             INT
    ,KeyCallType             INT
    ,KeyOriginCountry        INT
    ,KeyDestinationCountry   INT
    ,KeyOriginOperator       INT
    ,KeyDestinationOperator  INT
    ,DescDestinationCountry  VARCHAR(100)
    ,DescDestinationOperator VARCHAR(100)
    ,KeyPackage	             INT
    ,KeyCallOriginType       INT
    ,KeyCallDate             INT
    ,Duration                INT
    ,BillableDuration        INT
    ,Amount	                 FLOAT
    ,BillableAmount	         FLOAT

);


CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_FACT_USAGE()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        MERGE INTO THEVOICE.PROD.FACT_USAGE AS T
USING THEVOICE.STG.FACT_USAGE AS S
    ON T.CallId = S.CallId
WHEN NOT MATCHED THEN
INSERT ( T.CallId	                
        ,T.KeyCustomer            
        ,T.KeyCallType            
        ,T.KeyOriginCountry       
        ,T.KeyDestinationCountry  
        ,T.KeyOriginOperator      
        ,T.KeyDestinationOperator 
        ,T.DescDestinationCountry 
        ,T.DescDestinationOperator
        ,T.KeyPackage	            
        ,T.KeyCallOriginType      
        ,T.KeyCallDate            
        ,T.Duration               
        ,T.BillableDuration       
        ,T.Amount	                
        ,T.BillableAmount)
VALUES ( S.CallId	               
        ,S.KeyCustomer            
        ,S.KeyCallType            
        ,S.KeyOriginCountry       
        ,S.KeyDestinationCountry  
        ,S.KeyOriginOperator      
        ,S.KeyDestinationOperator 
        ,S.DescDestinationCountry 
        ,S.DescDestinationOperator
        ,S.KeyPackage	           
        ,S.KeyCallOriginType      
        ,S.KeyCallDate            
        ,S.Duration               
        ,S.BillableDuration       
        ,S.Amount	               
        ,S.BillableAmount);
        
        RETURN 'PROD FACT_USAGE LOADED SUCCESSFULLY';
    END;
$$;



// RUN PROD PROCEDURES
CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_RUN_PROD()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        CALL THEVOICE.PROD.SP_DimCallType();
        CALL THEVOICE.PROD.SP_DimCountries();
        CALL THEVOICE.PROD.SP_DimPackageCatalog();
        CALL THEVOICE.PROD.SP_DimOperators();
        CALL THEVOICE.PROD.SP_DimCustomers();
        CALL THEVOICE.PROD.SP_DimCallOriginType();
        CALL THEVOICE.PROD.SP_Dim_Date();
        CALL THEVOICE.PROD.SP_FACT_USAGE();
        
        RETURN 'PROD TABLES LOADED';
    END;
$$;


// RUN ENTIRE PROCCESS
CREATE OR REPLACE PROCEDURE THEVOICE.PROD.SP_RUN_ALL_PROCS()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    BEGIN
        CALL THEVOICE.MRR.SP_RUN_MRR();
        CALL THEVOICE.STG.SP_RUN_STG();
        CALL THEVOICE.PROD.SP_RUN_PROD();
        
        RETURN 'ETL Process ran successfully';
    END;
$$;



// Task to run every day from sunday to friday at 5 am
CREATE OR REPLACE TASK THEVOICE.MANAGE.TSK_RUN_ETL
    SCHEDULE = 'USING CRON 0 5 * * 1-6 UTC'
AS
CALL THEVOICE.PROD.SP_RUN_ALL_PROCS();
    





