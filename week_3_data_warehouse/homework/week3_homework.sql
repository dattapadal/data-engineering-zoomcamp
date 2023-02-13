CREATE OR REPLACE EXTERNAL TABLE `ny-rides-akash.dezoomcamp.external_fhv_2019_data`
OPTIONS (
  format = 'CSV',
  uris = ['https://storage.cloud.google.com/prefect-de-zoomcamp-akash/data/fhv/fhv_tripdata_2019-*.csv.gz']
);

select count(1) from ny-rides-akash.dezoomcamp.external_fhv_2019_data;

SELECT count(1) FROM `ny-rides-akash.dezoomcamp.fhv_data_2019`; -- created table using UI (https://cloud.google.com/bigquery/docs/loading-data-cloud-storage-csv)



select count(distinct(Affiliated_base_number)) from `ny-rides-akash.dezoomcamp.external_fhv_2019_data`;


select count(distinct(Affiliated_base_number)) from `ny-rides-akash.dezoomcamp.fhv_data_2019`;


select 
  count(1) 
from 
  `ny-rides-akash.dezoomcamp.external_fhv_2019_data` 
where 
  PUlocationID is null and DOlocationID is null;


CREATE OR REPLACE TABLE `ny-rides-akash.dezoomcamp.fhv_2019_table_partitoned_clustered`
PARTITION BY DATE(pickup_datetime)
CLUSTER BY affiliated_base_number AS
SELECT * FROM `ny-rides-akash.dezoomcamp.fhv_data_2019`;


select count(distinct(affiliated_base_number))
 from `ny-rides-akash.dezoomcamp.fhv_2019_table_partitoned_clustered`
 where DATE(pickup_datetime) between '2019-03-01' AND '2019-03-31' ;

 select count(distinct(affiliated_base_number))
 from `ny-rides-akash.dezoomcamp.fhv_data_2019`
 where DATE(pickup_datetime) between '2019-03-01' AND '2019-03-31'; 