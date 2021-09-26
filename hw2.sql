create table Employees (
  ID                number not null,  
  name              varchar2(50) not null,  
  phone               varchar2(50),  
  primary key (ID),
  foreign key (phone) references employee 
);

create table employee (
  phone               varchar2(50),  
  email               varchar2(50),
  primary key (phone)
);

create table covidTestLocation (
  locID                number not null,  
  selfChoice              number,  
  company               number,
  primary key (locID)
);

create table meeting (
  meetingRoomID                number not null,  
  meetingLoc              varchar(50) not null,  
  meetingDate               DATE not null,
  primary key (meetingRoomID)
);

create table contactTracing (
  tracingID                number not null,  
  tracePlace              varchar(50) not null,  
  traceDate               DATE not null,
  primary key (tracingID)
);

create table covidStatus (
  status ENUM('well', 'sick', 'hospitalized', 'presymptomatic', 'asymptomatic'),
  primary key (status)
);

 create table covidStatus (   
   id integer primary key, 
   status varchar(20) not null unique 
 )

insert into covidStatus (id, status)  
values (1, 'well') 

insert into covidStatus (id, status)  
values (2, 'sick') 

insert into covidStatus (id, status)  
values (3, 'hospitalized') 

insert into covidStatus (id, status)  
values (4, 'presymptomatic')

insert into covidStatus (id, status)  
values (5, 'asymptomatic') 


CREATE TABLE EmployeeCovidStatus  
(  
   covidType number NOT NULL primary key,  
   employeeStatus number not null,
   constraint fk_employee_status foreign key (employeeStatus) references covidStatus (id)  
);
