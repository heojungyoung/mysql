-- LAG�� LEAD �Լ��� �յ� �� ����
SELECT 
	x.payment_date,
	LAG(x.amount) OVER(ORDER BY x.payment_date ASC) AS lag_amount, amount,
	LEAD(x.amount) OVER(ORDER BY x.payment_date ASC) AS lead_amount
FROM (
	SELECT 
		date_format(payment_date, '%y-%m-%d') AS payment_date,
		SUM(amount) AS amount
	FROM payment 
	GROUP BY date_format(payment_date, '%y-%m-%d')
	) AS x
ORDER BY x.payment_date;

-- LAG�� LEAD �Լ��� 2ĭ�� �յ� �� ����
SELECT 
	x.payment_date,
	LAG(x.amount, 2) OVER(ORDER BY x.payment_date ASC) AS lag_amount, amount,
	LEAD(x.amount, 2) OVER(ORDER BY x.payment_date ASC) AS lead_amount
FROM (
	SELECT 
		date_format(payment_date, '%y-%m-%d') AS payment_date,
		SUM(amount) AS amount
	FROM payment 
	GROUP BY date_format(payment_date, '%y-%m-%d')
) AS x
ORDER BY x.payment_date;

-- CUME_DIST �Լ��� ���� ������ ���
SELECT 
	x.customer_id, x.amount, CUME_DIST() OVER(ORDER BY x.amount DESC)
FROM (
	SELECT 
		customer_id, sum(amount) AS amount
	FROM payment GROUP BY customer_id
	) AS X
ORDER BY x.amount DESC;

-- PERCENT_RANK �Լ��� ���� ���� ������ ���
SELECT 
	x.customer_id, x.amount, PERCENT_RANK() OVER (ORDER BY x.amount DESC)
FROM (
	SELECT 
		customer_id, sum(amount) AS amount
	FROM payment GROUP BY customer_id
	) AS X
ORDER BY x.amount DESC;


-- FIRST_VALUE �Լ��� ���� ���� �� ��ȸ
SELECT 
	x.payment_date, x.amount,
	FIRST_VALUE(x.amount) OVER(ORDER BY x.payment_date) AS f_value,
	LAST_VALUE(x.amount) OVER(ORDER BY x.payment_date RANGE BETWEEN UNBOUNDED
	PRECEDING AND UNBOUNDED FOLLOWING) AS l_value,
	x.amount - FIRST_VALUE(x.amount) OVER(ORDER BY x.payment_date) AS increase_amount
FROM (
	SELECT 
		date_format(payment_date, '%y-%m-%d') AS payment_date,
		SUM(amount) AS amount
	FROM payment 
	GROUP BY date_format(payment_date, '%y-%m-%d')
	) AS x
ORDER BY x.payment_date;

