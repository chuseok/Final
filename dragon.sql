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



















insert into product values(1,'meat','../resources/images/food/meat.svg', 1000, 'item', 'Æ÷¸¸°¨ +10 Áõ°¡');
insert into product values(2,'fish','../resources/images/food/fish.svg', 700, 'item', 'Æ÷¸¸°¨ +5 Áõ°¡');
insert into product values(3,'potion','../resources/images/food/potion.svg', 1000, 'item', '°æÇèÄ¡ +10 Áõ°¡');
insert into product values(4,'apple','../resources/images/food/apple.svg', 500, 'item', 'Æ÷¸¸°¨ +3 Áõ°¡');
insert into product values(5,'º¸¶ó»ö ¾Ë','../resources/images/egg/egg_1.svg', 3000, 'egg', 'º¸¶ùºûÀÌ µµ´Â ½ÅºñÇÑ ¾Ë');
insert into product values(6,'ºĞÈ«»ö ¾Ë','../resources/images/egg/egg_2.svg', 3000, 'egg', 'ºĞÈ«ºûÀÌ µµ´Â ½ÅºñÇÑ ¾Ë');
insert into product values(7,'ÁÖÈ²»ö ¾Ë','../resources/images/egg/egg_3.svg', 3000, 'egg', 'ÁÖÈ²ºûÀÌ µµ´Â ½ÅºñÇÑ ¾Ë');
insert into product values(8,'³ë¶õ»ö ¾Ë','../resources/images/egg/egg_4.svg', 3000, 'egg', '³ë¶õºûÀÌ µµ´Â ½ÅºñÇÑ ¾Ë');
insert into product values(9,'¾Ë','../resources/images/egg/egg_5.svg', 3000, 'egg', '±âº»À¸·Î Á¦°øµÇ´Â ¾Ë');
insert into product values(10,'ÆÄ¶õ»ö ¾Ë','../resources/images/egg/egg_6.svg', 3000, 'egg', 'ÆÄ¶õºûÀÌ µµ´Â ½ÅºñÇÑ ¾Ë');
insert into product values(11,'space','../resources/images/background/space_background.png', 3000, 'background', 'space');
insert into product values(12,'ÆÄÀÌ¸®','../resources/images/dragon/ÆÄÀÌ¸®.png', -1, 'dragon', 'ÆÄÀÌ¸®');
insert into product values(13,'¸®ÀÚµå','../resources/images/dragon/¸®ÀÚµå.png', -1, 'dragon', '¸®ÀÚµå');
insert into product values(14,'¸®ÀÚ¸ù','../resources/images/dragon/¸®ÀÚ¸ù.png', -1, 'dragon', '¸®ÀÚ¸ù');
insert into product values(15,'ÀÌ»óÇØ¾¾','../resources/images/dragon/ÀÌ»óÇØ¾¾.png', -1, 'dragon', 'ÀÌ»óÇØ¾¾');
insert into product values(16,'ÀÌ»óÇØÇ®','../resources/images/dragon/ÀÌ»óÇØÇ®.png', -1, 'dragon', 'ÀÌ»óÇØÇ®');
insert into product values(17,'ÀÌ»óÇØ²É','../resources/images/dragon/ÀÌ»óÇØ²É.png', -1, 'dragon', 'ÀÌ»óÇØ²É');
insert into product values(18,'²¿ºÎ±â','../resources/images/dragon/²¿ºÎ±â.png', -1, 'dragon', '²¿ºÎ±â');
insert into product values(19,'¾î´ÏºÎ±â','../resources/images/dragon/¾î´ÏºÎ±â.png', -1, 'dragon', '¾î´ÏºÎ±â');
insert into product values(20,'°ÅºÏ¿Õ','../resources/images/dragon/°ÅºÏ¿Õ.png', -1, 'dragon', '°ÅºÏ¿Õ');
insert into product values(21,'graydot','../resources/images/background/gray_dot_background.png', 3000, 'background', 'graydot');
insert into product values(22,'cloud','../resources/images/background/cloud_background.png',3000, 'background', 'cloud');
insert into product values(23,'Ä³ÅÍÇÇ','../resources/images/dragon/Ä³ÅÍÇÇ.png', -1, 'dragon', 'Ä³ÅÍÇÇ');
insert into product values(24,'´Üµ¥±â','../resources/images/dragon/´Üµ¥±â.png', -1, 'dragon', '´Üµ¥±â');
insert into product values(25,'¹öÅÍÇÃ','../resources/images/dragon/¹öÅÍÇÃ.png', -1, 'dragon', '¹öÅÍÇÃ');
insert into product values(26,'»ÔÃæÀÌ','../resources/images/dragon/»ÔÃæÀÌ.png', -1, 'dragon', '»ÔÃæÀÌ');
insert into product values(27,'µüÃæÀÌ','../resources/images/dragon/µüÃæÀÌ.png', -1, 'dragon', 'µüÃæÀÌ');
insert into product values(28,'µ¶Ä§ºØ','../resources/images/dragon/µ¶Ä§ºØ.png', -1, 'dragon', 'µ¶Ä§ºØ');
insert into product values(29,'±¸±¸','../resources/images/dragon/±¸±¸.png', -1, 'dragon', '±¸±¸');
insert into product values(30,'ÇÇÁÔ','../resources/images/dragon/ÇÇÁÔ.png', -1, 'dragon', 'ÇÇÁÔ');
insert into product values(31,'ÇÇÁÔÅõ','../resources/images/dragon/ÇÇÁÔÅõ.png', -1, 'dragon', 'ÇÇÁÔÅõ');
insert into product values(32,'ÇÇÃò','../resources/images/dragon/ÇÇÃò.png', -1, 'dragon', 'ÇÇÃò');
insert into product values(33,'ÇÇÄ«Ãò','../resources/images/dragon/ÇÇÄ«Ãò.png', -1, 'dragon', 'ÇÇÄ«Ãò');
insert into product values(34,'¶óÀÌÃò','../resources/images/dragon/¶óÀÌÃò.png', -1, 'dragon', '¶óÀÌÃò');
insert into product values(35,'¶Ñ¹÷Ãİ','../resources/images/dragon/¶Ñ¹÷Ãİ.png', -1, 'dragon', '¶Ñ¹÷Ãİ');
insert into product values(36,'³¿»õ²¿','../resources/images/dragon/³¿»õ²¿.png', -1, 'dragon', '³¿»õ²¿');
insert into product values(37,'¶óÇÃ·¹½Ã¾Æ','../resources/images/dragon/¶óÇÃ·¹½Ã¾Æ.png', -1, 'dragon', '¶óÇÃ·¹½Ã¾Æ');
insert into product values(38,'¹ßÃ¬ÀÌ','../resources/images/dragon/¹ßÃ¬ÀÌ.png', -1, 'dragon', '¹ßÃ¬ÀÌ');
insert into product values(39,'½´·úÃ¬ÀÌ','../resources/images/dragon/½´·úÃ¬ÀÌ.png', -1, 'dragon', '½´·úÃ¬ÀÌ');
insert into product values(40,'°­Ã¬ÀÌ','../resources/images/dragon/°­Ã¬ÀÌ.png', -1, 'dragon', '°­Ã¬ÀÌ');
insert into product values(41,'ÄÉÀÌ½Ã','../resources/images/dragon/ÄÉÀÌ½Ã.png', -1, 'dragon', 'ÄÉÀÌ½Ã');
insert into product values(42,'À±°Ö¶ó','../resources/images/dragon/À±°Ö¶ó.png', -1, 'dragon', 'À±°Ö¶ó');
insert into product values(43,'ÈÄµò','../resources/images/dragon/ÈÄµò.png', -1, 'dragon', 'ÈÄµò');
insert into product values(44,'¾ËÅë¸ó','../resources/images/dragon/¾ËÅë¸ó.png', -1, 'dragon', '¾ËÅë¸ó');
insert into product values(45,'±ÙÀ°¸ó','../resources/images/dragon/±ÙÀ°¸ó.png', -1, 'dragon', '±ÙÀ°¸ó');
insert into product values(46,'±«·Â¸ó','../resources/images/dragon/±«·Â¸ó.png', -1, 'dragon', '±«·Â¸ó');
insert into product values(47,'²¿¸¶µ¹','../resources/images/dragon/²¿¸¶µ¹.png', -1, 'dragon', '²¿¸¶µ¹');
insert into product values(48,'µ¥±¸¸®','../resources/images/dragon/µ¥±¸¸®.png', -1, 'dragon', 'µ¥±¸¸®');
insert into product values(49,'µü±¸¸®','../resources/images/dragon/µü±¸¸®.png', -1, 'dragon', 'µü±¸¸®');
insert into product values(50,'¾ßµ·','../resources/images/dragon/¾ßµ·.png', -1, 'dragon', '¾ßµ·');
insert into product values(51,'¾ßµµ¶õ','../resources/images/dragon/¾ßµµ¶õ.png', -1, 'dragon', '¾ßµµ¶õ');
insert into product values(52,'¸Ş°¡¾ßµµ¶õ','../resources/images/dragon/¸Ş°¡¾ßµµ¶õ.png', -1, 'dragon', '¸Ş°¡¾ßµµ¶õ');
insert into product values(53,'°í¿À½º','../resources/images/dragon/°í¿À½º.png', -1, 'dragon', '°í¿À½º');
insert into product values(54,'°í¿ì½ºÆ®','../resources/images/dragon/°í¿ì½ºÆ®.png', -1, 'dragon', '°í¿ì½ºÆ®');
insert into product values(55,'ÆÒÅÒ','../resources/images/dragon/ÆÒÅÒ.png', -1, 'dragon', 'ÆÒÅÒ');
insert into product values(56,'À×¾îÅ·','../resources/images/dragon/À×¾îÅ·.png', -1, 'dragon', 'À×¾îÅ·');
insert into product values(57,'°¼¶óµµ½º','../resources/images/dragon/°¼¶óµµ½º.png', -1, 'dragon', '°¼¶óµµ½º');
insert into product values(58,'¸Ş°¡°¼¶óµµ½º','../resources/images/dragon/¸Ş°¡°¼¶óµµ½º.png', -1, 'dragon', '¸Ş°¡°¼¶óµµ½º');
insert into product values(59,'ÇÁ¸®Á®','../resources/images/dragon/ÇÁ¸®Á®.png', -1, 'dragon', 'ÇÁ¸®Á®');
insert into product values(60,'½ã´õ','../resources/images/dragon/½ã´õ.png', -1, 'dragon', '½ã´õ');
insert into product values(61,'ÆÄÀÌ¾î','../resources/images/dragon/ÆÄÀÌ¾î.png', -1, 'dragon', 'ÆÄÀÌ¾î');
insert into product values(62,'¹Ì´¨','../resources/images/dragon/¹Ì´¨.png', -1, 'dragon', '¹Ì´¨');
insert into product values(63,'½Å´¨','../resources/images/dragon/½Å´¨.png', -1, 'dragon', '½Å´¨');
insert into product values(64,'¸Á³Ä´¨','../resources/images/dragon/¸Á³Ä´¨.png', -1, 'dragon', '¸Á³Ä´¨');
insert into product values(65,'¹Â','../resources/images/dragon/¹Â.png', -1, 'dragon', '¹Â');
insert into product values(66,'¹ÂÃ÷','../resources/images/dragon/¹ÂÃ÷.png', -1, 'dragon', '¹ÂÃ÷');
insert into product values(67,'¸Ş°¡¹ÂÃ÷','../resources/images/dragon/¸Ş°¡¹ÂÃ÷.png', -1, 'dragon', '¸Ş°¡¹ÂÃ÷');
insert into product values(68,'yellow','../resources/images/background/yellow_background.png', 0, 'background', 'yellow');
insert into product values(69,'mint','../resources/images/background/mint_background.png', 0, 'background', 'mint');
insert into product values(70,'purple','../resources/images/background/purple_background.png', 0, 'background', 'purple');
insert into product values(71,'default','../resources/images/background/white_background.png', 0, 'background', 'white');
insert into product values(72,'big potion','../resources/images/food/big_potion.svg', 1000, 'item', '°æÇèÄ¡ +100 Áõ°¡');


insert into dragonlist values(1, 7,'../resources/images/dragon/ÆÄÀÌ¸®.png','../resources/images/dragon/¸®ÀÚµå.png','../resources/images/dragon/¸®ÀÚ¸ù.png'); 
insert into dragonlist values(2, 7,'../resources/images/dragon/ÀÌ»óÇØ¾¾.png','../resources/images/dragon/ÀÌ»óÇØÇ®.png','../resources/images/dragon/ÀÌ»óÇØ²É.png'); 
insert into dragonlist values(3, 7,'../resources/images/dragon/²¿ºÎ±â.png','../resources/images/dragon/¾î´ÏºÎ±â.png','../resources/images/dragon/°ÅºÏ¿Õ.png'); 
insert into dragonlist values(4, 6,'../resources/images/dragon/Ä³ÅÍÇÇ.png','../resources/images/dragon/´Üµ¥±â.png','../resources/images/dragon/¹öÅÍÇÃ.png'); 
insert into dragonlist values(5, 6,'../resources/images/dragon/»ÔÃæÀÌ.png','../resources/images/dragon/µüÃæÀÌ.png','../resources/images/dragon/µ¶Ä§ºØ.png'); 
insert into dragonlist values(6, 6,'../resources/images/dragon/±¸±¸.png','../resources/images/dragon/ÇÇÁÔ.png','../resources/images/dragon/ÇÇÁÔÅõ.png'); 
insert into dragonlist values(7, 5,'../resources/images/dragon/ÇÇÃò.png','../resources/images/dragon/ÇÇÄ«Ãò.png','../resources/images/dragon/¶óÀÌÃò.png'); 
insert into dragonlist values(8, 5,'../resources/images/dragon/¶Ñ¹÷Ãİ.png','../resources/images/dragon/³¿»õ²¿.png','../resources/images/dragon/¶óÇÃ·¹½Ã¾Æ.png'); 
insert into dragonlist values(9, 5,'../resources/images/dragon/¹ßÃ¬ÀÌ.png','../resources/images/dragon/½´·úÃ¬ÀÌ.png','../resources/images/dragon/°­Ã¬ÀÌ.png'); 
insert into dragonlist values(10, 9,'../resources/images/dragon/ÄÉÀÌ½Ã.png','../resources/images/dragon/À±°Ö¶ó.png','../resources/images/dragon/ÈÄµò.png'); 
insert into dragonlist values(11, 9,'../resources/images/dragon/¾ËÅë¸ó.png','../resources/images/dragon/±ÙÀ°¸ó.png','../resources/images/dragon/±«·Â¸ó.png'); 
insert into dragonlist values(12, 9,'../resources/images/dragon/²¿¸¶µ¹.png','../resources/images/dragon/µ¥±¸¸®.png','../resources/images/dragon/µü±¸¸®.png');
insert into dragonlist values(13, 8,'../resources/images/dragon/¾ßµ·.png','../resources/images/dragon/¾ßµµ¶õ.png','../resources/images/dragon/¸Ş°¡¾ßµµ¶õ.png');
insert into dragonlist values(14, 8,'../resources/images/dragon/°í¿À½º.png','../resources/images/dragon/°í¿ì½ºÆ®.png','../resources/images/dragon/ÆÒÅÒ.png');
insert into dragonlist values(15, 8,'../resources/images/dragon/À×¾îÅ·.png','../resources/images/dragon/°¼¶óµµ½º.png','../resources/images/dragon/¸Ş°¡°¼¶óµµ½º.png');
insert into dragonlist values(16, 10,'../resources/images/dragon/ÇÁ¸®Á®.png','../resources/images/dragon/½ã´õ.png','../resources/images/dragon/ÆÄÀÌ¾î.png');
insert into dragonlist values(17, 10,'../resources/images/dragon/¹Ì´¨.png','../resources/images/dragon/½Å´¨.png','../resources/images/dragon/¸Á³Ä´¨.png');
insert into dragonlist values(18, 10,'../resources/images/dragon/¹Â.png','../resources/images/dragon/¹ÂÃ÷.png','../resources/images/dragon/¸Ş°¡¹ÂÃ÷.png');
commit;

