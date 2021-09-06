create table data_sums(
    id BIGINT,
    date varchar,
    sums BIGINT
);

insert into data_sums VALUES
     (111110, '2009-08-01',12000),
     (111110,	'2009-09-01',	5000),
     (111110,	'2009-10-01',	10000),
     (111110,	'2009-11-01',	10100),
     (111110,	'2009-12-01',	25000),
     (220000,	'2009-10-01',	20000),
     (220000,	'2009-11-01',	25000),
     (220000,	'2009-12-01',	10000);

Select SUM(sums) from data_sums where id = '111110' and date <= '2009-12-01';
