ALTER SESSION SET current_schema = cray1; 

CREATE TABLE office 
  ( 
     officeid   INT PRIMARY KEY, 
     officename VARCHAR(4000), 
     city       VARCHAR(4000), 
     state      VARCHAR(4000), 
     address    VARCHAR(4000), 
     zipcode    VARCHAR(4000) 
  ); 

CREATE TABLE staff 
  ( 
     emplid      INT PRIMARY KEY, 
     firstname   VARCHAR(4000), 
     lastname    VARCHAR(4000), 
     phonenumber VARCHAR(4000), 
     birthdate   DATE 
  ); 

CREATE TABLE car 
  ( 
     carid              INT PRIMARY KEY, 
     description        VARCHAR(4000), 
     registrationnumber VARCHAR(4000) 
  ); 

CREATE TABLE jobtitle 
  ( 
     jobtitleid INT PRIMARY KEY, 
     title      VARCHAR(4000) 
  ); 

CREATE TABLE position 
  ( 
     positionid INT PRIMARY KEY, 
     jobtitleid   INT REFERENCES jobtitle(jobtitleid), 
     emplid     INT REFERENCES staff(emplid), 
     officeid   INT REFERENCES office(officeid), 
     carid      INT REFERENCES car(carid) 
  ); 

CREATE TABLE client 
  ( 
     clientid    INT PRIMARY KEY, 
     firstname   VARCHAR(4000), 
     lastname    VARCHAR(4000), 
     phonenumber VARCHAR(4000), 
     email       VARCHAR(4000), 
     birthdate   DATE, 
     sex         VARCHAR(4000), 
     officeid    INT REFERENCES office(officeid) 
  ); 

CREATE TABLE provisionallicense 
  ( 
     licenseid  INT PRIMARY KEY, 
     clientid   INT REFERENCES client(clientid), 
     expiredate DATE 
  ); 

CREATE TABLE interview 
  ( 
     positionid     INT REFERENCES position(positionid), 
     clientid       INT REFERENCES client(clientid), 
     interviewnotes VARCHAR(4000), 
     interviewdate  DATE 
  ); 

CREATE TABLE lesson 
  ( 
     lessonid      INT PRIMARY KEY, 
     clientid      INT REFERENCES client(clientid), 
     startdate     DATE, 
     stopdate      DATE, 
     positionid    INT REFERENCES position(positionid), 
     carid         INT REFERENCES car(carid), 
     mileageused   INT, 
     progressnotes VARCHAR(4000) 
  ); 

CREATE TABLE drivingtest 
  ( 
     drivingtestid INT PRIMARY KEY, 
     clientid      INT REFERENCES client(clientid), 
     passed        CHAR, 
     testdate      DATE 
  ); 

CREATE TABLE writtentest 
  ( 
     writtentestid INT PRIMARY KEY, 
     clientid      INT REFERENCES client(clientid), 
     passed        CHAR, 
     testdate      DATE 
  ); 

CREATE TABLE maintenancelog 
  ( 
     maintenancelogid INT PRIMARY KEY, 
     carid            INT REFERENCES car(carid), 
     maintenancedate  DATE, 
     faultsfound      CHAR, 
     maintenancenotes VARCHAR(4000) 
  ); 
