-- =============================================
-- Description: Lists all students and the courses they have taken along with their grades
-- Author: Dung
-- Spool File: VD_StudentCourseHistoryReport.lst
-- =============================================

SPOOL VDStudentCourseHistoryReport.lst

SELECT 
    s.firstname || ' ' || s.lastname AS student_name,
    c.course_name,
    scr.letter_grade,
    scr.semester_code
FROM sis_student s
INNER JOIN sis_student_course_record scr 
    ON s.student_id = scr.student_id
INNER JOIN sis_course c 
    ON scr.course_code = c.course_code
ORDER BY student_name, scr.semester_code;

SPOOL OFF;
