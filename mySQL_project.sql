USE university_database;

INSERT INTO courses(courses_course)
VALUES("English");

INSERT INTO courses(courses_course)
VALUES("Math");

INSERT INTO courses(courses_course)
VALUES("Science");

INSERT INTO courses(courses_course)
VALUES("History");

INSERT INTO students(students_name)
VALUES("Micheal Uno");

INSERT INTO students(students_name)
VALUES("Archie Dose");

INSERT INTO students(students_name)
VALUES("Luffy Trees");

INSERT INTO students(students_name)
VALUES("Quail Thrower");

INSERT INTO professors(professors_name)
VALUES("Professor Bradbury");

INSERT INTO professors(professors_name)
VALUES("Professor Fibi");

INSERT INTO professors(professors_name)
VALUES("Professor Newt");

INSERT INTO professors(professors_name)
VALUES("Professor Teddy");


INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(87.3, 6, 1);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(85.5, 6, 2);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(100, 6, 3);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(90.56, 6, 4); 


INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(66.5, 7, 1);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(43.98, 7, 2);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(80, 7, 3);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(57.8, 7, 4);


INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(99, 8, 1);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(98, 8, 2);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(95, 8, 3);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(100, 8, 4);


INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(87.3, 9, 1);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(76, 9, 2);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(76.3, 9, 3);

INSERT INTO grades(grades_grade, grades_students_id, grades_course_id)
VALUES(78.7, 9, 4);

BEGIN;
SET SQL_SAFE_UPDATES = 0;

UPDATE courses SET courses_professors_id = 1
WHERE courses_course = 'ENGLISH';

UPDATE courses SET courses_professors_id = 2
WHERE courses_course = 'MATH';

UPDATE courses SET courses_professors_id = 3
WHERE courses_course = 'Science';

UPDATE courses SET courses_professors_id = 4
WHERE courses_course = 'History';


ROLLBACK;

BEGIN;
SET SQL_SAFE_UPDATES = 0;

UPDATE professors SET professors_course_id = 1
WHERE professors_name = 'Professor Bradbury';

UPDATE professors SET professors_course_id = 2
WHERE professors_name = 'Professor Fibi';

UPDATE professors SET professors_course_id = 3
WHERE professors_name = 'Professor Newt';

UPDATE professors SET professors_course_id = 4
WHERE professors_name = 'Professor Teddy';
ROLLBACK;


SELECT *
FROM courses;

SELECT *
FROM students;

SELECT *
FROM professors;

SELECT *
FROM grades;

SELECT *
FROM courses c
	LEFT JOIN (
    SELECT AVG (*) AS grades_grade, grades_course_id
    FROM grades
    GROUP BY grades_course_id
    ) AS g
    ON g.grades_course_id = c.course_id
    LEFT JOIN (
    SELECT (*) AS professors_name, professors_course_id
    FROM professors
    GROUP BY professors_course_id
    )AS p
	ON p.professors_course_id = c.courses_id;


SELECT MAX(grades_grade) AS 'Max Grade'
FROM students s
JOIN grades g
ON g.grades_students_id = s.students_id
JOIN courses c
ON g.grades_course_id = c.courses_id;

SELECT Max(grades_grade) AS "Second Max Grade"
FROM students s
JOIN grades g
ON g.grades_students_id = s.students_id
WHERE students_id = 7;

SELECT AVG(grades_grade) AS "English Avg grade"
FROM courses c
JOIN professors p
ON p.professors_course_id = c.courses_id
JOIN grades g
ON g.grades_course_id = c.courses_id
WHERE courses_id = 1;
    
SELECT
	AVG(grades_grade) AS 'Avg Grade',
	 courses_course AS 'Course'
FROM courses c
JOIN grades g
ON g.grades_course_id = c.courses_id
WHERE c.courses_course = 'English';

