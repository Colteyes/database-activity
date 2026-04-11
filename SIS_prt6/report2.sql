-- REPORT 2: Courses and Enrollment Count

SELECT 
    c.course_code,
    c.course_name,
    COUNT(scr.student_id) AS total_students  -- Group function
FROM sis_course c
LEFT OUTER JOIN sis_student_course_record scr   -- OUTER JOIN
    ON c.course_code = scr.course_code
GROUP BY c.course_code, c.course_name
ORDER BY total_students DESC;