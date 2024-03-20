-- CREATE ������ �����ͺ��̽� ����
CREATE DATABASE DoItSQL;

-- DROP ������ �����ͺ��̽� ����
DROP DATABASE doitsql;

-- �����ͺ��̽� ���� �� ����
CREATE DATABASE doitsql;
USE doitsql;


-- CREATE ������ ���̺� ����
CREATE TABLE doit_create_table (
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);

-- DROP ������ ���̺� ����
DROP TABLE doit_create_table;

-- INSERT ������ ������ ����
CREATE TABLE doit_dml (
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);
INSERT INTO doit_dml (col_1, col_2, col_3) VALUES (1, 'DoItSQL', '2023-01-01');

-- ���̺� ��ȸ�Ͽ� ������ ������ Ȯ��
SELECT * FROM doit_dml

-- ������ ���� ����ġ�� ���� ���� �߻� ��
INSERT INTO doit_dml(col_1) VALUES ('���� �Է�');

-- �� �̸� �����ϰ� ������ ����
INSERT INTO doit_dml VALUES (2, '�� �̸� ����', '2023-01-02');

-- ���Ե� ������ Ȯ��
SELECT * FROM doit_dml;

-- �� ���� ����ġ�� ���� ���� �߻�
INSERT INTO doit_dml VALUES (3, 'col_3 �� ����');

-- Ư�� ������ ������ ����
INSERT INTO doit_dml(col_1, col_2) VALUES (3, 'col_3 �� ����');

-- ������ �������� ���� ����
INSERT INTO doit_dml(col_1, col_3, col_2) VALUES (4,'2023-01-03', '������ ����');

-- ���� ������ �� ���� ����
INSERT INTO doit_dml(col_1, col_2, col_3) VALUES (5, '������ �Է�5', '2023-01-03'), (6, '������ �Է�6', '2023-01-03'), (7, '������ �Է�7', '2023-01-03');

-- NULL�� ������� �ʴ� ���̺� ���� �� NULL ���� �� ������ �߻��� ��
CREATE TABLE doit_notnull (
col_1 INT,
col_2 VARCHAR(50) NOT NULL
);
INSERT INTO doit_notnull (col_1) VALUES (1);

-- UPDATE ������ ������ ���� 1
UPDATE doit_dml SET col_2 = '������ ����'
WHERE col_1 = 4;

-- UPDATE ������ ������ ���� 2
UPDATE doit_dml SET col_2 = '������ ����'
WHERE col_1 = 4;

-- UPDATE ������ ���̺� ��ü ������ ����
UPDATE doit_dml SET col_1 = col_1 + 10;

-- DELETE ������ ������ ����
DELETE FROM doit_dml WHERE col_1 = 14;

-- DELETE ������ ���̺� ��ü ������ ����
DELETE FROM doit_dml;