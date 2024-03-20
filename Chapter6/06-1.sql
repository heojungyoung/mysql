-- CONCAT �Լ��� �� �̸��� ���ڿ� ����
SELECT CONCAT(first_name, ', ', last_name) AS customer_name FROM customer;

-- CONCAT_WS �Լ��� ������ ����
SELECT CONCAT_WS(', ', first_name, last_name, email) AS customer_name FROM customer;

-- CONCAT �Լ��� NULL�� �� �̸� ����
SELECT CONCAT(NULL, first_name, last_name) AS customer_name FROM customer;

-- CONCAT_WS ���ڷ� NULL�� �ִ� ���
SELECT CONCAT_WS(', ', first_name, NULL, last_name) as customer_name FROM customer;

-- ���ڿ��� ��ȣ ���� ���������� ����
SELECT
4 / '2',
4 / 2,
4 / CAST('2' AS UNSIGNED);

-- NOW �Լ��� ���� ��¥�� �ð� ���
SELECT NOW();

-- CAST �Լ��� ��¥���� ���������� ��ȯ
SELECT CAST(NOW() AS SIGNED);

-- CAST �Լ��� �������� ��¥������ ��ȯ
SELECT CAST(20230819 AS DATE);

-- CAST �Լ��� �������� ���ڿ��� ��ȯ
SELECT CAST(20230819 AS CHAR);

-- CONVERT �Լ��� ��¥���� ���������� ��ȯ
SELECT CONVERT(NOW(), SIGNED);

-- CONVERT �Լ��� �������� ��¥������ ��ȯ
SELECT CONVERT(20230819, DATE);

-- CHAR�� ������ ���� ����
SELECT CONVERT(20230819, CHAR(5));

-- �����÷� �߻� ��
SELECT 9223372036854775807 + 1;

-- CAST �Լ��� �����÷� ����
SELECT CAST(9223372036854775807 AS UNSIGNED) + 1;

-- CONVERT�Լ��� �����÷� ����
SELECT CONVERT(9223372036854775807, UNSIGNED) + 1;

-- ���̺� ����
CREATE TABLE doit_null (
col_1 INT,
col_2 VARCHAR(10),
col_3 VARCHAR(10),
col_4 VARCHAR(10),
col_5 VARCHAR(10)
);

INSERT INTO doit_null VALUES (1, NULL, 'col_3', 'col_4', 'col_5');
INSERT INTO doit_null VALUES (2, NULL, NULL, NULL, 'col_5');
INSERT INTO doit_null VALUES (3, NULL, NULL, NULL, NULL);
SELECT * FROM doit_null;

-- IFNULL �Լ��� col_2���� NULL ��ü
SELECT col_1, IFNULL(col_2, '') AS col_2, col_3, col_4, col_5
FROM doit_null WHERE col_1 = 1;

-- IFNULL �Լ��� col_3���� NULL ��ü
SELECT col_1, IFNULL(col_2, col_3) AS col_2, col_3, col_4, col_5
FROM doit_null WHERE col_1 = 1;

-- COALESCE �Լ��� NULL�� �ٸ� �����ͷ� ��ü: ������ ���ڿ� �����Ͱ� �ִ� ���
SELECT col_1, COALESCE(col_2, col_3, col_4, col_5)
FROM doit_null WHERE col_1 = 2;

-- COALESCE �Լ��� NULL�� �ٸ� �����ͷ� ��ü: ������ ���ڿ��� NULL�� �ִ� ���
SELECT col_1, COALESCE(col_2, col_3, col_4, col_5)
FROM doit_null WHERE col_1 = 3;

-- LOWER �Լ��� �ҹ��ڸ�, UPPER �Լ��� �빮�ڷ� ����
SELECT 'Do it! SQL', LOWER('Do it! SQL'), UPPER('Do it! SQL');

-- LOWER �Լ��� �ҹ��ڸ�, UPPER �Լ��� �빮�ڷ� ����
SELECT email, LOWER(email), UPPER(email) FROM customer;

-- LTRIM �Լ��� ���� ���� ����
SELECT ' Do it! MySQL', LTRIM(' Do it! MySQL');

-- RTRIM �Լ��� ������ ���� ����
SELECT 'Do it! MySQL ', RTRIM('Do it! MySQL ');

-- TRIM �Լ��� ���� ���� ����
SELECT ' Do it! MySQL ', TRIM(' Do it! MySQL ');

-- TRIM �Լ��� ���� ���� ����
SELECT TRIM(BOTH '#' FROM '# Do it! MySQL #');

-- LENGTH �Լ��� ���ڿ��� ũ�� ��ȯ
SELECT LENGTH('Do it! MySQL'), LENGTH('���� ���̿���ť��');

-- LENGTH �Լ��� �پ��� ������ ũ�� ��ȯ
SELECT LENGTH('A'), LENGTH('��'), LENGTH('��'), LENGTH('��'), LENGTH(' ');

-- CHAR_LENGTH �Լ��� ���ڿ��� ���� ��ȯ
SELECT CHAR_LENGTH('Do it! MySQL'), CHAR_LENGTH('���� ���̿���ť��');

-- LENGTH�� CHAR_LENGTH �Լ��� �� �̸� ����
SELECT first_name, LENGTH(first_name), CHAR_LENGTH(first_name) FROM customer;

-- POSITION �Լ��� Ư�� ���ڱ����� ũ�� ��ȯ
SELECT 'Do it!! SQL', POSITION('!' IN 'Do it!! MySQL');

-- Ž�� ���ڰ� ���� ���
SELECT 'Do it!! SQL', POSITION('#' IN 'Do it!! MySQL');

-- LEFT�� RIGHT �Լ��� ���ʰ� ������ 2���� ���ڿ� ��ȯ
SELECT 'Do it! MySQL', LEFT('Do it! MySQL', 2), RIGHT('Do it! MySQL', 2);

-- SUBSTRING �Լ��� ������ ������ ���ڿ� ��ȯ
SELECT 'Do it! MySQL', SUBSTRING('Do it! MySQL', 4, 2);

-- SUBSTRING �Լ��� �� �̸� ����
SELECT first_name, SUBSTRING(first_name, 2, 3) FROM customer;

-- SUBSTRING�� POSITOIN �Լ� ����
SELECT SUBSTRING('abc@email.com', 1, POSITION('@' IN 'abc@email.com') -1);

-- REPLACE �Լ��� ���� ����
SELECT first_name, REPLACE(first_name, 'A', 'C') FROM customer WHERE first_name LIKE 'A%';

-- REPEAT �Լ��� ���� �ݺ�
SELECT REPEAT('0', 10);

-- REPEAT�� REPLACE �Լ� ����
SELECT first_name, REPLACE(first_name, 'A', REPEAT('C', 10)) FROM customer WHERE first_name LIKE '%A%';

-- SPACE �Լ��� ���� ���� �ݺ�
SELECT CONCAT(first_name, SPACE(10), last_name) FROM customer;

-- REVERSE �Լ��� ���ڿ��� �������� ��ȯ
SELECT 'Do it! MySQL', REVERSE('Do it! MySQL');

-- REVERSE �Լ��� �ٸ� ���� �Լ� ����
WITH ip_list (ip)
AS (
	SELECT '192.168.0.1' UNION ALL
	SELECT '10.6.100.99' UNION ALL
	SELECT '8.8.8.8' UNION ALL
	SELECT '192.200.212.113'
)
SELECT 
	ip, SUBSTRING(ip, 1, CHAR_LENGTH(ip) - POSITION('.' IN REVERSE(ip)))
FROM ip_list;

-- STRCMP �Լ��� �� ���ڿ��� ��: ������ ���
SELECT STRCMP('Do it! MySQL', 'Do it! MySQL');

-- STRCMP �Լ��� �� ���ڿ��� ��: �������� ���� ���
SELECT STRCMP('Do it! MySQL', 'Do it! MySQL!');