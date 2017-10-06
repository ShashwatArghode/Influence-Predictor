drop database if exists webcrawl;
create database webcrawl;
use webcrawl;
create table p_login(
	username varchar(30) primary key, 
	passwrd varchar(30), 
	email varchar(100),
	subscribe_flag int default 0
);
	
create table p_product(
	prod_id int not null auto_increment primary key, 
	name varchar(30), 
	reference_hits int default 0,
	key(name)
);

create table p_user_product(
	username varchar(30), 
	prod_id int, 
	foreign key(username) references p_login(username) on delete cascade, 
	foreign key(prod_id) references p_product(prod_id) on delete cascade
);


create table p_datasource(
    website_url varchar(50) not null primary key
);

create table p_user_datasource(
	username varchar(30), 
	website_url varchar(50), 
	foreign key(username) references p_login(username) on delete cascade, 
	foreign key(website_url) references p_datasource(website_url) on delete cascade
);

create table p_fbdata(
	post_id varchar(100) primary key, 
	post_desc text,
    no_of_comments int,
    no_of_likes int,
    url varchar(200),
    no_of_shares int,
    tag varchar(50),
    date_of_post varchar(50),
    author varchar(50),
    influence_flag int default 0,
	post_score int,
	foreign key(tag) references p_product(name) on delete cascade
);

create table p_tweetdata(
	tweet_id BIGINT primary key, 
	tweet_desc text,
    no_of_comments int,
    no_of_favs int,
    retweets int,
    tag varchar(50),
    date_of_post varchar(100),
    author varchar(50),
    influence_flag int default 0,
	foreign key(tag) references p_product(name) on delete cascade
);


create table p_blogdata( 
	url varchar(200) primary key,
    title varchar(200),
    descp text,
    no_of_hits int,
    tag varchar(50),
	mainurl varchar(100),
	foreign key(tag) references p_product(name) on delete cascade,
	foreign key(mainurl) references p_datasource(website_url) on delete cascade
);


create table p_rank_prod(
	prod_name varchar(30) primary key, 
    score int,
    foreign key(prod_name) references p_product(name) on delete cascade
);

create or replace view login_r
as(
	select username, 
	passwrd, 
	email,
	subscribe_flag
    from p_login
);

	
create or replace view product_r
as(
	select prod_id,
	name,
	reference_hits
	from p_product
);

create or replace view user_product_r
as(
	select username,
	prod_id
	from p_user_product
);


create or replace view datasource_r
as(
	select website_url
	from p_datasource
);

create or replace view user_datasource_r
as(
	select username,
	website_url
	from p_user_datasource
);

create or replace view fbdata_r
as(
	select post_id,
	post_desc,
    no_of_comments,
    no_of_likes,
    url,
    no_of_shares,
    tag,
    date_of_post,
    author,
    influence_flag,
	post_score
	from p_fbdata
);

create or replace view tweetdata_r
as(
	select tweet_id,
	tweet_desc,
    no_of_comments,
    no_of_favs,
    retweets,
    tag,
    date_of_post,
    author,
    influence_flag
	from p_tweetdata
);


create or replace view blogdata_r
as(
	select url,
    title,
    descp,
    no_of_hits,
    tag,
	mainurl
	from p_blogdata
);


insert into p_product (name) values ('Norton');
insert into p_product (name) values ('NetBackup');
insert into p_product (name) values ('Endpoint Protection');
insert into p_product (name) values ('Storage Foundation');