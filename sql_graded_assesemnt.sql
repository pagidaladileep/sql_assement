
drop table doctor_table;
create database consultation;
create table doctor_table(doctor_id int primary key not null,
name varchar(30) not null,specialization varchar(30) not null);
insert into doctor_table values(2001,"Dileep","Caridiologist"),
(2002,"Shanthan","Dentist"),
(2003,"Sudharshan","ENT"),
(2004,"Suresh","Darmitalogist"),
(2005,"Neha","Gynacalogist");
select * from doctor_table;

create table appointmetnt_table(
appointment_id int primary key not null,
patient_id int not null,
doctor_id int not null,
foreign key (patient_id) references patient_table(patient_id),
foreign key (doctor_id) references doctor_table(doctor_id));
insert into appointment_table values(301,101,2001),(302,102,2002),
(303,103,2003),(304,104,2004),(305,105,2005);


create table patient_table(patient_id int primary key not null,
patient_age int not null,patient_name varchar(30) not null);
insert into patient_table vaLues(101,22,"Veere"),(102,25,"Nami"),(103,26,"Balu"),(104,21,"Pavan"),
(105,19,"Ganesh");

create table review(review_number int primary key not null,
rating float not null,
patient_id int not null,
doctor_id int not null,
foreign key (patient_id) references patient_table(patient_id),
foreign key (doctor_id) references doctor_table(doctor_id));
insert into review values(501,10.0,101,2001),(502,9.0,102,2002),
(503,6.8,103,2003),(504,4.8,104,2004),(505,7.0,105,2005);


CREATE TABLE CONTACT(
	CONTACT_ID INT PRIMARY KEY NOT NULL,
	CONTACT_EMAIL VARCHAR(30),
    FNAME VARCHAR(20),
	LNAME VARCHAR(20),
	COMPANY VARCHAR(20),
	ACTIVE_FLAG INT,
    OPT_OUT INT);

INSERT INTO CONTACT VALUES(123,"a@a.com","Kian","Seth","ABC",1,1),(133,"b@a.com","Neha","Seth","ABC",1,0),(234,"c@c.com","Puru","Malik","CDF",0,0),(342,"d@d.com","Sid","Maan","TEG",1,0);
select * from CONTACT;

-- Select all columns from the contact table where the active flag is 1
select * from CONTACT where active_flag=1;

-- Deactivate contacts who are opted out
delete from contact where opt_out=1;

-- Delete all the contacts who have the company name as ‘ABC’
delete from CONTACT where company='ABC';

-- Insert a new row with id as 658, name as ‘mili’, email as ‘mili@gmail.com’, the company as ‘DGH’, active flag as 1, opt-out flag as 1
insert into CONTACT values(658,'mili@gmail.com','mili',"seth","dgh",1,1);

-- Pull out the unique values of the company column 
select distinct company from CONTACT; 

-- Update name “mili” to “niti”.
update contact set fname="niti" where fname="mili";
-- ======================================================================
CREATE TABLE CUSTOMER(
	customer_id INT PRIMARY KEY NOT NULL,
    cust_name VARCHAR(20),
    city VARCHAR(20),
    grade INT,
    salesman_id INT,
    foreign key(salesman_id) references salesman(salesman_id));
    
INSERT INTO CUSTOMER VALUES(3002,"Nick Rimando","New York",100,5001),(3007,"Brad Davis","New York",200,5001),(3005,"Graham Zusi","California",200,5002),(3008,"Julian Green","London",300,5002),(3004,"Fabian Johnson","Paris",300,5006),(3009,"Geoff Cameron","Berlin",100 ,5003),(3003,"Jozy Altidor","Moscow",200,5007);
INSERT INTO CUSTOMER(customer_id,cust_name,city,salesman_id) values(3001,"Brad Guzan","London",5005);
select * fROM CUSTOMER;

CREATE TABLE SALESMAN(
SALESMAN_ID INT PRIMARY KEY NOT NULL,
SALESMAN_NAME VARCHAR(40) ,
CITY VARCHAR(40),
COMMISSION FLOAT);
INSERT INTO SALESMAN VALUES(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);
select * from salesman;

SELECT CUST_NAME,CUSTOMER.CITY,GRADE,SALESMAN_NAME,SALESMAN.CITY FROM CUSTOMER,SALESMAN WHERE GRADE < 100 and CUSTOMER.SALESMAN_ID=SALESMAN.SALESMAN_ID order by CUSTOMER_ID;
