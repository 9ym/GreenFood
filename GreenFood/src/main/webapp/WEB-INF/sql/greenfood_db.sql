-- oracle sql db query


-- questino_category ����
select q.* , c.question_category_dsc
from tbl_question q, tbl_question_category c
where q.question_category = c.question_category;

