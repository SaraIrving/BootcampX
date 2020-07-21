--Get the cohort with the longest average duration of assistance requests.

--The same requirements as the previous query, but only return the single row with the longest average.

SELECT cohorts.name AS name, AVG(completed_at-started_at) AS average_assignment_time
FROM cohorts
JOIN students
ON cohorts.id = cohort_id
JOIN assistance_requests
ON students.id = student_id
GROUP BY cohorts.name
ORDER BY average_assignment_time DESC
LIMIT 1;