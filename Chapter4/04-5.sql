-- special_features ���� �����͸� �׷�ȭ
SELECT special_features FROM film GROUP BY special_features;

-- rating ���� �����͸� �׷�ȭ
SELECT rating FROM film GROUP BY rating;

-- special_features, rating �� ������ �����͸� �׷�ȭ
SELECT special_features, rating FROM film GROUP BY special_features, rating;

-- rating, special_features �� ������ �����͸� �׷�ȭ
SELECT rating, special_features FROM film GROUP BY special_features, rating;

-- COUNT �Լ��� �׷쿡 ���� ������ ���� ����
SELECT special_features, COUNT(*) AS cnt FROM film GROUP BY special_features;

-- �� ���� ������ �׷쿡 ���� ������ ���� ����
SELECT 
	special_features, rating, COUNT(*) AS cnt 
FROM film
GROUP BY special_features, rating 
ORDER BY special_features, rating, cnt DESC;

-- SELECT ���� GROUP BY ���� �� �̸��� �޸��� ���
SELECT special_features, rating, COUNT(*) AS cnt FROM film GROUP BY rating;

-- rating ������ G�� �����͸� ���͸�
SELECT 
	special_features, rating, 
FROM film
GROUP BY special_features, rating
HAVING rating = 'G';

-- special_features ������ ������ ������ 70���� ū �͸� ���͸�
SELECT 
	special_features, COUNT(*) AS cnt 
FROM film
GROUP BY special_features
HAVING cnt > 70;

-- �׷�ȭ���� ���� ���� ���͸��� ���
SELECT
	special_features, COUNT(*) AS cnt 
FROM film
GROUP BY special_features
HAVING rating = 'G';

-- ���� ���� ���͸��� ���
SELECT 
	special_features, rating, COUNT(*) AS cnt 
FROM film
GROUP BY special_features, rating
HAVING rating = 'R' AND cnt > 8;

-- �� ���� ������ �ߺ� ����
SELECT DISTINCT special_features, rating FROM film;

-- GROUP BY ������ �� ���� �׷�ȭ�� ���
SELECT special_features, rating FROM film GROUP BY special_features, rating;

-- DISTINCT ���� COUNT �Լ��� ����� ���
SELECT DISTINCT special_features, rating, COUNT(*) AS cnt FROM film;

