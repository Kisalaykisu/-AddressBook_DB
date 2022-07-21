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
