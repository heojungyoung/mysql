-- ROW_NUMBER �Լ��� ���� �ο�
SELECT 
	ROW_NUMBER() OVER(ORDER BY amount DESC) AS num, customer_id, amount
FROM (
	SELECT 
		customer_id, SUM(amount) AS amount
	FROM payment GROUP BY customer_id
	) AS x;

-- �������� ������ ����� ROW_NUMBER �Լ��� ���� �ο�
SELECT 
	ROW_NUMBER() OVER(ORDER BY amount DESC, customer_id DESC) AS num, customer_id, amount
FROM (
	SELECT 
		customer_id, SUM(amount) AS amount
	FROM payment GROUP BY customer_id
	) AS x;

-- PARTITION BY ������ ����� �׷캰 ���� �ο�
SELECT 
	staff_id,
	ROW_NUMBER() OVER(PARTITION BY staff_id ORDER BY amount DESC, customer_id ASC) AS num, 
	customer_id, 
	amount
FROM (
	SELECT 
		customer_id, staff_id, SUM(amount) AS amount
	FROM payment GROUP BY customer_id, staff_id
	) AS x;

-- RANK �Լ��� ���� �ο�
SELECT 
	RANK() OVER(ORDER BY amount DESC) AS num, customer_id, amount
FROM (
	SELECT 
		customer_id, SUM(amount) AS amount
	FROM payment GROUP BY customer_id
	) AS x;

-- DENSE_RANK �Լ��� ���� �ο�
SELECT 
	DENSE_RANK() OVER(ORDER BY amount DESC) AS num, customer_id, amount
FROM (
	SELECT 
		customer_id, SUM(amount) AS amount
	FROM payment GROUP BY customer_id
	) AS x;

-- ������������ ������ ����� NTILE �Լ��� ���� �ο�
SELECT 
	NTILE(100) OVER(ORDER BY amount DESC) AS num, customer_id, amount
FROM (
	SELECT 
		customer_id, SUM(amount) AS amount
	FROM payment GROUP BY customer_id
	) AS x;