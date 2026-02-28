CREATE DATABASE OLA ;             -- vehicle turn around time
USE OLA ;

select * from bookings ;

-- SQL Questions

-- 1. Retrieve all successful bookings:

SELECT * FROM bookings 
WHERE booking_status = 'success' ;

-- 2. Find the average ride distance for each vehicle type:

SELECT vehicle_type, AVG(ride_distance) AS avg_ride_dist 
FROM bookings
GROUP BY vehicle_type ;

-- 3. Get the total number of cancelled rides by customers:

SELECT booking_status , COUNT(*) total_rides_canceled
FROM bookings 
WHERE booking_status = 'canceled by customer';

-- 4. List the top 5 customers who booked the highest number of rides:

SELECT customer_id, COUNT(booking_id) AS total_rides
from bookings
GROUP BY customer_id 
ORDER BY total_rides DESC
LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT COUNT(*) AS total_rides_canceled 
FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT MAX(driver_ratings) AS max_rating, MIN(driver_ratings) AS min_rating
FROM bookings
WHERE vehicle_type = 'Prime Sedan' ;

-- 7. Retrieve all rides where payment was made using UPI:

SELECT * FROM bookings
WHERE payment_method = 'upi' ;

-- 8. Find the average customer rating per vehicle type:

SELECT vehicle_type, ROUND(AVG(customer_rating),2) AS avg_cust_rating
FROM bookings
GROUP BY vehicle_type ;

-- 9. Calculate the total booking value of rides completed successfully:

SELECT SUM(booking_value) AS total_successful_values FROM bookings
WHERE booking_status = 'success' ;

-- 10. List all incomplete rides along with the reason

SELECT booking_id, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides = 'yes' ;