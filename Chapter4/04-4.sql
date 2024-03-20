-- ù ��° ���ڰ� A�� �����ϴ� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'A%';

-- ù ��° ���ڰ� AA�� �����ϴ� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'AA%';

-- A�� ������ ��� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE '%A';

-- RA�� ������ ��� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE '%RA';

-- A�� ������ ��� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE '%A%';

-- ù ��° ���ڰ� A�� �������� �ʴ� �����͸� ��ȸ
SELECT * FROM customer WHERE first_name NOT LIKE 'A%';

-- Ư�� ���ڸ� ������ ������ ���̺� ����
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE;

-- Ư�� ���� %�� ������ ������ ��ȸ
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%';

-- ESCAPE�� Ư�� ���� %�� ������ ������ ��ȸ
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%#%%' ESCAPE '#';

-- ESCAPE�� !�� Ư�� ���� %�� ������ ������ ��ȸ
WITH CTE (col_1) AS (
SELECT 'A%BC' UNION ALL
SELECT 'A_BC' UNION ALL
SELECT 'ABC'
)
SELECT * FROM CTE WHERE col_1 LIKE '%!%%' ESCAPE '!';

-- A�� �����ϸ鼭 ���ڿ� ���̰� 2�� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'A_';

-- A�� �����ϸ鼭 ���ڿ� ���̰� 3�� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'A__';

-- A�� �����鼭 ���ڿ� ���̰� 3�� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE '__A';

-- A�� �����ϰ� A�� �����鼭 ���ڿ� ���̰� 4�� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'A__A';

-- ���ڿ� ���̰� 5�� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE '_____';

-- A_R�� �����ϴ� ���ڿ� ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'A_R%';

-- __R�� �����ϴ� ���ڿ� ��ȸ
SELECT * FROM customer WHERE first_name LIKE '__R%';

-- A�� �����ϸ鼭 R_�� ������ ���ڿ� ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'A%R_';

-- ^, |, $�� ����� ������ ��ȸ
SELECT * FROM customer WHERE first_name REGEXP '^K|N$';

-- [��]�� ����� ������ ��ȸ
SELECT * FROM customer WHERE first_name REGEXP 'K[L-N]';

-- [^��]�� ����� ������ ��ȸ
SELECT * FROM customer WHERE first_name REGEXP 'K[^L-N]';

-- %�� [��]�� ����� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE 'S%' AND first_name REGEXP 'A[L-N]';

-- ���ϵ�ī�� �������� ������ ��ȸ
SELECT * FROM customer WHERE first_name LIKE '_______' AND first_name REGEXP 'A[L-N]' AND first_name REGEXP 'O$';