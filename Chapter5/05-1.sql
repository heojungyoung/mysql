-- ���� ������ ���̺��� ���ǿ� �´� ������ ��ȸ
SELECT
	a.customer_id, a.store_id, a.first_name, a.last_name, a.email, a.address_id AS a_address_id,
	b.address_id AS b_address_id, b.address, b.district, b.city_id, b.postal_code, b.phone, b.location
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
WHERE a.first_name = 'ROSA';

-- �� �̸��� �������� ���� ���
SELECT
	address_id
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
WHERE a.first_name = 'ROSA';

-- 2���� ���� �������� ������ ���̺��� ���ǿ� �´� ������ ��ȸ
SELECT
	a.customer_id, a.first_name, a.last_name,
	b.address_id, b.address, b.district, b.postal_code
FROM customer AS a
	INNER join address AS b ON a.address_id = b.address_id AND a.create_date = b.last_update
WHERE a.first_name = 'ROSA';

-- 3���� ���̺��� ������ ���̺��� ���ǿ� �´� ������ ��ȸ
SELECT
	a.customer_id, a.first_name, a.last_name,
	b.address_id, b.address, b.district, b.postal_code,
	c.city_id, c.city
FROM customer AS a
	INNER JOIN address AS b ON a.address_id = b.address_id
	INNER JOIN city AS c ON b.city_id = c.city_id
WHERE a.first_name = 'ROSA';

-- LEFT OUTER JOIN�� ��� ��ȸ
SELECT
	a.address, a.address_id AS a_address_id,
	b.address_id AS b_address_id, b.store_id
FROM address AS a
	LEFT OUTER JOIN store AS b ON a.address_id = b.address_id;

-- LEFT OUTER JOIN���� ��ȸ�� ������� NULL�� ��ȸ
SELECT
	a.address, a.address_id AS a_address_id,
	b.address_id AS b_address_id, b.store_id
FROM address AS a
	LEFT OUTER JOIN store AS b ON a.address_id = b.address_id
WHERE b.address_id IS NULL

-- RIGHT OUTER JOIN�� ��� ��ȸ
SELECT
	a.address, a.address_id AS a_address_id,
	b.address_id AS b_address_id, b.store_id
FROM address AS a
	RIGHT OUTER JOIN store AS b ON a.address_id = b.address_id;

-- RIGHT OUTER JOIN���� ��ȸ�� ������� NULL�� ��ȸ
SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	RIGHT OUTER JOIN address AS b ON a.address_id = b.address_id
WHERE a.address_id IS NULL;

-- FULL OUTER JOIN�� ��� ��ȸ
SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	LEFT OUTER JOIN address AS b ON a.address_id = b.address_id

UNION

SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a	
	RIGHT OUTER JOIN address AS b ON a.address_id = b.address_id;

-- FULL OUTER JOIN���� ��ȸ�� ������� NULL�� ��ȸ
SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	LEFT OUTER JOIN address AS b ON a.address_id = b.address_id
WHERE b.address_id IS NULL

UNION

SELECT
	a.address_id AS a_address_id, a.store_id,
	b.address, b.address_id AS b_address_id
FROM store AS a
	RIGHT OUTER JOIN address AS b ON a.address_id = b.address_id
WHERE a.address_id IS NULL;

-- ���� ������ ����
CREATE TABLE doit_cross1(num INT);
CREATE TABLE doit_cross2(name VARCHAR(10));

INSERT INTO doit_cross1 VALUES (1), (2), (3);
INSERT INTO doit_cross2 VALUES ('Do'), ('It'), ('SQL');

-- CROSS JOIN ���� ������ ����
SELECT
	a.num, b.name
FROM doit_cross1 AS a
	CROSS JOIN doit_cross2 AS b
ORDER BY a.num;

-- WHERE ���� ����� CROSS JOIN
SELECT
	a.num, b.name
FROM doit_cross1 AS a
	CROSS JOIN doit_cross2 AS b
WHERE a.num = 1;

-- SELF JOIN ���� ������ ���� 1
SELECT 
	a.customer_id AS a_customer_id, b.customer_id AS b_customer_id
FROM customer AS a
	INNER JOIN customer AS b ON a.customer_id = b.customer_id

-- SELF JOIN ���� ������ ���� 2
SELECT
	a.payment_id, a.amount, b.payment_id, b.amount, b.amount - a.amount AS profit_amount
FROM payment AS a
	LEFT OUTER JOIN payment AS b ON a.payment_id = b.payment_id -1;