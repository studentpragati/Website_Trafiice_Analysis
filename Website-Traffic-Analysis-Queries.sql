#EXPLORATORY DATA ANALYSIS

#1. Total Visitors Count
select count(visitor_id) as total_visitors from visitors;

#2. Visitors by Country
select count(*) as number_of_visitors, country from visitors group by country order by number_of_visitors desc;

#3. Sessions by Device Type
select devices.device_type, count(*) as total_sessions from sessions inner join devices on sessions.device_id = devices.device_id group by device_type;

#4. Average Session Duration
select round(AVG(session_duration), 2) as avg_session_duration from sessions;

#5. New vs Returning Visitors
select user_type, COUNT(*) as number_of_visitors from visitors group by user_type;

#Getting percentage of returning users
SELECT 
  ROUND(
    (SUM(CASE WHEN user_type = 'Returning' THEN count ELSE 0 END) * 100.0) 
    / SUM(count), 
    2
  ) AS returning_user_percentage
FROM (
  SELECT user_type, COUNT(*) AS count
  FROM visitors
  GROUP BY user_type
) AS user_counts;



#6. Most Viewed Pages
select page_title, count(*) as number_of_views from page_views group by page_title order by number_of_views desc;

#7. Top 5 countries by visitor count
select country, count(*) as number_of_visitors from visitors group by country order by number_of_visitors desc limit 5;

#8. Top cities for traffic
select city, count(*) as number_of_visitors from visitors group by city order by number_of_visitors desc limit 5;

#9. Total sessions recorded
select count(*) as number_of_sessions from sessions;

#10. Sessions per traffic source
select traffic_sources.source_name as traffic_source, count(*) as number_of_sessions from sessions inner join traffic_sources on sessions.source_id = traffic_sources.source_id group by traffic_source;

#11. Sessions per marketing campaign
select traffic_sources.campaign as marketing_campaign, count(*) as number_of_sessions from sessions inner join traffic_sources on sessions.source_id = traffic_sources.source_id group by marketing_campaign order by number_of_sessions desc;

#12. Sessions by medium (organic, paid, etc.)
select traffic_sources.medium as medium_name, count(*) as number_of_sessions from sessions inner join traffic_sources on sessions.source_id = traffic_sources.source_id group by medium order by number_of_sessions desc;

#13. Sessions by device type
select devices.device_type as type_of_device, count(*) as number_of_sessions from sessions inner join devices on sessions.device_id = devices.device_id group by type_of_device order by number_of_sessions desc;

#14. Most common browser
select devices.browser as name_of_browser, count(*) as number_of_sessions from sessions inner join devices on sessions.device_id = devices.device_id group by name_of_browser order by number_of_sessions desc limit 1;

#15. Most popular OS
select devices.os as name_of_os, count(*) as number_of_sessions from sessions inner join devices on sessions.device_id = devices.device_id group by name_of_os order by number_of_sessions desc;

#16. Top 5 most viewed pages
select page_title, count(*) as number_of_views from page_views group by page_title order by number_of_views desc limit 5;

#17. Average time spent per page
select page_title, round(avg(time_spent_seconds), 2) as average_time_spent from page_views group by page_title order by average_time_spent desc;

#18. Which session had the most page views
select session_id, count(*) as page_view_count from page_views group by session_id order by page_view_count desc limit 1;

#19. Top event types performed
select event_type, count(*) as total_events from events group by event_type order by total_events desc;

#20. Most clicked elements
select element_clicked, count(*) as number_of_times_clicked from events group by element_clicked order by number_of_times_clicked desc limit 5;

#21. Which sessions had a 'signup' event
select distinct(session_id), event_type from events where event_type = 'signup';

#22. Window Function – Rank Most Active Visitors
SELECT 
  visitor_id,
  COUNT(*) AS total_sessions,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS visitor_rank
FROM sessions
GROUP BY visitor_id;


#23. CTE – Average Session Duration by Source
WITH avg_duration AS (
  SELECT 
    source_id,
    ROUND(AVG(session_duration), 2) AS avg_session_sec
  FROM sessions
  GROUP BY source_id
)
SELECT ts.source_name, avg_duration.avg_session_sec
FROM avg_duration
JOIN traffic_sources ts ON ts.source_id = avg_duration.source_id;


#24. Subquery – Sessions Longer Than Average
SELECT *
FROM sessions
WHERE session_duration > (
  SELECT AVG(session_duration) FROM sessions
);


#Total sessions by Date
SELECT 
  DATE(session_start) AS session_date,
  COUNT(*) AS total_sessions
FROM sessions
GROUP BY session_date
ORDER BY session_date;



