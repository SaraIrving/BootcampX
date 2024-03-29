--We need to be able to see the total amount of time being spent on an assistance request for each cohort. This number will tell use how much time is being spent on assistance requests for each cohort.

--Get the total duration of all assistance requests for each cohort.

--Select the cohort's name and the total duration the assistance requests.

--Order by total_duration.

--Look at the ERD to see how to join the tables.

SELECT cohorts.name AS cohort, SUM(completed_at-started_at) AS total_duration
FROM cohorts
JOIN students
ON cohorts.id = cohort_id
JOIN assistance_requests
ON students.id = student_id
GROUP BY cohorts.name
ORDER BY total_duration;
