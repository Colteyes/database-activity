-- REPORT 2: Courses and Instructors (including courses with no instructor)

COLUMN course_name FORMAT A25;
COLUMN instructor_name FORMAT A25;

SELECT 
    c.course_name,
    NVL(i.firstname || ' ' || i.lastname, 'No Instructor') AS instructor_name
FROM sis_course c
LEFT OUTER JOIN sis_scheduled_course sc
    ON c.course_code = sc.course_code
LEFT OUTER JOIN sis_instructor_course ic
    ON sc.CRN = ic.CRN
LEFT OUTER JOIN sis_instructor i
    ON ic.instructorid = i.instructorid
WHERE c.num_of_credits >= 3
  AND c.course_name LIKE '%Programming%'
ORDER BY c.course_name;