-- 52�ְ��� �ֽ� �������� �ְ� ��ȸ
SELECT
	symbol,
	CAST(MIN(close) AS DECIMAL(18,2)) AS w52_min,
	CAST(MAX(close) AS DECIMAL(18,2)) AS w52_max,
	CAST(MAX(close) - MIN(close) AS DECIMAL(18,2)) AS `w52_diff_price($)`,
	CAST((MAX(close) - MIN(close)) / MIN(close) * 100 AS DECIMAL(18,2)) AS `w52_diff_ratio(%)`
FROM stock
WHERE date >= DATE_ADD('2023-10-04', INTERVAL -52 week) AND date <= '2023-10-04'
GROUP BY symbol;

-- 1�ϰ��� ���ʰ��� ������ ���� ���� ��ȸ
SELECT
	date,
	symbol,
	CAST(open AS DECIMAL(18,2)) AS open,
	CAST(close AS DECIMAL(18,2)) AS close,
	CAST((open - close) AS DECIMAL(18,2)) AS `diff_price($)`,
	CAST(((close - open) / open * 100) AS DECIMAL(18,2)) AS `diff_ratio(%)`,
	'' AS '---',
	CAST(low AS DECIMAL(18,2)) AS low,
	CAST(high AS DECIMAL(18,2)) AS high,
	CAST((high - low) AS DECIMAL(18,2)) AS `diff_high_price($)`,
	CAST(((high - low) / low * 100) AS DECIMAL(18,2)) AS `diff_high_ratio(%)`
FROM stock
WHERE date = '2023-10-04';

-- 10% �̻� ������ ���� ���� ��ȸ
SELECT
	date,
	symbol,
	CAST(open AS DECIMAL(18,2)) AS open,
	CAST(close AS DECIMAL(18,2)) AS close,
	CAST((open - close) AS DECIMAL(18,2)) AS `diff_price($)`,
	CAST(((close - open) / open * 100) AS DECIMAL(18,2)) AS `diff_ratio(%)`,
	'' AS '---',
	CAST(low AS DECIMAL(18,2)) AS low,
	CAST(high AS DECIMAL(18,2)) AS high,
	CAST((high - low) AS DECIMAL(18,2)) AS `diff_high_price($)`,
	CAST(((high - low) / low * 100) AS DECIMAL(18,2)) AS `diff_high_ratio(%)`
FROM stock
WHERE date = '2022-02-24'
	AND CAST(((close - open) / open * 100) AS DECIMAL(18,2)) >= 10
ORDER BY CAST(((close - open) / open * 100) AS DECIMAL(18,2)) DESC;

-- SELF JOIN���� ���� ��� ������ ������ ��ȸ
SELECT
	a.symbol,
	a.date AS a_date,
	CAST(a.close AS DECIMAL(18,2)) AS a_close,
	'' AS '---',
	b.date AS b_date,
	CAST(b.close AS DECIMAL(18,2)) AS b_close,
	'' AS '---',
	CAST((b.close - a.close) AS DECIMAL(18,2)) AS `diff_price($)`,
	CAST(((b.close - a.close) / b.close * 100) AS DECIMAL(18,2)) AS `diff_ratio(%)`
FROM stock AS A
	INNER JOIN stock AS B ON a.symbol = b.symbol AND a.date = date_add(b.date, INTERVAL -1 DAY)
WHERE a.date = '2023-10-04';

-- Ư�� �Ⱓ ���� ���� ����� �����ϴ� ���̺� ����
CREATE TEMPORARY TABLE temp1
SELECT
	a.symbol,
	a.close AS a_close,
	b.close AS b_close,
	b.close - a.close AS close_diff,
	(b.close - a.close) / a.close * 100 AS ratio_diff
FROM (SELECT symbol, close FROM stock WHERE date = '2021-02-17' ) AS a
	INNER JOIN (SELECT symbol, close FROM stock WHERE date = '2021-02-24') AS b ON a.symbol = b.symbol;

SELECT * FROM temp1;

-- 10% ����� ������� ������ �����ϴ� ���̺� ����
CREATE TEMPORARY TABLE temp2
SELECT
	ROW_NUMBER() OVER (PARTITION BY a.symbol ORDER BY date ASC) AS num,
	a.symbol,
	b.date,
	b.close
FROM temp1 AS a
	INNER JOIN stock AS b ON a.symbol = b.symbol
WHERE a.ratio_diff >= 10
	AND b.date >= '2021-02-17'
	AND b.date <= '2021-02-24';

CREATE TEMPORARY TABLE temp2_1
SELECT
	ROW_NUMBER() OVER (PARTITION BY a.symbol ORDER BY date ASC) AS num,
	a.symbol,
	b.date,
	b.close
FROM temp1 AS a
	INNER JOIN stock AS b ON a.symbol = b.symbol
WHERE a.ratio_diff >= 10
	AND b.date >= '2021-02-17'
	AND b.date <= '2021-02-24';

SELECT * FROM temp2;

-- symbol ���� �������� ���� ������ ���� ��� ����� ���� �����͸� �����ϴ� ���̺� ����
CREATE TEMPORARY TABLE temp3
SELECT
	b.symbol,
	a.date AS a_date,
	a.close AS a_close,
	b.date AS b_date,
	b.close AS b_close,
	b.close - a.close AS close_diff,
	((b.close - a.close) / a.close) * 100 AS ratio_diff
FROM temp2 AS a
	INNER JOIN temp2_1 AS b ON a.symbol = b.symbol AND a.num = b.num - 1
ORDER BY b.symbol, b.date;

SELECT * FROM temp3;

-- �ְ��� �� ���� �϶����� ���� �����͸� �����ϴ� ���̺� ����
CREATE TEMPORARY TABLE temp3_1
SELECT symbol FROM temp3 WHERE ratio_diff < 0 GROUP BY symbol;

CREATE TEMPORARY TABLE temp4
SELECT
	symbol,
	a_date,
	round(a_close, 2) AS a_close,
	b_date,
	round(b_close, 2) AS b_close,
	round(close_diff,2) AS close_diff,
	round(ratio_diff, 2) AS ratio_diff
FROM temp3
WHERE symbol NOT IN (SELECT symbol FROM temp3_1);

SELECT * FROM temp4;

-- nasdaq_company ���̺�� �ӽ� ���̺��� ������ ���� ���� ���
SELECT
	a.symbol,
	d.company_name,
	d.industry,
	ROUND(a.a_close, 2) AS a_close,
	ROUND(a.b_close, 2) AS b_close,
	ROUND(a.close_diff, 2) AS diff_price,
	ROUND(a.ratio_diff,2) AS diff_ratio
FROM temp1 AS a
	INNER JOIN (SELECT symbol FROM temp2 GROUP BY symbol) AS b ON a.symbol = b.symbol
	INNER JOIN (SELECT symbol FROM temp4 GROUP BY symbol) AS c ON a.symbol = c.symbol
	INNER JOIN nasdaq_company AS d ON a.symbol = d.symbol
ORDER BY ratio_diff DESC;

-- �ӽ� ���̺� ����
DROP TEMPORARY TABLE temp1;
DROP TEMPORARY TABLE temp2;
DROP TEMPORARY TABLE temp2_1;
DROP TEMPORARY TABLE temp3;
DROP TEMPORARY TABLE temp3_1;
DROP TEMPORARY TABLE temp4;