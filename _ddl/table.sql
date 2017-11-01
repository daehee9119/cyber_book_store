-- 테이블 스페이스 생성 및 사용자
create tablespace JSPDB
  	datafile 'C:\Oracle9\JSPDB.dbf' size 100m;

create user jsp
  	identified by db
  	default tablespace JSPDB;

grant connect, resource to jsp;

conn jsp/db


--회원가입
-- drop table member;
CREATE TABLE member (
     id              varchar2(10)  primary key 
    ,passwd          varchar2(10)  not null    
    ,name            varchar2(10)  not null 
    ,mem_num1        char(6)       unique 
    ,mem_num2        char(7)       unique 
    ,e_mail          varchar2(30)  unique 
    ,phone           varchar2(30)  not null 
    ,zipcode         char(7)       not null 
    ,address         varchar2(80)  not null 
    ,blog            varchar2(30)      null
  );


alter table member
modify (name varchar2(50));

alter table member
add constraint membert_email_u 
unique (e_mail);

alter table member
add constraint membert_mem_num1_u 
unique (mem_num1);


CREATE TABLE zipcode (
	zipcode             char(7)              NOT NULL  ,
	area1               varchar2(10)             NULL      ,
	area2               varchar2(20)             NULL      ,
	area3               varchar2(40)             NULL      ,
	area4               varchar2(20)             NULL      
);

--관리자
CREATE TABLE admin(
     admin_id          varchar2(20)  PRIMARY KEY
    ,admin_passwd      varchar2(20)  not null
  );
insert into admin values('admin', 'admin');


-- Q & A
CREATE TABLE board (
     num                 number(11)          primary key,
     name                varchar2(15),
     email               varchar2(30),
     homepage            varchar2(50),
     subject             varchar2(50),
     content             varchar2(4000),
     pos                 number(11),
     depth               varchar2(5),
     regdate             date,
     pass                varchar2(15),
     count               number(5),
     ip                  varchar2(15)
  );

create sequence num;

-- 주문관련
CREATE TABLE shop_order (
     no_n              number(5)             NOT NULL ,
     product_no        varchar2(5)           NOT NULL ,
     quantity          varchar2(10)          NULL      ,
     day               varchar2(10)          NULL      ,
     state             varchar2(10)          NULL      ,
     id                varchar2(10)          NULL      ,
     PRIMARY KEY ( no_n )
  );

create sequence no_n;


-- 도서 등록
drop table shop_bproduct;
CREATE TABLE shop_bproduct (
     no_bp             number(5)             NOT NULL  , 
     code	       varchar2(20)          NOT NULL  ,
     name              varchar2(50)          NOT NULL  ,
     juja              varchar2(30)          NOT NULL  ,
     chool             varchar2(20)          NOT NULL  ,
     isbn              varchar2(20)          NULL      ,
     price             varchar2(10)          NULL      ,
     detail            varchar2(4000)        NULL      ,
     day               varchar2(20)          NULL      ,
     stock             varchar2(10)          NULL      ,
     image             varchar2(20)          NULL      ,
     PRIMARY KEY ( no_bp )
   );

create sequence no_bp;

 alter table shop_bproduct
 modify (name varchar2(50));

insert into shop_bproduct values
(no_bp.nextval, '도서분류', '도서명', '저자명', '출판사',
'ISBN', '가격', '도서상세정보', '출판일', '개수', '이미지');
commit;


-- 저자 모집
drop table juja_book;
CREATE TABLE juja_book (
     jujanum           number(5)             NOT NULL  , 
     name              varchar2(20)          NOT NULL  , 
     email             varchar2(20)          NOT NULL  ,
     phone             varchar2(20)          NOT NULL  ,
     content1          varchar2(4000)        NOT NULL  ,
     content2          varchar2(4000)        NOT NULL  ,
     content3          varchar2(4000)        NOT NULL  ,
     filename          varchar2(20)          NULL      ,
     PRIMARY KEY ( jujanum )
   );

create sequence jujanum;

insert into juja_book values
(jujanum.nextval, '이름', '메일', '전화번호',
'내용1', '내용2', '내용', '');


-- 교육교재채택
drop table book_c;
CREATE TABLE book_c (
     book              number(5)             NOT NULL  , 
     name              varchar2(20)          NOT NULL  , 
     email             varchar2(20)          NOT NULL  ,
     phone             varchar2(20)          NOT NULL  ,
     content1          varchar2(80)          NOT NULL  ,
     content2          varchar2(4000)        NOT NULL  ,
     PRIMARY KEY ( book )
   );
create sequence book;




-- 공지사항
CREATE TABLE board_1 (
     num1                number(11)          primary key,
     name                varchar2(15),
     email               varchar2(30),
     homepage            varchar2(50),
     subject             varchar2(50),
     content             varchar2(4000),
     pos                 number(11),
     depth               varchar2(5),
     regdate             date,
     pass                varchar2(15),
     count               number(5),
     ip                  varchar2(15)
  );

create sequence num1;


-- Q N A
CREATE TABLE board_4 (
     num4                number(11)          primary key,
     name                varchar2(15),
     email               varchar2(30),
     homepage            varchar2(50),
     subject             varchar2(50),
     content             varchar2(4000),
     pos                 number(11),
     depth               varchar2(5),
     regdate             date,
     pass                varchar2(15),
     count               number(5),
     ip                  varchar2(15)
  );

create sequence num4;


-- F A Q
CREATE TABLE board_5 (
     num5                number(11)          primary key,
     name                varchar2(15),
     email               varchar2(30),
     homepage            varchar2(50),
     subject             varchar2(50),
     content             varchar2(4000),
     pos                 number(11),
     depth               varchar2(5),
     regdate             date,
     pass                varchar2(15),
     count               number(5),
     ip                  varchar2(15)
  );

create sequence num5;


-- 자료실 생성

-- DROP TABLE BOARD1_TBL CASCADE CONSTRAINTS;

CREATE TABLE BOARD1_TBL (
	NUM		number		NOT NULL, --일련번호
	REG_NAME		varchar2(20)	NOT NULL, --등록자서명
	TITLE		varchar2(40)	NOT NULL, --제목
	CONTENT		varchar2(4000)	NOT NULL, --내용
	FILE_NAME1	varchar2(50),             	--파일이름
	HIT_CNT		number		default 0, 	--죄회수
	doc_group		number ,	              	--글 그룹
	doc_pos		number ,	              	--글 위치
	doc_step		number ,	              	--답글위치
	ip_num		varchar2(16)	NOT NULL, --아이피
	reg_date		varchar2(10)	NOT NULL, --등록일자
	state		varchar2(2)	NOT NULL, --상태
	CONSTRAINTS BOARD1_TBL_PK PRIMARY KEY (NUM)
);	
 
--시퀀스 생성

CREATE  SEQUENCE COMM1_SEQ
START  WITH  1
INCREMENT  BY  1
NOCYCLE;



