use `freshertrainingmanagement` ;
create table Trainee (
	traineeId int primary key auto_increment ,
    full_Name varchar(50) ,
    birth_date date ,
    gender enum('male','female','unknow') ,
    et_iq int check (et_iq between 0 and 20 ) ,
    et_gmath int check (et_gmath between 0 and 20 ) ,
    et_english int check (et_english between 0 and 50 ) ,
    training_class varchar(50),
    evaluation_notes varchar(100)
);
alter table trainee 
add vt1_account varchar(50) not null unique ;