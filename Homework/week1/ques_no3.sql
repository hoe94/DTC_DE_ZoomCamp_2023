select 
	COUNT(*)
from 
	green_taxi_trips 
where
	DATE(lpep_pickup_datetime) = '2019-01-15' AND
	DATE(lpep_dropoff_datetime) = '2019-01-15';