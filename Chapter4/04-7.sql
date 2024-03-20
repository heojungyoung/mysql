-- �Ǽ��� �����Ͱ� �ִ� ���̺� ����
USE doitsql;

CREATE TABLE doit_float (col_1 FLOAT);

INSERT INTO doit_float VALUES (0.7);

SELECT * FROM doit_float WHERE col_1 = 0.7;

-- �Ͻ��� �� ��ȯ���� ��� ����� ��µ� ��
SELECT 10/3;


-- ���ڿ� �������� ���̿� ũ�� Ȯ��
USE doitsql;

CREATE TABLE doit_char_varchar (
col_1 CHAR(5),
col_2 VARCHAR(5)
);

INSERT INTO doit_char_varchar VALUES ('12345', '12345');
INSERT INTO doit_char_varchar VALUES ('ABCDE', 'ABCDE');
INSERT INTO doit_char_varchar VALUES ('�����ٶ�', '�����ٶ�');
INSERT INTO doit_char_varchar VALUES ('hello', '�ȳ��ϼ���');
INSERT INTO doit_char_varchar VALUES ('��һ��һ��', '��һ��һ��');

SELECT
	col_1, 
	CHAR_LENGTH(col_1) as char_length, 
	LENGTH(col_1) AS char_byte,col_2, 
	CHAR_LENGTH(col_2) as char_length, 
	LENGTH(col_2) AS char_byte
FROM doit_char_varchar;

-- ���� ������ �ʰ��� ��
USE doitsql;

CREATE TABLE doit_table_byte (
col_1 VARCHAR(16383)
); 	--���� ����
	
CREATE TABLE doit_table_byte (
col_1 VARCHAR(16383),
col_2 VARCHAR(10)
); --���� ����

-- MySQL�� ���� ���� Ȯ��
SHOW CHARACTER SET;

-- �ݷ��̼ǿ� ���� ���� ���� �񱳸� ���� ���̺� ����
CREATE TABLE doit_collation (
col_latin1_general_ci VARCHAR(10) COLLATE latin1_general_ci,
col_latin1_general_cs VARCHAR(10) COLLATE latin1_general_cs,
col_latin1_bin VARCHAR(10) COLLATE latin1_bin,
col_latin7_general_ci VARCHAR(10) COLLATE latin7_general_ci
);
INSERT INTO doit_collation VALUES ('a', 'a', 'a', 'a');
INSERT INTO doit_collation VALUES ('b', 'b', 'b', 'b');
INSERT INTO doit_collation VALUES ('A', 'A', 'A', 'A');
INSERT INTO doit_collation VALUES ('B', 'B', 'B', 'B');
INSERT INTO doit_collation VALUES ('*', '*', '*', '*');
INSERT INTO doit_collation VALUES ('_', '_', '_', '_');
INSERT INTO doit_collation VALUES ('!', '!', '!', '!');
INSERT INTO doit_collation VALUES ('1', '1', '1', '1');
INSERT INTO doit_collation VALUES ('2', '2', '2', '2');

-- �ݷ��̼ǿ� ���� ���� ���� Ȯ��
SELECT col_latin1_general_ci FROM doit_collation ORDER BY col_latin1_general_ci;

SELECT col_latin1_general_cs FROM doit_collation ORDER BY col_latin1_general_cs;

SELECT col_latin1_bin FROM doit_collation ORDER BY col_latin1_bin;

SELECT col_latin7_general_ci FROM doit_collation ORDER BY col_latin7_general_ci;

-- ������ ������ ���� ���� �ð� ��ȸ
CREATE TABLE date_table(
justdate DATE,
justtime TIME,
justdatetime DATETIME,
justtimestamp TIMESTAMP);

INSERT INTO date_table VALUES (now(), now(), now(), now());

SELECT * FROM date_table;