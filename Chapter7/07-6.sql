-- ���̺� ����
USE doitsql;

CREATE TABLE tbl_trigger_1 (
col_1 INT,
col_2 VARCHAR(50)
);

CREATE TABLE tbl_trigger_2 (
col_1 INT,
col_2 VARCHAR(50)
);

INSERT INTO tbl_trigger_1 VALUES (1, '������ 1 �Է�');

SELECT * FROM tbl_trigger_1;

-- UPDATE �߻� �� �����ϴ� Ʈ���� ����
DELIMITER $$
CREATE TRIGGER dot_update_tirgger
AFTER UPDATE
	ON tbl_trigger_1
	FOR EACH ROW
BEGIN
	INSERT INTO tbl_trigger_2 VALUES (OLD.col_1, OLD.col_2);
END $$
DELIMITER ;

-- Ʈ���� ����
SET SQL_SAFE_UPDATES = 0;

UPDATE tbl_trigger_1 SET col_1 = 2, col_2 = '1�� 2�� ����';

SELECT * FROM tbl_trigger_2;

SELECT * FROM tbl_trigger_1;