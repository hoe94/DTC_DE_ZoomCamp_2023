SELECT 
	DATE(lpep_pickup_datetime) 
FROM 
	green_taxi_trips 
WHERE
	TRIP_DISTANCE = (SELECT MAX(TRIP_DISTANCE) FROM green_taxi_trips)
LIMIT 10;