CREATE TABLE PDCL (
    Date DATE DEFAULT current_date,
    Customer INT NOT NULL,
    Deal INT NOT NULL,
    Currency VARCHAR(6) DEFAULT 'RUR',
    Sum INT
);

INSERT INTO PDCL VALUES
    ('2009-12-12', 111110, 111111, 'RUR', 12000),
    ('2009-12-25', 111110, 111111, 'RUR', 5000),
    ('2010-12-12', 111110, 122222, 'RUR', 10000),
    ('2010-12-01', 111110, 111111, 'RUR', -10100),
    ('2009-11-20', 220000, 222221, 'RUR', 25000),
    ('2009-12-20', 220000, 222221, 'RUR', 20000),
    ('2009-12-21', 220000, 222221, 'RUR', -25000),
    ('2009-12-29', 111110, 122222, 'RUR', -10000);

SELECT cast(Date AS DATE), Sum FROM PDCL WHERE Deal = 222221 ORDER BY Date;

WITH b AS (SELECT
    Deal,
    Date,
    sum(Sum) OVER (PARTITION BY Deal ORDER By Date ASC) AS balance,
    Row_Number() OVER (PARTITION BY Deal ORDER By Date ASC) AS RowNum
FROM PDCL
ORDER BY Deal DESC, Date
           ),
s AS (SELECT *, sign(balance) AS sign FROM b
)
SELECT *,
CASE WHEN lag(sign)
       OVER (ORDER BY Deal DESC) != sign
       THEN RowNum END AS lo,
  CASE WHEN lead(sign)
       OVER (ORDER BY Deal DESC) != sign
       THEN coalesce(RowNum, 0) END AS hi
FROM s
