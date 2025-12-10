create database studentresult;
use studentresult;
create table Students(StudentID int PRIMARY KEY,Name varchar(20),Department varchar(50),Year int);
create table Subjects (SubjectID int PRIMARY KEY, SubjectName varchar(100), Credits int);
create table Marks (MarkID int, StudentID int, SubjectID int, Marks int,FOREIGN KEY (StudentID) REFERENCES Students(StudentID),FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID));
INSERT INTO Students (StudentID, Name, Department, Year) VALUES
(1, 'Alice', 'Computer Science', 1),
(2, 'Brian', 'Mechanical', 2),
(3, 'Catherine', 'Electrical', 3),
(4, 'Daniel', 'Computer Science', 1),
(5, 'Eva', 'Civil', 4);
INSERT INTO Subjects (SubjectID, SubjectName, Credits) VALUES
(101, 'Mathematics', 4),
(102, 'Physics', 3),
(103, 'Programming', 4),
(104, 'Data Structures', 4),
(105, 'Engineering Drawing', 3);
INSERT INTO Marks (MarkID, StudentID, SubjectID, Marks) VALUES
(1, 1, 101, 85),  
(2, 1, 102, 55),
(3, 1, 103, 32),
(4, 1, 104, 91),
(5, 1, 105, 28),

(1, 2, 101, 99),  
(2, 2, 102, 23),
(3, 2, 103, 56),
(4, 2, 104, 91),
(5, 2, 105, 34),

(1, 3, 101, 56),  
(2, 3, 102, 44),
(3, 3, 103, 32),
(4, 3, 104, 91),
(5, 3, 105, 78),

(1, 4, 101, 34),  
(2, 4, 102, 78),
(3, 4, 103, 77),
(4, 4, 104, 89),
(5, 4, 105, 22),

(1, 5, 101, 100),  
(2, 5, 102, 12),
(3, 5, 103, 45),
(4, 5, 104, 67),
(5, 5, 105, 55);






  

select * from Students;
select * from Subjects;
select * from Marks;

#Get top 3 students in each subject
select st.Name,st.StudentID,sb.SubjectName,m.Marks from Marks m  join Subjects sb on m.SubjectID=sb.SubjectID join Students st on m.StudentID=st.StudentID where sb.SubjectID=101 order by Marks desc limit 3;
select st.Name,st.StudentID,sb.SubjectName,m.Marks from Marks m  join Subjects sb on m.SubjectID=sb.SubjectID join Students st on m.StudentID=st.StudentID where sb.SubjectID=102 order by Marks desc limit 3;
select st.Name,st.StudentID,sb.SubjectName,m.Marks from Marks m  join Subjects sb on m.SubjectID=sb.SubjectID join Students st on m.StudentID=st.StudentID where sb.SubjectID=103 order by Marks desc limit 3;
select st.Name,st.StudentID,sb.SubjectName,m.Marks from Marks m  join Subjects sb on m.SubjectID=sb.SubjectID join Students st on m.StudentID=st.StudentID where sb.SubjectID=104 order by Marks desc limit 3;
select st.Name,st.StudentID,sb.SubjectName,m.Marks from Marks m  join Subjects sb on m.SubjectID=sb.SubjectID join Students st on m.StudentID=st.StudentID where sb.SubjectID=105 order by Marks desc limit 3;

#Calculate average marks per department
select sb.Department,avg(m.marks)as average_marks from Students sb join Marks m on sb.StudentID=m.StudentID group by sb.Department order by average_marks desc;

#Find students who failed in more than 2 subjects
select st.Name,sb.SubjectName,m.Marks from Marks m join Subjects sb on m.SubjectID=sb.SubjectID join Students st on m.StudentID=st.StudentID where m.Marks<30;