-- first_name ���� �������� ����
SELECT * FROM customer ORDER BY first_name;

-- last_name ���� �������� ����
SELECT * FROM customer ORDER BY last_name;

-- store_id, first_name ������ ������ ����
SELECT * FROM customer ORDER BY store_id, first_name;

-- first_name, store_id ������ ������ ����
SELECT * FROM customer ORDER BY first_name, store_id;

-- first_name ���� ������������ ����
SELECT * FROM customer ORDER BY first_name ASC;

-- first_name ���� ������������ ����
SELECT * FROM customer ORDER BY first_name DESC;

-- ASC�� DESC�� �����Ͽ� ������ ����
SELECT * FROM customer ORDER BY store_id DESC, first_name ASC;

-- LIMIT���� ���� 10���� ������ ��ȸ
SELECT * FROM customer ORDER BY store_id DESC, first_name ASC LIMIT 10;

-- LIMIT���� 101��°���� 10���� ������ ��ȸ
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 100, 10;

-- ������ 100 ���� �ǳʶٰ� ������ 10�� ��ȸ
SELECT * FROM customer ORDER BY customer_id ASC LIMIT 10 OFFSET 100;

