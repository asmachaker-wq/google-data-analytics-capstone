-- ================================================
-- Cyclistic Bike-Share Analysis
-- Step 1: Data Exploration
-- ================================================

-- Check total rows in one month
SELECT COUNT(*) AS total_rows
FROM `cyclistic-capstone.cyclistic_data.trips_2023_01`;

-- Preview the data
SELECT *
FROM `cyclistic-capstone.cyclistic_data.trips_2023_01`
LIMIT 10;

-- Check all column names and data types
SELECT column_name, data_type
FROM `cyclistic-capstone.cyclistic_data.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'trips_2023_01';

-- Check for null values
SELECT
  COUNTIF(ride_id IS NULL) AS null_ride_id,
  COUNTIF(rideable_type IS NULL) AS null_rideable_type,
  COUNTIF(started_at IS NULL) AS null_started_at,
  COUNTIF(ended_at IS NULL) AS null_ended_at,
  COUNTIF(start_station_name IS NULL) AS null_start_station,
  COUNTIF(end_station_name IS NULL) AS null_end_station,
  COUNTIF(member_casual IS NULL) AS null_member_casual
FROM `cyclistic-capstone.cyclistic_data.trips_2023_01`;

-- Check distinct rider types
SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone.cyclistic_data.trips_2023_01`
GROUP BY member_casual;

-- Check distinct bike types
SELECT
  rideable_type,
  COUNT(*) AS total_rides
FROM `cyclistic-capstone.cyclistic_data.trips_2023_01`
GROUP BY rideable_type;

-- Check date range
SELECT
  MIN(started_at) AS earliest_ride,
  MAX(started_at) AS latest_ride
FROM `cyclistic-capstone.cyclistic_data.trips_2023_01`;
