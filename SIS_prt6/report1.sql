-- REPORT 1: Student GPA Summary by Credential



SELECT 
    s.firstname,
    s.lastname,
    c.name AS credential_name,
    ROUND(AVG(sc.gpa), 2) AS avg_gpa   -- Single function + Group function
FROM sis_student s
INNER JOIN sis_student_credential sc   -- INNER JOIN
    ON s.student_id = sc.student_id
INNER JOIN sis_credential c
    ON sc.credential_id = c.credential_id
WHERE sc.gpa > 3.0                    
AND c.type IN ('CT','DP')            
GROUP BY s.firstname, s.lastname, c.name
HAVING AVG(sc.gpa) > 3.2            
ORDER BY avg_gpa DESC;                