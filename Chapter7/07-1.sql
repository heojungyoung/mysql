-- ������ ���ν��� ����
DELIMITER $$
CREATE PROCEDURE doit_proc()
BEGIN
	DECLARE customer_cnt INT;
	DECLARE add_number INT;
	
	SET customer_cnt = 0;
	SET add_number = 100;
	SET customer_cnt = (SELECT COUNT(*) FROM customer);
	
	SELECT customer_cnt + add_number;
END $$
DELIMITER ;

-- ������ ���ν��� ȣ��
CALL doit_proc();

-- ������ ���ν��� ���� Ȯ��
SHOW CREATE PROCEDURE doit_proc;

-- ������ ���ν��� ����
DROP PROCEDURE doit_proc;