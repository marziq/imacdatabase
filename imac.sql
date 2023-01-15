-- Drop table
DROP TABLE Feedback;
DROP TABLE Registration;
DROP TABLE Funding;
DROP TABLE Student;
DROP TABLE DSU;
DROP TABLE Person_in_charge;
DROP TABLE Kulliyyah;
DROP TABLE Activity;
DROP TABLE Program;

-- Create table
CREATE TABLE Kulliyyah (
  kulliyyah_id varchar(10) PRIMARY KEY ,
  kulliyyah_name VARCHAR(255) NOT NULL,
  contact_details VARCHAR(255) NOT NULL
);

CREATE TABLE Program (
  program_id varchar(10) PRIMARY KEY,
  purpose VARCHAR(255) NOT NULL,
  program_name VARCHAR(255) NOT NULL,
  kulliyyah_id varchar(10)REFERENCES Kulliyyah(kulliyyah_id),
  status VARCHAR(255) NOT NULL
);

CREATE TABLE Person_in_charge (
  pic_id varchar(10) PRIMARY KEY,
  pic_name VARCHAR(255) NOT NULL,
  contact_details VARCHAR(255) NOT NULL,
  kulliyyah_id varchar(10)REFERENCES Kulliyyah(kulliyyah_id)
);

CREATE TABLE Activity (
  activity_id varchar(10) PRIMARY KEY,
  program_id varchar(10) REFERENCES Program(program_id),
  activity_name VARCHAR(255) NOT NULL,
  act_date DATE NOT NULL,
  start_time varchar(20) NOT NULL,
  end_time varchar(20) NOT NULL,
  purpose VARCHAR(255) NOT NULL,
  pic_id varchar(10) REFERENCES Person_in_charge(pic_id),
  status VARCHAR(255) NOT NULL
);

CREATE TABLE Student (
  student_id varchar(10) PRIMARY KEY,
  student_name VARCHAR(255) NOT NULL,
  contact_details VARCHAR(255) NOT NULL
);


CREATE TABLE DSU (
  dsu_id varchar(10) PRIMARY KEY,
  contact_details VARCHAR(255) NOT NULL,
  policies_procedures VARCHAR(255) NOT NULL
);

CREATE TABLE Funding (
  funding_id varchar(10) PRIMARY KEY,
  program_id varchar(10) REFERENCES Program(program_id),
  dsu_id varchar(10) REFERENCES DSU(dsu_id),
  amount NUMERIC(10, 2) CHECK (amount <= 15000),
  approved varchar(10) NOT NULL
);

CREATE TABLE Registration (
  registration_id varchar(10) PRIMARY KEY,
  student_id varchar(10) REFERENCES Student(student_id),
  activity_id varchar(10) REFERENCES Activity(activity_id)
);

CREATE TABLE Feedback (
  feedback_id varchar(10) PRIMARY KEY,
  program_id varchar(10) REFERENCES Program(program_id),
  student_id varchar(10) REFERENCES Student(student_id),
  score NUMERIC(4, 1),
  comments varchar(255) NOT NULL
);

-- INSERT VALUES

INSERT ALL
    INTO Kulliyyah values('K1','Engineering','engineering@iium.edu.my')
    INTO Kulliyyah values('K2','Law','law@iium.edu.my')
    INTO Kulliyyah values('K3','Medicine','medicine@iium.edu.my')
    INTO Kulliyyah values('K4','HS','hs@iium.edu.my')
    INTO Kulliyyah values('K5','IT','it@iium.edu.my')
    select * from dual;

INSERT ALL
    INTO Person_in_charge values('P101','Ahmad','ahmad@iium.edu.my','K1')
    INTO Person_in_charge values('P102','Sarah','sarah@iium.edu.my','K2')
    INTO Person_in_charge values('P103','Ali','ali@iium.edu.my','K3')
    INTO Person_in_charge values('P104','Abu','abu@iium.edu.my','K4')
    INTO Person_in_charge values('P105','Aminah','aminah@iium.edu.my','K5')
    select * from dual;

INSERT ALL
   INTO DSU values('D1','dsu@iium.edu.my', 'https://www.iium.edu.my/dsu/policies')
   select * from dual;
     
INSERT ALL
    INTO Student values('S1','Amir', 'amir@iium.edu.my')
    INTO Student values('S2','Syafina', 'syafina@iium.edu.my')
    INTO Student values('S3','Syamsul', 'syamsul@iium.edu.my')
    INTO Student values('S4','Syafiq', 'syafiq@iium.edu.my')
    INTO Student values('S5','Shahrul', 'shahrul@iium.edu.my')
    select * from dual;

INSERT ALL
    INTO Program values('PRG1','To provide support and resources for students with disabilities','I-MaC','K1','Approved')
    INTO Program values('PRG2','To promote awareness and understanding of disability issues','Disability Awareness','K2','Pending')
    INTO Program values('PRG3','To provide legal resources and support for students','Legal Aid Clinic','K3','Approved')
    select * from dual;

INSERT ALL
    INTO Activity values('ACT1','PRG1','Seminar on Disability Rights','1-Jan-23','10AM','12PM','To provide information on assistive technology tools and resources','P101','Completed')
    INTO Activity values('ACT2','PRG1','Workshop on Assistive Technology','2-Jan-21','10AM','12PM','To educate students on disability rights and advocacy','P102','Completed')
    INTO Activity values('ACT3','PRG2','Lecture on stress management','3-Jan-22','10AM','12PM','To educate students on stress management techniques','P103','Completed')
    INTO Activity values('ACT4','PRG2','Yoga session','4-Jan-21','10AM','12PM','To promote relaxation and self-care','P103','Completed')
    INTO Activity values('ACT5','PRG3','Legal clinic','5-Jan-23','10AM','12PM','To provide legal advice and resources to students','P104','Completed')
    select * from dual;

INSERT ALL
    INTO Funding values('F1','PRG1','D1',5000,'True')
    INTO Funding values('F2','PRG2','D1',7000,'True')
    INTO Funding values('F3','PRG3','D1',9000,'True')
    select * from dual;
    
INSERT ALL
    INTO Registration values ('R1','S1','ACT1')
    INTO Registration values ('R2','S2','ACT2')
    INTO Registration values ('R3','S3','ACT3')
    INTO Registration values ('R4','S4','ACT4')
    INTO Registration values ('R5','S5','ACT5')
    INTO Registration values ('R6','S1','ACT4')
    select * from dual;

INSERT ALL
    INTO Feedback values('FB1','PRG1','S1',5,'The workshop was very informative and the facilitator was knowledgeable')
    INTO Feedback values('FB2','PRG1','S2',4,'The support group was helpful, but I wish it was held more frequently')
    INTO Feedback values('F3','PRG2','S3',3,'The lecture was good, but I wish there were more practical exercises')
    INTO Feedback values('FB4','PRG2','S4',4,'The yoga session was relaxing, but it was too crowded')
    INTO Feedback values('FB5','PRG3','S5',4,'The legal clinic was very helpful, but the wait time was long')
    select * from dual;
    
