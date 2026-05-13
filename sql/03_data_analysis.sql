-- ================================================
-- Cyclistic Bike-Share Analysis
-- Step 3: Data Analysis
-- ================================================

-- 1. Total rides by rider type
SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual
ORDER BY total_rides DESC;

-- 2. Average ride length by rider type
SELECT
  member_casual,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual;

-- 3. Rides by day of week and rider type
SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;

-- 4. Rides by month and rider type
SELECT
  member_casual,
  month,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, month
ORDER BY member_casual, month;

-- 5. Rides by season and rider type
SELECT
  member_casual,
  season,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, season
ORDER BY member_casual, season;

-- 6. Rides by hour of day and rider type
SELECT
  member_casual,
  hour_of_day,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, hour_of_day;

-- 7. Rides by bike type and rider type
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;

-- 8. Top 10 start stations for casual riders
SELECT
  start_station_name,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;

-- 9. Top 10 start stations for members
SELECT
  start_station_name,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;
