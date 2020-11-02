create user c##dragon identified by 1234;
grant connect, resource, dba to c##dragon;

create table Mem(
userId VARCHAR(50),
userPwd varchar(50),
userName varchar(50),
birthday varchar(50),
phoneNo VARCHAR(50),
email varchar(50),
lastConn Date DEFAULT Sysdate,
enabled char(1) default '1',
primary key(userId),
    unique(userName),
coin number DEFAULT 10000 NOT NULL
);

create table tbl_member_auth(
userId varchar2(50) not null,
auth varchar(50) not null,
constraint fk_authorities_auth foreign key(userId) references mem(userId));

create unique index ix_auth_userId on tbl_member_auth(userId,auth);

create table persistent_logins(
username varchar(64) not null,
series varchar(64) primary key,
token varchar(64) not null,
last_used timestamp not null,
constraint fk_persistent_logins foreign key(username) references mem(userid)
on delete cascade);


create table folder (
folderId number(10, 0) not null,
folderTitle varchar2(100) not null,
description varchar2(200),
link varchar2(200) not null,
userId varchar2(50) not null,
regdate Date DEFAULT Sysdate,
constraint pk_folder primary key(folderId),
constraint pk_foldertitle unique(folderTitle),
constraint fk_folder foreign key(userid) references mem(userid)
on delete cascade);


create table wordBook (
bookId number(10, 0) not null,
folderId number(10, 0),
userId varchar2(100) not null,
wordTitle varchar2(100) not null,
constraint pk_wordbook primary key(bookId)
);

create sequence seq_folder
increment by 1
nocycle
nocache
;

create sequence seq_wordbook
increment by 1
nocycle
nocache
;


create table recentStudy (
  userId VARCHAR(50),
  bookId varchar(50),
  bookTitle varchar(50),
  studyDate date DEFAULT sysdate 
);



create table product(
proid number primary key,
proname nvarchar2(40),
proimg nvarchar2(70),
price number(10),
category nvarchar2(30),
description nvarchar2(200)
);

commit;

create table dragoninfo(
userid varchar2(50) not null,
totallevel number(10) not null,
levelvalue number(3) not null,
foodvalue number(3) not null,
toyvalue number(3) not null,
equip varchar2(1) not null,
backgroundid number not null,
dragonid number not null,
CONSTRAINT FK_DRAGON_USERID FOREIGN KEY(userid) REFERENCES MEM(userid)  on delete cascade,
CONSTRAINT PK_DRAGON_USERID PRIMARY KEY(userid, dragonid),
CONSTRAINT FK_DRAGON_DRAGONID FOREIGN KEY(dragonid) REFERENCES DRAGONLIST(DRAGONID)

);


create table dragonlist(
dragonid number primary key, 
eggid number not null,
level1 nvarchar2(80) not null,
level2 nvarchar2(80) not null,
level3 nvarchar2(80) not null,
CONSTRAINT FK_DRAGON_EGGID FOREIGN KEY(eggid) REFERENCES PRODUCT(PROID)
);



create table inventory(
inventoryid VARCHAR2(50) not null,
userid VARCHAR2(50) not null,
productid number not null,
amount number not null,
orderDate Date default sysdate,
primary key(inventoryId),
CONSTRAINT product_productId FOREIGN KEY(productid)
REFERENCES product(proid) on delete cascade,
CONSTRAINT FK_PRODUCT_USERID FOREIGN KEY(userid) REFERENCES MEM(userid)  on delete cascade


);



















insert into product values(1,'meat','../resources/images/food/meat.svg', 1000, 'item', '������ +10 ����');
insert into product values(2,'fish','../resources/images/food/fish.svg', 700, 'item', '������ +5 ����');
insert into product values(3,'potion','../resources/images/food/potion.svg', 1000, 'item', '����ġ +10 ����');
insert into product values(4,'apple','../resources/images/food/apple.svg', 500, 'item', '������ +3 ����');
insert into product values(5,'����� ��','../resources/images/egg/egg_1.svg', 3000, 'egg', '�������� ���� �ź��� ��');
insert into product values(6,'��ȫ�� ��','../resources/images/egg/egg_2.svg', 3000, 'egg', '��ȫ���� ���� �ź��� ��');
insert into product values(7,'��Ȳ�� ��','../resources/images/egg/egg_3.svg', 3000, 'egg', '��Ȳ���� ���� �ź��� ��');
insert into product values(8,'����� ��','../resources/images/egg/egg_4.svg', 3000, 'egg', '������� ���� �ź��� ��');
insert into product values(9,'��','../resources/images/egg/egg_5.svg', 3000, 'egg', '�⺻���� �����Ǵ� ��');
insert into product values(10,'�Ķ��� ��','../resources/images/egg/egg_6.svg', 3000, 'egg', '�Ķ����� ���� �ź��� ��');
insert into product values(11,'space','../resources/images/background/space_background.png', 3000, 'background', 'space');
insert into product values(12,'���̸�','../resources/images/dragon/���̸�.png', -1, 'dragon', '���̸�');
insert into product values(13,'���ڵ�','../resources/images/dragon/���ڵ�.png', -1, 'dragon', '���ڵ�');
insert into product values(14,'���ڸ�','../resources/images/dragon/���ڸ�.png', -1, 'dragon', '���ڸ�');
insert into product values(15,'�̻��ؾ�','../resources/images/dragon/�̻��ؾ�.png', -1, 'dragon', '�̻��ؾ�');
insert into product values(16,'�̻���Ǯ','../resources/images/dragon/�̻���Ǯ.png', -1, 'dragon', '�̻���Ǯ');
insert into product values(17,'�̻��ز�','../resources/images/dragon/�̻��ز�.png', -1, 'dragon', '�̻��ز�');
insert into product values(18,'���α�','../resources/images/dragon/���α�.png', -1, 'dragon', '���α�');
insert into product values(19,'��Ϻα�','../resources/images/dragon/��Ϻα�.png', -1, 'dragon', '��Ϻα�');
insert into product values(20,'�źϿ�','../resources/images/dragon/�źϿ�.png', -1, 'dragon', '�źϿ�');
insert into product values(21,'graydot','../resources/images/background/gray_dot_background.png', 3000, 'background', 'graydot');
insert into product values(22,'cloud','../resources/images/background/cloud_background.png',3000, 'background', 'cloud');
insert into product values(23,'ĳ����','../resources/images/dragon/ĳ����.png', -1, 'dragon', 'ĳ����');
insert into product values(24,'�ܵ���','../resources/images/dragon/�ܵ���.png', -1, 'dragon', '�ܵ���');
insert into product values(25,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(26,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(27,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(28,'��ħ��','../resources/images/dragon/��ħ��.png', -1, 'dragon', '��ħ��');
insert into product values(29,'����','../resources/images/dragon/����.png', -1, 'dragon', '����');
insert into product values(30,'����','../resources/images/dragon/����.png', -1, 'dragon', '����');
insert into product values(31,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(32,'����','../resources/images/dragon/����.png', -1, 'dragon', '����');
insert into product values(33,'��ī��','../resources/images/dragon/��ī��.png', -1, 'dragon', '��ī��');
insert into product values(34,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(35,'�ѹ���','../resources/images/dragon/�ѹ���.png', -1, 'dragon', '�ѹ���');
insert into product values(36,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(37,'���÷��þ�','../resources/images/dragon/���÷��þ�.png', -1, 'dragon', '���÷��þ�');
insert into product values(38,'��ì��','../resources/images/dragon/��ì��.png', -1, 'dragon', '��ì��');
insert into product values(39,'����ì��','../resources/images/dragon/����ì��.png', -1, 'dragon', '����ì��');
insert into product values(40,'��ì��','../resources/images/dragon/��ì��.png', -1, 'dragon', '��ì��');
insert into product values(41,'���̽�','../resources/images/dragon/���̽�.png', -1, 'dragon', '���̽�');
insert into product values(42,'���ֶ�','../resources/images/dragon/���ֶ�.png', -1, 'dragon', '���ֶ�');
insert into product values(43,'�ĵ�','../resources/images/dragon/�ĵ�.png', -1, 'dragon', '�ĵ�');
insert into product values(44,'�����','../resources/images/dragon/�����.png', -1, 'dragon', '�����');
insert into product values(45,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(46,'���¸�','../resources/images/dragon/���¸�.png', -1, 'dragon', '���¸�');
insert into product values(47,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(48,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(49,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(50,'�ߵ�','../resources/images/dragon/�ߵ�.png', -1, 'dragon', '�ߵ�');
insert into product values(51,'�ߵ���','../resources/images/dragon/�ߵ���.png', -1, 'dragon', '�ߵ���');
insert into product values(52,'�ް��ߵ���','../resources/images/dragon/�ް��ߵ���.png', -1, 'dragon', '�ް��ߵ���');
insert into product values(53,'�����','../resources/images/dragon/�����.png', -1, 'dragon', '�����');
insert into product values(54,'��콺Ʈ','../resources/images/dragon/��콺Ʈ.png', -1, 'dragon', '��콺Ʈ');
insert into product values(55,'����','../resources/images/dragon/����.png', -1, 'dragon', '����');
insert into product values(56,'�׾�ŷ','../resources/images/dragon/�׾�ŷ.png', -1, 'dragon', '�׾�ŷ');
insert into product values(57,'���󵵽�','../resources/images/dragon/���󵵽�.png', -1, 'dragon', '���󵵽�');
insert into product values(58,'�ް����󵵽�','../resources/images/dragon/�ް����󵵽�.png', -1, 'dragon', '�ް����󵵽�');
insert into product values(59,'������','../resources/images/dragon/������.png', -1, 'dragon', '������');
insert into product values(60,'���','../resources/images/dragon/���.png', -1, 'dragon', '���');
insert into product values(61,'���̾�','../resources/images/dragon/���̾�.png', -1, 'dragon', '���̾�');
insert into product values(62,'�̴�','../resources/images/dragon/�̴�.png', -1, 'dragon', '�̴�');
insert into product values(63,'�Ŵ�','../resources/images/dragon/�Ŵ�.png', -1, 'dragon', '�Ŵ�');
insert into product values(64,'���Ĵ�','../resources/images/dragon/���Ĵ�.png', -1, 'dragon', '���Ĵ�');
insert into product values(65,'��','../resources/images/dragon/��.png', -1, 'dragon', '��');
insert into product values(66,'����','../resources/images/dragon/����.png', -1, 'dragon', '����');
insert into product values(67,'�ް�����','../resources/images/dragon/�ް�����.png', -1, 'dragon', '�ް�����');
insert into product values(68,'yellow','../resources/images/background/yellow_background.png', 0, 'background', 'yellow');
insert into product values(69,'mint','../resources/images/background/mint_background.png', 0, 'background', 'mint');
insert into product values(70,'purple','../resources/images/background/purple_background.png', 0, 'background', 'purple');
insert into product values(71,'default','../resources/images/background/white_background.png', 0, 'background', 'white');
insert into product values(72,'big potion','../resources/images/food/big_potion.svg', 1000, 'item', '����ġ +100 ����');


insert into dragonlist values(1, 7,'../resources/images/dragon/���̸�.png','../resources/images/dragon/���ڵ�.png','../resources/images/dragon/���ڸ�.png'); 
insert into dragonlist values(2, 7,'../resources/images/dragon/�̻��ؾ�.png','../resources/images/dragon/�̻���Ǯ.png','../resources/images/dragon/�̻��ز�.png'); 
insert into dragonlist values(3, 7,'../resources/images/dragon/���α�.png','../resources/images/dragon/��Ϻα�.png','../resources/images/dragon/�źϿ�.png'); 
insert into dragonlist values(4, 6,'../resources/images/dragon/ĳ����.png','../resources/images/dragon/�ܵ���.png','../resources/images/dragon/������.png'); 
insert into dragonlist values(5, 6,'../resources/images/dragon/������.png','../resources/images/dragon/������.png','../resources/images/dragon/��ħ��.png'); 
insert into dragonlist values(6, 6,'../resources/images/dragon/����.png','../resources/images/dragon/����.png','../resources/images/dragon/������.png'); 
insert into dragonlist values(7, 5,'../resources/images/dragon/����.png','../resources/images/dragon/��ī��.png','../resources/images/dragon/������.png'); 
insert into dragonlist values(8, 5,'../resources/images/dragon/�ѹ���.png','../resources/images/dragon/������.png','../resources/images/dragon/���÷��þ�.png'); 
insert into dragonlist values(9, 5,'../resources/images/dragon/��ì��.png','../resources/images/dragon/����ì��.png','../resources/images/dragon/��ì��.png'); 
insert into dragonlist values(10, 9,'../resources/images/dragon/���̽�.png','../resources/images/dragon/���ֶ�.png','../resources/images/dragon/�ĵ�.png'); 
insert into dragonlist values(11, 9,'../resources/images/dragon/�����.png','../resources/images/dragon/������.png','../resources/images/dragon/���¸�.png'); 
insert into dragonlist values(12, 9,'../resources/images/dragon/������.png','../resources/images/dragon/������.png','../resources/images/dragon/������.png');
insert into dragonlist values(13, 8,'../resources/images/dragon/�ߵ�.png','../resources/images/dragon/�ߵ���.png','../resources/images/dragon/�ް��ߵ���.png');
insert into dragonlist values(14, 8,'../resources/images/dragon/�����.png','../resources/images/dragon/��콺Ʈ.png','../resources/images/dragon/����.png');
insert into dragonlist values(15, 8,'../resources/images/dragon/�׾�ŷ.png','../resources/images/dragon/���󵵽�.png','../resources/images/dragon/�ް����󵵽�.png');
insert into dragonlist values(16, 10,'../resources/images/dragon/������.png','../resources/images/dragon/���.png','../resources/images/dragon/���̾�.png');
insert into dragonlist values(17, 10,'../resources/images/dragon/�̴�.png','../resources/images/dragon/�Ŵ�.png','../resources/images/dragon/���Ĵ�.png');
insert into dragonlist values(18, 10,'../resources/images/dragon/��.png','../resources/images/dragon/����.png','../resources/images/dragon/�ް�����.png');
commit;

