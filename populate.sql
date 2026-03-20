-- ============================================
-- DELETE (CHILD FIRST)
-- ============================================

DELETE FROM sis_student_course_record;
DELETE FROM sis_student_credential;
DELETE FROM sis_courses_within_cred;
DELETE FROM sis_instructor_course;
DELETE FROM sis_scheduled_course;
DELETE FROM sis_course;
DELETE FROM sis_credential;
DELETE FROM sis_instructor;
DELETE FROM sis_student;

-- ============================================
-- INSERT STUDENTS (5)
-- ============================================

INSERT INTO sis_student VALUES (1, 'Dung', 'Vu', 'AC', DATE '2025-01-01', '403-123-4567', 'dung.vu@email.com');
INSERT INTO sis_student VALUES (2, 'Alex', 'Nguyen', 'AC', DATE '2025-01-01', '403-222-3333', 'alex.nguyen@email.com');
INSERT INTO sis_student VALUES (3, 'John', 'Smith', 'AC', DATE '2025-01-01', '403-444-5555', 'john.smith@email.com');
INSERT INTO sis_student VALUES (4, 'Emma', 'Tran', 'AC', DATE '2025-01-01', '403-666-7777', 'emma.tran@email.com');
INSERT INTO sis_student VALUES (5, 'Lisa', 'Chen', 'AC', DATE '2025-01-01', '403-888-9999', 'lisa.chen@email.com');

-- ============================================
-- INSERT INSTRUCTORS (10)
-- ============================================

INSERT INTO sis_instructor VALUES (1, 'David', 'Lee', '123 Main St', 'Calgary', 'AB', 'T2N3A4', '403-111-1111', 'david@email.com');
INSERT INTO sis_instructor VALUES (2, 'Sarah', 'Kim', '456 Oak St', 'Calgary', 'AB', 'T2N3B5', '403-222-2222', 'sarah@email.com');
INSERT INTO sis_instructor VALUES (3, 'Michael', 'Brown', '789 Pine St', 'Calgary', 'AB', 'T2N3C6', '403-333-3333', 'michael@email.com');
INSERT INTO sis_instructor VALUES (4, 'Jessica', 'Wong', '321 Elm St', 'Calgary', 'AB', 'T2N3D7', '403-444-4444', 'jessica@email.com');
INSERT INTO sis_instructor VALUES (5, 'Daniel', 'Garcia', '654 Maple St', 'Calgary', 'AB', 'T2N3E8', '403-555-5555', 'daniel@email.com');
INSERT INTO sis_instructor VALUES (6, 'Sophia', 'Martinez', '987 Cedar St', 'Calgary', 'AB', 'T2N3F9', '403-666-6666', 'sophia@email.com');
INSERT INTO sis_instructor VALUES (7, 'James', 'Wilson', '147 Birch St', 'Calgary', 'AB', 'T2N3G1', '403-777-7777', 'james@email.com');
INSERT INTO sis_instructor VALUES (8, 'Emily', 'Davis', '258 Spruce St', 'Calgary', 'AB', 'T2N3H2', '403-888-8888', 'emily@email.com');
INSERT INTO sis_instructor VALUES (9, 'Chris', 'Johnson', '369 Aspen St', 'Calgary', 'AB', 'T2N3J3', '403-999-9999', 'chris@email.com');
INSERT INTO sis_instructor VALUES (10, 'Anna', 'Taylor', '159 Willow St', 'Calgary', 'AB', 'T2N3K4', '403-000-0000', 'anna@email.com');

-- ============================================
-- INSERT CREDENTIALS (4)
-- ============================================

INSERT INTO sis_credential VALUES (1, 'SAIT', 'Web Development', 'CT');
INSERT INTO sis_credential VALUES (2, 'SAIT', 'Data Analytics', 'CT');
INSERT INTO sis_credential VALUES (3, 'SAIT', 'Software Development', 'DP');
INSERT INTO sis_credential VALUES (4, 'SAIT', 'Business IT', 'DP');

-- ============================================
-- INSERT COURSES (20)
-- ============================================

INSERT INTO sis_course VALUES ('CPSC101', 'Intro to Programming', 3, NULL);
INSERT INTO sis_course VALUES ('CPSC102', 'Web Basics', 3, NULL);

INSERT INTO sis_course VALUES ('CPSC201', 'Java Programming', 4, 'CPSC101');
INSERT INTO sis_course VALUES ('CPSC202', 'JavaScript', 4, 'CPSC102');
INSERT INTO sis_course VALUES ('CPSC203', 'Database Systems', 4, 'CPSC101');
INSERT INTO sis_course VALUES ('CPSC204', 'Python Programming', 4, 'CPSC101');

INSERT INTO sis_course VALUES ('CPSC301', 'Advanced Java', 5, 'CPSC201');
INSERT INTO sis_course VALUES ('CPSC302', 'ReactJS', 5, 'CPSC202');
INSERT INTO sis_course VALUES ('CPSC303', 'SQL Advanced', 5, 'CPSC203');
INSERT INTO sis_course VALUES ('CPSC304', 'Data Analysis', 5, 'CPSC204');

INSERT INTO sis_course VALUES ('CPSC401', 'Machine Learning', 5, 'CPSC304');
INSERT INTO sis_course VALUES ('CPSC402', 'Cloud Computing', 5, 'CPSC303');
INSERT INTO sis_course VALUES ('CPSC403', 'DevOps', 5, 'CPSC301');
INSERT INTO sis_course VALUES ('CPSC404', 'Cybersecurity', 5, 'CPSC203');

INSERT INTO sis_course VALUES ('CPSC405', 'UI/UX Design', 3, NULL);
INSERT INTO sis_course VALUES ('CPSC406', 'Mobile Development', 4, 'CPSC202');
INSERT INTO sis_course VALUES ('CPSC407', 'API Development', 4, 'CPSC301');
INSERT INTO sis_course VALUES ('CPSC408', 'Software Testing', 3, NULL);
INSERT INTO sis_course VALUES ('CPSC409', 'Agile Methodology', 3, NULL);
INSERT INTO sis_course VALUES ('CPSC410', 'Project Management', 3, NULL);

-- ============================================
-- SCHEDULED COURSES
-- ============================================

INSERT INTO sis_scheduled_course VALUES (10001, 'FALL2025', 'CPSC101', 'A');
INSERT INTO sis_scheduled_course VALUES (10002, 'FALL2025', 'CPSC102', 'A');
INSERT INTO sis_scheduled_course VALUES (10003, 'FALL2025', 'CPSC201', 'A');
INSERT INTO sis_scheduled_course VALUES (10004, 'FALL2025', 'CPSC202', 'A');
INSERT INTO sis_scheduled_course VALUES (10005, 'FALL2025', 'CPSC203', 'A');

INSERT INTO sis_scheduled_course VALUES (10006, 'WIN2026', 'CPSC301', 'A');
INSERT INTO sis_scheduled_course VALUES (10007, 'WIN2026', 'CPSC302', 'A');
INSERT INTO sis_scheduled_course VALUES (10008, 'WIN2026', 'CPSC303', 'A');
INSERT INTO sis_scheduled_course VALUES (10009, 'WIN2026', 'CPSC304', 'A');

-- ============================================
-- INSTRUCTOR COURSE (many teach multiple)
-- ============================================

INSERT INTO sis_instructor_course VALUES (10001, 'FALL2025', 1);
INSERT INTO sis_instructor_course VALUES (10002, 'FALL2025', 2);
INSERT INTO sis_instructor_course VALUES (10003, 'FALL2025', 1);
INSERT INTO sis_instructor_course VALUES (10004, 'FALL2025', 3);
INSERT INTO sis_instructor_course VALUES (10005, 'FALL2025', 2);

INSERT INTO sis_instructor_course VALUES (10006, 'WIN2026', 1);
INSERT INTO sis_instructor_course VALUES (10007, 'WIN2026', 4);
INSERT INTO sis_instructor_course VALUES (10008, 'WIN2026', 5);
INSERT INTO sis_instructor_course VALUES (10009, 'WIN2026', 3);

-- ============================================
-- COURSES WITHIN CREDENTIAL
-- ============================================

INSERT INTO sis_courses_within_cred VALUES (1, 'CPSC101', 'R');
INSERT INTO sis_courses_within_cred VALUES (1, 'CPSC102', 'R');

INSERT INTO sis_courses_within_cred VALUES (2, 'CPSC203', 'R');
INSERT INTO sis_courses_within_cred VALUES (2, 'CPSC304', 'R');

INSERT INTO sis_courses_within_cred VALUES (3, 'CPSC201', 'R');
INSERT INTO sis_courses_within_cred VALUES (3, 'CPSC301', 'R');
INSERT INTO sis_courses_within_cred VALUES (3, 'CPSC303', 'R');

INSERT INTO sis_courses_within_cred VALUES (4, 'CPSC410', 'R');
INSERT INTO sis_courses_within_cred VALUES (4, 'CPSC409', 'R');

-- ============================================
-- STUDENT CREDENTIAL
-- ============================================

INSERT INTO sis_student_credential VALUES (1, 3, DATE '2025-01-01', NULL, 'ACTIVE', 3.5);
INSERT INTO sis_student_credential VALUES (2, 1, DATE '2025-01-01', NULL, 'ACTIVE', 3.2);

INSERT INTO sis_student_credential VALUES (3, 1, DATE '2025-01-01', NULL, 'ACTIVE', 3.8);
INSERT INTO sis_student_credential VALUES (3, 2, DATE '2025-01-01', NULL, 'ACTIVE', 3.6);

INSERT INTO sis_student_credential VALUES (4, 4, DATE '2025-01-01', NULL, 'ACTIVE', 3.1);
INSERT INTO sis_student_credential VALUES (5, 2, DATE '2025-01-01', NULL, 'ACTIVE', 3.4);

-- ============================================
-- STUDENT COURSE RECORD (~20)
-- ============================================

INSERT INTO sis_student_course_record VALUES (10001, 'FALL2025', 1, 3, 'CPSC101', 'A');
INSERT INTO sis_student_course_record VALUES (10003, 'FALL2025', 1, 3, 'CPSC201', 'B');

INSERT INTO sis_student_course_record VALUES (10001, 'FALL2025', 2, 1, 'CPSC101', 'A');
INSERT INTO sis_student_course_record VALUES (10002, 'FALL2025', 2, 1, 'CPSC102', 'B');

INSERT INTO sis_student_course_record VALUES (10001, 'FALL2025', 3, 1, 'CPSC101', 'A');
INSERT INTO sis_student_course_record VALUES (10005, 'FALL2025', 3, 2, 'CPSC203', 'B');

INSERT INTO sis_student_course_record VALUES (10002, 'FALL2025', 4, 4, 'CPSC102', 'C');
INSERT INTO sis_student_course_record VALUES (10006, 'WIN2026', 4, 4, 'CPSC301', 'B');

INSERT INTO sis_student_course_record VALUES (10004, 'FALL2025', 5, 2, 'CPSC202', 'A');
INSERT INTO sis_student_course_record VALUES (10009, 'WIN2026', 5, 2, 'CPSC304', 'B');

-- extra
INSERT INTO sis_student_course_record VALUES (10007, 'WIN2026', 1, 3, 'CPSC302', 'A');
INSERT INTO sis_student_course_record VALUES (10008, 'WIN2026', 2, 1, 'CPSC303', 'B');
INSERT INTO sis_student_course_record VALUES (10006, 'WIN2026', 3, 2, 'CPSC301', 'A');
INSERT INTO sis_student_course_record VALUES (10003, 'FALL2025', 4, 4, 'CPSC201', 'C');
INSERT INTO sis_student_course_record VALUES (10005, 'FALL2025', 5, 2, 'CPSC203', 'B');
