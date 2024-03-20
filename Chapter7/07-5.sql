-- �Լ� ���� ���� �ο�
SET GLOBAL log_bin_trust_function_creators = 1;

-- ������ �Լ� ����
USE doitsql;

DROP FUNCTION IF EXISTS user_sum;

DELIMITER $$
CREATE FUNCTION user_sum(num_1 INT, num_2 INT)
RETURNS INT
BEGIN
	RETURN num_1 + num_2;
END $$
DELIMITER ;

-- ������ �Լ� ȣ��
SELECT user_sum (1, 5);

-- ������ �Լ� ���� Ȯ��
SHOW CREATE FUNCTION user_sum;

-- ������ �Լ� ����
DROP FUNCTION user_sum;

-- Ŀ�� ����
DROP PROCEDURE IF EXISTS doit_cursor;

DELIMITER $$
CREATE PROCEDURE doit_cursor()
BEGIN
	DECLARE endOfRow BOOLEAN DEFAULT FALSE; -- ������ Ŀ�� �������� �����ϱ� ���� ���� ����(�⺻��: FALSE)
	
	-- Ŀ���� ����� ����
	DECLARE user_payment_id INT; -- payment_id�� ������ ����
	DECLARE user_amount DECIMAL(10,2) DEFAULT 0; -- amount�� ������ ����
	DECLARE idCursor CURSOR FOR -- Ŀ�� ����
	
	SELECT payment_id FROM payment WHERE staff_id = 1;
	
	-- �ݺ� ���� ����
	DECLARE CONTINUE HANDLER -- ���� ���̸� endOfRow ������ TRUE ����
	FOR NOT FOUND SET endOfRow = TRUE;
	
	-- Ŀ�� ����
	OPEN idCursor;
	
	-- �ݺ� ����
	sum_loop : LOOP
		FETCH idCursor INTO user_payment_id; -- ù ��° ������ ��������
		
		IF endOfRow THEN
			LEAVE sum_loop; -- ������ ���̸� ����
		END IF;
	
		-- ������ ó��
		SET user_amount = user_amount + (SELECT amount FROM payment WHERE payment_id = user_payment_id);
	
	END LOOP sum_loop;
	
	-- ������ ��� ��ȯ
	SELECT user_amount;
	
	-- Ŀ�� �ݱ�
	CLOSE idCursor;
END$$
DELIMITER ;

-- ������ ���ν��� ����
CALL doit_cursor();

-- ��� �񱳸� ���� ���� �Է�
SELECT sum(amount) FROM payment WHERE staff_id = 1;