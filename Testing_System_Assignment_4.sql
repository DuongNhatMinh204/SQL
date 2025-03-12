use `testing_system_assignment_1` ;
-- qs1 : viết câu lệnh để lấy ra danh sách nhân viên  và thông tin phòng ban của họ
select * 
from account a
left join department d  on a.departmentId = d.departmentId 
union 
select * 
from account a
right join department d  on a.departmentId = d.departmentId ;

-- qs2 : viết câu lệnh để lấy ra thông tin account được tạo sau ngày 20-01-2025
select *
from account a
where a.createDate >= ('2025-01-20');

-- qs3 : viết câu lệnh để lấy ra tất cả các developer
select * 
from account a
inner join position p on a.positionId = p.positionId
where p.positionName = 'DEV' ;

-- qs4 : viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên
select d.departmentId, d.departmentName , count(d.departmentId) as TotalEmployee
from department d
inner join account a on d.departmentId = a.departmentId 
group by d.departmentId 
having count(d.departmentId) >= 3 ;

-- qs5 : viết câu lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select q.questionID, q.content,q.createDate , count(e.examId) as total
from question q
inner join exam_question e on q.questionID = e.questionID
group by q.questionID
limit 1 ; 

-- qs6 : thống kê môi category question được sử dụng trong bao nhiêu question
select cq.categoryID ,cq.categoryName  , count(q.questionID) Total
from category_question cq
inner join question q on cq.categoryID = q.categoryId
group by cq.categoryID, cq.categoryName ;
 
-- qs7: thống kê mỗi question được sử dụng trong bao nhiêu exam
select q.questionID,q.content, count(eq.examId) as TotalExam
from question q
inner join  exam_question eq on  q.questionID = eq.questionId 
group by q.questionID ; 

-- qs8 : lấy ra question có nhiều câu trả lời nhất
select q.questionID,q.content , count(a.answerId) as TotalAnswer
from question q 
inner join answer a on q.questionID = a.questionId
group by q.questionID 
order by count(a.answerId) desc
limit 1;

-- qs9 : thống kê số lượng account có trong mỗi group
select g.groupId , g.groupName , count(ga.accountId) Total
from `group` g
left join group_account ga on g.groupId = ga.groupId 
group by g.groupId ;

-- qs10 : tìm chức vụ có ít người nhất
select p.positionId , p.positionName , count(a.positionId) Total
from position p  
left join account a on p.positionId = a.positionId
group by p.positionId ;

-- qs11 : thống kê phòng ban có bao nhiêu dev ,test, scrum , pm
select d.departmentId , d.departmentName , p.positionName , count(a.accountId)
from department d
left join account a on  d.departmentId = a.departmentId
left join position p on a.positionId = p.positionId
group by d.departmentId , p.positionName 
order by d.departmentId ;

-- qs12 : lấy thông tin chi tiết các loại câu hỏi bao gồm : thông tin cơ bản của question , loại câu hỏi , 
-- ai là người tạo ra câu hỏi , câu trả lời là gì ... 
select q.questionID , q.content,q.createDate , tq.typeName , a.fullName ,anw.content , anw.isCorrect
from question q
left join type_question tq on q.typeId = tq.typeId
inner join account a on q.creatorId = a.accountId
left join answer anw on q.questionID = anw.questionId -- left join để giữ lại các câu hỏi không có câu trả lời 
order by q.questionID ;

-- qs13 : lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select tq.typeId , tq.typeName , count(q.questionID) Total
from type_question tq
left join question q on tq.typeId = q.typeId
group by tq.typeId ;

-- qs14 : lấy ra group không có account nào 
select g.groupId , g.groupName , count(ga.accountId) TotalAccount
from `group` g 
left join group_account ga on g.groupId = ga.groupId
group by g.groupId
having count(ga.accountId) = 0 ;

-- qs16 :lấy ra question không có answer nào
select q.questionID  , q.content , count(ans.answerId) TotalAnswer
from question q 
left join answer ans on q.questionID = ans.questionId
group by  q.questionID
having count(ans.answerId) = 0 ;

-- qs17 a : lấy ra account thuộc nhóm thứ nhất 
select *
from account a
inner join group_account ga on a.accountId = ga.accountId
where ga.groupId = 1
order by a.accountId ;
-- qs17 b : lấy ra account thuộc nhóm thứ 4
select *
from account a
inner join group_account ga on a.accountId = ga.accountId
where ga.groupId = 4
order by a.accountId ;
-- qs17 c : ghép 2 kết quả từ câu a và b sao cho không có record trùng nhau 
select *
from account a
inner join group_account ga on a.accountId = ga.accountId
where ga.groupId = 1
union 
select *
from account a
inner join group_account ga on a.accountId = ga.accountId
where ga.groupId = 4 ;

-- qs18a : lấy các group có >= 2 nhân viên 
select g.groupId , g.groupName , count(ga.accountId) TotalNV
from `group` g
inner join group_account ga on  g.groupId = ga.groupId
group by g.groupId
having count(ga.accountId) >= 2 ;

-- qs18b : lấy các group có <=4  nhân viên 
select g.groupId , g.groupName , count(ga.accountId) TotalNV
from `group` g
inner join group_account ga on  g.groupId = ga.groupId
group by g.groupId
having count(ga.accountId) <= 4;

-- qs18c : gộp a và b
select g.groupId , g.groupName , count(ga.accountId) TotalNV
from `group` g
inner join group_account ga on  g.groupId = ga.groupId
group by g.groupId
having count(ga.accountId) >= 2 
union
select g.groupId , g.groupName , count(ga.accountId) TotalNV
from `group` g
inner join group_account ga on  g.groupId = ga.groupId
group by g.groupId
having count(ga.accountId) <= 4; 

