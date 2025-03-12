use `testing_system_assignment_1` ;
-- question 2: lấy ra tất cả các phòng ban
select * from department ;
-- question 3 : lấy ra id của phòng ban "Sale"
select departmentId ,departmentName
from department
where departmentName = 'Sale' ;
-- question 4 : lấy ra thông tin account có full name dài nhất
update account 
set fullName = 'Duong Nhat Minh'
where accountId = 1 ;

select * 
from account
order by length(fullName) desc
limit 1 ;
-- question 5 : lấy ra thông tin account có fullname dài nhất và thuộc phòng ban có id = 3 
select *
from account 
where departmentId = 3 
order by length(fullName) desc 
limit 1 ;

-- question 6 : lấy ra tên group  đã tham gia trước ngày  01-01-2025
select groupName , createDate
from `group` 
where createDate < ('2025-01-01') ; 

-- question 7 : lấy ra id của question có >= 4 câu trả lời 	
select q.questionID , count(a.answerId) as TotalAnswer
from question q 
inner join answer a on q.questionID = a.questionId
group by q.questionID
having count(a.answerId) >= 4  ;

-- question 8 : Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tao trc ngay 20-12-2024
select e.examId , e.code ,e.duration , e.createDate
from exam e 
where e.duration > maketime(1,0,0)  and e.createDate < ('2024-12-20') ;

-- question 9 : Lấy ra 5 group được tạo gần đây nhất
select * 
from `group`
order by createDate desc
limit 5 ;

-- question 10 : Đếm số nhân viên thuộc department có id = 2
select count(accountId)
from account  a
where a.departmentId = 2 ;

-- question 11 : Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"'
select * 
from account a
where a.fullName like 'D%o' ;

-- question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2024
SET SQL_SAFE_UPDATES = 0;
delete 
from  exam e
where e.createDate < ('2024-12-20')  ; 
SET SQL_SAFE_UPDATES = 1;

-- question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SET SQL_SAFE_UPDATES = 0;
delete 
from question q
where q.content like 'câu hỏi%' ;

-- question 14 : Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
-- email thành loc.nguyenba@vti.com.vn
update account ac
set ac.fullName = 'Nguyễn Bá Lộc' , ac.email = 'loc.nguyenba@vti.com.vn' 
where ac.accountId = 5 ;

-- question 15 : update account có id = 3 sẽ thuộc group có id = 4 
update group_account ga
set groupId = 4
where accountId =3 

