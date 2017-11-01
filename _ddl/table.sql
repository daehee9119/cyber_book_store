-- ���̺� �����̽� ���� �� �����
create tablespace JSPDB
  	datafile 'C:\Oracle9\JSPDB.dbf' size 100m;

create user jsp
  	identified by db
  	default tablespace JSPDB;

grant connect, resource to jsp;

conn jsp/db


--ȸ������
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

--������
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

-- �ֹ�����
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


-- ���� ���
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
(no_bp.nextval, '�����з�', '������', '���ڸ�', '���ǻ�',
'ISBN', '����', '����������', '������', '����', '�̹���');
commit;


-- ���� ����
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
(jujanum.nextval, '�̸�', '����', '��ȭ��ȣ',
'����1', '����2', '����', '');


-- ��������ä��
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




-- ��������
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


-- �ڷ�� ����

-- DROP TABLE BOARD1_TBL CASCADE CONSTRAINTS;

CREATE TABLE BOARD1_TBL (
	NUM		number		NOT NULL, --�Ϸù�ȣ
	REG_NAME		varchar2(20)	NOT NULL, --����ڼ���
	TITLE		varchar2(40)	NOT NULL, --����
	CONTENT		varchar2(4000)	NOT NULL, --����
	FILE_NAME1	varchar2(50),             	--�����̸�
	HIT_CNT		number		default 0, 	--��ȸ��
	doc_group		number ,	              	--�� �׷�
	doc_pos		number ,	              	--�� ��ġ
	doc_step		number ,	              	--�����ġ
	ip_num		varchar2(16)	NOT NULL, --������
	reg_date		varchar2(10)	NOT NULL, --�������
	state		varchar2(2)	NOT NULL, --����
	CONSTRAINTS BOARD1_TBL_PK PRIMARY KEY (NUM)
);	
 
--������ ����

CREATE  SEQUENCE COMM1_SEQ
START  WITH  1
INCREMENT  BY  1
NOCYCLE;



