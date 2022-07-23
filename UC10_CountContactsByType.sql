###################################################################################################################################################################
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

##################################################################################################################################################################

mysql> CREATE DATABASE addressbook_service;
Query OK, 1 row affected (0.01 sec)

###################################################################################################################################################################
mysql> USE addressbook_service;
Database changed

###################################################################################################################################################################
mysql> select database();
+---------------------+
| database()          |
+---------------------+
| addressbook_service |
+---------------------+
1 row in set (0.00 sec)

###################################################################################################################################################################
mysql> CREATE TABLE addressbook (
    -> firstName varchar(50) NOT NULL,
    ->     lastName varchar(50) NOT NULL,
    ->     address varchar(100),
    ->     city varchar(20),
    ->     state varchar(30),
    ->     zip varchar(10),
    ->     phoneNO varchar(20),
    ->     email varchar(50)
    -> );
Query OK, 0 rows affected (0.02 sec)

###################################################################################################################################################################
mysql> DESC addressbook;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| firstName | varchar(50)  | NO   |     | NULL    |       |
| lastName  | varchar(50)  | NO   |     | NULL    |       |
| address   | varchar(100) | YES  |     | NULL    |       |
| city      | varchar(20)  | YES  |     | NULL    |       |
| state     | varchar(30)  | YES  |     | NULL    |       |
| zip       | varchar(10)  | YES  |     | NULL    |       |
| phoneNO   | varchar(20)  | YES  |     | NULL    |       |
| email     | varchar(50)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

#################################################################################################################################################################
mysql> INSERT INTO addressbook
    -> VALUES
    -> ('kisalay','srivastav','random_address','vizag','AP','530013','9346860516','kisalay@gmail.com'),
    -> ('saran','yallanki','random_address','vizag','AP','530032','9617726229','saran@gmail.com'),
    -> ('subham','verma','random_address','gorakhpur','UP','273001','7894560516','subham@gmail.com'),
    -> ('dinesh','bodepali','random_address','vizag','AP','530009','8332860516','kisalay@gmail.com'),
    -> ('rafi','shaik','random_address','vizag','AP','530011','9982860516','rafi@gmail.com');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

########################################################################################################################################################

mysql> SELECT * FROM addressbook WHERE firstName = 'kisalay'  AND lastName = 'srivastav';
+-----------+-----------+----------------+-------+-------+--------+------------+-------------------+
| firstName | lastName  | address        | city  | state | zip    | phoneNO    | email             |
+-----------+-----------+----------------+-------+-------+--------+------------+-------------------+
| kisalay   | srivastav | random_address | vizag | AP    | 530013 | 9346860516 | kisalay@gmail.com |
+-----------+-----------+----------------+-------+-------+--------+------------+-------------------+
1 row in set (0.00 sec)
#######################################################################################################################################################
mysql> UPDATE addressbook SET city = 'bangalore' WHERE firstName = 'kisalay' AND lastName = 'srivastav';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
######################################################################################################################################################
mysql> SELECT * FROM addressbook WHERE firstName = 'kisalay'  AND lastName = 'srivastav';
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
| firstName | lastName  | address        | city      | state | zip    | phoneNO    | email             |
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
| kisalay   | srivastav | random_address | bangalore | AP    | 530013 | 9346860516 | kisalay@gmail.com |
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
1 row in set (0.00 sec)
########################################################################################################################################################
mysql> DELETE FROM addressbook WHERE firstName = 'dinesh' AND lastName = 'bodepali';
Query OK, 1 row affected (0.01 sec)

##########################################################################################################################################################
mysql> select * from addressbook;
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
| firstName | lastName  | address        | city      | state | zip    | phoneNO    | email             |
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
| kisalay   | srivastav | random_address | bangalore | AP    | 530013 | 9346860516 | kisalay@gmail.com |
| saran     | yallanki  | random_address | vizag     | AP    | 530032 | 9617726229 | saran@gmail.com   |
| subham    | verma     | random_address | gorakhpur | UP    | 273001 | 7894560516 | subham@gmail.com  |
| rafi      | shaik     | random_address | vizag     | AP    | 530011 | 9982860516 | rafi@gmail.com    |
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
4 rows in set (0.00 sec)
############################################################################################################################################################
mysql> SELECT firstName, lastName FROM addressbook WHERE city = 'vizag';
+-----------+----------+
| firstName | lastName |
+-----------+----------+
| saran     | yallanki |
| rafi      | shaik    |
+-----------+----------+
2 rows in set (0.00 sec)
##############################################################################################################################################################
mysql> SELECT firstName, lastName FROM addressbook WHERE state = 'AP';
+-----------+-----------+
| firstName | lastName  |
+-----------+-----------+
| kisalay   | srivastav |
| saran     | yallanki  |
| rafi      | shaik     |
+-----------+-----------+
3 rows in set (0.00 sec)
##############################################################################################################################################################
mysql> SELECT COUNT(firstName) AS contacts_count FROM addressbook WHERE city = 'vizag';
+----------------+
| contacts_count |
+----------------+
|              2 |
+----------------+
1 row in set (0.00 sec)
############################################################################################################################################################
mysql> SELECT COUNT(firstName) AS contacts_count FROM addressbook WHERE state = 'ap';
+----------------+
| contacts_count |
+----------------+
|              3 |
+----------------+
1 row in set (0.00 sec)
#############################################################################################################################################################
mysql> SELECT * FROM addressbook ORDER BY firstName;
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
| firstName | lastName  | address        | city      | state | zip    | phoneNO    | email             |
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
| kisalay   | srivastav | random_address | bangalore | AP    | 530013 | 9346860516 | kisalay@gmail.com |
| rafi      | shaik     | random_address | vizag     | AP    | 530011 | 9982860516 | rafi@gmail.com    |
| saran     | yallanki  | random_address | vizag     | AP    | 530032 | 9617726229 | saran@gmail.com   |
| subham    | verma     | random_address | gorakhpur | UP    | 273001 | 7894560516 | subham@gmail.com  |
+-----------+-----------+----------------+-----------+-------+--------+------------+-------------------+
#############################################################################################################################################################


mysql> ALTER TABLE addressbook ADD type varchar(20) NOT NULL AFTER lastName;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc addressbook;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| firstName | varchar(50)  | NO   |     | NULL    |       |
| lastName  | varchar(50)  | NO   |     | NULL    |       |
| type      | varchar(20)  | NO   |     | NULL    |       |
| address   | varchar(100) | YES  |     | NULL    |       |
| city      | varchar(20)  | YES  |     | NULL    |       |
| state     | varchar(30)  | YES  |     | NULL    |       |
| zip       | varchar(10)  | YES  |     | NULL    |       |
| phoneNO   | varchar(20)  | YES  |     | NULL    |       |
| email     | varchar(50)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)
###################################################################################################################################################################
mysql> UPDATE addressbook SET type  = 'Friends' WHERE firstName = 'dinesh' OR firstname = 'rafi';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+-----------+-----------+---------+----------------+-----------+-------+--------+------------+-------------------+
| firstName | lastName  | type    | address        | city      | state | zip    | phoneNO    | email             |
+-----------+-----------+---------+----------------+-----------+-------+--------+------------+-------------------+
| kisalay   | srivastav |         | random_address | bangalore | AP    | 530013 | 9346860516 | kisalay@gmail.com |
| saran     | yallanki  |         | random_address | vizag     | AP    | 530032 | 9617726229 | saran@gmail.com   |
| subham    | verma     |         | random_address | gorakhpur | UP    | 273001 | 7894560516 | subham@gmail.com  |
| rafi      | shaik     | Friends | random_address | vizag     | AP    | 530011 | 9982860516 | rafi@gmail.com    |
+-----------+-----------+---------+----------------+-----------+-------+--------+------------+-------------------+
4 rows in set (0.00 sec)
#######################################################################################################################################################################
mysql> UPDATE addressbook SET type  = 'Profession' WHERE firstName != 'dinesh' AND firstname != 'rafi' AND firstname != 'yashwant';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from addressbook;
+-----------+-----------+------------+----------------+-----------+-------+--------+------------+-------------------+
| firstName | lastName  | type       | address        | city      | state | zip    | phoneNO    | email             |
+-----------+-----------+------------+----------------+-----------+-------+--------+------------+-------------------+
| kisalay   | srivastav | Profession | random_address | bangalore | AP    | 530013 | 9346860516 | kisalay@gmail.com |
| saran     | yallanki  | Profession | random_address | vizag     | AP    | 530032 | 9617726229 | saran@gmail.com   |
| subham    | verma     | Profession | random_address | gorakhpur | UP    | 273001 | 7894560516 | subham@gmail.com  |
| rafi      | shaik     | Friends    | random_address | vizag     | AP    | 530011 | 9982860516 | rafi@gmail.com    |
+-----------+-----------+------------+----------------+-----------+-------+--------+------------+-------------------+
4 rows in set (0.00 sec)
#########################################################################################################################################################################
mysql> UPDATE addressbook SET type  = 'Family' WHERE firstName = 'yashwant';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from addressbook;
+-----------+-----------+------------+----------------+-----------+-------+--------+------------+-------------------+
| firstName | lastName  | type       | address        | city      | state | zip    | phoneNO    | email             |
+-----------+-----------+------------+----------------+-----------+-------+--------+------------+-------------------+
| kisalay   | srivastav | Profession | random_address | bangalore | AP    | 530013 | 9346860516 | kisalay@gmail.com |
| saran     | yallanki  | Profession | random_address | vizag     | AP    | 530032 | 9617726229 | saran@gmail.com   |
| subham    | verma     | Profession | random_address | gorakhpur | UP    | 273001 | 7894560516 | subham@gmail.com  |
| rafi      | shaik     | Friends    | random_address | vizag     | AP    | 530011 | 9982860516 | rafi@gmail.com    |
+-----------+-----------+------------+----------------+-----------+-------+--------+------------+-------------------+
4 rows in set (0.00 sec)

#######################################################################################################################################################################

mysql> SELECT COUNT(firstName) AS contacts_count_by_type FROM addressbook WHERE type = 'Profession';
+------------------------+
| contacts_count_by_type |
+------------------------+
|                      3 |
+------------------------+
1 row in set (0.00 sec)

################################################################################################################################################################
