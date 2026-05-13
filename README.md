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

## 🔍 Analysis Process
1. **Ask** — Defined business task and key questions
2. **Prepare** — Downloaded and explored 12 months of trip data
3. **Process** — Cleaned data using SQL in Google BigQuery
4. **Analyze** — Identified trends using Python
5. **Share** — Built interactive dashboard in Tableau
6. **Act** — Delivered top 3 marketing recommendations

---

## 📈 Key Findings
*(To be updated after analysis)*
- Finding 1
- Finding 2
- Finding 3

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
