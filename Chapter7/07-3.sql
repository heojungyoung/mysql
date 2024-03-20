-- �ǽ��� ���� ���̺�� ������ ����
USE doitsql;

DROP TABLE IF EXISTS doit_clusterindex;

CREATE TABLE doit_clusterindex (
col_1 INT,
col_2 VARCHAR(50),
col_3 VARCHAR(50)
);

INSERT INTO doit_clusterindex VALUES (2, '����', 'lion');
INSERT INTO doit_clusterindex VALUES (5, 'ȣ����', 'tiger');
INSERT INTO doit_clusterindex VALUES (3, '��踻', 'zbera');
INSERT INTO doit_clusterindex VALUES (4, '�ڻԼ�', 'Rhinoceros');
INSERT INTO doit_clusterindex VALUES (1, '�ź���', 'turtle');

SELECT * FROM doit_clusterindex;

-- �⺻Ű(�⺻ �ε���) ����
ALTER TABLE doit_clusterindex
	ADD CONSTRAINT PRIMARY KEY (col_1);

SELECT * FROM doit_clusterindex;

-- ���ο� ������ �Է�
INSERT INTO doit_clusterindex VALUES (0, '�����', 'fish');

SELECT * FROM doit_clusterindex;

-- col_2 ���� �ε��� ����
ALTER TABLE doit_clusterindex
	DROP PRIMARY KEY,
	ADD CONSTRAINT PRIMARY KEY doit_clusterindex (col_2);

SELECT * FROM doit_clusterindex;

-- col_3 ���� �ε��� ����
ALTER TABLE doit_clusterindex
	DROP PRIMARY KEY,
	ADD CONSTRAINT PRIMARY KEY (col_3);

SELECT * FROM doit_clusterindex;

-- ����Ű �ε��� ����
ALTER TABLE doit_clusterindex
	DROP PRIMARY KEY,
	ADD CONSTRAINT PRIMARY KEY(col_1, col_3);

SHOW INDEX FROM doit_clusterindex;

-- �ε��� ����
ALTER TABLE doit_clusterindex DROP PRIMARY KEY;

SHOW INDEX FROM doit_clusterindex;

-- �ǽ��� ���� ���̺�� ������ ����
USE doitsql;

DROP TABLE IF EXISTS doit_nonclusterindex;

CREATE TABLE doit_nonclusterindex (
col_1 INT,
col_2 VARCHAR(50),
col_3 VARCHAR(50)
);

INSERT INTO doit_nonclusterindex VALUES (2, '����', 'lion');
INSERT INTO doit_nonclusterindex VALUES (5, 'ȣ����', 'tiger');
INSERT INTO doit_nonclusterindex VALUES (3, '��踻', 'zbera');
INSERT INTO doit_nonclusterindex VALUES (4, '�ڻԼ�', 'Rhinoceros');
INSERT INTO doit_nonclusterindex VALUES (1, '�ź���', 'turtle');

SELECT * FROM doit_nonclusterindex;

-- ��Ŭ�������� �ε��� ����
CREATE INDEX ix_doit_nonclusterindex_1 ON doit_nonclusterindex (col_1);

SELECT * FROM doit_nonclusterindex;

-- ���ο� ������ �Է�
INSERT INTO doit_nonclusterindex VALUES (0, '�����', 'fish');

SELECT * FROM doit_nonclusterindex;

-- �� ������ �ε��� ����
CREATE INDEX ix_doit_nonclusterindex_2 ON doit_nonclusterindex (col_2);
CREATE INDEX ix_doit_nonclusterindex_3 ON doit_nonclusterindex (col_3);

SELECT * FROM doit_nonclusterindex;

-- ����Ű �ε��� ����
CREATE INDEX ix_doit_nonclusterindex_1_2 ON doit_nonclusterindex (col_1, col_2);
CREATE INDEX ix_doit_nonclusterindex_1_3 ON doit_nonclusterindex (col_1, col_3);

SHOW INDEX FROM doit_nonclusterindex;

-- �ε��� ����
DROP INDEX ix_doit_nonclusterindex_1_2 ON doit_nonclusterindex;
DROP INDEX ix_doit_nonclusterindex_1_3 ON doit_nonclusterindex;

SHOW INDEX FROM doit_nonclusterindex;