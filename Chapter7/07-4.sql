-- �Ϻ� ���� �����ִ� �� ����
CREATE VIEW v_customer
AS
	SELECT first_name, last_name, email FROM customer;

SELECT* FROM v_customer;

-- 2���� ���̺��� ������ ���ϴ� �����͸� �����ִ� �� ����
CREATE VIEW v_payuser
AS
	SELECT 
		first_name, last_name, email, amount, address_id
	FROM customer AS a
		INNER JOIN (
			SELECT 
				customer_id, SUM(amount) AS amount 
			FROM payment
			GROUP BY customer_id
			) AS b ON a.customer_id = b.customer_id;

SELECT * FROM v_payuser;

-- �� ���̺�� �Ϲ� ���̺� ����
SELECT a.*, b.*
FROM v_payuser AS a
	INNER JOIN address AS b ON a.address_id = b.address_id;

-- �� ����
ALTER VIEW v_customer
AS
	SELECT 
		customer_id, first_name, last_name, email, address_id
	FROM customer;

SELECT * FROM v_customer;

-- v_customer �� ���� �� ��ü
CREATE OR REPLACE VIEW v_customer
AS
	SELECT '�䰡 �̹� ������ ����, ������ ����';

SELECT * FROM v_customer;

-- �� ���� Ȯ��
DESCRIBE v_payuser;

-- SQL ������ �� ���� Ȯ��
SHOW CREATE VIEW v_payuser;

-- �� ����
DROP VIEW v_customer;
DROP VIEW v_payuser;

-- ���̺�� �� ����
CREATE TABLE tbl_a (
col_1 INT NOT NULL,
col_2 VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_b (
col_1 INT NOT NULL,
col_2 VARCHAR(50) NOT NULL
);

INSERT INTO tbl_a VALUES(1, 'tbl_a_1');
INSERT INTO tbl_a VALUES(2, 'tbl_a_2');
INSERT INTO tbl_b VALUES(1, 'tbl_b_1');
INSERT INTO tbl_b VALUES(2, 'tbl_b_2');

CREATE VIEW v_tbl_a
AS
	SELECT col_1, col_2 FROM tbl_a;


SELECT * FROM v_tbl_a;

-- ���� �� ������ ����
SET SQL_SAFE_UPDATES = 0;

UPDATE v_tbl_a SET col_2 = 'tbl_a �� ����' WHERE col_1 = 1;

SELECT * FROM v_tbl_a;

-- ���� �� ������ �߰�
INSERT v_tbl_a VALUES (3, 'tbl_a_3');

SELECT * FROM v_tbl_a;

-- ���� �� ������ ����
DELETE FROM v_tbl_a WHERE col_1 = 3;

SELECT * FROM v_tbl_a;

-- ���ο� �� ���� �� ������ �߰�
CREATE VIEW v_tbl_a2
AS
	SELECT col_1 FROM tbl_a;

INSERT v_tbl_a2 VALUES (5);

-- ���� �� ����
CREATE VIEW v_tbl_a_b
AS
	SELECT
		a.col_1 as a_col_1,
		a.col_2 as a_col_2,
		b.col_2 as b_col_2
	FROM tbl_a AS a
		INNER JOIN tbl_b AS b ON a.col_1 = b.col_1;


SELECT * FROM v_tbl_a_b;

-- ���� �� ������ ����
UPDATE v_tbl_a_b SET a_col_2 = 'tbl_a �÷� ����', b_col_2 = 'tbl_b �÷� ����' WHERE a_col_1 = 1;

-- ���� �� ������ �Է�
INSERT v_tbl_a_b VALUES (3, 'tbl_a_3', 'tbl_b_3');

-- ���� ���̺� ����
DROP TABLE tbl_a;

-- ���� ���̺� ������ �� ��ȸ
SELECT * FROM v_tbl_a_b;

-- �� ���� Ȯ��
CHECK TABLE tbl_a_b;

