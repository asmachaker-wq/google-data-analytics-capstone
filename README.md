# 🚲 Cyclistic Bike-Share Analysis
## Google Data Analytics Capstone Project

---

## 📋 Scenario
This is a capstone project completed as part of the Google Data Analytics 
Professional Certificate on Coursera. The analysis is based on a fictional 
bike-share company called Cyclistic, where I play the role of a junior data 
analyst tasked with analyzing how annual members and casual riders use 
Cyclistic bikes differently — in order to design a marketing strategy 
to convert casual riders into annual members.

---

## 🎯 Business Task
**How do annual members and casual riders use Cyclistic bikes differently?**

---

## 🔧 Tools Used
| Step | Tool |
|------|------|
| Data Cleaning | SQL (Google BigQuery) |
| Data Analysis | Python (Pandas, Matplotlib) |
| Visualization | Tableau |

---

## 📁 Project Structure
cyclistic-capstone/
│
├── README.md
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_data_cleaning.sql
│   └── 03_data_analysis.sql
├── python/
│   └── cyclistic_analysis.ipynb
└── data/
└── cyclistic_cleaned.csv
---

## 📊 Data Source
- Cyclistic historical trip data (previous 12 months)
- Made available by Motivate International Inc.
- Public data — no personally identifiable information used

---

## 🧹 Data Cleaning Summary

| | Rows |
|---|---|
| **Before cleaning** | 4,584,139 |
| **After cleaning** | 3,209,104 |
| **Rows removed** | 1,375,035 |

### Rows were removed due to:
- Null values in station names
- Duplicate ride IDs
- Rides under 1 minute (false starts)
- Rides over 24 hours (stolen bikes)

## 🔍 Analysis Process

1. **Ask** — Defined business task: how do annual members and casual 
   riders use Cyclistic bikes differently?

2. **Prepare** — Downloaded 12 months of Cyclistic trip data 
   (May 2025 to April 2026) from Divvy public dataset. 
   Total raw rows: 4,584,139

3. **Process** — Cleaned data using SQL in Google BigQuery:
   - Combined 12 monthly CSV files into one table
   - Removed nulls, duplicates, and invalid ride lengths
   - Added ride_length_minutes, day_of_week, month, hour and season columns
   - Rows after cleaning: 3,209,104 (removed 1,375,035 rows)

4. **Analyze** — *(In progress — Python analysis coming soon)*

5. **Share** — *(In progress — Tableau dashboard coming soon)*

6. **Act** — *(In progress — Recommendations coming soon)*

---

## 📈 Key Findings
1. Members take **almost 2x more rides** than casual riders
   (65.7% vs 34.3% of total rides)
2. Casual riders ride **almost 2x longer** per ride
   (21.42 min vs 11.96 min average)
3. Casual riders peak on **weekends**, members peak on **weekdays**
4. Casual riders drop **83% in winter**, members stay consistent year round
5. Casual riders peak in **Summer**, members ride consistently all seasons
6. Members show a **commuter pattern** (8am + 5pm peaks),
   casuals show a **leisure pattern** (gradual afternoon peak)
7. Casual riders slightly prefer **electric bikes**,
   members slightly prefer **classic bikes**
8. Casual riders start at **tourist landmarks**
   (Navy Pier, Millennium Park, Shedd Aquarium)
9. Members start at **business and commuter districts**
   (Canal St, Clinton St, Wells St)

---

## ✅ Recommendations
*(To be updated after analysis)*
- Recommendation 1
- Recommendation 2
- Recommendation 3

---

## 🔗 Links
- 📊 Tableau Dashboard: [Coming Soon]
- 📓 Kaggle Notebook: [Coming Soon]

---

## 📥 Data Source & Preparation

### Where is the data from?
- Downloaded from Divvy public trip data:
  https://divvy-tripdata.s3.amazonaws.com/index.html
- Made available by Motivate International Inc. under public license
- 12 months of historical bike trip data (CSV format)
- No personally identifiable information included

### How is the data organized?
Each CSV file contains one month of trip data with these columns:
| Column | Description |
|--------|-------------|
| ride_id | Unique ID for each ride |
| rideable_type | Type of bike used |
| started_at | Start date and time |
| ended_at | End date and time |
| start_station_name | Name of start station |
| end_station_name | Name of end station |
| start_lat / start_lng | Start location coordinates |
| end_lat / end_lng | End location coordinates |
| member_casual | Rider type (member or casual) |

---
