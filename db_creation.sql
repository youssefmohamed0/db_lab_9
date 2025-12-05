CREATE DATABASE CourseRegistrationProcessingSystem;

USE CourseRegistrationProcessingSystem;

CREATE TABLE department
(
    dept_id INT NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (dept_id)
);

CREATE TABLE student
(
    student_id INT NOT NULL,
    student_name VARCHAR(255) NOT NULL,
    major VARCHAR(255) NOT NULL,
    `level` VARCHAR(2) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (student_id)
);

CREATE TABLE professor
(
    prof_id INT NOT NULL,
    prof_name VARCHAR(255) NOT NULL,
    dept_id INT NOT NULL,
    PRIMARY KEY (prof_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE course
(
    course_code VARCHAR(4) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (course_code)
);

CREATE TABLE semester_course
(
    course_code VARCHAR(4) NOT NULL,
    `quarter` VARCHAR(255) NOT NULL,
    `year` INT NOT NULL,
    prof_id INT NOT NULL,
    PRIMARY KEY (course_code,`quarter`,`year`),
    FOREIGN KEY (course_code) REFERENCES course(course_code),
    FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
);

CREATE TABLE enrolled
(
    student_id INT NOT NULL,
    course_code VARCHAR(4) NOT NULL,
    `quarter` VARCHAR(255) NOT NULL,
    `year` INT NOT NULL,
    enrolled_at DATE NOT NULL,
    PRIMARY KEY (student_id,course_code,`quarter`,`year`),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_code,`quarter`,`year`) REFERENCES semester_course(course_code,`quarter`,`year`)
);