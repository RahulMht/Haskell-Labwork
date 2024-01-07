 % Facts about courses
course(english, 'English', 3).
course(math, 'Math', 4).
course(history, 'History', 3).
course(science, 'Science', 4).

% Facts about instructors
instructor(john_doe, 'John Doe', english).
instructor(jane_smith, 'Jane Smith', math).
instructor(mark_jones, 'Mark Jones', history).
instructor(mary_davis, 'Mary Davis', science).

% Facts about students
student(michael_johnson, 'Michael Johnson').
student(sarah_walker, 'Sarah Walker').
student(robert_brown, 'Robert Brown').
student(jessica_miller, 'Jessica Miller').

% Graduate Student Relationship
graduate_student(StudentName) :-
    student(StudentName, _).

% Defining faculty as a subclass of instructors
faculty(InstructorName) :-
    instructor(InstructorName, _, _).

% Relationship: Instructor teaches a Course
teaches(InstructorName, CourseCode) :-
    instructor(InstructorName, _, CourseCode).

% Additional Rule: List courses taught by a specific instructor
courses_taught_by(InstructorName, CourseList) :-
    findall(Course, teaches(InstructorName, Course), CourseList).
