-- REPORT 3: Courses and Their Prerequisites

COLUMN course_name FORMAT A25;
COLUMN prereq FORMAT A25;

SELECT 
    c.course_name,
    NVL(p.course_name, 'No Prerequisite') AS prereq   
FROM sis_course c
LEFT OUTER JOIN sis_course p   
    ON c.prereq_course_code = p.course_code
ORDER BY 
    c.course_name;