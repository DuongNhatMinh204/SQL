use `testing_system_assignment_1` ;

-- question 1 : tao view co chua danh sach nhan vien thuoc phong ban sale
create view  NhanVienSale as
	select *
	from account a 
    where a.departmentId = 2 ;

-- question 2 : tao view co chua thong tin cac account tham gia vao nhieu group nhat
create view AccountMultipleGroup  as
	select a.accountId , a.email , a.userName , a.fullName , count(ga.groupId) as TotalGroup
    from account a
    left join group_account ga on a.accountId = ga.accountId 
    group by a.accountId 
    having count(ga.groupId) >= ALL(
								select  count(ga.groupId) as TotalGroup
								from account a
								left join group_account ga on a.accountId = ga.accountId 
								group by a.accountId 
								)
    order by count(ga.groupId) desc ;
-- question 2 : su dung cte 
with MaxCount as (
	select count(ga.groupId) as TotalGroup
    from account a 
    left join group_account ga on a.accountId = ga.accountId 
	group by a.accountId
    order by count(ga.groupId) desc
    limit 1 
) 
select a.accountId , a.email , a.userName , a.fullName , count(ga.groupId) as TotalGroup
from account a
left join group_account ga on a.accountId = ga.accountId 
group by a.accountId 
having count(ga.groupId) = (
							select TotalGroup from MaxCount 
							) ;
-- question 3 : tao view co chua cau hoi co nhung content qua dai ( qua 14 tu ) va xoa no di 
drop view QuestionLongContent ;
create view  QuestionLongContent as
	select * 
    from question q 
    where length(q.content) - length(replace(q.content,' ','')) > 14 ;
delete from question where length(content) > 14 ;

-- question 4 : tao view co chua danh sach cac phong ban co nhieu nhan vien nhat
create view DepartmentMaxEmployees  as
	select d.departmentId , d.departmentName , count(a.accountId) as TotalNv
    from department d 
    left join account a on d.departmentId = a.departmentId
    group by d.departmentId
    having count(a.accountId) = (
							select max(TotalNv)
								from (
									select count(a.accountId) as TotalNv
									from department d 
									left join account a on d.departmentId = a.departmentId
									group by d.departmentId
								) as max_count
							) 
    order by count(a.accountId) desc ;

-- question 5 : tao view co chua tat ca cac cau hoi do ho Nguyen tao
create view ListQsByNguyen as
	select q.questionID , q.content, a.fullName
    from  question q 
    join account a on q.creatorId = a.accountId 
    where a.fullName like 'Nguyen%'
