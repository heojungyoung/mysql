-- ù ��° ���� AUTO_INCREMENT ����
USE doitsql;

CREATE TABLE doit_increment (
col_1 INT AUTO_INCREMENT PRIMARY KEY,
col_2 VARCHAR(50),
col_3 INT
);
INSERT INTO doit_increment (col_2, col_3) VALUES ('1 �ڵ� �Է�', 1);
INSERT INTO doit_increment (col_2, col_3) VALUES ('2 �ڵ� �Է�', 2);

SELECT * FROM doit_increment;

-- �ڵ� �ԷµǴ� ���� ������ ���� �Է��� ���
INSERT INTO doit_increment (col_1, col_2, col_3) VALUES (3, '3 �ڵ� �Է�', 3);

SELECT * FROM doit_increment;

-- �ڵ� �ԷµǴ� ������ ū ���� �Է��� ���
INSERT INTO doit_increment (col_1, col_2, col_3) VALUES (5, '4 �ǳʶٰ� 5 �ڵ� �Է�', 5);

SELECT * FROM doit_increment;

-- 1���� �����ϰ� ������ �Է��� ���
INSERT INTO doit_increment (col_2, col_3) VALUES ('������ �ԷµǾ�����?', 0);

SELECT * FROM doit_increment;

-- AUTO_INCREMENT�� ����� ���� ������ ������ ��ȸ
SELECT LAST_INSERT_ID();

-- �ڵ����� �ԷµǴ� ���� 100���� ����
ALTER TABLE doit_increment AUTO_INCREMENT=100;

INSERT INTO doit_increment (col_2, col_3) VALUES ('���۰��� ����Ǿ�����?', 0);

SELECT * FROM doit_increment;

-- �ڵ����� �ԷµǴ� ���� 5�� ����
SET @@AUTO_INCREMENT_INCREMENT = 5;

INSERT INTO doit_increment (col_2, col_3) VALUES ('5�� �����ұ�? (1)', 0);
INSERT INTO doit_increment (col_2, col_3) VALUES ('5�� �����ұ�? (2)', 0);

SELECT * FROM doit_increment;

-- INSERT INTO�� SELECT�� �ٸ� ���̺� ��� �Է�
CREATE TABLE doit_insert_select_from (
col_1 INT,
col_2 VARCHAR(10)
);

CREATE TABLE doit_insert_select_to (
col_1 INT,
col_2 VARCHAR(10)
);

INSERT INTO doit_insert_select_from VALUES (1, 'Do');
INSERT INTO doit_insert_select_from VALUES (2, 'It');
INSERT INTO doit_insert_select_from VALUES (3, 'MySQL');

INSERT INTO doit_insert_select_to
SELECT * FROM doit_insert_select_from;

SELECT * FROM doit_insert_select_to;

-- INSERT INTO�� SELECT�� �ٸ� ���̺� ��� �Է�
CREATE TABLE doit_select_new AS (SELECT * FROM doit_insert_select_from);

SELECT * FROM doit_select_new;

-- �θ� ���̺�� �ڽ� ���̺� ����
CREATE TABLE doit_parent (col_1 INT PRIMARY KEY);
CREATE TABLE doit_child (col_1 INT);

ALTER TABLE doit_child
ADD FOREIGN KEY (col_1) REFERENCES doit_parent(col_1);

-- �ڽ� ���̺� ������ �Է� �� �θ� ���̺� �ش� �����Ͱ� ���� ���
INSERT INTO doit_child VALUES (1);

-- �θ� ���̺� ������ �Է� �� �ڽ� ���̺��� ������ �Է�
INSERT INTO doit_parent VALUES (1);
INSERT INTO doit_child VALUES (1);

SELECT * FROM doit_parent;
SELECT * FROM doit_child;

-- �θ� ���̺����� �����͸� ������ ���
DELETE FROM doit_parent WHERE col_1 = 1;

-- �ڽ� ���̺��� ������ ���� �� �θ� ���̺��� ������ ����
DELETE FROM doit_child WHERE col_1 = 1;
DELETE FROM doit_parent WHERE col_1 = 1;

-- �θ� ���̺��� ������ ���
DROP TABLE doit_parent;

-- ���� ���̺� ���� �� ���� ���̺� ����
DROP TABLE doit_child;
DROP TABLE doit_parent;

-- �θ� ���̺� ���� �� ���� ���� Ȯ��
CREATE TABLE doit_parent (col_1 INT PRIMARY KEY);
CREATE TABLE doit_child (col_1 INT);

SHOW CREATE TABLE doit_child;

-- ���� ���� ���� �� ���� ���̺� ����
ALTER TABLE doit_child
DROP CONSTRAINT doit_child_ibfk_1;

DROP TABLE doit_parent;