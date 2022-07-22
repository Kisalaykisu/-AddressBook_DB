#UC 3 Ability to insert new Contacts to Address Book
CREATE DATABASE addressbook_service;
USE addressbook_service;
CREATE TABLE addressbook (
	firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    address varchar(100),
    city varchar(20),
    state varchar(30),
    zip varchar(10),
    phoneNO varchar(20),
    email varchar(50)
);
DESC addressbook;

INSERT INTO addressbook 
VALUES 
('kisalay','srivastav','random_address','vizag','AP','530013','9346860516','kisalay@gmail.com'),
('dipali','sonawane','random_address','vizag','AP','530032','9617726229','dipali@gmail.com'),
('subham','verma','random_address','gorakhpur','UP','273001','7894560516','subham@gmail.com'),
('dinesh','bodepali','random_address','vizag','AP','530009','8332860516','kisalay@gmail.com'),
('rafi','shaik','random_address','vizag','AP','530011','9982860516','rafi@gmail.com');
