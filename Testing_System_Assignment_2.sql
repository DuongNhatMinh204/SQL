CREATE DATABASE IF NOT EXISTS  TESTING_SYSTEM_ASSIGNMENT_1    ;
CREATE TABLE Department (
	departmentId INT AUTO_INCREMENT PRIMARY KEY ,
	departmentName VARCHAR(50) not null  
);
CREATE TABLE `Position` (
	positionId INT AUTO_INCREMENT PRIMARY KEY ,
    positionName VARCHAR(50) not null 
);
CREATE TABLE Account (
	accountId INT AUTO_INCREMENT PRIMARY KEY ,
    email VARCHAR(50) not null,
    userName VARCHAR(50) not null ,
    fullName VARCHAR(50) not null,
    departmentId INT ,
    positionId INT ,
    createDate DATE not null ,
    FOREIGN KEY (departmentId) REFERENCES Department(departmentId) ,
    FOREIGN KEY (positionId) REFERENCES Position (positionId) 
);
use `testing_system_assignment_1` ;
insert into department(departmentId,departmentName)
values 				  (1,'Marketing') ,
					   (2,'Sale') ,
                        (3,'Bảo Vệ') ,
                         (4,'Nhân Sự') ,	
                          (5,'Kỹ thuật') ,
                           (6,'Tài chính') ,
                            (7,'Phó giám đốc') ,
                             (8,'Giám đốc') ,
                              (9,'Thư kí') ,
                               (10,'Bán hàng') ;
                               
insert into position (positionId,positionName) 
values 				(1,'DEV'),
					(2,'Test'),
                    (3,'Scrum Master'),
                    (4,'PM');
                    
					
insert into account(accountId,email,userName,fullName,departmentId,positionId,createDate) 
values             (1,'a@gmail.com','nguyenvana','Nguyen Van A' , 10,1,'2025-03-11') ,
					 (2,'b@gmail.com','nguyenvanb','Nguyen Van B' , 9,2,'2025-03-12') ,
                      (3,'c@gmail.com','nguyenvanc','Nguyen Van C' , 8,3,'2025-02-11') ,
                       (4,'d@gmail.com','nguyenvand','Nguyen Van D' , 7,4,'2025-01-10') ,
                        (5,'e@gmail.com','nguyenvane','Nguyen Van E' , 6,1,'2024-06-11') ,
                         (6,'f@gmail.com','nguyenvanf','Nguyen Van F' , 5,2,'2025-01-06') ,
                          (7,'g@gmail.com','nguyenvang','Nguyen Van G' , 4,3,'2025-02-04') ,
                           (8,'h@gmail.com','nguyenvanh','Nguyen Van H' , 3,4,'2025-01-01')  ,
                            (9,'i@gmail.com','nguyenvani','Nguyen Van I' , 2,1,'2025-03-11') ,
                             (10,'k@gmail.com','nguyenvank','Nguyen Van K' , 1,2,'2025-03-11') ;