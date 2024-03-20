-- ABS �Լ��� �Է��� ���ڸ� �������� ��ȯ
SELECT ABS(-1.0), ABS(0.0), ABS(1.0);

-- ABS �Լ��� �Է��� ������ ����� �������� ��ȯ
SELECT 
	a.amount - b.amount AS amount, ABS(a.amount - b.amount) AS abs_amount
FROM payment AS a
	INNER JOIN payment AS b ON a.payment_id = b.payment_id-1;

-- �Ͻ��� �� ��ȯ���� �����÷� ���� ������ ��ȯ
SELECT ABS(-2147483648);

-- SIGN �Լ��� �Է��� ���ڰ� ���, ����, 0������ �Ǵ�
SELECT SIGN(-256), SIGN(0), SIGN(256);

-- SIGN �Լ��� ������ ����� ���, ����, 0������ �Ǵ�
SELECT 
	a.amount - b.amount AS amount, SIGN(a.amount - b.amount) AS abs_amount
FROM payment AS a
	INNER JOIN payment AS b ON a.payment_id = b.payment_id-1;

-- CEILING �Լ��� õ�尪 ��ȯ
SELECT CEILING(2.4), CEILING(-2.4), CEILING(0.0);

-- FLOOR �Լ��� �ٴڰ� ��ȯ
SELECT FLOOR(2.4), FLOOR(-2.4), FLOOR(0.0);

-- ROUND �Լ��� �Ҽ��� ��° �ڸ����� �ݿø�
SELECT ROUND(99.9994, 3), ROUND(99.9995, 3);

-- ROUND �Լ��� �Ҽ��� ������ ���� �ݿø�
SELECT ROUND(234.4545, 2), ROUND(234.4545, -2);

-- ���� �κ��� ���̺��� ū �ڸ����� �Է��� ���
SELECT ROUND(748.58, -1);
SELECT ROUND(748.58, -2);
SELECT ROUND(748.58, -4);

-- LOG �Լ��� �α� 10�� ���
SELECT LOG(10);

-- LOG �Լ��� �α� 10�� 5�� ���
SELECT LOG(10, 5);

-- EXP �Լ��� ���� 1.0�� ���
SELECT EXP(1.0);

-- EXP �Լ��� ���� 10�� ���
SELECT EXP(10);

-- LOG �Լ��� EXP �Լ��� ��� Ȯ��
SELECT EXP(LOG(20)), LOG(EXP(20));

-- POWER �Լ��� �ŵ����� ���
SELECT POWER(2,3), POWER(2,10), POWER(2.0, 3);

-- SQRT �Լ��� ������ ���
SELECT SQRT(1.00), SQRT(10.00);

-- RAND �Լ��� ���� ���
SELECT RAND(100), RAND(), RAND();

-- �μ��� ���� RAND �Լ��� ���� ���
DELIMITER $$

CREATE PROCEDURE rnd()
BEGIN
	DECLARE counter INT;
	
	SET counter = 1;
	
	WHILE counter < 5 DO
		SELECT RAND() Random_Number;
	
		SET counter = counter + 1;
	END WHILE;

END $$

DELIMITER ;

call rnd();

-- COS �Լ� ���
SELECT COS(14.78);

-- SIN �Լ� ���
SELECT SIN(45.175643);

-- TAN �Լ� ���
SELECT TAN(PI()/2), TAN(.45)

-- ATAN �Լ� ���
SELECT 
	ATAN(45.87) AS atanCalc1,
	ATAN(-181.01) AS atanCalc2,
	ATAN(0) AS atanCalc3,
	ATAN(0.1472738) AS atanCalc4,
	ATAN(197.1099392) AS atanCalc5;

