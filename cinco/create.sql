create database if not exists cinco;
use cinco;
set global local_infile = True;


create table if not exists `jezyki` (
	jezyk varchar(21),
	rodzina varchar(26)
);
load data local infile '/home/tomasz/Proyectos/mysql/Dane_PR2_2020/jezyki.txt' into table `jezyki` fields terminated by '	' ignore 1 lines;


create table if not exists `panstwa` (
	panstwo varchar(17),
	kontynent varchar(18),
	populacja decimal(3, 1)
);
load data local infile '/home/tomasz/Proyectos/mysql/Dane_PR2_2020/panstwa.txt' into table `panstwa` fields terminated by '	' ignore 1 lines;


create table if not exists `uzytkownicy` (
	panstwo varchar(17),
	jezyk varchar(21),
	uzytkownicy decimal(5, 1),
	urzedowy char(3)
);
load data local infile '/home/tomasz/Proyectos/mysql/Dane_PR2_2020/uzytkownicy.txt' into table `uzytkownicy` fields terminated by '	' ignore 1 lines;

