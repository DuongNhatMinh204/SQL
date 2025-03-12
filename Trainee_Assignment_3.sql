SELECT * FROM freshertrainingmanagement.trainee;
-- question 1 : add 10 record
-- question 2 : query all the trainees who is passed the entry test ,group them into different birth month
use `freshertrainingmanagement` ;
select * 
from trainee t
where t.et_iq + t.et_gmath >= 20 
	and t.et_iq >= 8 
    and t.et_gmath >= 8
    and et_english >= 18 ;
    
-- question 3 : query the trainee who has a longest name , showing his/her age along with his/her basic information
select * , year(curdate()) - year(t.birth_date) as Age
from trainee t 
order by length(t.full_Name) desc
limit 1;

-- question 4 : giong qs 2
-- question 5: delete infomation of trainee who has traineeId = 3 
delete 
from trainee t
where t.traineeId = 3 ;

-- question 6 : trainee who has traineeId = 5 move "2" class .let update information into database
update trainee t 
set t.training_class = 2 
where t.traineeId = 5 ;