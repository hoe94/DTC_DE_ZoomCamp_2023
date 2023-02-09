CREATE OR REPLACE EXTERNAL TABLE `ny_taxi.fhv_data`
OPTIONS (
  format = 'csv',
  uris = ['gs://dtc-gbq/fhv_tripdata_2019-*.csv.gz']
);

--Question 1: What is the count for fhv vehicle records for year 2019 
--Answer: 43,244,696
SELECT COUNT(*) FROM `ny_taxi.fhv_data`;

--Question 2: 
--Write a query to count the distinct number of affiliated_base_number for the entire dataset on both the tables.
--What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?

SELECT DISTINCT(Affiliated_base_number) FROM `ny_taxi.fhv_data`;

--Question 3:
--How many records have both a blank (null) PUlocationID and DOlocationID in the entire dataset?
--Answer: 717,748
SELECT 
  COUNT(*) 
FROM 
  `ny_taxi.fhv_data`
WHERE 
  PUlocationID IS NULL AND DOlocationID IS NULL;

--Question 4:
--What is the best strategy to optimize the table if query always filter by pickup_datetime and order by affiliated_base_number?
--Answer: Partition by pickup_datetime Cluster on affiliated_base_number


--Question 5:
CREATE OR REPLACE TABLE `ny_taxi.fhv_data_non_partitioned` as
SELECT * FROM `ny_taxi.fhv_data`;

SELECT DISTINCT(Affiliated_base_number)
FROM `ny_taxi.fhv_data_non_partitioned`
WHERE pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31';

CREATE OR REPLACE TABLE `ny_taxi.fhv_data_partitioned` 
PARTITION BY DATE(pickup_datetime)
CLUSTER BY affiliated_base_number
AS
SELECT * FROM `ny_taxi.fhv_data`;

SELECT DISTINCT(Affiliated_base_number)
FROM `ny_taxi.fhv_data_partitioned` 
WHERE pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31';

--Answer: 647.87 MB for non-partitioned table and 23.06 MB for the partitioned table