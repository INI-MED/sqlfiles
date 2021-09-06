CREATE TABLE auto (
    auto_year INT,
    auto_type Varchar,
    auto_id int
);

INSERT into auto VALUES
	(2007,	'Иномарка',	1),
	(2008,	'Отечественный', 2),
	(2008,	'Отечественный', 3),
	(2010,	'Иномарка',	4),
	(2017,	'Иномарка',	5),
	(2017,	'Иномарка',	6),
	(2017,	'Иномарка',	7),
	(2017,	'Отечественный', 8);

SELECT auto_year,
	COUNT(case WHEN auto_type = 'Иномарка' THEN 1 END) AS "Кол-во иномарок",
	COUNT(case WHEN auto_type = 'Отечественный' THEN 1 END) AS "Кол-во отечественных"
FROM auto GROUP BY auto_year;
