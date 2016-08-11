create database mar;
use mar;
create table mold(gno int ,nums int);

create table goods(gno int primary key ,cno int,odd int ,total int,price float(5,2));

create table vip (vno int primary key,name char(20),sex char(4),phone char(14),integral int);

create table cashier (cano int primary key, name char(20),pass char(16));

create table acount(id int,vno int ,gno int, num int,prices float(6,2))

select * from goods
