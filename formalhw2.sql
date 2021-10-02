CREATE DATABASE "formalHW2"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


create table Employee (
  ID 				integer primary key,  
  floorNumber       integer not null,  
  officeNumber       integer not null,  
  name              text not null,  
  phoneNumber       text not null,  
  email 			text not null
);
create type symptomID as enum('1','2','3','4','5');
create table symptom (
  rowID                integer primary key,   
  symptomID symptomID,
  dateReported               DATE not null,
  employeeID                integer not null,
	foreign key(employeeID) references Employee (ID)
);
insert into Employee values (1, 3, 101, 'ben', 2134318009, 'ben@hp.com');
insert into symptom values(1, '1', '2020-03-20', 1);
insert into symptom values(2, '5', '2020-03-22', 1);
create table scan (
	scanID integer primary key,
	scanDate DATE not null,
	scanTime time not null,
	employeeID integer not null,
	temperature integer not null,
	foreign key (employeeID) references Employee (ID)
);
create table meeting (
  meetingID                integer primary key,
  roomNumber               integer not null,
  floorNumber              integer not null,
  employeeID                integer not null,
  meetingStartTime			integer null,
	foreign key (employeeID) references Employee (ID)
);

create type result as ENUM('positive', 'negative');
create table test (
	testID integer primary key,
	location varchar(50) not null,
	testDate date not null,
	testTime time not null,
	employeeID integer null,
	symptomRowID integer not null unique,
	scanID integer null unique,
	testResult result,
	foreign key (employeeID) references Employee (ID),
	foreign key (symptomRowID) references symptom (rowID),
	foreign key (scanID) references scan (scanID)
);

create type notificationType as enum ('mandatory', 'optional');
create table notification (
	notificationID                integer primary key,
	notificationDate              date not null,
	notifyType          notificationType,
	employeeID          integer null,
	meetingID           integer null,
	testID 				integer null,
	foreign key (employeeID) references Employee (ID),
	foreign key (testID) references test (testID),
	foreign key (meetingID) references meeting (meetingID)
);

create type resolution as ENUM('back to work', 'left the company', 'decreased');
create table cases (
	caseID integer primary key,
	employeeID integer not null,
	date date not null,
	solution resolution,
	testID integer null unique,
	foreign key (testID) references test (testID)
);

 create type hs as ENUM('well', 'sick', 'hospitalized');
 create table healthStatus (
	rowId integer primary key,
	employeeID integer not null,
	date DATE not null,
	status hs,
	caseID integer not null,
	foreign key (caseID) references cases (caseID)
 )


//start to insert table
//employee table 
insert into Employee values (1, 3, 101, 'ben', 2134318009, 'ben@hp.com');
insert into Employee values (2, 6, 102, 'miller', 2133009679, 'miller@hp.com');
insert into Employee values (3, 7, 101, 'shawn', 2134362503, 'shawn@hp.com');
insert into Employee values (4, 1, 104, 'bryan', 2133177843, 'bryan@hp.com');
insert into Employee values (5, 2, 105, 'chin', 2134111953, 'chin@hp.com');
insert into Employee values (6, 2, 106, 'lung', 2134584182, 'lung@hp.com');
insert into Employee values (7, 9, 107, 'alvin', 2133699166, 'alvin@hp.com');
insert into Employee values (8, 10, 105, 'sandy', 2134541659, 'sandy@hp.com');
insert into Employee values (9, 2, 109, 'sam', 2133207810, 'sam@hp.com');
insert into Employee values (10, 5, 110, 'jacob', 2134503061, 'jacob@hp.com');
insert into Employee values (11, 7, 111, 'justin', 2134496541, 'justin@hp.com');
insert into Employee values (12, 4, 111, 'peter', 2134698464, 'peter@hp.com');
insert into Employee values (13, 6, 113, 'mike', 2133737455, 'mike@hp.com');
insert into Employee values (14, 5, 114, 'michael', 2134540350, 'michael@hp.com');
insert into Employee values (15, 5, 115, 'daniel', 2134581400, 'daniel@hp.com');
insert into Employee values (16, 3, 102, 'hicks', 2133222167, 'hicks@hp.com');
insert into Employee values (17, 7, 117, 'may', 2134899858, 'may@hp.com');
insert into Employee values (18, 3, 118, 'mary', 2134755565, 'mary@hp.com');
insert into Employee values (19, 9, 104, 'lily', 2133115865, 'lily@hp.com');
insert into Employee values (20, 6, 120, 'calire', 2133272699, 'claire@hp.com');
insert into Employee values (21, 9, 120, 'sharon', 2134668359, 'sharon@hp.com');
insert into Employee values (22, 1, 110, 'nancy', 2134668999, 'nacy@hp.com');
//for symptom table data
insert into symptom values(3, '1', '2020-04-24', 3);
insert into symptom values(4, '2', '2020-05-24', 4);
insert into symptom values(5, '3', '2020-06-24', 5);
insert into symptom values(6, '4', '2020-07-4', 6);
insert into symptom values(7, '2', '2020-08-24', 7);
insert into symptom values(8, '2', '2020-05-4', 8);
insert into symptom values(9, '3', '2020-04-2', 9);
insert into symptom values(10, '4', '2020-04-24', 10);
insert into symptom values(11, '4', '2020-04-24', 11);
insert into symptom values(12, '2', '2020-11-14', 12);
insert into symptom values(13, '3', '2020-12-24', 13);
insert into symptom values(14, '4', '2020-12-25', 14);
insert into symptom values(15, '5', '2020-10-10', 15);
insert into symptom values(16, '5', '2020-03-02', 16);
insert into symptom values(17, '4', '2020-09-25', 17);
insert into symptom values(18, '3', '2020-08-24', 18);
insert into symptom values(19, '2', '2020-09-30', 19);
insert into symptom values(20, '1', '2020-07-14', 20);
insert into symptom values(21, '2', '2020-03-14', 21);
insert into symptom values(22, '4', '2020-04-24', 5);
//scan data 
insert into scan values(1, '2020-03-12', '02:03:04', 1, 28);
insert into scan values(2, '2020-04-15', '12:03:04', 2, 39);
insert into scan values(3, '2020-03-12', '02:03:04', 3, 28);
insert into scan values(4, '2020-04-15', '12:03:04', 4, 36);
insert into scan values(5, '2020-03-12', '02:03:04', 8, 38);
insert into scan values(6, '2020-05-15', '12:03:04', 10, 35);
insert into scan values(7, '2020-05-12', '02:03:04', 7, 27);
insert into scan values(8, '2020-06-15', '12:03:04', 12, 38);
insert into scan values(9, '2020-06-12', '02:03:04', 21, 28);
insert into scan values(10, '2020-07-15', '12:03:04', 16, 36);
insert into scan values(11, '2020-07-15', '02:03:04', 17, 37);
insert into scan values(12, '2020-08-15', '12:03:04', 2, 39);
insert into scan values(13, '2020-08-15', '02:03:04', 20, 32);
insert into scan values(14, '2020-09-15', '12:03:04', 21, 33);
//meeting
insert into meeting values(1, 99, 9, 1, 18);
insert into meeting values(2, 99, 9, 2, 18);
insert into meeting values(3, 99, 9, 3, 18);
insert into meeting values(4, 99, 9, 20, 18);
insert into meeting values(5, 101, 1, 4, 13);
insert into meeting values(6, 101, 1, 6, 13);
insert into meeting values(7, 101, 1, 8, 13);
insert into meeting values(8, 46, 4, 10, 12);
insert into meeting values(9, 46, 4, 12, 11);
insert into meeting values(10, 23, 2, 14, 14);
insert into meeting values(11, 23, 2, 18, 14);
insert into meeting values(12, 21, 2, 17, 10);
//test data
insert into test values(1, 'clinic', '2020-03-19', '12:33:44', 1, 1, 1,'negative');
insert into test values(2, 'company', '2020-04-20', '12:34:56', 1, 2, null,'positive');
insert into test values(3, 'clinic', '2020-03-12', '12:33:44', 3, 3, 3,'negative');
insert into test values(4, 'company', '2020-03-21', '12:33:44', 4, 4, 4,'negative');
insert into test values(5, 'clinic', '2020-03-09', '12:33:44', 5, 5, null,'negative');
insert into test values(6, 'clinic', '2020-04-19', '12:33:44', 6, 6, null,'positive');
insert into test values(7, 'company', '2020-01-19', '12:33:44', 7, 7, 7,'negative');
insert into test values(8, 'clinic', '2020-02-19', '12:33:44', 8, 8, 5,'negative');
insert into test values(9, 'clinic', '2020-03-19', '12:33:44', 9, 9, null,'negative');
insert into test values(10, 'company', '2020-04-19', '12:33:44', 10, 10, 6,'positive');
insert into test values(11, 'clinic', '2020-05-19', '12:33:44', 11, 11, null,'positive');
insert into test values(12, 'clinic', '2020-06-19', '12:33:44', 12, 12, 2,'negative');
insert into test values(13, 'company', '2020-07-19', '12:33:44', 13, 13, null,'negative');
insert into test values(14, 'clinic', '2020-08-19', '12:33:44', 14, 14, null,'positive');
insert into test values(15, 'company', '2020-09-19', '12:33:44', 15, 15, null,'positive');
insert into test values(16, 'clinic', '2020-11-19', '12:33:44', 16, 16, 10,'positive');
insert into test values(17, 'clinic', '2020-12-19', '12:33:44', 17, 17, 11,'positive');
insert into test values(18, 'company', '2020-12-25', '12:33:44', 18, 18, null,'negative');
insert into test values(19, 'clinic', '2020-12-31', '12:33:44', 19, 19, null,'negative');
insert into test values(20, 'home', '2020-03-19', '12:33:44', 20, 20, 13,'negative');
insert into test values(21, 'clinic', '2020-03-19', '12:33:44', 21, 21, 14,'negative');
insert into test values(22, 'home', '2020-03-19', '12:33:44', 5, 22, null,'positive');
//cases 
insert into cases values(1, 1, '2020-05-02', 'left the company', 2);
insert into cases values(2, 6, '2020-04-20', 'left the company', 6);
insert into cases values(3, 10, '2020-04-22', 'back to work', 10);
insert into cases values(4, 11, '2020-05-22', 'back to work', 11);
insert into cases values(5, 14, '2020-08-02', 'back to work', 14);
insert into cases values(6, 15, '2020-09-22', 'left the company', 15);
insert into cases values(7, 16, '2020-11-24', 'back to work', 16);
insert into cases values(8, 17, '2020-12-31', 'decreased', 17);
insert into cases values(9, 22, '2020-05-02', 'back to work', 22);
//healthstaus
insert into healthStatus values(1, 1, '2020-06-02', 'hospitalized', 1);
insert into healthStatus values(2, 6, '2020-05-20', 'hospitalized', 2);
insert into healthStatus values(3, 10, '2020-05-22', 'well', 3);
insert into healthStatus values(4, 11, '2020-06-22', 'well', 4);
insert into healthStatus values(5, 14, '2020-09-02', 'well', 5);
insert into healthStatus values(6, 15, '2020-10-22', 'sick', 6);
insert into healthStatus values(7, 16, '2020-11-29', 'well', 7);
insert into healthStatus values(8, 17, '2020-12-30', 'hospitalized', 8);
insert into healthStatus values(9, 22, '2020-05-22', 'well', 9);
// notification
insert into notification values(1, '2020-03-24', 'optional', 1, 1, 1);
insert into notification values(2, '2020-03-02', 'optional', 5, 6, 5);
insert into notification values(3, '2020-02-12', 'optional', 7, 6, null);
insert into notification values(4, '2020-03-13', 'optional', 11, 11, null);
insert into notification values(5, '2020-01-14', 'optional', 12, null, 12);
insert into notification values(6, '2020-02-14', 'optional', 21, null, 21);
insert into notification values(7, '2020-03-24', 'mandatory', 1, 1, 2);
insert into notification values(8, '2020-03-14', 'mandatory', 6, 6, 6);
insert into notification values(9, '2020-04-12', 'mandatory', 10, 8, 8);
insert into notification values(10, '2020-05-11', 'mandatory', 11, null, 11);
insert into notification values(11, '2020-07-20', 'mandatory', 14, null,14);
insert into notification values(12, '2020-09-10', 'mandatory', 15, null,15);
insert into notification values(13, '2020-11-10', 'mandatory', 16, null,16);
insert into notification values(14, '2020-12-20', 'mandatory', 17, 12, 17);
insert into notification values(15, '2020-04-22', 'mandatory', 22, null, 22);
//Q1 

//Q2
select symptomid, count(symptomid) from symptom group by symptomid order by count(*) DESC;
//Q3
select floornumber, count(floornumber)
from Employee
where ID in (select employeeID from cases)
group by floornumber
order by count(floornumber) DESC;
//Q4
SELECT count(s.employeeID) as scan_count
FROM scan s
WHERE s.scanDate BETWEEN '2020-03-01' AND '2020-06-30'

SELECT
  count(t.employeeID) as test_count
FROM test t
WHERE t.testDate BETWEEN '2020-03-01' AND '2020-06-30'

SELECT 
  count(sym.employeeID) as sym_count
FROM symptom sym
WHERE sym.dateReported BETWEEN '2020-03-01' AND '2020-06-30'

SELECT 
  count(c.employeeID) as cases_count
FROM cases c
WHERE c.date BETWEEN '2020-03-01' AND '2020-06-30'




//Q5
we could like to know employees received notification after they had meeting with college who had covid 

SELECT distinct employeeID
FROM notification
WHERE meetingID in (select meetingID from meeting join cases USING (employeeID))
and employeeID in (select employeeID from test where testResult = 'negative');

