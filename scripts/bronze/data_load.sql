/*
load the data from CSV files to the schema tables using Bulk Insert

truncate the tables if loaded before

calculate the duration of each load opperation 
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

	/* making variabled to calc the duration of each step */
	DECLARE @start_time DATETIME , @end_time DATETIME

	BEGIN TRY

	PRINT '-------------------------------------'
	PRINT 'INSERTING TABLE crm_cust_info'
	PRINT '-------------------------------------'
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\Yosram\Desktop\Data ENG\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE();
	PRINT'load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' SEC'


	SELECT COUNT (*) FROM bronze.crm_cust_info

	PRINT '-------------------------------------'
	PRINT 'INSERTING TABLE crm_prd_info'
	PRINT '-------------------------------------'
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_prd_info
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\Yosram\Desktop\Data ENG\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	SET @end_time = GETDATE();
	PRINT'load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' SEC'

	SELECT COUNT (*) FROM bronze.crm_prd_info 

	PRINT '-------------------------------------'
	PRINT 'INSERTING TABLE crm_sales_details'
	PRINT '-------------------------------------'

	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_sales_details
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\Yosram\Desktop\Data ENG\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE();
	PRINT'load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' SEC'
	SELECT COUNT (*) FROM bronze.crm_sales_details 


	PRINT '-------------------------------------'
	PRINT 'INSERTING TABLE erp_cust_az12'
	PRINT '-------------------------------------'
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.erp_cust_az12
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\Yosram\Desktop\Data ENG\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE();
	PRINT'load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' SEC'
	SELECT COUNT (*) FROM bronze.erp_cust_az12 

	PRINT '-------------------------------------'
	PRINT 'INSERTING TABLE erp_loc_a101'
	PRINT '-------------------------------------'
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.erp_loc_a101
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\Yosram\Desktop\Data ENG\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE();
	PRINT'load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' SEC'
	SELECT COUNT (*) FROM bronze.erp_loc_a101 

	PRINT '-------------------------------------'
	PRINT 'INSERTING TABLE erp_px_cat_g1v2'
	PRINT '-------------------------------------'
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.erp_px_cat_g1v2
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\Yosram\Desktop\Data ENG\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW =2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE();
	PRINT'load duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +' SEC'
	SELECT COUNT (*) FROM bronze.erp_px_cat_g1v2 
	END TRY

	BEGIN CATCH
	PRINT 'THERE IS ERROR'
	END CATCH

END;
