CREATE DATABASE PRJ321_LunarNewYearShop;

use PRJ321_LunarNewYearShop;

CREATE TABLE Account(
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	isSell int NULL,
	isAdmin int NULL,
	isActive INT NOT NULL,
	PRIMARY KEY(username),
);


CREATE TABLE Category(
	cateID int NOT NULL,
	cateName nvarchar(50) NOT NULL,
	PRIMARY KEY(cateID),
);

CREATE TABLE Product(
	proID INT IDENTITY(1,1) PRIMARY KEY,
	proName NVARCHAR(150) NOT NULL,
	price INT NOT NULL,
	proOwner VARCHAR(50) NOT NULL,
	description NVARCHAR(500) NULL,
	cateID INT NOT NULL,
	imgName TEXT NULL,
	quantity INT NOT NULL,
	FOREIGN KEY(proOwner) REFERENCES dbo.Account(username),
	FOREIGN KEY(cateID) REFERENCES dbo.Category(cateID),	
);

CREATE TABLE UserOrder(
	ordID bigint PRIMARY KEY,
	Customer_Name VARCHAR(150) NOT NULL,
	Amount FLOAT NOT NULL,
	FullName NVARCHAR(150),
	PhoneNumber TEXT NULL,
	Address NVARCHAR(150),
	[Date] dateTime NULL,
	[Status] INT NOT NULL,
);

CREATE TABLE OrderDetail(
	Order_Detail_ID bigint PRIMARY KEY,
	ordID bigint NOT NULL,
	proID INT NOT NULL,
	price INT,
	Quantity INT NULL,
	proOwner varchar(50) NULL,
	FOREIGN KEY(ordID) REFERENCES dbo.UserOrder(ordID),
	FOREIGN KEY(proID) REFERENCES dbo.Product(proID),
);

DROP TABLE OrderDetail;

