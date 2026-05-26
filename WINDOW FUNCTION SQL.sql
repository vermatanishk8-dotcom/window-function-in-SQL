CREATE DATABASE STU_DB;
USE STU_DB;

CREATE TABLE Student_Performance (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(30),
    score INT,
    attendance INT,
    mentor VARCHAR(50),
    join_date DATE,
    city VARCHAR(50)
);

INSERT INTO Student_Performance 
(student_id, name, course, score, attendance, mentor, join_date, city)
VALUES
(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', '2023-06-12', 'Mumbai'),
(102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma', '2023-07-01', 'Delhi'),
(103, 'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair', '2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. Iyer', '2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms. Nair', '2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer', '2023-05-18', 'Pune'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms. Kapoor', '2023-06-15', 'Delhi'),
(108, 'Meera Pillai', 'Tableau', 82, 87, 'Ms. Kapoor', '2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr. Sharma', '2023-07-05', 'Chennai'),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr. Iyer', '2023-05-27', 'Bengaluru'),
(111, 'Siddharth Jain', 'Python', 85, 90, 'Ms. Nair', '2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor', '2023-06-10', 'Pune'),
(113, 'Rohan Gupta', 'SQL', 89, 91, 'Mr. Iyer', '2023-05-25', 'Delhi'),
(114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma', '2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair', '2023-07-12', 'Hyderabad');

-- ========================================================================================
-- Question 1 : Create a ranking of students based on score (highest first).

SELECT NAME,SCORE,
DENSE_RANK() OVER(ORDER BY SCORE DESC)AS STU_RANKING
FROM Student_Performance;

select * FROM Student_Performance;

-- Question 2 : Show each student's score and the previous student’s score (based on score order).

SELECT NAME,SCORE, student_id,
LAG(NAME,1)OVER(ORDER BY STUDENT_ID)AS previous_student’s_score,
lag(SCORE,1)OVER(ORDER BY STUDENT_ID)AS previous_student’s_score
FROM Student_Performance ;

-- Question 3 : Convert all student names to uppercase and extract the month name from join_date.

SELECT UPPER(NAME),extract(MONTH FROM JOIN_DATE)AS JOIN_MONTH
FROM Student_PERFORMANCE;

-- Question 4 : Show each student's name and the next student’s attendance (ordered by attendance).

SELECT ATTENDANCE,NAME
 FROM Student_Performance 
 ORDER BY ATTENDANCE ASC;
 
 -- Question 5 : Assign students into 4 performance groups using NTILE()
 
 SELECT STUDENT_ID, NAME,COURSE,SCORE,ATTENDANCE,MENTOR,JOIN_DATE,CITY,
 NTILE(4) OVER (ORDER BY SCORE DESC) AS STU_GROUPS
 FROM STUDENT_PERFORMANCE;
 
select * FROM Student_Performance;

-- Question 6 : For each course, assign a row number based on attendance (highest first).

SELECT NAME, 
COURSE, ATTENDANCE,
ROW_NUMBER() OVER(partition by COURSE ORDER BY ATTENDANCE DESC) AS ROW_NUM
FROM STUDENT_PERFORMANCE;

	/*Question 7 : Calculate the number of days each student has been enrolled 
	(from join_date to today).(Assume current date = '2025-01-01')*/
    
SELECT Student_ID,
NAME,JOIN_DATE,
datediff('2025-01-01',JOIN_DATE)AS STU_DAYS
FROM STUDENT_PERFORMANCE;

-- Question 8 : Format join_date as “Month Year” (e.g., “June 2023”).

SELECT NAME,
JOIN_DATE,
date_format(JOIN_DATE,'%M-%Y')AS DATE_FORMAT
FROM STUDENT_PERFORMANCE;

-- Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes

SELECT NAME,
CITY,
replace(CITY,'Mumbai','MUM') AS UPDATE_CITY
FROM STUDENT_PERFORMANCE;

-- Question 10 : For each course, find the highest score using FIRST_VALUE().

SELECT 
    NAME,
    COURSE,
    row_number() OVER(PARTITION BY COURSE) AS TOTAL_STUDENTS_IN_COURSE,
    FIRST_VALUE(SCORE) OVER(PARTITION BY COURSE ORDER BY SCORE DESC) AS HIGHEST_SCORE
FROM STUDENT_PERFORMANCE;

SELECT * FROM STUDENT_PERFORMANCE;





