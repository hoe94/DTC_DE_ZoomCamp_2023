SELECT 
	passenger_count,
	COUNT(*) AS no_trips
FROM 
	green_taxi_trips
WHERE
	DATE(lpep_pickup_datetime) = '2019-01-01'
	AND (passenger_count = 2 OR passenger_count = 3)
GROUP BY
	passenger_count;
	