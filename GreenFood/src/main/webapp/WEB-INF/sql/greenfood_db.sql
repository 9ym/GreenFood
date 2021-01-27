-- 장바구니
CREATE TABLE TBL_CART 
(
  CART_NO VARCHAR2(20 BYTE) NOT NULL 
, USER_ID VARCHAR2(10 BYTE) 
, PRODUCT_CODE VARCHAR2(10 BYTE) 
, PRODUCT_TITLE VARCHAR2(50 BYTE) NOT NULL 
, PRODUCT_PRICE NUMBER(6, 0) NOT NULL 
, PRODUCT_SALE_RATE NUMBER(5, 0) DEFAULT 0 
, CART_QUANTITY NUMBER(6, 0) NOT NULL 
, CART_DATE TIMESTAMP(6) DEFAULT sysdate NOT NULL 
);

ALTER TABLE TBL_CART
ADD CONSTRAINT R_PRODUCT_CODE_C FOREIGN KEY
( PRODUCT_CODE )
REFERENCES TBL_PRODUCT
( PRODUCT_CODE )
ENABLE;

ALTER TABLE TBL_CART
ADD CONSTRAINT R_USER_ID_C FOREIGN KEY
( USER_ID )
REFERENCES TBL_MEMBER
( USER_ID )
ENABLE;

-- 회원 멤버 등급
CREATE TABLE TBL_LEVEL_CATEGORY 
(
  USER_LEVEL NUMBER NOT NULL 
, USER_LEVEL_DSC VARCHAR2(20 BYTE) NOT NULL 
, CONSTRAINT SYS_C005358 PRIMARY KEY 
);

-- 회원
CREATE TABLE TBL_MEMBER 
(
  USER_ID VARCHAR2(10 BYTE) NOT NULL 
, USER_PW VARCHAR2(11 BYTE) NOT NULL 
, USER_NAME VARCHAR2(10 BYTE) NOT NULL 
, USER_ADDR1 VARCHAR2(10 BYTE) NOT NULL 
, USER_PHONE VARCHAR2(13 BYTE) NOT NULL 
, USER_EMAIL VARCHAR2(50 BYTE) 
, USER_POINT NUMBER DEFAULT 0 NOT NULL 
, USER_LEVEL NUMBER DEFAULT 0 NOT NULL 
, USER_CODE VARCHAR2(10 BYTE) 
, USER_DATE TIMESTAMP(6) DEFAULT sysdate 
, USER_ADDR2 VARCHAR2(100 BYTE) NOT NULL 
, USER_ADDR3 VARCHAR2(100 BYTE) 
, USER_DELETED VARCHAR2(5 BYTE) DEFAULT 'N' NOT NULL 
, CONSTRAINT SYS_C005092 PRIMARY KEY 
);

ALTER TABLE TBL_MEMBER
ADD CONSTRAINT R_USER_CODE_M FOREIGN KEY
( USER_CODE ) 
REFERENCES TBL_MEMBER_CODE
( USER_CODE )
ENABLE;

ALTER TABLE TBL_MEMBER
ADD CONSTRAINT R_USER_LEVEL_M FOREIGN KEY
( USER_LEVEL )
REFERENCES TBL_LEVEL_CATEGORY
( USER_LEVEL )
ENABLE;

-- 회원 종류
CREATE TABLE TBL_MEMBER_CODE 
(
  USER_CODE VARCHAR2(10 BYTE) NOT NULL 
, USER_CODE_DSC VARCHAR2(10 BYTE) NOT NULL 
, CONSTRAINT SYS_C005094 PRIMARY KEY 
);

-- 공지사항
CREATE TABLE TBL_NOTICE 
(
  NOTICE_NO NUMBER(10, 0) NOT NULL 
, NOTICE_TITLE VARCHAR2(50 BYTE) NOT NULL 
, NOTICE_CONTENT VARCHAR2(500 BYTE) 
, ADMIN_ID VARCHAR2(10 BYTE) 
, NOTICE_DATE TIMESTAMP(6) DEFAULT sysdate 
, NOTICE_READCOUNT NUMBER(5, 0) DEFAULT 0 
, CONSTRAINT SYS_C005279 PRIMARY KEY 
);

-- 주문
CREATE TABLE TBL_ORDER 
(
  USER_ID VARCHAR2(10 BYTE) 
, ORDER_CODE VARCHAR2(20 BYTE) NOT NULL 
, ORDER_DATE TIMESTAMP(6) DEFAULT sysdate 
, ORDER_TOTAL_PRICE NUMBER(10, 0) NOT NULL 
, ORDER_STATE VARCHAR2(20 BYTE) NOT NULL 
, ORDER_ADDR1 VARCHAR2(10 BYTE) NOT NULL 
, ORDER_ADDR2 VARCHAR2(100 BYTE) NOT NULL 
, ORDER_ADDR3 VARCHAR2(100 BYTE) 
, ORDER_SALE_PRICE NUMBER(10, 0) DEFAULT 0 
, ORDER_POINT_USE NUMBER(5, 0) DEFAULT 0 
, ORDER_PAY_METHOD VARCHAR2(10 BYTE) 
, CONSTRAINT SYS_C005250 PRIMARY KEY 
);

ALTER TABLE TBL_ORDER
ADD CONSTRAINT R_ORDER_STATR_O FOREIGN KEY
( ORDER_STATE )
REFERENCES TBL_ORDER_STATE_CATEGORY
( ORDER_STATE )
ENABLE;

ALTER TABLE TBL_ORDER
ADD CONSTRAINT R_USER_ID_O FOREIGN KEY
( USER_ID )
REFERENCES TBL_MEMBER
( USER_ID )
ENABLE;

-- 주문 상세
CREATE TABLE TBL_ORDER_DETAIL 
(
  ORDER_DETAIL_CODE VARCHAR2(20 BYTE) NOT NULL 
, ORDER_CODE VARCHAR2(20 BYTE) 
, PRODUCT_CODE VARCHAR2(10 BYTE) 
, ORDER_QUANTITY NUMBER(6, 0) NOT NULL 
, CONSTRAINT SYS_C005269 PRIMARY KEY 
);

ALTER TABLE TBL_ORDER_DETAIL
ADD CONSTRAINT R_PRODUCT_CODE_OD FOREIGN KEY
( PRODUCT_CODE )
REFERENCES TBL_PRODUCT
( PRODUCT_CODE )
ENABLE;

-- 주문 상태
CREATE TABLE TBL_ORDER_STATE_CATEGORY 
(
  ORDER_STATE VARCHAR2(20 BYTE) NOT NULL 
, ORDER_STATE_DSC VARCHAR2(20 BYTE) NOT NULL 
, CONSTRAINT SYS_C005445 PRIMARY KEY 
);

-- 포인트
CREATE TABLE TBL_POINT 
(
  POINT_NO NUMBER(10, 0) NOT NULL 
, POINT_CATEGORY NUMBER(10, 0) 
, POINT_SCORE NUMBER(10, 0) NOT NULL 
, USER_ID VARCHAR2(10 BYTE) 
, POINT_DATE TIMESTAMP(6) DEFAULT sysdate 
, CONSTRAINT SYS_C005296 PRIMARY KEY 
);

ALTER TABLE TBL_POINT
ADD CONSTRAINT R_POINT_CATEGORY_P FOREIGN KEY
( POINT_CATEGORY )
REFERENCES TBL_POINT_CATEGORY
( POINT_CATEGORY )
ENABLE;

ALTER TABLE TBL_POINT
ADD CONSTRAINT R_USER_ID_P FOREIGN KEY
( USER_ID )
REFERENCES TBL_MEMBER
( USER_ID )
ENABLE;

-- 포인트 종류
CREATE TABLE TBL_POINT_CATEGORY 
(
  POINT_CATEGORY NUMBER(10, 0) NOT NULL 
, POINT_CATEGORY_DSC VARCHAR2(20 BYTE) NOT NULL 
, CONSTRAINT SYS_C005291 PRIMARY KEY 
);

-- 상품
CREATE TABLE TBL_PRODUCT 
(
  PRODUCT_CODE VARCHAR2(10 BYTE) NOT NULL 
, PRODUCT_CATEGORY VARCHAR2(10 BYTE) NOT NULL 
, PRODUCT_TITLE VARCHAR2(50 BYTE) NOT NULL 
, PRODUCT_PRICE NUMBER(6, 0) NOT NULL 
, PRODUCT_REGISTRATION_DATE TIMESTAMP(6) DEFAULT sysdate NOT NULL 
, PRODUCT_SALES_DEADLINES TIMESTAMP(6) 
, PRODUCT_SUB_TITLE VARCHAR2(100 BYTE) NOT NULL 
, PRODUCT_CONTENT VARCHAR2(1500 BYTE) NOT NULL 
, PRODUCT_WEIGHT VARCHAR2(20 BYTE) 
, PRODUCT_SALES_UNIT VARCHAR2(10 BYTE) 
, PRODUCT_ORIGIN VARCHAR2(20 BYTE) NOT NULL 
, PRODUCT_ORDER_COUNT NUMBER(4, 0) DEFAULT 0 NOT NULL 
, PRODUCT_STAR NUMBER(4, 1) DEFAULT 0 NOT NULL 
, PRODUCT_SHELF_LIFE NUMBER(10, 0) 
, PRODUCT_SALE_RATE NUMBER(5, 0) DEFAULT 0 
, CONSTRAINT TBL_PRODUCT_PK PRIMARY KEY 
);

ALTER TABLE TBL_PRODUCT
ADD CONSTRAINT R_PRODUCT_CATEGORY_P FOREIGN KEY
( PRODUCT_CATEGORY )
REFERENCES TBL_PRODUCT_CATEGORY
( PRODUCT_CATEGORY )
ENABLE;

ALTER TABLE TBL_PRODUCT
ADD CONSTRAINT CHK_PRODUCT_SALE_RATE CHECK 
(product_sale_rate <= 30)
ENABLE;

-- 상품 카테고리
CREATE TABLE TBL_PRODUCT_CATEGORY 
(
  PRODUCT_CATEGORY VARCHAR2(10 BYTE) NOT NULL 
, PRODUCT_CATEGORY_DSC VARCHAR2(20 BYTE) NOT NULL 
, CONSTRAINT TBL_PRODUCT_CATEGORY_PK PRIMARY KEY 
);

-- 상품 이미지
CREATE TABLE TBL_PRODUCT_IMAGE 
(
  IMAGE_CODE VARCHAR2(10 BYTE) NOT NULL 
, PRODUCT_CODE VARCHAR2(10 BYTE) 
, IMAGE_INFO_FILE_NAME VARCHAR2(100 BYTE) NOT NULL 
, IMAGE_CONTENT_FILE_NAME VARCHAR2(100 BYTE) NOT NULL 
, IMAGE_REGISTRANTION_DATE TIMESTAMP(6) DEFAULT sysdate 
, CONSTRAINT SYS_C005246 PRIMARY KEY 
);

ALTER TABLE TBL_PRODUCT_IMAGE
ADD CONSTRAINT R_PRODUCT_CODE_PI FOREIGN KEY
( PRODUCT_CODE )
REFERENCES TBL_PRODUCT
( PRODUCT_CODE )
ENABLE;

-- 자주하는 질문
CREATE TABLE TBL_QUESTION 
(
  QUESTION_NO NUMBER(10, 0) NOT NULL 
, QUESTION_TITLE VARCHAR2(50 BYTE) NOT NULL 
, QUESTION_CONTENT VARCHAR2(500 BYTE) 
, QUESTION_DATE TIMESTAMP(6) DEFAULT sysdate 
, QUESTION_CATEGORY NUMBER(10, 0) 
, CONSTRAINT SYS_C005284 PRIMARY KEY 
);

ALTER TABLE TBL_QUESTION
ADD CONSTRAINT R_QUESTION_CATEGORY_Q FOREIGN KEY
( QUESTION_CATEGORY )
REFERENCES TBL_QUESTION_CATEGORY
( QUESTION_CATEGORY )
ENABLE;

-- 질문 카테고리
CREATE TABLE TBL_QUESTION_CATEGORY 
(
  QUESTION_CATEGORY NUMBER(10, 0) NOT NULL 
, QUESTION_CATEGORY_DSC VARCHAR2(20 BYTE) NOT NULL 
, CONSTRAINT SYS_C005282 PRIMARY KEY 
);

-- 1:1 질문
CREATE TABLE TBL_QUESTION_ONE 
(
  Q_O_NO NUMBER(10, 0) NOT NULL 
, Q_O_CATEGORY NUMBER(10, 0) NOT NULL 
, Q_O_ORDER_CODE VARCHAR2(20 BYTE) 
, Q_O_TITLE VARCHAR2(200 BYTE) NOT NULL 
, Q_O_CONTENT VARCHAR2(2000 BYTE) NOT NULL 
, Q_O_WRITER VARCHAR2(10 BYTE) 
, Q_O_EMAIL VARCHAR2(50 BYTE) 
, Q_O_PHONE VARCHAR2(13 BYTE) 
, Q_O_DATE TIMESTAMP(6) DEFAULT sysdate 
, Q_O_OK VARCHAR2(50 BYTE) 
, Q_O_ANSWER VARCHAR2(1000 BYTE) 
, CONSTRAINT SYS_C005475 PRIMARY KEY 
);

ALTER TABLE TBL_QUESTION_ONE
ADD CONSTRAINT R_ORDER_CODE_QO FOREIGN KEY
( Q_O_ORDER_CODE )
REFERENCES TBL_ORDER
( ORDER_CODE )
ENABLE;

ALTER TABLE TBL_QUESTION_ONE
ADD CONSTRAINT R_QUESTION_CATEGORY_QO FOREIGN KEY
( Q_O_CATEGORY )
REFERENCES TBL_QUESTION_CATEGORY
( QUESTION_CATEGORY )
ENABLE;

ALTER TABLE TBL_QUESTION_ONE
ADD CONSTRAINT R_USER_ID_QO FOREIGN KEY
( Q_O_WRITER )
REFERENCES TBL_MEMBER
( USER_ID )
ENABLE;

-- 후기
CREATE TABLE TBL_REVIEW 
(
  USER_ID VARCHAR2(10 BYTE) 
, ORDER_CODE VARCHAR2(20 BYTE) 
, REVIEW_NO NUMBER(10, 0) NOT NULL 
, REVIEW_CONTENT VARCHAR2(200 BYTE) NOT NULL 
, REVIEW_DATE TIMESTAMP(6) DEFAULT sysdate 
, REVIEW_TITLE VARCHAR2(100 BYTE) NOT NULL 
, REVIEW_IMAGE VARCHAR2(20 BYTE) 
, REVIEW_READCOUNT NUMBER(5, 0) DEFAULT 0 
, PRODUCT_TITLE VARCHAR2(20 BYTE) 
, STAR_POINT VARCHAR2(10 BYTE) 
, PRODUCT_CODE VARCHAR2(10 BYTE) NOT NULL 
, CONSTRAINT SYS_C005287 PRIMARY KEY 
);

ALTER TABLE TBL_REVIEW
ADD CONSTRAINT R_ORDER_CODE_R FOREIGN KEY
( ORDER_CODE )
REFERENCES TBL_ORDER
( ORDER_CODE )
ENABLE;

ALTER TABLE TBL_REVIEW
ADD CONSTRAINT R_PRODUCT_CODE_R FOREIGN KEY
( PRODUCT_CODE )
REFERENCES TBL_PRODUCT
( PRODUCT_CODE )
ENABLE;

ALTER TABLE TBL_REVIEW
ADD CONSTRAINT R_USER_ID_R FOREIGN KEY
( USER_ID )
REFERENCES TBL_MEMBER
( USER_ID )
ENABLE;
