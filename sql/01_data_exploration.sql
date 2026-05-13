-- ================================================
-- Cyclistic Bike-Share Analysis
-- Step 3: Data Analysis
-- Dataset: May 2025 to April 2026
-- Total clean rows: 3,209,104
-- ================================================

-- ------------------------------------------------
-- QUERY 1: Total rides by rider type
-- Result: Member 2,106,931 | Casual 1,102,173
-- ------------------------------------------------
SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual
ORDER BY total_rides DESC;

-- ------------------------------------------------
-- QUERY 2: Average ride length by rider type
-- Result: Casual 21.42 min | Member 11.96 min
-- ------------------------------------------------
SELECT
  member_casual,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual;

-- ------------------------------------------------
-- QUERY 3: Rides by day of week and rider type
-- (1=Sunday, 7=Saturday)
-- ------------------------------------------------
SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;

-- ------------------------------------------------
-- QUERY 4: Rides by month and rider type
-- ------------------------------------------------
SELECT
  member_casual,
  year,
  month,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, year, month
ORDER BY member_casual, year, month;

-- ------------------------------------------------
-- QUERY 5: Rides by season and rider type
-- ------------------------------------------------
SELECT
  member_casual,
  season,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, season
ORDER BY member_casual, season;

-- ------------------------------------------------
-- QUERY 6: Rides by hour of day and rider type
-- ------------------------------------------------
SELECT
  member_casual,
  hour_of_day,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, hour_of_day;

-- ------------------------------------------------
-- QUERY 7: Rides by bike type and rider type
-- ------------------------------------------------
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;

-- ------------------------------------------------
-- QUERY 8: Top 10 start stations for casual riders
-- ------------------------------------------------
SELECT
  start_station_name,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;

-- ------------------------------------------------
-- QUERY 9: Top 10 start stations for members
-- ------------------------------------------------
SELECT
  start_station_name,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone-496214.cyclistic_data.trips_cleaned`
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;
