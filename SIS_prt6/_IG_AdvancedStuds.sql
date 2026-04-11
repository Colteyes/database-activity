SELECT 
    s.firstname,
    s.lastname,
    scr.course_code,
    scr.letter_grade
FROM sis_student s
INNER JOIN sis_student_course_record scr   -- INNER JOIN
    ON s.student_id = scr.student_id
WHERE scr.course_code IN (
        SELECT course_code              -- SUBQUERY
        FROM sis_course
        WHERE course_code LIKE 'CPSC3%'  -- condition inside subquery
    )
AND scr.letter_grade IN ('A','B')         -- WHERE condition #1
AND s.status = 'AC'                       -- WHERE condition #2
ORDER BY s.lastname, s.firstname;