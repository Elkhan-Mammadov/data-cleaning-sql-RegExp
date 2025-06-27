--Table created 

Create table  customers (
first_name VARCHAR2(30),
last_name  VARCHAR2(30),
address   VARCHAR2(100),
phone VARCHAR2(20),
email VARCHAR2(50));


--Inserting 10 rows

INSERT INTO customers VALUES ('eLxan', 'MAMmadov', 'Bakı, Azadlıq 45, AZ1142', '0505658789', 'elxan.mammadov@gmail.com');
INSERT INTO customers VALUES ('AysEL', 'quLiYEVA', 'Gəncə, Nərimanov 12, AZ2001', '+994556782397', 'aysel_q@gmail.com');
INSERT INTO customers VALUES ('turAl', 'SADIqov', 'Sumqayıt, Sülh 23, AZ5000', '+9940773427898', 'tural1990@outlook.com');
INSERT INTO customers VALUES ('SEVda', 'HASANli', 'Şəki, Heydər Əliyev 1, AZ5500', '559875623', 'sevda_h@mail.az');
INSERT INTO customers VALUES ('RamiL', 'AhMADov', 'Xırdalan, Mərkəzi 7, AZ5600', '0704567890', 'ramil.a@gmail.com');
INSERT INTO customers VALUES ('nIGAR', 'mEHdiYEVA', 'Lənkəran, Qələbə 11, AZ6001', '00994500333222', 'nigar@xmail.az');
INSERT INTO customers VALUES ('SAmiR', 'TaGİYEV', 'Mingəçevir, Dədə Qorqud 4, AZ3002', '055 645 67 89', 'samir!tagiyev@site');
INSERT INTO customers VALUES ('LEYla', 'ABDULlAyeva', 'Bərdə, Heydər Əliyev 13, AZ3400', '504445566', 'leyla.qurbanova@outlook.com');
INSERT INTO customers VALUES ('murAD', 'SULTANOV', 'Qəbələ, Q.Qarayev 9, AZ5600', '+994 50 987 65 43', 'murad@gmail.net');
INSERT INTO customers VALUES ('zeyNEB', 'KƏRİMLİ', 'Zaqatala, Faiq Əmirov 2, AZ4700', '0771231231', 'zeyneb.karimli@code.az');


--Check  customers table

select * from customers;


--Create cleaned customer table with standardized names, address, phone, and email domains

Create table customers_cleaned as
select
initcap(lower(first_name)) as first_name,
initcap(lower(last_name)) as last_name,
regexp_substr(address, '^[^,]+') as address,
regexp_substr(address, 'AZ\d{4}') as postal_code,
'+994 ' || regexp_replace(substr(regexp_replace(phone,'\D', ''), -9), 
'(\d{2})(\d{3})(\d{2})(\d{2})','\1-\2-\3-\4' ) as phone,
email,
regexp_substr(email, '@(.+)$', 1, 1, null, 1) as email_domain
from customers;


--Check customers_cleaned table

select * from customers_cleaned;