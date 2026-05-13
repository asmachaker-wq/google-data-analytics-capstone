-- ================================================
-- Cyclistic Bike-Share Analysis
-- Step 2: Data Cleaning
-- ================================================

-- Combine all 12 months into one table
CREATE TABLE `cyclistic-capstone-496214.cyclistic_data.trips_all` AS
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_05`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_06`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_07`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_08`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_09`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_10`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_11`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2025_12`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2026_01`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2026_02`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2026_03`
UNION ALL
SELECT * FROM `cyclistic-capstone-496214.cyclistic_data.trips_2026_04`;

-- Check total rows after combining
SELECT COUNT(*) AS total_rows
FROM `cyclistic-capstone.cyclistic_data.trips_all`;

-- Create clean table removing:
-- 1. Null values
-- 2. Duplicate ride_ids
-- 3. Rides under 1 minute (false starts)
-- 4. Rides over 24 hours (bikes likely stolen)
CREATE TABLE `cyclistic-capstone.cyclistic_data.trips_cleaned` AS
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual,
  -- Add ride length in minutes
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
  -- Add day of week (1=Sunday, 7=Saturday)
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week,
  -- Add month
  EXTRACT(MONTH FROM started_at) AS month,
  -- Add hour of day
  EXTRACT(HOUR FROM started_at) AS hour_of_day,
  -- Add season
  CASE
    WHEN EXTRACT(MONTH FROM started_at) IN (12, 1, 2) THEN 'Winter'
    WHEN EXTRACT(MONTH FROM started_at) IN (3, 4, 5) THEN 'Spring'
    WHEN EXTRACT(MONTH FROM started_at) IN (6, 7, 8) THEN 'Summer'
    WHEN EXTRACT(MONTH FROM started_at) IN (9, 10, 11) THEN 'Fall'
  END AS season
FROM `cyclistic-capstone.cyclistic_data.trips_all`
WHERE
  -- Remove nulls
  start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL
  -- Remove duplicates
  AND ride_id IN (
    SELECT ride_id
    FROM `cyclistic-capstone.cyclistic_data.trips_all`
    GROUP BY ride_id
    HAVING COUNT(*) = 1
  )
  -- Remove rides under 1 minute
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1
  -- Remove rides over 24 hours
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1440;

-- Verify cleaned table
SELECT COUNT(*) AS total_clean_rows
FROM `cyclistic-capstone.cyclistic_data.trips_cleaned`;

-- Compare before and after cleaning
SELECT
  (SELECT COUNT(*) FROM `cyclistic-capstone.cyclistic_data.trips_all`) 
    AS rows_before,
  (SELECT COUNT(*) FROM `cyclistic-capstone.cyclistic_data.trips_cleaned`) 
    AS rows_after,
  (SELECT COUNT(*) FROM `cyclistic-capstone.cyclistic_data.trips_all`) -
  (SELECT COUNT(*) FROM `cyclistic-capstone.cyclistic_data.trips_cleaned`) 
    AS rows_removed;
