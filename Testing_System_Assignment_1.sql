CREATE DATABASE IF NOT EXISTS  TESTING_SYSTEM_ASSIGNMENT_1    ;
CREATE TABLE Department (
	departmentId INT AUTO_INCREMENT PRIMARY KEY ,
	departmentName VARCHAR(50) 
);
CREATE TABLE `Position` (
	positionId INT AUTO_INCREMENT PRIMARY KEY ,
    positionName VARCHAR(50)
);
CREATE TABLE Account (
	accountId INT AUTO_INCREMENT PRIMARY KEY ,
    email VARCHAR(50),
    userName VARCHAR(50),
    fullName VARCHAR(50),
    departmentId INT ,
    positionId INT ,
    createDate DATE ,
    FOREIGN KEY (departmentId) REFERENCES Department(departmentId) ,
    FOREIGN KEY (positionId) REFERENCES Position (positionId) 
);
