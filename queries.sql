SELECT c.name, c.course_code FROM enrolled AS e NATURAL JOIN course AS c WHERE e.quarter="spring" AND e.year="2016" GROUP BY e.course_code HAVING COUNT(e.student_id) > 2; 

-- SELECT s.student_name FROM student AS s WHERE
-- (
--     SELECT e.course_code, e.quarter, e.year FROM enrolled AS e NATURAL JOIN student WHERE e.student_id=s.student_id
-- )
-- CONTAINS
-- (
--     SELECT sc.course_code, sc.quarter, sc.year FROM semester_course AS sc WHERE sc.prof_id="2"
-- )

;

SELECT s.student_name
FROM student AS s
NATURAL JOIN enrolled AS e
NATURAL JOIN semester_course AS sc  
WHERE e.course_code IN (SELECT sc2.course_code FROM semester_course AS sc2 WHERE prof_id='2')
GROUP BY e.student_id HAVING COUNT(DISTINCT e.course_code) = 
(
    SELECT COUNT(DISTINCT course_code) FROM semester_course WHERE prof_id='2'
);


SELECT p.prof_name, p.prof_id FROM professor AS p LEFT JOIN semester_course AS sc ON p.prof_id = sc.prof_id WHERE p.dept_id IN ('1','2','3','4') GROUP BY p.prof_id HAVING COUNT(sc.course_code)<2;


SELECT c.course_code, c.name, p.prof_name, p.prof_id, COUNT(*) FROM
course AS c NATURAL JOIN semester_course AS sc NATURAL JOIN professor AS p GROUP BY p.prof_id, c.course_code
HAVING COUNT(*)>=2