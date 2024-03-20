-- yfinance ��ġ ���
pip install yfinance

-- pymysql ��ġ ���
pip install pymysql

-- pandas ��ġ ���
pip install pandas

-- �ֽ� �м��� ���� �����ͺ��̽� ����
CREATE DATABASE us_stock;

-- �ֽ� �м��� ���� nasdaq_company ���̺� ����
USE us_stock;

CREATE TABLE nasdaq_company(
symbol VARCHAR(255),
company_name VARCHAR(255),
country VARCHAR (255),
ipo_year INT,
sector VARCHAR(255),
industry VARCHAR(255),
last_crawel_date_stock DATETIME,
is_delete VARCHAR(5),
open DECIMAL(18,2),
high DECIMAL(18,2),
low DECIMAL(18,2),
close DECIMAL(18,2),
adj_close DECIMAL(18,2),
volume BIGINT
);

ALTER TABLE nasdaq_company ADD PRIMARY KEY(symbol);

-- �ֽ� �м��� ���� stock ���̺� ����
USE us_stock;

CREATE TABLE stock(
date DATETIME,
symbol VARCHAR(255),
open DECIMAL(18,2),
high DECIMAL(18,2),
low DECIMAL(18,2),
close DECIMAL(18,2),
adj_close DECIMAL(18,2),
volume BIGINT
);

CREATE INDEX ix_stock_1 ON stock(date,symbol);
CREATE INDEX ix_stock_2 ON stock(symbol,date);

-- �ֽ� �м��� ���� ���� ������ ����
insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('TSLA', 'Tesla Inc. Common Stock', 2010, 'Capital Goods', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('MSFT', 'Microsoft Corporation Common Stock', 1986, 'Technology', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('AMZN', 'Amazon.com Inc. Common Stock', 1997, 'Consumer Services', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('AAPL', 'Apple Inc. Common Stock', 1980, 'Technology', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('INTC', 'Intel Corporation Common Stock', NULL, 'Technology', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('NVDA', 'NVIDIA Corporation Common Stock', 1999, 'Technology', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('AMD', 'Advanced Micro Devices Inc. Common Stock', NULL, 'Technology', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('META', 'Meta Platforms, Inc.', 2012, 'Technology', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('AMPG', 'AMPG, Inc.', 2012, '', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('CAR', 'CAR, Inc.', 2012, '', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('UAN', 'UAN, Inc.', 2012, '', 'K2');

insert into nasdaq_company (symbol, company_name, ipo_year, sector, industry) values ('BHR', 'BHR, Inc.', 2012, '', 'K2');

SELECT * FROM nasdaq_company;

-- main.py ���� ����

-- ������ �ֽ� ������ �Ϻθ� Ȯ��
SELECT * FROM stock LIMIT 10;