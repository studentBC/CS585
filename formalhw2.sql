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
insert into symptom values(2, '1', '2020-03-22', 1);
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
  notifyType           notificationType,
  employeeID                integer null,
	meetingID			integer null,

	foreign key (employeeID) references Employee (ID)
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



