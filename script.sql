USE [db_sql_16_04]
GO 

INSERT INTO Examination (Name)
VALUES ('Blood Test'),
       ('X-Ray'),
       ('MRI'),
       ('Ultrasound');

INSERT INTO Doctors (Name, Premium, Salary, Surname)
VALUES ('John', 200, 5000, 'Doe'),
       ('Jane', 150, 4800, 'Smith'),
       ('Michael', 180, 5200, 'Johnson');

INSERT INTO Departments (Building, Name)
VALUES (1, 'Cardiology'),
       (2, 'Neurology'),
       (3, 'Orthopedics');

INSERT INTO Wards (Name, Places, DepartmentId)
VALUES ('Ward 1A', 15, 1),
       ('Ward 2B', 20, 2),
       ('Ward 3C', 25, 3);

INSERT INTO DoctorsExaminations (EndTime, StartTime, DoctorId, ExaminationId, WardId)
VALUES ('10:00', '08:00', 1, 1, 1),
       ('12:00', '10:00', 1, 2, 2),
       ('14:00', '12:00', 2, 3, 3),
       ('16:00', '14:00', 3, 4, 1);