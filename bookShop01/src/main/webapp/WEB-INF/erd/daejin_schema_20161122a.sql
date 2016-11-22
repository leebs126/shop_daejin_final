drop table t_shoping_main_setting;
drop table t_shoping_popup;
drop table t_shoping_review;
drop table t_shoping_search_word;
drop table t_shoping_user_reco;

drop table t_goods_detail_image;
drop table t_shoping_order;
drop table t_shoping_cart;
drop table t_shoping_member;
drop table t_goods_info;


--------------------------------------------------------
--  DDL for Table T_GOODS_DETAIL_IMAGE
--------------------------------------------------------

  CREATE TABLE "T_GOODS_DETAIL_IMAGE" 
   (	"IMAGE_ID" VARCHAR2(20 BYTE), 
	"GOODS_ID" VARCHAR2(30 BYTE), 
	"FILENAME" VARCHAR2(50 BYTE), 
	"REG_ID" VARCHAR2(20 BYTE), 
	"FILETYPE" VARCHAR2(40 BYTE), 
	"CREDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_GOODS_INFO
--------------------------------------------------------

  CREATE TABLE "T_GOODS_INFO" 
   (	"GOODS_ID" VARCHAR2(30 BYTE), 
	"GOODS_SORT" VARCHAR2(50 BYTE), 
	"GOODS_TITLE" VARCHAR2(100 BYTE), 
	"GOODS_WRITER" VARCHAR2(50 BYTE), 
	"GOODS_PUBLISHER" VARCHAR2(50 BYTE), 
	"GOODS_PRICE" NUMBER(10,0), 
	"GOODS_SALES_PRICE" NUMBER(10,0), 
	"GOODS_POINT" NUMBER(10,0), 
	"GOODS_PUBLISHED_DATE" DATE, 
	"GOODS_TOTAL_PAGE" NUMBER(5,0), 
	"GOODS_ISBN" VARCHAR2(50 BYTE), 
	"GOODS_DELIVERY_PRICE" NUMBER(10,0), 
	"GOODS_DELIVERY_DATE" DATE, 
	"GOODS_TYPE" VARCHAR2(50 BYTE), 
	"GOODS_INTRO" VARCHAR2(2000 BYTE), 
	"GOODS_WRITER_INTRO" VARCHAR2(2000 BYTE), 
	"GOODS_PUBLISHER_COMMENT" VARCHAR2(2000 BYTE), 
	"GOODS_RECOMMENDATION" VARCHAR2(2000 BYTE), 
	"GOODS_CONTENTS_ORDER" CLOB, 
	"GOODS_CREDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("GOODS_CONTENTS_ORDER") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table T_MEMBER
--------------------------------------------------------

  CREATE TABLE "T_MEMBER" 
   (	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(50 BYTE), 
	"WEIGHT" NUMBER(5,0), 
	"HEIGHT" NUMBER(5,0), 
	"AGE" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_CART
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_CART" 
   (	"CART_ID" NUMBER(10,0), 
	"GOODS_ID" VARCHAR2(30 BYTE), 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"DEL_YN" VARCHAR2(20 BYTE) DEFAULT 'N', 
	"CREDATE" DATE DEFAULT sysdate, 
	"CART_GOODS_QTY" NUMBER(4,0) DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_MAIN_SETTING
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_MAIN_SETTING" 
   (	"MAIN_SETTING_ID" VARCHAR2(10 BYTE), 
	"MEMBER_ID" VARCHAR2(10 BYTE), 
	"GOODS_TYPE" VARCHAR2(20 BYTE), 
	"SHOW_YN" VARCHAR2(10 BYTE), 
	"CREDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_MEMBER
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_MEMBER" 
   (	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"MEMBER_PW" VARCHAR2(30 BYTE), 
	"MEMBER_NAME" VARCHAR2(50 BYTE), 
	"MEMBER_GENDER" VARCHAR2(10 BYTE), 
	"TEL1" VARCHAR2(20 BYTE), 
	"TEL2" VARCHAR2(20 BYTE), 
	"TEL3" VARCHAR2(20 BYTE), 
	"HP1" VARCHAR2(20 BYTE), 
	"HP2" VARCHAR2(20 BYTE), 
	"HP3" VARCHAR2(20 BYTE), 
	"SMSSTS_YN" VARCHAR2(20 BYTE), 
	"EMAIL1" VARCHAR2(20 BYTE), 
	"EMAIL2" VARCHAR2(20 BYTE), 
	"EMAILSTS_YN" VARCHAR2(20 BYTE), 
	"ZIPCODE" VARCHAR2(20 BYTE), 
	"ROADADDRESS" VARCHAR2(500 BYTE), 
	"JIBUNADDRESS" VARCHAR2(500 BYTE), 
	"NAMUJIADDRESS" VARCHAR2(500 BYTE), 
	"MEMBER_BIRTH_Y" VARCHAR2(20 BYTE), 
	"MEMBER_BIRTH_M" VARCHAR2(20 BYTE), 
	"MEMBER_BIRTH_D" VARCHAR2(20 BYTE), 
	"MEMBER_BIRTH_GN" VARCHAR2(20 BYTE), 
	"JOINDATE" DATE DEFAULT sysdate, 
	"DEL_YN" VARCHAR2(20 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_ORDER
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_ORDER" 
   (	"ORDER_SEQ_NUM" VARCHAR2(20 BYTE), 
	"ORDER_ID" VARCHAR2(20 BYTE), 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"GOODS_ID" VARCHAR2(20 BYTE), 
	"ORDERER_NAME" VARCHAR2(50 BYTE), 
	"GOODS_TITLE" VARCHAR2(100 BYTE), 
	"ORDER_GOODS_QTY" NUMBER(5,0), 
	"GOODS_SALES_PRICE" NUMBER(5,0), 
	"GOODS_FILENAME" VARCHAR2(60 BYTE), 
	"RECEIVER_NAME" VARCHAR2(50 BYTE), 
	"RECEIVER_HP1" VARCHAR2(20 BYTE), 
	"RECEIVER_HP2" VARCHAR2(20 BYTE), 
	"RECEIVER_HP3" VARCHAR2(20 BYTE), 
	"RECEIVER_TEL1" VARCHAR2(20 BYTE), 
	"RECEIVER_TEL2" VARCHAR2(20 BYTE), 
	"RECEIVER_TEL3" VARCHAR2(20 BYTE), 
	"DELIVERY_ADDRESS" VARCHAR2(500 BYTE), 
	"DELIVERY_METHOD" VARCHAR2(40 BYTE), 
	"DELIVERY_MESSAGE" VARCHAR2(300 BYTE), 
	"GIFT_WRAPPING" VARCHAR2(20 BYTE), 
	"PAY_METHOD" VARCHAR2(200 BYTE), 
	"CARD_COM_NAME" VARCHAR2(50 BYTE), 
	"CARD_PAY_MONTH" VARCHAR2(20 BYTE), 
	"PAY_ORDERER_HP_NUM" VARCHAR2(20 BYTE), 
	"DELIVERY_STATE" VARCHAR2(20 BYTE) DEFAULT 'delivery_prepared', 
	"PAY_ORDER_TIME" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_POPUP
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_POPUP" 
   (	"POPUP_ID" VARCHAR2(10 BYTE), 
	"MEMBER_ID" VARCHAR2(10 BYTE), 
	"GOODS_ID" VARCHAR2(10 BYTE), 
	"POPUP_TYPE" VARCHAR2(20 BYTE), 
	"POPUP_MESSAGE" VARCHAR2(100 BYTE), 
	"POPUP_IMAGENAME" VARCHAR2(30 BYTE), 
	"CREDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_REVIEW
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_REVIEW" 
   (	"REVIEW_ID" VARCHAR2(10 BYTE), 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"GOODS_ID" VARCHAR2(3 BYTE), 
	"REVIEW_PW" VARCHAR2(20 BYTE), 
	"REVIEW_TITLE" VARCHAR2(40 BYTE), 
	"REVIEW_CONTENT" VARCHAR2(500 BYTE), 
	"REG_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_SEARCH_WORD
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_SEARCH_WORD" 
   (	"SEARCH_WORD_ID" VARCHAR2(10 BYTE), 
	"SEARCH_WORD" VARCHAR2(20 BYTE), 
	"SEARCH_COUNT" NUMBER(5,0), 
	"CREDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table T_SHOPING_USER_RECO
--------------------------------------------------------

  CREATE TABLE "T_SHOPING_USER_RECO" 
   (	"USER_RECO_ID" VARCHAR2(10 BYTE), 
	"MEMBER_ID" VARCHAR2(10 BYTE), 
	"RECO_GOODS_TITLE" VARCHAR2(50 BYTE), 
	"RECO_GOODS_CONTENT" VARCHAR2(1000 BYTE), 
	"RECO_GOODS_IMAGENAME" VARCHAR2(50 BYTE), 
	"CREDATE" DATE DEFAULT sysdate, 
	"GOODS_ID" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into T_GOODS_DETAIL_IMAGE
SET DEFINE OFF;
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('300','334','test_detail_image1.png','admin','detail_image1',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('302','334','test_detail_image3.png','admin','detail_image3',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('303','335','test_main_image.png','admin','main_image',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('304','335','test_detail_image1.png','admin','detail_image1',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('305','335','test_detail_image2.png','admin','detail_image2',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('306','335','test_detail_image3.png','admin','detail_image3',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('307','336','good1_detail_image1.jpg','admin','main_image',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('308','336','good1_detail_image2.jpg','admin','detail_image1',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('309','336','good1_detail_image3.jpg','admin','detail_image2',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('310','336','good1_detail_image3.jpg','admin','detail_image3',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('270','308','test_detail_image3.png','admin','detail_image3',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('268','308','test_detail_image1.png','admin','detail_image1',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('291','301','test_main_image1.png','admin','main_image',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('293','301','test_detail_image2.png','admin','detail_image2',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('283','300','good1_main_image.jpg','admin','main_image',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('284','300','good1_detail_image1.jpg','admin','detail_image1',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('292','301','test_detail_image1.png','admin','detail_image1',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('294','301','test_detail_image3.png','admin','detail_image3',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('285','300','good1_detail_image2.jpg','admin','detail_image2',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('286','300','good1_detail_image3.jpg','admin','detail_image3',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('267','308','test_main_image1.png','admin','main_image',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('269','308','test_detail_image2.png','admin','detail_image2',to_date('16/05/27','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('311','354','test_main_image.png','admin','main_image',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('312','354','test_detail_image1.png','admin','detail_image1',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('313','354','test_detail_image2.png','admin','detail_image2',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('314','354','test_detail_image3.png','admin','detail_image3',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('319','355','cover_idea_java.jpg','admin','main_image',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('320','355','idea_java1.jpg','admin','detail_image1',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('321','355','lens2.jpg','admin','detail_image2',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('322','355','nikon1.jpg','admin','detail_image3',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('299','334','test_main_image.png','admin','main_image',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_DETAIL_IMAGE (IMAGE_ID,GOODS_ID,FILENAME,REG_ID,FILETYPE,CREDATE) values ('301','334','test_detail_image2.png','admin','detail_image2',to_date('16/10/28','RR/MM/DD'));
REM INSERTING into T_GOODS_INFO
SET DEFINE OFF;
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('301','��ǻ�Ϳ� ���ͳ�','아이디어자바','�̺���','�����Ͻ�',30000,30000,1000,to_date('15/05/05','RR/MM/DD'),1212,'121212',2500,to_date('15/06/05','RR/MM/DD'),'bestseller','<pre>
���� �̺����� ���� �Ⱓ �ǹ����� ������ �̷� �� ��ҿ� ������ �ִ� �о߿� �п� ���� �� �Թ��ڵ��� ù ���α׷����� ����� ���� ���� �κа� ������ �����ϸ鼭 ������� ���� ������ ���������� �������� �ڹٸ� ó�� ���� �Թ��ڰ� ���� �ڽ��� ���̵� �����Ͽ� ������ �� �ְ� �����Ͽ� �����ߴ�. 

- ���ڰ��а� ���� 
- ��ó ������� �پ��� ����Ʈ���� ���� ���� 
- ������ �ý��� ���� �۾��� ���õ� ����Ʈ���� ���� ���� 
- IT���α׷��� �п����� ���� 

������ī�� : http://cafe.naver.com/standardjava 
 </pre>','<pre>
�� å�� �а� ���� ���α׷��Ӵ� ���ο� ��ü�� ã�Ƽ� ����� �� ���̰�, �װ��� ���α׷���ȭ �ϴ� ���� ������ ��ü ���� ���α׷����̶�� ����� ���ݰ� �� ���̴�. 

��ü ���� ���α׷����̶� ����� ����ü(subject)���� �ϰ�, ��ü�� �ٶ� ���(���, �繰, ��ü)�� ����ü(object)����� �Ѵ�. ����� �ϻ������� ����, ������, �����ϴ� �������� ���α׷����� �ϴ� ����̴�. 
 </pre>','<pre>
�� å�� ������ �����Դϴ�.�� å�� �ٸ� å���� ����ȭ�� ���� ����帳�ϴ�.�� å�� ����-���͵�뿡�� �������� �������� ���鼭 �ڹ� ���θ� �� �� �ִ�.(���濡 ��� ������� ū ��� �鿩�� ���￡ �� �ʿ���� ���ͳ����� ����� �н� ����)   -�ٸ� å�� �������� å�� �μ����� ���� ������� �����ϰ� ������ �� å�� �������� ���� �������   �����ϹǷ� ���ڿ��� ���ܹ޴� �� ���� �н��� �� �־ �����п��� �ٴϴ� �ͺ��� �ξ� ȿ��������   �н��� �� �ִ�.(��������� å�� ��� ȿ������..
 </pre>','<pre>
�� å�� ������ �����Դϴ�.�� å�� �ٸ� å���� ����ȭ�� ���� ����帳�ϴ�.�� å�� ����-���͵�뿡�� �������� �������� ���鼭 �ڹ� ���θ� �� �� �ִ�.(���濡 ��� ������� ū ��� �鿩�� ���￡ �� �ʿ���� ���ͳ����� ����� �н� ����)   -�ٸ� å�� �������� å�� �μ����� ���� ������� �����ϰ� ������ �� å�� �������� ���� �������   �����ϹǷ� ���ڿ��� ���ܹ޴� �� ���� �н��� �� �־ �����п��� �ٴϴ� �ͺ��� �ξ� ȿ��������   �н��� �� �ִ�.(��������� å�� ��� ȿ������..
 </pre>',to_date('16/05/25','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('308','��ǻ�Ϳ� ���ͳ�','자바이야기','ȫ�浿','������',30000,30000,2000,to_date('15/05/11','RR/MM/DD'),1111,'12121212',2500,to_date('15/06/05','RR/MM/DD'),'newbook','<pre>�� å �Ұ� 
 �� å�� �а� ���� ���α׷��Ӵ� ���ο� ��ü�� ã�Ƽ� ����� �� ���̰�, �װ��� ���α׷���ȭ �ϴ� ���� ������ ��ü ���� ���α׷����̶�� ����� ���ݰ� �� ���̴�. 

��ü ���� ���α׷����̶� ����� ����ü(subject)���� �ϰ�, ��ü�� �ٶ� ���(���, �繰, ��ü)�� ����ü(object)����� �Ѵ�. ����� �ϻ������� ����, ������, �����ϴ� �������� ���α׷����� �ϴ� ����̴�. 

�ڹٸ� ó�� ���ϴ� ����� �ټ� ������ ������ �������� �ݺ��ؼ� �н��� �ϴ� ���� ����� ���α׷��ֿ� �Թ��� �� �ִٴ� ����� ���ݰ� �� ���̴�. �� ���� ������ ���������� �ξ� �����ϱ⿡ �����ϴ�. ���� ������ ī��(http://cafe.naver.com/standardjava)������ �� å�� ������ ��� ������ ���¸� ����� �����Ѵ�.  </pre>','<pre> ���� �̺����� ���� �Ⱓ �ǹ����� ������ �̷� �� ��ҿ� ������ �ִ� �о߿� �п� ���� �� �Թ��ڵ��� ù ���α׷����� ����� ���� ���� �κа� ������ �����ϸ鼭 ������� ���� ������ ���������� �������� �ڹٸ� ó�� ���� �Թ��ڰ� ���� �ڽ��� ���̵� �����Ͽ� ������ �� �ְ� �����Ͽ� �����ߴ�. 

- ���ڰ��а� ���� 
- ��ó ������� �پ��� ����Ʈ���� ���� ���� 
- ������ �ý��� ���� �۾��� ���õ� ����Ʈ���� ���� ���� 
- IT���α׷��� �п����� ���� 

������ī�� : http://cafe.naver.com/standardjava </pre>','<pre>�� å�� �� �ܰ� �н� ��� 

 ù ��° �ܰ�� ���α׷��� ���� �����̴�. 
 : ��ü ���� ���α׷����� ���ϱ� ���ؼ��� �켱 ���� ���α׷��� ����� ������ ���α׷����� Ư¡�� �� �˾ƾ� �Ѵ�. �׸��� �ڹ� ���� ���� ���� ����ϴ� �����̳� ����� �״�� ����ϱ� ������ ���� ���� ���α׷����� �⺻���� Ư¡�̳� ����� �н��� �ʿ䰡 �ִ�. 

�� ��° �ܰ�� �ڹ��� ��ü ���� ���信 ���� ����. 
 : C���� ��ǻ���� ���� ������ �䳻 �� ������ ����̴�. �̷��� ������ �� �ϴµ� �־� ���� ���� �������� ��Ÿ����. ��ǥ�����δ� �ҽ� �ڵ��� �����̴�. ������ ���� ���α׷��� �ʱ⿡ ���� �Ը� Ŀ���� ���� �Ⱓ�� ���� �Ҹ�ȴ�. �ڹٴ� ���� ����� ���뼺, ������ ���̼�, ������ ���� ���� ������ ���� ã�� �ִ�. �� �ܰ��� �ٽ��� ���뼺 �� ���α׷��� ����� ���õ� ��ü ���� ���信 ���� �н��Ѵ�.  </pre>','<pre>�� å�� �� �ܰ� �н� ��� 

 ù ��° �ܰ�� ���α׷��� ���� �����̴�. 
 : ��ü ���� ���α׷����� ���ϱ� ���ؼ��� �켱 ���� ���α׷��� ����� ������ ���α׷����� Ư¡�� �� �˾ƾ� �Ѵ�. �׸��� �ڹ� ���� ���� ���� ����ϴ� �����̳� ����� �״�� ����ϱ� ������ ���� ���� ���α׷����� �⺻���� Ư¡�̳� ����� �н��� �ʿ䰡 �ִ�. 

�� ��° �ܰ�� �ڹ��� ��ü ���� ���信 ���� ����. 
 : C���� ��ǻ���� ���� ������ �䳻 �� ������ ����̴�. �̷��� ������ �� �ϴµ� �־� ���� ���� �������� ��Ÿ����. ��ǥ�����δ� �ҽ� �ڵ��� �����̴�. ������ ���� ���α׷��� �ʱ⿡ ���� �Ը� Ŀ���� ���� �Ⱓ�� ���� �Ҹ�ȴ�. �ڹٴ� ���� ����� ���뼺, ������ ���̼�, ������ ���� ���� ������ ���� ã�� �ִ�. �� �ܰ��� �ٽ��� ���뼺 �� ���α׷��� ����� ���õ� ��ü ���� ���信 ���� �н��Ѵ�.  </pre>',to_date('16/05/25','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('334','ì»´í¨í°ì ì¸í°ë·','jquery 기초','홍길동','한국출판사',20000,20000,1000,to_date('15/05/05','RR/MM/DD'),999,'1122',2000,to_date('15/06/05','RR/MM/DD'),'writer_book','<pre>ìë° ì´ì¼ê¸° </pre>','<pre>ìë° ì´ì¼ê¸° </pre>','<pre>ìë° ì´ì¼ê¸° </pre>','<pre> ìë° ì´ì¼ê¸°</pre>',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('1001','ì»´í¨í°ì ì¸í°ë·','오라클과 자바','111','111',111,111,111,to_date('15/05/05','RR/MM/DD'),111,'111',111,to_date('15/06/05','RR/MM/DD'),'newbook','<pre>12121 </pre>','<pre>121212 </pre>','<pre>12121 </pre>','<pre> 12121</pre>',to_date('16/10/20','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('1002','ì»´í¨í°ì ì¸í°ë·','안드로이드 따라하기','222','222',222,222,222,to_date('15/05/05','RR/MM/DD'),222,'222',222,to_date('15/06/05','RR/MM/DD'),'newbook','<pre>222 </pre>','<pre>222 </pre>','<pre> 222</pre>','<pre>2222 </pre>',to_date('16/10/20','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('335','컴퓨터와 인터넷','자바이야기2','자바이야기','자바이야기',5555,5555,5555,to_date('15/05/05','RR/MM/DD'),5555,'555',5555,to_date('15/06/05','RR/MM/DD'),'steadyseller','<pre>자바이야기 </pre>','<pre>자바이야기 </pre>','<pre>자바이야기 </pre>','<pre>자바이야기 </pre>',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('336','컴퓨터와 인터넷','책으로 배우는 스프링','이순신','한국출판사',23000,9999,9999,to_date('15/05/05','RR/MM/DD'),9999,'999',9999,to_date('15/06/05','RR/MM/DD'),'bestseller','<pre>
『초보자를 위한 Java Programming』은 자바의 객체 지향 개념에 대해 배운다. 자바를 처음 접하
는 사람은 다소 생소한 개념이 나오지만 반복해서 학습을 하다 보면 어느새 프로그래밍에 입문할 
수 있도록 구성하였다. 각 장의 끝에는 연습문제를 두어 독학하기에 적합하다.
 </pre>','<pre>
『초보자를 위한 Java Programming』은 자바의 객체 지향 개념에 대해 배운다. 자바를 처음 접하
는 사람은 다소 생소한 개념이 나오지만 반복해서 학습을 하다 보면 어느새 프로그래밍에 입문할 
수 있도록 구성하였다. 각 장의 끝에는 연습문제를 두어 독학하기에 적합하다.
 </pre>','<pre>『초보자를 위한 Java Programming』은 자바의 객체 지향 개념에 대해 배운다. 자바를 처음 접하
는 사람은 다소 생소한 개념이 나오지만 반복해서 학습을 하다 보면 어느새 프로그래밍에 입문할 
수 있도록 구성하였다. 각 장의 끝에는 연습문제를 두어 독학하기에 적합하다.
 </pre>','<pre>『초보자를 위한 Java Programming』은 자바의 객체 지향 개념에 대해 배운다. 자바를 처음 접하
는 사람은 다소 생소한 개념이 나오지만 반복해서 학습을 하다 보면 어느새 프로그래밍에 입문할 
수 있도록 구성하였다. 각 장의 끝에는 연습문제를 두어 독학하기에 적합하다.
 </pre>',to_date('16/10/28','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('1000','ì»´í¨í°ì ì¸í°ë·','JSP 배우기','111','111',111,111,111,to_date('15/05/05','RR/MM/DD'),111,'111',111,to_date('15/06/05','RR/MM/DD'),'newbook','<pre>12121 </pre>','<pre>121212 </pre>','<pre>12121 </pre>','<pre> 12121</pre>',to_date('16/10/20','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('354','컴퓨터와 인터넷','자바를 배우자','홍길동1','한국출판사',23000,23000,100,to_date('15/05/05','RR/MM/DD'),780,'1211212',2500,to_date('15/06/05','RR/MM/DD'),'bestseller','<pre>
저자 이병승은 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다. 

- 전자공학과 졸업 
- 벤처 기업에서 다양한 소프트웨어 개발 참여 
- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여 
- IT프로그래밍 학원에서 강의 

※저자카페 : http://cafe.naver.com/standardjava 

 </pre>','<pre> 
저자 이병승은 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다. 

- 전자공학과 졸업 
- 벤처 기업에서 다양한 소프트웨어 개발 참여 
- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여 
- IT프로그래밍 학원에서 강의 

※저자카페 : http://cafe.naver.com/standardjava 

</pre>','<pre>
저자 이병승은 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다. 

- 전자공학과 졸업 
- 벤처 기업에서 다양한 소프트웨어 개발 참여 
- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여 
- IT프로그래밍 학원에서 강의 

※저자카페 : http://cafe.naver.com/standardjava 
 </pre>','<pre>
저자 이병승은 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다. 

- 전자공학과 졸업 
- 벤처 기업에서 다양한 소프트웨어 개발 참여 
- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여 
- IT프로그래밍 학원에서 강의 

※저자카페 : http://cafe.naver.com/standardjava 

 </pre>',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('355','컴퓨터와 인터넷','안드로이드 배우기','홍길동','555',555,555,555,to_date('15/05/05','RR/MM/DD'),555,'555',555,to_date('15/06/05','RR/MM/DD'),'discount_book','<pre>5555 </pre>','<pre> 555</pre>','<pre>5555 </pre>','<pre>5555 </pre>',to_date('16/10/31','RR/MM/DD'));
Insert into T_GOODS_INFO (GOODS_ID,GOODS_SORT,GOODS_TITLE,GOODS_WRITER,GOODS_PUBLISHER,GOODS_PRICE,GOODS_SALES_PRICE,GOODS_POINT,GOODS_PUBLISHED_DATE,GOODS_TOTAL_PAGE,GOODS_ISBN,GOODS_DELIVERY_PRICE,GOODS_DELIVERY_DATE,GOODS_TYPE,GOODS_INTRO,GOODS_WRITER_INTRO,GOODS_PUBLISHER_COMMENT,GOODS_RECOMMENDATION,GOODS_CREDATE) values ('300','��ǻ�Ϳ� ���ͳ�','초보자를 위한 자바 프로그래밍','�̺���','�����Ͻ�',30000,30000,1000,to_date('15/05/05','RR/MM/DD'),1000,'12121',2500,to_date('15/06/05','RR/MM/DD'),'newbook','<pre>

���� : �̺��� 
  
���� �̺����� ���� �Ⱓ �ǹ����� ������ �̷� �� ��ҿ� ������ �ִ� �о߿� �п� ���� �� �Թ��ڵ��� ù ���α׷����� ����� ���� ���� �κа� ������ �����ϸ鼭 ������� ���� ������ ����������
 �������� �ڹٸ� ó�� ���� �Թ��ڰ� ���� �ڽ��� ���̵� �����Ͽ� ������ �� �ְ� �����Ͽ� �����ߴ�. 

- ���ڰ��а� ���� 
- ��ó ������� �پ��� ����Ʈ���� ���� ���� 
- ������ �ý��� ���� �۾��� ���õ� ����Ʈ���� ���� ���� 
- IT���α׷��� �п����� ����  </pre>','<pre>



�� å �Ұ� 
 �� å�� �а� ���� ���α׷��Ӵ� ���ο� ��ü�� ã�Ƽ� ����� �� ���̰�, �װ��� ���α׷���ȭ �ϴ� ���� ������ ��ü ���� ���α׷����̶�� ����� ���ݰ� �� ���̴�. 

��ü ���� ���α׷����̶� ����� ����ü(subject)���� �ϰ�, ��ü�� �ٶ� ���(���, �繰, ��ü)�� ����ü(object)����� �Ѵ�. ����� �ϻ������� ����, ������, �����ϴ� �������� ���α׷����� �ϴ� ����̴�.  </pre>','<pre>���ǻ� ����


�� å �Ұ� 
 �� å�� �а� ���� ���α׷��Ӵ� ���ο� ��ü�� ã�Ƽ� ����� �� ���̰�, �װ��� ���α׷���ȭ �ϴ� ���� ������ ��ü ���� ���α׷����̶�� ����� ���ݰ� �� ���̴�. 

��ü ���� ���α׷����̶� ����� ����ü(subject)���� �ϰ�, ��ü�� �ٶ� ���(���, �繰, ��ü)�� ����ü(object)����� �Ѵ�. ����� �ϻ������� ����, ������, �����ϴ� �������� ���α׷����� �ϴ� ����̴�.  
</pre>','<pre> 
���ǻ� ����


�� å �Ұ� 
 �� å�� �а� ���� ���α׷��Ӵ� ���ο� ��ü�� ã�Ƽ� ����� �� ���̰�, �װ��� ���α׷���ȭ �ϴ� ���� ������ ��ü ���� ���α׷����̶�� ����� ���ݰ� �� ���̴�. 

��ü ���� ���α׷����̶� ����� ����ü(subject)���� �ϰ�, ��ü�� �ٶ� ���(���, �繰, ��ü)�� ����ü(object)����� �Ѵ�. ����� �ϻ������� ����, ������, �����ϴ� �������� ���α׷����� �ϴ� ����̴�. 
</pre>',to_date('16/05/25','RR/MM/DD'));
REM INSERTING into T_MEMBER
SET DEFINE OFF;
Insert into T_MEMBER (ID,NAME,WEIGHT,HEIGHT,AGE) values ('0001','홍길동',77,177,22);
Insert into T_MEMBER (ID,NAME,WEIGHT,HEIGHT,AGE) values ('0002','이순신',66,166,33);
Insert into T_MEMBER (ID,NAME,WEIGHT,HEIGHT,AGE) values ('0003','임꺽정',88,188,25);
REM INSERTING into T_SHOPING_CART

SET DEFINE OFF;
Insert into T_SHOPING_MAIN_SETTING (MAIN_SETTING_ID,MEMBER_ID,GOODS_TYPE,SHOW_YN,CREDATE) values ('2','kim1','review_book','n',to_date('16/11/09','RR/MM/DD'));
Insert into T_SHOPING_MAIN_SETTING (MAIN_SETTING_ID,MEMBER_ID,GOODS_TYPE,SHOW_YN,CREDATE) values ('3','kim1','brand_book','n',to_date('16/11/09','RR/MM/DD'));
Insert into T_SHOPING_MAIN_SETTING (MAIN_SETTING_ID,MEMBER_ID,GOODS_TYPE,SHOW_YN,CREDATE) values ('4','kim1','writer_book','n',to_date('16/11/09','RR/MM/DD'));
Insert into T_SHOPING_MAIN_SETTING (MAIN_SETTING_ID,MEMBER_ID,GOODS_TYPE,SHOW_YN,CREDATE) values ('5','kim1','bestseller','y',to_date('16/11/09','RR/MM/DD'));
Insert into T_SHOPING_MAIN_SETTING (MAIN_SETTING_ID,MEMBER_ID,GOODS_TYPE,SHOW_YN,CREDATE) values ('6','kim1','newbook','y',to_date('16/11/09','RR/MM/DD'));
Insert into T_SHOPING_MAIN_SETTING (MAIN_SETTING_ID,MEMBER_ID,GOODS_TYPE,SHOW_YN,CREDATE) values ('7','kim1','discount_book','n',to_date('16/11/09','RR/MM/DD'));
Insert into T_SHOPING_MAIN_SETTING (MAIN_SETTING_ID,MEMBER_ID,GOODS_TYPE,SHOW_YN,CREDATE) values ('8','kim1','steadyseller','y',to_date('16/11/09','RR/MM/DD'));
REM INSERTING into T_SHOPING_MEMBER
SET DEFINE OFF;
Insert into T_SHOPING_MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_GENDER,TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,ZIPCODE,ROADADDRESS,JIBUNADDRESS,NAMUJIADDRESS,MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D,MEMBER_BIRTH_GN,JOINDATE,DEL_YN) values ('kim1','1212','김유신','101','02','1111','111','010','1111','1111','Y','kim','gmail.com,non','Y','17020','경기 용인시 처인구 관전로 3 (역북동)','경기 용인시 처인구 역북동 399-10','310호','2000','5','10','2',to_date('16/11/09','RR/MM/DD'),'N');
Insert into T_SHOPING_MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_GENDER,TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,ZIPCODE,ROADADDRESS,JIBUNADDRESS,NAMUJIADDRESS,MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D,MEMBER_BIRTH_GN,JOINDATE,DEL_YN) values ('hong','1212','ȫ�浿','101','02','1111','1111','010','1111','           1111','true','hong','google.com','false','16661','��� ������ �Ǽ��� ������ 89-2 (��Ȳ����)','��� ������ �Ǽ��� ��Ȳ���� 248-26','�ѳ����� 1111ȣ','1996','5','10','2',to_date('16/05/17','RR/MM/DD'),'N');
Insert into T_SHOPING_MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_GENDER,TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,ZIPCODE,ROADADDRESS,JIBUNADDRESS,NAMUJIADDRESS,MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D,MEMBER_BIRTH_GN,JOINDATE,DEL_YN) values ('admin','1212','����','102','02','1111','1111','010','1111','111','Y','admin','bookshop.com,non','Y','05811','���� ���ı� ������12�� 16 (������, ��������Ÿ��4����)','���� ���ı� ������ 837','111ȣ','2001','5','10','2',to_date('16/05/25','RR/MM/DD'),'N');
Insert into T_SHOPING_MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_GENDER,TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,ZIPCODE,ROADADDRESS,JIBUNADDRESS,NAMUJIADDRESS,MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D,MEMBER_BIRTH_GN,JOINDATE,DEL_YN) values ('lee','1212','�̼���','101','02','3333',' 1111','010','2222',' 2222','true','leebs126','google.com,non','Y','04417','���� ��걸 �ٻ�� 8-11 (�ѳ���)','���� ��걸 �ѳ��� 726-180','�������� 1112ȣ','2001','8','17','2',to_date('16/05/23','RR/MM/DD'),'N');
Insert into T_SHOPING_MEMBER (MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_GENDER,TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,ZIPCODE,ROADADDRESS,JIBUNADDRESS,NAMUJIADDRESS,MEMBER_BIRTH_Y,MEMBER_BIRTH_M,MEMBER_BIRTH_D,MEMBER_BIRTH_GN,JOINDATE,DEL_YN) values ('kim','1212','김유신','101','02','1111','2222','010','3333','4444','Y','leebs126','gmail.com,non','Y','11159','경기 포천시 호국로 1007 (선단동)','경기 포천시 자작동 산 32-3','정보전산원 101호','2000','10','20','2',to_date('16/10/28','RR/MM/DD'),'N');
REM INSERTING into T_SHOPING_ORDER
SET DEFINE OFF;
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('68','81','kim','301','김유신','아이디어자바',3,30000,'test_main_image1.png','홍길동','010','5555','6666','02','8888','9999','우편번호:04403<br>도로명 주소:서울 용산구 대사관로 20 (한남동)<br>[지번 주소:서울 용산구 한남동 686-63]<br>한남빌딩','일반택배','부재 시 옆집에 맡겨 주세요.','no','신용카드<Br>카드사:하나SK<br>할부개월수:3개월','하나SK','3개월','해당없음','delivering',to_date('16/10/28','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('69','82','kim','300','김유신','초보자를 위한 자바 프로그래밍',1,30000,'good1_main_image.jpg','김유신','010','3333','4444','02','1111','2222','우편번호:11159<br>도로명 주소:경기 포천시 호국로 1007 (선단동)<br>[지번 주소:경기 포천시 자작동 산 32-3]<br>정보전산원 101호','일반택배','택배 기사님께 전달할 메시지를 남겨주세요.','no','신용카드<Br>카드사:삼성<br>할부개월수:일시불','삼성','일시불','해당없음','delivering',to_date('16/10/28','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('6','75','admin','301','����','�ʺ��ڸ� �����ڹ����α׷���',1,30000,'test_main_image1.png','����','010','1111','111','02','1111','1111','�����ȣ:05811<br>���θ� �ּ�:���� ���ı� ������12�� 16 (������, ��������Ÿ��4����)<br>[���� �ּ�:���� ���ı� ������ 837]<br>111ȣ','�Ϲ��ù�','�ù� ���Բ� ������ �޽����� �����ּ���.','no','�ſ�ī��<Br>ī���:�ϳ�SK<br>�Һΰ�����:2����','�ϳ�SK','2����','�ش����','delivery_prepared',to_date('16/05/27','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('7','76','hong','308','ȫ�浿','�ʺ��ڹ�',1,30000,'test_main_image1.png','�̼���','010','1111','           1111','02','1111','1111','�����ȣ:16661<br>���θ� �ּ�:��� ������ �Ǽ��� ������ 89-2 (��Ȳ����)<br>[���� �ּ�:��� ������ �Ǽ��� ��Ȳ���� 248-26]<br>�ѳ����� 1111ȣ','�Ϲ��ù�','�ù� ���Բ� ������ �޽����� �����ּ���.','no','�ſ�ī��<Br>ī���:�Ｚ<br>�Һΰ�����:�Ͻú�','�Ｚ','�Ͻú�','�ش����','delivering',to_date('16/05/27','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('28','79','lee','301','�̼���','�ʺ��ڸ� �����ڹ����α׷���',1,30000,'test_main_image1.png','�̼���','010','2222','2222','02','111','1111','�����ȣ:04417<br>���θ� �ּ�:���� ��걸 �ٻ�� 8-11 (�ѳ���)<br>[���� �ּ�:���� ��걸 �ѳ��� 726-180]<br>�������� 1112ȣ','�Ϲ��ù�','�ù� ���Բ� ������ �޽����� �����ּ���.','no','�ſ�ī��<Br>ī���:�Ｚ<br>�Һΰ�����:�Ͻú�','�Ｚ','�Ͻú�','�ش����','delivery_prepared',to_date('16/06/07','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('5','74','admin','309','����','�Ϻ����� ���� �͵鿡 ���� ���',1,13320,'test_main_image.png','����','010','1111','111','02','1111','1111','�����ȣ:05811<br>���θ� �ּ�:���� ���ı� ������12�� 16 (������, ��������Ÿ��4����)<br>[���� �ּ�:���� ���ı� ������ 837]<br>111ȣ','�Ϲ��ù�','�ù� ���Բ� ������ �޽����� �����ּ���.','no','�ſ�ī��<Br>ī���:�Ｚ<br>�Һΰ�����:�Ͻú�','�Ｚ','�Ͻú�','�ش����','delivery_prepared',to_date('16/05/26','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('8','77','lee','300','�̼���','���̵�� �ڹ�',1,30000,'good1_main_image.jpg','�̼���','010','2222','2222','02','111','1111','�����ȣ:04417<br>���θ� �ּ�:���� ��걸 �ٻ�� 8-11 (�ѳ���)<br>[���� �ּ�:���� ��걸 �ѳ��� 726-180]<br>�������� 1112ȣ','�Ϲ��ù�','���� �� ���ǿ� �ð� �ּ���','no','�ſ�ī��<Br>ī���:����<br>�Һΰ�����:3����','����','3����','�ش����','delivering',to_date('16/06/07','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('9','77','lee','301','�̼���','�ʺ��ڸ� �����ڹ����α׷���',1,30000,'test_main_image1.png','�̼���','010','2222','2222','02','111','1111','�����ȣ:04417<br>���θ� �ּ�:���� ��걸 �ٻ�� 8-11 (�ѳ���)<br>[���� �ּ�:���� ��걸 �ѳ��� 726-180]<br>�������� 1112ȣ','�Ϲ��ù�','���� �� ���ǿ� �ð� �ּ���','no','�ſ�ī��<Br>ī���:����<br>�Һΰ�����:3����','����','3����','�ش����','delivering',to_date('16/06/07','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('10','78','lee','308','�̼���','�ʺ��ڹ�',1,30000,'test_main_image1.png','�̼���','010','2222','2222','02','111','1111','�����ȣ:04417<br>���θ� �ּ�:���� ��걸 �ٻ�� 8-11 (�ѳ���)<br>[���� �ּ�:���� ��걸 �ѳ��� 726-180]<br>�������� 1112ȣ','�Ϲ��ù�','�ù� ���Բ� ������ �޽����� �����ּ���.','no','�ſ�ī��<Br>ī���:�Ｚ<br>�Һΰ�����:�Ͻú�','�Ｚ','�Ͻú�','�ش����','delivery_prepared',to_date('16/06/07','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('88','83','kim','335','김유신','자바이야기',1,5555,'test_main_image.png','김유신','010','3333','4444','02','1111','2222','우편번호:11159<br>도로명 주소:경기 포천시 호국로 1007 (선단동)<br>[지번 주소:경기 포천시 자작동 산 32-3]<br>정보전산원 101호','일반택배','택배 기사님께 전달할 메시지를 남겨주세요.','no','신용카드<Br>카드사:하나SK<br>할부개월수:일시불','하나SK','일시불','해당없음','cancel_order',to_date('16/10/31','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('89','83','kim','301','김유신','아이디어자바',1,30000,'test_main_image1.png','김유신','010','3333','4444','02','1111','2222','우편번호:11159<br>도로명 주소:경기 포천시 호국로 1007 (선단동)<br>[지번 주소:경기 포천시 자작동 산 32-3]<br>정보전산원 101호','일반택배','택배 기사님께 전달할 메시지를 남겨주세요.','no','신용카드<Br>카드사:하나SK<br>할부개월수:일시불','하나SK','일시불','해당없음','cancel_order',to_date('16/10/31','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('90','84','kim','335','김유신','자바이야기',1,5555,'test_main_image.png','김유신','010','3333','4444','02','1111','2222','우편번호:11159<br>도로명 주소:경기 포천시 호국로 1007 (선단동)<br>[지번 주소:경기 포천시 자작동 산 32-3]<br>정보전산원 101호','일반택배','택배 기사님께 전달할 메시지를 남겨주세요.','no','신용카드<Br>카드사:삼성<br>할부개월수:일시불','삼성','일시불','해당없음','finished_delivering',to_date('16/10/31','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('91','85','kim','354','김유신','자바를 배우자',1,23000,'test_main_image.png','김유신','010','3333','4444','02','1111','2222','우편번호:11159<br>도로명 주소:경기 포천시 호국로 1007 (선단동)<br>[지번 주소:경기 포천시 자작동 산 32-3]<br>정보전산원 101호','일반택배','택배 기사님께 전달할 메시지를 남겨주세요.','no','신용카드<Br>카드사:삼성<br>할부개월수:일시불','삼성','일시불','해당없음','delivery_prepared',to_date('16/10/31','RR/MM/DD'));
Insert into T_SHOPING_ORDER (ORDER_SEQ_NUM,ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE,ORDER_GOODS_QTY,GOODS_SALES_PRICE,GOODS_FILENAME,RECEIVER_NAME,RECEIVER_HP1,RECEIVER_HP2,RECEIVER_HP3,RECEIVER_TEL1,RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS,DELIVERY_METHOD,DELIVERY_MESSAGE,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME,CARD_PAY_MONTH,PAY_ORDERER_HP_NUM,DELIVERY_STATE,PAY_ORDER_TIME) values ('108','86','kim1','354','김유신','자바를 배우자',1,23000,'test_main_image.png','김유신','010','1111','1111','02','1111','111','우편번호:17020<br>도로명 주소:경기 용인시 처인구 관전로 3 (역북동)<br>[지번 주소:경기 용인시 처인구 역북동 399-10]<br>310호','일반택배','택배 기사님께 전달할 메시지를 남겨주세요.','no','신용카드<Br>카드사:삼성<br>할부개월수:일시불','삼성','일시불','해당없음','delivery_prepared',to_date('16/11/18','RR/MM/DD'));
REM INSERTING into T_SHOPING_POPUP
SET DEFINE OFF;
Insert into T_SHOPING_POPUP (POPUP_ID,MEMBER_ID,GOODS_ID,POPUP_TYPE,POPUP_MESSAGE,POPUP_IMAGENAME,CREDATE) values ('52','admin','355','newbook','eee  ','cover_idea_java.jpg',to_date('16/11/21','RR/MM/DD'));
Insert into T_SHOPING_POPUP (POPUP_ID,MEMBER_ID,GOODS_ID,POPUP_TYPE,POPUP_MESSAGE,POPUP_IMAGENAME,CREDATE) values ('53','admin','354','newbook','추천책입니다.
     ','test_main_image.png',to_date('16/11/21','RR/MM/DD'));
REM INSERTING into T_SHOPING_REVIEW
SET DEFINE OFF;
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('0001','kim','354','1212','테스트입니다.','좋은책 감사합니다.',to_date('16/11/01','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('0002','hong','354','1212','책 리뷰입니다.','테스트 글입니다.',to_date('16/11/01','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('0003','hong','354','1212','test','test글입니다.',to_date('16/11/01','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('28','kim','354','1212','안녕하세요','안녕하세요  ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('29','kim','354','1212','3333','ㄹㄹㄹㄹ        ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('30','kim','354','1111','안녕하세요','도서평을 입력하세요!!                        ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('31','kim','354','1111','9999','00000                ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('5','kim','354','3333','333','도서평을 입력하세요!!                        ',to_date('16/11/02','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('21','lee','336','1212','서평','좋은 책입니다.',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('22','kim','354','1111','1111','도서평을 입력하세요!!                        ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('23','kim','354','34344','3434','34343  ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('24','kim','354','6666','666','6666      ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('25','kim','354','1212','hello','hello  ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('26','kim','354','5555','5555','5555   ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('27','kim','354','1212','7777','안녕하세요                    ',to_date('16/11/03','RR/MM/DD'));
Insert into T_SHOPING_REVIEW (REVIEW_ID,MEMBER_ID,GOODS_ID,REVIEW_PW,REVIEW_TITLE,REVIEW_CONTENT,REG_DATE) values ('4','kim','354','1111','리뷰','도서평을 입력하세요!!                        ',to_date('16/11/02','RR/MM/DD'));
REM INSERTING into T_SHOPING_SEARCH_WORD
SET DEFINE OFF;
Insert into T_SHOPING_SEARCH_WORD (SEARCH_WORD_ID,SEARCH_WORD,SEARCH_COUNT,CREDATE) values ('0001','토익',100,to_date('16/11/10','RR/MM/DD'));
Insert into T_SHOPING_SEARCH_WORD (SEARCH_WORD_ID,SEARCH_WORD,SEARCH_COUNT,CREDATE) values ('0002','자바',200,to_date('16/11/10','RR/MM/DD'));
Insert into T_SHOPING_SEARCH_WORD (SEARCH_WORD_ID,SEARCH_WORD,SEARCH_COUNT,CREDATE) values ('0003','만화',300,to_date('16/11/10','RR/MM/DD'));
Insert into T_SHOPING_SEARCH_WORD (SEARCH_WORD_ID,SEARCH_WORD,SEARCH_COUNT,CREDATE) values ('0004','자기 계발서',4000,to_date('16/11/10','RR/MM/DD'));
Insert into T_SHOPING_SEARCH_WORD (SEARCH_WORD_ID,SEARCH_WORD,SEARCH_COUNT,CREDATE) values ('0005','과학',500,to_date('16/11/10','RR/MM/DD'));
REM INSERTING into T_SHOPING_USER_RECO
SET DEFINE OFF;
Insert into T_SHOPING_USER_RECO (USER_RECO_ID,MEMBER_ID,RECO_GOODS_TITLE,RECO_GOODS_CONTENT,RECO_GOODS_IMAGENAME,CREDATE,GOODS_ID) values ('5','kim1','3333','3333     ','Chrysanthemum.jpg',to_date('16/11/14','RR/MM/DD'),'354');
Insert into T_SHOPING_USER_RECO (USER_RECO_ID,MEMBER_ID,RECO_GOODS_TITLE,RECO_GOODS_CONTENT,RECO_GOODS_IMAGENAME,CREDATE,GOODS_ID) values ('6','kim1','다른 좋은 책을 추천합니다.',' JSP 이야기를 같이 읽으면 좋습니다.
           ','test.jpg',to_date('16/11/14','RR/MM/DD'),'354');
Insert into T_SHOPING_USER_RECO (USER_RECO_ID,MEMBER_ID,RECO_GOODS_TITLE,RECO_GOODS_CONTENT,RECO_GOODS_IMAGENAME,CREDATE,GOODS_ID) values ('21','kim1','추천합니다.','아이디어 자바와 읽으면 좋습니다.
           ','Chrysanthemum.jpg',to_date('16/11/21','RR/MM/DD'),'308');
Insert into T_SHOPING_USER_RECO (USER_RECO_ID,MEMBER_ID,RECO_GOODS_TITLE,RECO_GOODS_CONTENT,RECO_GOODS_IMAGENAME,CREDATE,GOODS_ID) values ('0001','kim1','이 책 다음에 읽으면 좋은 책입니다.','이 책은 기초이므로 다음의 책을 읽으면 도움됩니다.','Lighthouse.jpg',to_date('16/11/11','RR/MM/DD'),'354');
Insert into T_SHOPING_USER_RECO (USER_RECO_ID,MEMBER_ID,RECO_GOODS_TITLE,RECO_GOODS_CONTENT,RECO_GOODS_IMAGENAME,CREDATE,GOODS_ID) values ('0002','kim1','추천제목','좋은 책입니다.','test.jpg',to_date('16/11/11','RR/MM/DD'),'354');
Insert into T_SHOPING_USER_RECO (USER_RECO_ID,MEMBER_ID,RECO_GOODS_TITLE,RECO_GOODS_CONTENT,RECO_GOODS_IMAGENAME,CREDATE,GOODS_ID) values ('0003','kim1','다른 도서 추천','JSP이야기와 같이 읽으면 좋습니다.','Penguins.jpg',to_date('16/11/11','RR/MM/DD'),'354');
--------------------------------------------------------
--  DDL for Index SYS_C007201
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007201" ON "T_GOODS_DETAIL_IMAGE" ("IMAGE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007322
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007322" ON "T_GOODS_INFO" ("GOODS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "T_MEMBER_PK" ON "T_MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007305
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007305" ON "T_SHOPING_CART" ("CART_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007043
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007043" ON "T_SHOPING_MAIN_SETTING" ("MAIN_SETTING_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index T_SHOPING_MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "T_SHOPING_MEMBER_PK" ON "T_SHOPING_MEMBER" ("MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007319
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007319" ON "T_SHOPING_ORDER" ("ORDER_SEQ_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007048
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007048" ON "T_SHOPING_POPUP" ("POPUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007031
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007031" ON "T_SHOPING_REVIEW" ("REVIEW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007045
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007045" ON "T_SHOPING_SEARCH_WORD" ("SEARCH_WORD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007052
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007052" ON "T_SHOPING_USER_RECO" ("USER_RECO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table T_GOODS_DETAIL_IMAGE
--------------------------------------------------------

  ALTER TABLE "T_GOODS_DETAIL_IMAGE" ADD PRIMARY KEY ("IMAGE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_GOODS_INFO
--------------------------------------------------------

  ALTER TABLE "T_GOODS_INFO" ADD PRIMARY KEY ("GOODS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_MEMBER
--------------------------------------------------------

  ALTER TABLE "T_MEMBER" ADD CONSTRAINT "T_MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "T_MEMBER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_SHOPING_CART
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_CART" ADD PRIMARY KEY ("CART_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_SHOPING_MAIN_SETTING
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_MAIN_SETTING" ADD PRIMARY KEY ("MAIN_SETTING_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_SHOPING_MEMBER
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "T_SHOPING_MEMBER" ADD CONSTRAINT "T_SHOPING_MEMBER_PK" PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_SHOPING_ORDER
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_ORDER" ADD PRIMARY KEY ("ORDER_SEQ_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_SHOPING_POPUP
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_POPUP" ADD PRIMARY KEY ("POPUP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_SHOPING_REVIEW
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_REVIEW" ADD PRIMARY KEY ("REVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_SHOPING_SEARCH_WORD
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_SEARCH_WORD" ADD PRIMARY KEY ("SEARCH_WORD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table T_SHOPING_USER_RECO
--------------------------------------------------------

  ALTER TABLE "T_SHOPING_USER_RECO" ADD PRIMARY KEY ("USER_RECO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;



--------------------------------------------------------
--  DDL for Sequence ORDER_SEQ_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "ORDER_SEQ_NUM"  MINVALUE 0 MAXVALUE 10000000 INCREMENT BY 1 START WITH 128 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GOODS_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_GOODS_ID"  MINVALUE 100 MAXVALUE 1000000 INCREMENT BY 1 START WITH 374 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_IMAGE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_IMAGE_ID"  MINVALUE 1 MAXVALUE 11111111 INCREMENT BY 1 START WITH 323 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MAIN_SETTING_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MAIN_SETTING_ID"  MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDER_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ORDER_ID"  MINVALUE 0 MAXVALUE 10000000 INCREMENT BY 1 START WITH 87 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_POPUP_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_POPUP_ID"  MINVALUE 1 MAXVALUE 11111111 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REVIEW_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_REVIEW_ID"  MINVALUE 1 MAXVALUE 10000000 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USER_RECO_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_USER_RECO_ID"  MINVALUE 1 MAXVALUE 11111111 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
