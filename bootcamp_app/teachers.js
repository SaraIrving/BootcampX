const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query (`
SELECT DISTINCT teachers.name AS teachers, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests
ON teachers.id = teacher_id
JOIN students
ON student_id = students.id
JOIN cohorts
ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teachers.name;
`, [`${process.argv[2] || 'JUL02'}`])
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teachers}`);
  })
});