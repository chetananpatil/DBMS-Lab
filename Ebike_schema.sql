-- DDL Commands--
create database lab_3;
use lab_3;
create table Dealer (
Dealer_ID int NOT NULL, 
Name varchar(255), 
state varchar(255), 
city varchar(20),
PIN int, 
street varchar(20),
PRIMARY KEY(Dealer_ID)
);

Create table SalesPerson (
SalesPersonID int NOT NULL,
FName varchar(255),
LName varchar(255),
Dealer_ID int,
PRIMARY KEY (SalesPersonID), 
FOREIGN KEY (Dealer_ID) REFERENCES Dealer (Dealer_ID));

Create table Customer (
Cust_ID int NOT NULL, 
FName varchar(255), 
LName varchar(255),
Address varchar(100),
Email varchar(255),
Mobile varchar(10),
PRIMARY KEY (Cust_ID));

Create table Bike (
VIN int NOT NULL, 
Make varchar(30), 
Model varchar(30),
Reg_No varchar(10), 
Y_O_M int, 
Chasis_No varchar(20),
PRIMARY KEY (VIN));

Create table Service_Manager (
M_emp_id int NOT NULL,
F_Name varchar(255),
L_Name varchar(255),
no_of_bike_service int,PRIMARY KEY (M_emp_id));

Create table Service_Ticket (
Service_ID int NOT NULL,
VIN int,
Cust_ID int, 
Date_Rec DATE,
Date_Del DATE, 
M_emp_id int,
Primary KEY(Service_ID), 
FOREIGN KEY (VIN) REFERENCES Bike(VIN), 
FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
FOREIGN KEY (M_emp_id) REFERENCES Service_Manager(M_emp_id));

Create table Parts (
P_ID int NOT NULL, 
Description varchar(255),
Qty int,
Price DECIMAL(10,2), 
Service_ID int ,
PRIMARY KEY (P_ID), 
FOREIGN KEY (Service_ID) REFERENCES Service_Ticket (Service_ID ));

Create table Invoice (
SalesPersonID int, 
VIN int, 
Cust_ID int,
Date DATE, 
Total_Bill decimal(10,2),
PRIMARY KEY(SalesPersonID, VIN, Cust_ID), 
FOREIGN KEY (VIN) REFERENCES Bike(VIN), 
FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson (SalesPersonID),
FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID));

Create table cust_phone(
Cust_ID int,
phone_No varchar(10),
PRIMARY KEY(Cust_ID , phone_No), FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID));

ALTER TABLE SalesPerson MODIFY FName varchar(255) NOT NULL, MODIFY LName varchar(255) NOT NULL;

ALTER table Bike ADD UNIQUE (VIN);

ALTER table Invoice ADD CHECK(Date>='2021-01-01');

Rename table parts TO Accessories;

Create view black_bike AS select VIN, Model from Bike where color=’black’;

desc bike;



