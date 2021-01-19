-- oracle sql db query


-- questino_category ����
select q.* , c.question_category_dsc
from tbl_question q, tbl_question_category c
where q.question_category = c.question_category;





-- 봉규 

select o.order_code, o.order_date, o.order_total_price, p.product_title
from tbl_order o, tbl_order_detail d, tbl_product p
where user_id = 'user'
and o.order_code = d.order_code
and d.product_code = p.product_code
order by o.order_date desc;

select * from tbl_order
where user_id = 'user';

select d.*, p.product_title from tbl_order_detail d, tbl_product p
where d.order_code = '115'
and d.product_code = p.product_code;

select * from           
				(select rownum rnum, a.* from (select * from tbl_notice a 
                    where notice_title      like '%199%'
                    order by notice_no desc) a)
				where rnum between 1 and 3;


select o.order_code, p.product_code, p.product_title
from tbl_order o, tbl_product p
where user_id = 'user'
and o.order_code = '202101060007'
order by o.order_date desc;