create table Student(SId varchar(10),Sname varchar(10),Sage datetime,Ssex varchar(10));
insert into Student values('01' , 'ZHAO LEI ' , '1990-01-01' , 'Male');
insert into Student values('02' , 'QIAN DIAN' , '1990-12-21' , 'Male');
insert into Student values('03' , 'SUN FENG' , '1990-12-20' , 'Male');
insert into Student values('04' , 'LI YUN' , '1990-12-06' , 'Male');
insert into Student values('05' , 'ZHOU MEI' , '1991-12-01' , 'Female');
insert into Student values('06' , 'WU LAN' , '1992-01-01' , 'Female');
insert into Student values('07' , 'ZHENG ZHU' , '1989-01-01' , 'Female');
insert into Student values('09' , 'ZHANG SAN' , '2017-12-20' , 'Female');
insert into Student values('10' , 'LI SI' , '2017-12-25' , 'Female');
insert into Student values('11' , 'LI SI' , '2012-06-06' , 'Female');
insert into Student values('12' , 'ZHAO LIU' , '2013-06-13' , 'Female');
insert into Student values('13' , 'SUN QI' , '2014-06-01' , 'Female');

create table Course(CId varchar(10),Cname nvarchar(10),TId varchar(10));
insert into Course values('01' , 'Chinese' , '02');
insert into Course values('02' , 'Math' , '01');
insert into Course values('03' , 'English' , '03');

create table Teacher(TId varchar(10),Tname varchar(10));
insert into Teacher values('01' , 'ZHANG SAN');
insert into Teacher values('02' , 'LI SI');
insert into Teacher values('03' , 'WANG WU');

create table SC(SId varchar(10),CId varchar(10),score decimal(18,1));
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);



