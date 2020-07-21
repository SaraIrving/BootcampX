--Get the average duration of assistance requests for each cohort.

--Select the cohort's name and the average assistance request time

--Order the results from shortest average to longest.

SELECT cohorts.name AS name, AVG(completed_at-started_at) AS average_assignment_time
FROM cohorts
JOIN students
ON cohorts.id = cohort_id
JOIN assistance_requests
ON students.id = student_id
GROUP BY cohorts.name
ORDER BY average_assignment_time;