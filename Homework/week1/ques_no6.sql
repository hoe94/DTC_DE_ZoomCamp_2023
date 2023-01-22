SELECT 
	c."Zone"
FROM
	green_taxi_trips as a 
	INNER JOIN taxi_zone_lookup as b ON a."PULocationID" = b."LocationID"
	INNER JOIN taxi_zone_lookup as c ON a."DOLocationID" = c."LocationID"
WHERE
	b."Zone" = 'Astoria'
	AND a."tip_amount" = (SELECT 
				   		MAX(tip_amount)
				  	FROM
						green_taxi_trips as a 
					INNER JOIN taxi_zone_lookup as b ON a."PULocationID" = b."LocationID"
					INNER JOIN taxi_zone_lookup as c ON a."DOLocationID" = c."LocationID"
					WHERE
						b."Zone" = 'Astoria'
				  );
	
	