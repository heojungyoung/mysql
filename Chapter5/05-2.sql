-- ���� �� ���� ���� ����
SELECT * FROM customer
WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name = 'ROSA');

-- �߸��� ���� �� ���� ���� ���� �� ���� �߻� ��
SELECT * FROM customer
WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- IN�� Ȱ���� ���� �� ���� ���� ���� 1
SELECT * FROM customer WHERE first_name IN ('ROSA', 'ANA');

-- IN�� Ȱ���� ���� �� ���� ���� ���� 2
SELECT * FROM customer
WHERE customer_id IN (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- ���̺� 3���� �����ϴ� ����
SELECT
	a.film_id, a.title
FROM film AS a
	INNER JOIN film_category AS b ON a.film_id = b.film_id
	INNER JOIN category AS c ON b.category_id = c.category_id
WHERE c.name = 'Action';

-- IN�� Ȱ���� ���� ���� ����
SELECT
	film_id, title
FROM film
WHERE film_id IN (
	SELECT a.film_id
	FROM film_category AS a
		INNER JOIN category AS b ON a.category_id = b.category_id
	WHERE b.name = 'Action'
	);

-- NOT IN�� Ȱ���� ���� ���� ����
SELECT
	film_id, title
FROM film
WHERE film_id NOT IN (
	SELECT a.film_id
	FROM film_category AS a
		INNER JOIN category AS b ON a.category_id = b.category_id
	WHERE b.name = 'Action'
	);

-- = ANY�� Ȱ���� ���� ���� ����
SELECT * FROM customer
WHERE customer_id = ANY (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- < ANY�� Ȱ���� ���� ���� ����
SELECT * FROM customer
WHERE customer_id < ANY (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- > ANY�� Ȱ���� ���� ���� ����
SELECT * FROM customer
WHERE customer_id > ANY (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- EXISTS�� Ȱ���� ���� ���� ����: TRUE�� ��ȯ�ϴ� ���
SELECT * FROM customer
WHERE EXISTS (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- EXISTS�� Ȱ���� ���� ���� ����: FALSE�� ��ȯ�ϴ� ���
SELECT * FROM customer
WHERE EXISTS (SELECT customer_id FROM customer WHERE first_name IN ('KANG'));

-- NOT EXISTS�� Ȱ���� ���� ���� ����: TRUE�� ��ȯ�ϴ� ���
SELECT * FROM customer
WHERE NOT EXISTS (SELECT customer_id FROM customer WHERE first_name IN ('KANG'));

-- ALL�� Ȱ���� ���� ���� ����
SELECT * FROM customer
WHERE customer_id = ALL (SELECT customer_id FROM customer WHERE first_name IN ('ROSA', 'ANA'));

-- ���̺� ����
SELECT
	a.film_id, a.title, a.special_features, c.name
FROM film AS a
	INNER JOIN film_category AS b ON a.film_id = b.film_id
	INNER JOIN category AS c ON b.category_id = c.category_id
WHERE a.film_id > 10 AND a.film_id < 20;

-- FROM ���� ���� ���� ����
SELECT
	a.film_id, a.title, a.special_features, x.name
FROM film AS a
INNER JOIN (
	SELECT
		b.film_id, c.name
	FROM film_category AS b
		INNER JOIN category AS c ON b.category_id = c.category_id
	WHERE b.film_id > 10 AND b.film_id < 20
	) AS x ON a.film_id = x.film_id;

-- ���̺� ����
SELECT
	a.film_id, a.title, a.special_features, c.name
FROM film AS a
	INNER JOIN film_category AS b ON a.film_id = b.film_id
	INNER JOIN category AS c ON b.category_id = c.category_id
WHERE a.film_id > 10 AND a.film_id < 20;

-- SELECT ���� ���� ���� ����
SELECT
	a.film_id, a.title, a.special_features, (SELECT c.name FROM film_category as
	b INNER JOIN category AS c ON b.category_id = c.category_id WHERE a.film_id =
	b.film_id) AS name
FROM film AS a
WHERE a.film_id > 10 AND a.film_id < 20;