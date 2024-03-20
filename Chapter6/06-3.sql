-- COUNT �Լ��� ������ ���� ����
SELECT COUNT(*) FROM customer;

-- COUNT �Լ��� GROUP BY �� ����
SELECT store_id, COUNT(*) AS cnt FROM customer GROUP BY store_id;

-- COUNT �Լ��� GROUP BY �� ����: �� 2�� Ȱ��
SELECT store_id, active, COUNT(*) AS cnt FROM customer GROUP BY store_id, active;

-- NULL�� ������ ���� Ȯ��
SELECT COUNT(*) AS all_cnt, COUNT(address2) AS ex_null FROM address;

-- COUNT �Լ��� DISTINCT �� ����
SELECT COUNT(*), COUNT(store_id), COUNT(DISTINCT store_id) FROM customer;

-- SUM �Լ��� amount ���� ������ �ջ�
SELECT SUM(amount) FROM payment;

-- SUM �Լ��� GROUP BY �� ����
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id;

-- �Ͻ��� �� ��ȯ���� �����÷� ���� �ջ� ����� ��ȯ
CREATE TABLE doit_overflow (
col_1 int,
col_2 int,
col_3 int
);

INSERT INTO doit_overflow VALUES (1000000000,1000000000, 1000000000);
INSERT INTO doit_overflow VALUES (1000000000,1000000000, 1000000000);
INSERT INTO doit_overflow VALUES (1000000000,1000000000, 1000000000);

SELECT SUM(col_1) FROM doit_overflow;

-- AVG �Լ��� amount ���� ������ ��� ���
SELECT AVG(amount) FROM payment;

-- AVG �Լ��� GROUP BY �� ����
SELECT customer_id, AVG(amount) FROM payment GROUP BY customer_id;

-- MIN�� MAX �Լ��� amount ���� �ּڰ��� �ִ� ��ȸ
SELECT MIN(amount), MAX(amount) FROM payment;

-- MIN�� MAX �Լ� �׸��� GROUP BY �� ����
SELECT customer_id, MIN(amount), MAX(amount) FROM payment GROUP BY customer_id;

-- ROLLUP �Լ��� �κ��� ���
SELECT 
	customer_id, staff_id, SUM(amount)
FROM payment
GROUP BY customer_id, staff_id WITH ROLLUP;

-- STDDEV�� STDDEV_SAMP �Լ��� ǥ������ ���
SELECT STDDEV(amount), STDDEV_SAMP(amount) FROM payment;
