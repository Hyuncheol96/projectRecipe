use db_project_spring_mvc;

show tables;
drop table recipe_table;

create table memberRecipe_table(
	id bigint auto_increment,
    memberId varchar(20) not null ,
    memberPassword varchar(20),
    memberName varchar(20),
    memberEmail varchar(20),
    memberMobile varchar(20) not null,
    memberDay int default 0,
    constraint pk_memberRecipe_table primary key(id),
    constraint unique(memberId),
    constraint unique(memberMobile)
    );
    alter table memberRecipe_table add column memberDay int default 0;
    alter table memberRecipe_table modify memberDay int default 0;
-- insert memberRecipe_table (memberId,memberMobile) value("aa","010");
   update memberRecipe_table set memberDay = 0 where id = 4;
   
    select * from memberRecipe_table;
    drop table memberRecipe_table;
    
create table boardRecipe_table(
	id bigint auto_increment,
    boardCategory varchar(20),
    boardTitle varchar(20),
    boardWriter varchar(20) not null,
    boardContents varchar(200),
    boardHits int default 0,
    boardCreatedDate datetime,
    constraint pk_board_table primary key(id)
    );
    -- alter table boardRecipe_table add column boardCategory varchar(200);
    select * from boardRecipe_table;
	drop table boardRecipe_table; 
    
    
create table product_table (
	id bigint auto_increment, 
	productName varchar(300),
	productPrice int,
	constraint pk_product_table primary key(id)
);
    
    select * from product_table;
    drop table product_table;
    
    
    create table commentRecipe_table(
	id bigint auto_increment,
	boardId bigint not null,
	commentWriter varchar(20),
    commentContents varchar(200),
	commentCreatedDate datetime,
	constraint pk_commentRecipe_table primary key(id),
    constraint fk_commentRecipe_table_num1 foreign key(boardId) references boardRecipe_table(id),
    constraint fk_commentRecipe_table_num2 foreign key(commentWriter) references memberRecipe_table(memberId)
	
);
	select * from commentRecipe_table;
	drop table commentRecipe_table;

    
create table orderList_table(
	id bigint auto_increment,
    productId bigint not null,
    memberId varchar (20),
    productName varchar (20),
    productPrice int,
    constraint pk_orderList_table primary key(id),
    constraint fk_orderList_table_num1 foreign key(productId) references product_table(id)
    
    );
    
    select * from orderList_table;
    drop table orderList_Table;
    
    
    
    
    
    
-- create table western_table(
-- 	id bigint auto_increment,
--     westernCategory varchar(20),
--     westernTitle varchar(20),
--     westernWriter varchar(20) not null,
--     westernContents varchar(200),
--     westernHits int default 0,
--     westernCreatedDate datetime,
--     constraint pk_western_table primary key(id)
--     );
--     -- alter table boardRecipe_table add column boardCategory varchar(200);
--     select * from western_table;
-- 	drop table western_table; 
--     
-- create table dessert_table(
-- 	id bigint auto_increment,
--     dessertCategory varchar(20),
--     dessertTitle varchar(20),
--     dessertWriter varchar(20) not null,
--     dessertContents varchar(200),
--     dessertHits int default 0,
--     dessertCreatedDate datetime,
--     constraint pk_dessert_table primary key(id)
--     );
--     -- alter table boardRecipe_table add column boardCategory varchar(200);
--     select * from dessert_table;
-- 	drop table dessert_table; 
    

    
    


    