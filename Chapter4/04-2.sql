-- WHERE ��, = �����ڷ� Ư�� �� ��ȸ
SELECT * FROM customer WHERE first_name = 'MARIA';

-- address_id�� 200�� ���� ��ȸ
SELECT * FROM customer WHERE address_id = 200;

-- address_id�� 200 �̸��� ���� ��ȸ
SELECT * FROM customer WHERE address_id < 200;

-- first_name�� MARIA�� ���� ��ȸ
SELECT * FROM customer WHERE first_name = 'MARIA';

-- first_name�� MARIA �̸��� ���� ��ȸ
SELECT * FROM customer WHERE first_name < 'MARIA';

-- payment_date�� 2005-07-09 13:24:07�� ���� ��ȸ
SELECT * FROM payment WHERE payment_date = '2005-07-09 13:24:07';

-- payment_date�� 2005�� 7�� 9�� �̸��� ���� ��ȸ
SELECT * FROM payment WHERE payment_date < '2005-07-09';

-- ������ ������ �ش��ϴ� ������ ��ȸ
SELECT * FROM customer WHERE address_id BETWEEN 5 AND 10;

-- 2005�� 6�� 17��~2005�� 7�� 19���� ������ ��¥ ��ȸ
SELECT * FROM payment WHERE payment_date BETWEEN '2005-06-17' AND '2005-07-19';

-- ��Ȯ�� ��¥�� ��ȸ
SELECT * FROM payment WHERE payment_date = '2005-07-08 07:33:56';

-- first_name ������ M~O ������ ������ ��ȸ
SELECT * FROM customer WHERE first_name BETWEEN 'M' AND 'O';

-- first_name ������ M~O ������ ���� ������ ������ ��ȸ
SELECT * FROM customer WHERE first_name NOT BETWEEN 'M' AND 'O';

-- �� ������ �����ϴ� ������ ��ȸ
SELECT * FROM city WHERE city = 'Sunnyvale' AND country_id= 103;

-- �� ���� �� ������� �����ϴ� ������ ��ȸ
SELECT * FROM payment WHERE payment_date >= '2005-06-01' AND payment_date <= '2005-07-05';

-- �� ������ ������ ��� ������ ��ȸ
SELECT * FROM customer WHERE first_name = 'MARIA' OR first_name = 'LINDA';

-- OR�� �� �� �̻� ����� ���
SELECT * FROM customer WHERE first_name = 'MARIA' OR first_name = 'LINDA' OR first_name = 'NANCY';

-- IN�� Ȱ���� ������ ��ȸ
SELECT * FROM customer WHERE first_name IN ('MARIA', 'LINDA','NANCY');

-- �䱸 ������ �ݿ��� �ۼ��� ����
SELECT * FROM city WHERE country_id = 103 OR country_id = 86 AND city IN ('Cheju', 'Sunnyvale', 'Dallas');

-- ���� ������ ����
SELECT * FROM city WHERE country_id = 86 OR country_id = 103 AND city IN ('Cheju', 'Sunnyvale', 'Dallas' );

-- �Ұ�ȣ�� �켱������ �ٽ� ���� �����͸� ��ȸ
SELECT * FROM city WHERE (country_id = 103 OR country_id = 86) AND city IN ('Cheju', 'Sunnyvale', 'Dallas');

-- IN, AND�� �����Ͽ� ��ȸ
SELECT * FROM city WHERE country_id IN (103, 86) AND city IN ('Cheju', 'Sunnyvale', 'Dallas' );

-- Null�� �ִ� ���̺� ��ȸ
SELECT * FROM address;

-- = �����ڸ� ����� NULL ������ ��ȸ
SELECT * FROM address WHERE address2 = NULL;

-- address2 ������ NULL�� ������ ��ȸ
SELECT * FROM address WHERE address2 IS NULL;

-- address2 ������ NULL�� �ƴ� ������ ��ȸ
SELECT * FROM address WHERE address2 IS NOT NULL;

-- address2 ������ NULL�� �ƴ� ������ ��ȸ
SELECT * FROM address WHERE address2 = '';

