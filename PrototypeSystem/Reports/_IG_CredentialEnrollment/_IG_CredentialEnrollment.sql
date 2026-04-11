-- REPORT 3: Credential Enrollment Summary


SPOOL C:\cprg250s\SIS_prt6\CredEnroll_out.txt

SELECT 
    c.name AS credential_name,
    COUNT(sc.student_id) AS total_students
FROM sis_credential c
LEFT OUTER JOIN sis_student_credential sc   -- outer join
    ON c.credential_id = sc.credential_id
WHERE c.credential_id IN (
        SELECT credential_id   -- subquery
        FROM sis_student_credential
        WHERE gpa > 3.2        -- condition inside subquery
    )
GROUP BY c.name
ORDER BY total_students DESC;

SPOOL OFF