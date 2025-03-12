use `testing_system_assignment_1` ;
create table `group`(
	groupId int primary key auto_increment ,
    groupName varchar(50) ,
    creatorId int ,
    createDate Date ,
    foreign key(creatorId) references account(accountId)
);group
create table group_account(
	groupId int ,
    accountId int ,
    joinDate Date ,
    foreign key(groupId) references `group`(groupId) ,
    foreign key(accountId) references account(accountId)
);
create table type_question(
	typeId int primary key auto_increment ,
    typeName Enum ('Essay' , 'Multiple-Choice')
);
create table category_question(
	categoryID int primary key auto_increment ,
    categoryName varchar(50) 
);
create table question(
	questionID int primary key auto_increment ,
    content varchar(100) ,
    categoryId int ,
    typeId int ,
    creatorId int ,
    createDate Date ,
    foreign key(categoryId) references category_question(categoryID) ,
    foreign key(typeId) references type_question(typeId) ,
    foreign key(creatorId) references account(accountId) 
);
create table answer (
	answerId int primary key auto_increment ,
    content varchar(100) ,
    questionId int ,
    isCorrect bool ,
    foreign key(questionId) references question(questionID) 
);
create table exam(
	examId int primary key auto_increment ,
    code int ,
    title varchar(50) ,
    categoryId int ,
    duration Time ,
    creatorId int ,
    createDate Date ,
    foreign key(categoryId) references category_question(categoryID) ,
    foreign key(creatorId) references account(accountId)
);
create table exam_question(
	examId int ,
    questionId int ,
    foreign key(examId) references exam(examId) ,
    foreign key(questionId) references question(questionID)
);