use `project_employee` ;

-- b : viết stored procedure(không có parameter) để remove tất cả thông tin project đã hoàn thành sau 3 tháng kể từ ngày hoàn thiện
-- In số lượng record đã remove từ các table liên quan trong khi removing ( dùng lệnh print)
delimiter //
drop procedure if exists RemoveAllInfoPrj ;
create procedure RemoveAllInfoPrj()
begin 
	declare row_count int ;
    
	delete 
    from  projects 
    where datediff(current_date(),projectCompletedOn) > 3 ;
    
    set row_count = row_count() ;
    select concat('đã xóa số bản ghi : ',row_count) as result ;
end //
delimiter ;
SET SQL_SAFE_UPDATES = 0;
call RemoveAllInfoPrj() ;
SET SQL_SAFE_UPDATES = 1;

-- viết stored procedure(có parameter) để on ra các module đang được thực hiện 
delimiter //
create procedure ListModule(in projectId int ) 
begin 
	select pm.moduleId, pm.projectId , pm.projectModulesDescription ,pm.projectModulesDate
    from project_modules pm
    where pm.projectModulesCompledOn is null ;
end //
delimiter ;
