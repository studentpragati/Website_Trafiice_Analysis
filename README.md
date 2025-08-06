# 📈 Website Traffic Analysis – SQL + Power BI Project

 **Domain:** Web Analytics | User Behavior Insights | Marketing Analytics  
 **Tools Used:** SQL (MySQL) • Power BI

---

## 🧠 Project Objective

In a digital-first world, analyzing how users interact with a website is key to understanding product performance, optimizing content, and driving better marketing decisions.  
This project simulates how data analysts uncover actionable insights from website traffic using SQL and visualize them in Power BI.

---

## 🗃️ Dataset & Schema

I designed a **relational database schema** to represent website interaction data. The database consists of 6 interrelated tables:

| Table Name       | Description                                      |
|------------------|--------------------------------------------------|
| `visitors`       | Basic info about site visitors                   |
| `sessions`       | Start/end time, session duration per visitor     |
| `page_views`     | Pages visited within each session                |
| `events`         | Actions like clicks, scrolls, signups            |
| `devices`        | Device type, OS, browser used                    |
| `traffic_sources`| Source (Google, Email, Social, etc.), campaign   |

---

## 🔍 SQL Exploration

I wrote 20+ queries to extract insights such as:

- Total visitors by country & city  
- New vs Returning visitors  
- Sessions by device type, browser, OS  
- Top marketing campaigns & traffic mediums  
- Most viewed pages and avg. time spent  
- Top event types (clicks, signups, scrolls)  
- Visitor activity rankings using `RANK()` (Window Function)  
- Average session duration by source using a `CTE`  
- Sessions longer than average using a `Subquery`  

---

## 📊 Power BI Dashboard

I built an **interactive dashboard** in Power BI to showcase key insights:

### 🔹 Page 1: Website Overview
- Total sessions  
- Average session duration  
- Device breakdown (desktop/tablet/mobile)  
- Session trend line  

### 🔹 Page 2: Traffic Sources
- Top traffic sources & marketing campaigns  
- Organic vs Paid vs Referral vs Email  
- Average session duration by source  

### 🔹 Page 3: User Behavior
- Most viewed pages  
- Avg. time spent per page  
- Most clicked elements  
- Sessions with signup events  

---

## 🚀 Key Learnings

- Applied SQL to a real-world style dataset with joins, window functions, CTEs, and subqueries  
- Practiced breaking down a business problem (web performance) using data  
- Built and styled a complete Power BI report for stakeholder-friendly storytelling  

---
