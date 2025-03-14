use `testing_system_assignment_1` ;
-- question 1 : tao store de nguoi dung nhap vao ten phong ban va in ra tat ca cac account thuoc phong ban do 

delimiter // 
create procedure searchDepartment (in department_name nvarchar(50) ) 
begin 
	select * 
    from account ac 
    join department d on ac.departmentId = d.departmentId 
    where d.departmentName = department_name ;
end //
delimiter ;
-- use
call searchDepartment('Sale') ;

-- qs2 : tao store de in ra so luong account trong moi group
delimiter // 
drop procedure  if exists printQuantityAccoutGroup;
create procedure printQuantityAccoutGroup()
begin 
	select ga.groupId,g.groupName , count(accountId) as TotalAccount
    from group_account ga 
    join `group` g on ga.groupId =  g.groupId
    group by ga.groupId 
    order by ga.groupId ;
end //
delimiter ;
call printQuantityAccoutGroup() ;
    
-- question 3 : tao store de thong ke moi type question co bao nhieu question duoc tao trong thang hien tai
delimiter // 
create procedure AmountQuestionInMoth()
begin 
	select tq.typeId , tq.typeName , count(q.typeId) as TotalQuestion
    from type_question tq
    left join question q on tq.typeId = q.typeId 
    and month(q.createDate) = month(current_date())
    group by tq.typeId 
    order by count(q.typeId) desc ;
end // 
delimiter ;
call AmountQuestionInMoth() ;

-- question 4: tao store de tra ra id cua type question co nhieu cau hoi nhat 
DELIMITER //

DROP PROCEDURE IF EXISTS MaxType;
CREATE PROCEDURE MaxType(OUT max_type_id INT)
BEGIN 
    DECLARE max_question INT;
    -- Lấy số lượng câu hỏi lớn nhất (không cần VIEW)
    SELECT MAX(TotalQuestion) INTO max_question
    FROM (
        SELECT COUNT(q.questionID) AS TotalQuestion
        FROM type_question tq
        LEFT JOIN question q ON tq.typeId = q.typeId
        GROUP BY tq.typeId
    ) AS subquery;
    SELECT tq.typeId INTO max_type_id
    FROM type_question tq
    LEFT JOIN question q ON tq.typeId = q.typeId 
    GROUP BY tq.typeId 
    HAVING COUNT(q.questionID) = max_question
    LIMIT 1; 
END //
DELIMITER ;

-- qs5: su dung store o qs 4 de tim ra ten cua type question
SET @max_type_id = NULL;
CALL MaxType(@max_type_id);  
SELECT @max_type_id AS TypeID;  
SELECT tq.typeName
FROM type_question tq
WHERE tq.typeId = @max_type_id;

-- qs6 : viet 1 store cho phep nguoi dung nhap vao 1 chuoi va tra ve group co ten chua chuoi cua nguoi dung nhap vao hoac tra ve
-- user name chua chuoi cua nguoi dung nhap vao
DELIMITER //
DROP PROCEDURE IF EXISTS SearchGroupOrUser;
CREATE PROCEDURE SearchGroupOrUser(IN searchString VARCHAR(255))
BEGIN
    SELECT 'Group' AS Type, g.groupId AS ID, g.groupName AS Name
    FROM `group` g
    WHERE g.groupName LIKE CONCAT('%', searchString, '%')
    UNION
    SELECT 'User' AS Type, a.accountId AS ID, a.userName AS Name
    FROM account a
    WHERE a.userName LIKE CONCAT('%', searchString, '%');
END //
DELIMITER ;
CALL SearchGroupOrUser('a');
