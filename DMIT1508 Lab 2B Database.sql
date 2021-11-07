--Use "your database on DMIT-SQL1"

Go

Drop Table SaleDetail;
Drop Table Sale;
Drop Table AuthorTitle;
Drop Table Author;
Drop Table Title;
Drop Table Customer;
Drop Table Employee;
Drop Table Category;
Drop Table Publisher;
Go

Create Table Publisher
(
	PublisherCode			int identity(200,1)	not null 
												constraint PK_Publisher_PublisherCode Primary Key,
	Name					varchar(40)			not null 
);

Create Table Category
(
	CategoryCode			int identity(1,1)	not null 
												constraint PK_Category_CategoryCode Primary Key,
	Description				varchar(40)			not null
);

Create Table Employee
(
	EmployeeNumber			int identity(300,1)	not null 
												constraint PK_Employee_EmployeeNumber Primary Key,
	SIN						char (9)			not null,
	LastName				varchar(30)			not null,
	FirstName				varchar(30)			not null,
	Address					varchar(40)			not null,
	City					varchar(20)			null,
	Province				char(2)				null
												constraint DF_Employee_Province_AB default 'AB',
	PostalCode				char(6)				null 
												constraint CK_Employee_PostalCode_Z9Z9Z9 
													check (PostalCode like'[A-Z][0-9][A-Z][0-9][A-Z][0-9]'),
	HomePhone				char(10)			null
												constraint CK_Employee_HomePhone_9999999999
													check (HomePhone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	WorkPhone				char(10)			null
												constraint CK_Employee_WorkPhone_9999999999
													check (WorkPhone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Email					varchar(40)			null,
	ActiveYN				char(1)				not null
												constraint DF_Employee_ActiveYN_Y default 'Y' 
);

Create Table Customer
(
	CustomerNumber			int identity (1,1)	not null
												constraint PK_Customer_CustomerNumber Primary Key,
	LastName				varchar(30)			not null,
	FirstName				varchar(30)			not null,
	Address					varchar(40)			not null,
	City					varchar(30)			null,
	Province				char(2)				null
												constraint DF_Customer_Province_AB default 'AB',
	PostalCode				char(6)				null
												constraint CK_Customer_PostalCode_Z9Z9Z9
													check (PostalCode like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]'),
	HomePhone				char(10)			null
												constraint CK_Customer_HomePhone_9999999999
													check (HomePhone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	WorkPhone				char(10)			null
												constraint CK_Customer_WorkPhone_9999999999
													check (WorkPhone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	EmailAddress			varchar(30)			null
												constraint CK_Customer_EmailAddress_Chars_At_Chars
													check (EmailAddress like '%___@___%.__%')
);

Create Table Title
(
	ISBN					char(10)			not null
												constraint PK_Title_ISBN Primary Key,
	Title					varchar(40)			not null,
	SuggestedPrice			smallmoney			not null
												constraint DF_Title_SuggestedPrice_Zero default 0,
	NumberInStock			smallint			not null 
												constraint DF_Title_NumberInStock_Zero default 0
												constraint CK_Title_NumberInstock_GrEqZero
													check (NumberInStock >=0),
	PublisherCode			int					not null
												constraint FK_Title_Publisher_PublisherCode
													references Publisher(PublisherCode),
	CategoryCode			int					not null
												constraint FK_Title_Category_CategoryCode
													references Category(CategoryCode)
);

Create Table Author
(
	AuthorCode				int identity(100,1)	not null
												constraint PK_Author_AuthorCode Primary Key,
	FirstName				varchar(30)			null,
	LastName				varchar(30)			not null
);


Create Table AuthorTitle
(
	ISBN					char(10)			not null
												constraint FK_AuthorTitle_Title_ISBN
													references Title(ISBN),
	AuthorCode				int					not null
												constraint FK_AuthorTitle_Author_AuthorCode
													references Author(AuthorCode),
	constraint PK_AuthorTitle_AuthorCode_ISBN Primary Key(ISBN, AuthorCode)

);

Create Table Sale
(
	SaleNumber				int identity(3000,1) not null
												constraint PK_Sale_SaleNumber Primary Key,
	SaleDate				datetime			not null,
	SubTotal				money				not null,
	GST						money				not null,
	Total					money				not null,
	EmployeeNumber			int					not null
												constraint FK_Sale_Employee_EmployeeNumber
													references Employee(EmployeeNumber),
	CustomerNumber			int					not null
												constraint FK_Sale_Customer_CustomerNumber
													references Customer(CustomerNumber),
	constraint CK_Sale_Total_GrEq_SubTotal check (Total >= SubTotal)
);

Create Table SaleDetail
(
	SaleNumber				int					not null
												constraint FK_SaleDetail_Sale_SaleNumber
													references Sale(SaleNumber),
	ISBN					char (10)			not null
												constraint FK_SaleDetail_Title_ISBN
													references Title(ISBN),
	SellingPrice			money				not null,
	Quantity				int					not null,
	Amount					money				not null
	constraint PK_SaleDetail_SaleNumber_ISBN Primary Key(SaleNumber, ISBN)
);
Go

Create nonclustered Index IX_Title_PublisherCode	on Title(PublisherCode)
Create nonclustered Index IX_Title_CategoryCode		on Title(CategoryCode)
Create nonclustered Index IX_Sale_EmployeeNumber	on Sale(EmployeeNumber)
Create nonclustered Index IX_Sale_CustomerNumber	on Sale(CustomerNumber)
Create nonclustered Index IX_AuthorTitle_ISBN		on AuthorTitle(ISBN)
Create nonclustered Index IX_AuthorTitle_AuthorCode	on AuthorTitle(AuthorCode)
Create nonclustered Index IX_SaleDetail_SaleNumber	on SaleDetail(SaleNumber)
Create nonclustered Index IX_SaleDetail_ISBN		on SaleDetail(ISBN)
Go


Insert into Publisher
	(Name)
Values
	('Addison Westley'),
	('SAMS'),
	('Harlequin'),
	('Self Publish Inc'),
	('Microsoft Press'),
	('Jones and Bartlett'),
	('WROX'),
	('West'),
	('Premier')


Insert into Category
	(Description)
Values
	('Computers'),
	('Business'),
	('Human Relation'),
	('Electronics'),
	('Designs'),
	('Miscellaneous'),
	('Media Design'),
	('Information Technologies'),
	('Things To Do When Bored')


Insert into Employee
	(SIN, LastName, FirstName, Address, City, Province, PostalCode, HomePhone, WorkPhone, Email)
Values
	('666555410', 'Zinick', 'Zeb', '12345 67 St', 'Edmonton', 'AB', 'T5J1X1', '7806665555', '7809976666', 'Zebz@hotmail.com'),
	('666555412', 'Young', 'Yanny', '12345 77 St', 'Edmonton', 'AB', 'T5J1X2', '7806664433', '7809971234', 'yannyy@hotmail.com'),
	('666555415', 'Winters', 'Willy', '12345 87 St', 'Edmonton', 'AB', 'T5J1X3', '7806665544', '7809972345', 'willyw@hotmail.com'),
	('666555449', 'Verse', 'Vinny', '12345 97 St', 'Edmonton', 'AB', 'T5J1X4', '7806666655', '7809973456', 'vinnyv@hotmail.com'),
	('666555413', 'Unger', 'Ursella', '12345 107 St', 'Edmonton', 'AB', 'T5J1X5', '7806667766', '7809974567', 'ursellau@hotmail.com'),
	('666555411', 'Tucker', 'Tom', '12345 57 St', 'Edmonton', 'AB', 'T5J1X6', '7806668877', '7809975678', 'tomt@hotmail.com'),
	('666555447', 'Stevenson', 'Steve', '12345 47 St', 'Edmonton', 'AB', 'T5J1X7', '7806669988', '7809976789', 'steves@hotmail.com'),
	('666555448', 'Sun', 'Sam', '12345 117 St', 	 'Edmonton', 'AB', 'T5J1X8', '7806660099', '7809977890', 'sams@hotmail.com'),
	('666555414', 'Gretzki', 'Wayne', '12345 22 Avenue', 'Edmonton', 'AB', 'T5J1X4', '7806666641', '7809973401', 'wayneg@gmail.com'),
	('666555446', 'Coffee', 'Ron', 	 '12345 122 Avenue', 'Edmonton', 'AB', 'T5J1X5', '7806667740', '7809974523', 'rcoffee@gmail.com'),
	('666555445', 'Lowe', 'Kevin', '12345 56 Avenue', 'Edmonton', 'AB', 'T5J1X6', '7806668839', '7809975634', 'kevinl@hotmail.com'),
	('666555443', 'Dryden', 'Dave', '12345 100 Avenue', 'Edmonton', 'AB', 'T5J1X7', '7806669938', '7809976735', 'ddry@hotmail.com'),
	('666555442', 'Kurri', 'Jari', '12345 78 Avenue', 'Edmonton', 'AB', 'T5J1X8', '7806660037', '7809977836', 'jarikur@hotmail.com'),
	('666555441', 'Thirteen', 'Lucky', '12345 70 Avenue', 'Edmonton', 'AB', 'T5J1X0', '7806660030', '7809977830', 'lucky13@hotmail.com')


Insert into Customer
	(LastName, FirstName, Address, City, PRovince, PostalCode, HomePhone, WorkPhone, EmailAddress)
Values
	('Gretzki', 'Wayne', '5619 - 99 Ave', 'Edmonton', 'AB', 'T5R1B1', '7807771234', '7897871122', 'russr@shaw.ca'),
	('Potter', 'Harry', '5403 - 120 St', 'Edmonton', 'AB', 'T5R1B2', '7807772345', '7897872122', 'hpotter@gmail.com'),
	('Overland', 'Miles', '10932 - 117 Ave', 'Edmonton', 'AB', 'T5R1B3', '7807771245', '7897874122', 'mileso@shaw.ca'),
	('North', 'Nathan', '12705 - 153 Ave', 'Edmonton', 'AB', 'T5R1B4', '7807775432', '7897871422', 'nnorth@shaw.ca'),
	('Morton', 'Milley', '11911 - 135 St', 'Edmonton', 'AB', 'T5R1B5', '7807776543', '7897871142', 'mmorton@gmail.com'),
	('Lancelot', 'Cruse', '8713 - 111 Ave', 'Edmonton', 'AB', 'T5R1B6', '7807773456', '7897871124', 'mmorton@shaw.ca'),
	('Kettle', 'P. A.', '12903 - 127 St', 'Edmonton', 'AB', 'T5R1B7', '7807774567', '7897875122', 'pak@shaw.ca'),
	('Great', 'Wayne', '7821 - Birch Cr', 'Edmonton', 'AB', 'T5R1B8', '7807777654', '7897871522', 'johnj@shaw.ca'),
	('Innes', 'Isabel', '5705 - 118 Ave', 'Edmonton', 'AB', 'T5R1B9', '7807771236', '7897871152', 'iines@shaw.ca'),
	('Hanson', 'Hans', '14305 - 101 St', 'Edmonton', 'AB', 'T5R2B1', '7807771237', '7897871125', 'hansh@shaw.ca'),
	('Guest', 'Guss', '2305 - 23 Ave', 'Edmonton', 'AB', 'T5R3C1', '7807771238', '7897876122', 'gussg@shaw.ca'),
	('Forest', 'Fern', '12904 - Dunluce Cr', 'Edmonton', 'AB', 'T5R4C1', '7807771239', '7897871622', 'fernf@shaw.ca'),
	('Evans', 'Even', '6606 - 129 Ave', 'Edmonton', 'AB', 'T5R5B1', '7807771230', '7897871162', 'evene@shaw.ca'),
	('Drake', 'Doris', '8301 - 144 St', 'Edmonton', 'AB', 'T5R6B1', '7807771288', '7897871126', 'ddrake@hotmail.com'),
	('Cotter', 'Cal', '15309 - 167 Ave', 'Edmonton', 'AB', 'T5R7B1', '7807771777', '7897877122', 'calc@shaw.ca'),
	('Benson', 'Ben', '23109 - 14 Ave', 'Edmonton', 'AB', 'T5R8B1', '7807771785', '7897871722', 'benb@hotmail.com'),
	('Apple', 'Andy', '8221 - 121 Ave', 'Edmonton', 'AB', 'T5R9B1', '7807771456', '7897871172', 'andya@shaw.ca'),
	('Kay', 'Jari', '9503 - 125 St', 'Edmonton', 'AB', 'T5R0B1', '7807771455', '7897871127', 'billb@shaw.ca'),
	('Kurri', 'Jari', '11113 - 149 St', 'Edmonton', 'AB', 'T5R3F1', '7807771223', '7897878122', 'ccrane@hotmail.com'),
	('Dove', 'Dave', '9812 - 107 Ave', 'Edmonton', 'AB', 'T5R4R1', '7807771986', '7897871822', 'ddove@shaw.ca'),
	('Anderson', 'Glen', '1009 - 99 Ave', 'Edmonton', 'AB', 'T5R1B1', '7807771234', '7897871122', 'dsem@shaw.ca'),
	('Coffey', 'Paul', '7701 - 143 St', 'Edmonton', 'AB', 'T5R1B2', '7807772345', '7897872122', 'glenandr@shaw.ca'),
	('Price', 'Pat', '10112 - 149 Ave', 'Edmonton', 'AB', 'T5R1B3', '7807771245', '7897874122', 'pcof@shaw.ca'),
	('Semenko', 'Dave', '2323 - 24 Ave', 'Edmonton', 'AB', 'T5R1B4', '7807775432', '7897871422', 'atprice@shaw.ca'),
	('Huddy', 'Charlie', '3419 - 34 Ave', 'Edmonton', 'AB', 'T5R1B5', '7807776543', '7897871142', 'chud@shaw.ca'),
	('Low', 'Ron', 	'7007 - 95 St', 'Edmonton', 'AB', 'T5R1B6', '7807773456', '7897871124', 'ronl@gmail.com'),
	('Simpson', 'Homer', '5412 - 103 Ave', 'Edmonton', 'AB', 'T5R1B6', '7807773456', '7897871124', 'simpone@gmail.com'),
	('Claus', 'Santa', '13223 - 148 St', 'Edmonton', 'AB', 'T5R1B6', '7807773456', '7897871124', 'SantaC@gmail.com'),
	('Horton', 'Tim', '14014 - 158 St', 'Edmonton', 'AB', 'T5R1B6', '7807773456', '7897871124', 'TimG@gmail.com')


Insert into Title
	(ISBN, Title, CategoryCode, PublisherCode, SuggestedPrice, NumberInStock)
Values
	('1021031040', 'PL SQL', 1, 200, 75.50, 10),
	('1021031041', 'SQL in 30 days', 1, 201, 90.00, 12),
	('1021031042', 'Visual Basic .Net', 1, 202, 95.00, 15),
	('1021031043', 'Pascal', 1, 203, 178.40, 6),
	('1021031044', 'Introduction to .net', 1, 204, 70.00, 7),
	('1021031045', 'VB.Net for Business', 1, 205, 99.00, 8),
	('1021031046', 'Programming for Bus', 1, 200, 78.00, 10),
	('1021031047', 'Java', 1, 201, 67.30, 10),
	('1021031048', 'Java Beans', 1, 202, 70.00, 2),
	('1021031049', 'Flowcharting', 1, 203, 75.00, 12),
	('1021031050', 'Structured Charts', 1, 204, 145.00, 10),
	('1021031051', 'Object Code', 1, 205, 23.00, 10),
	('1021031052', 'MS SQL', 1, 205, 12.00, 15),
	('1021031053', 'Database Management', 1, 204, 56.00, 10),
	('1021031054', 'Oracle', 4, 203, 80.00, 5),
	('1021031055', 'Oracle in 21 days', 4, 202, 90.00, 10),
	('1021031056', 'Accounting Basics', 2, 201, 80.00, 5),
	('1021031057', 'Intro to Acct', 2, 200, 80.00, 6),
	('1021031058', 'Intermediate Acct', 2, 200, 90.00, 7),
	('1021031059', 'Advanced Accounting', 2, 201, 70.00, 0),
	('1021031061', 'Management Principles', 2, 202, 80.00, 0),
	('1021031063', 'Marketing Now', 2, 203, 80.00, 10),
	('1021031064', 'Bus Communications', 2, 203, 80.00, 5),
	('1021031065', 'Corporate Law', 2, 204, 99.00, 6),
	('1021031066', 'Circuts', 4, 205, 80.00, 7),
	('1021031068', 'Circut Design', 4, 205, 80.00, 8),
	('1021031069', 'UML a new Approach', 5, 205, 35.00, 10),
	('1021031070', 'UML Basics', 5, 200, 45.00, 10),
	('1021031071', 'Business Life Cycle', 5, 200, 355.00, 10),
	('1021031072', 'C++', 4, 201, 80.00, 2),
	('1021031073', 'Visual C', 4, 202, 80.00, 2),
	('1021031074', 'ADO.Net', 4, 203, 80.00, 0),
	('1021031075', 'Changing a Tire', 6, 204, 20.00, 1),
	('1021031076', 'Defensive Driving', 6, 205, 50.00, 2),
	('1021031077', 'The Art of Cooking', 6, 200, 40.00, 1),
	('1021031079', 'Baking Bread', 6, 201, 30.00, 1),
	('1021031200', 'Flash Beginners', 7, 205, 150.00, 7),
	('1021031201', 'Analysis of Business', 8, 205, 180.00, 8),
	('1021031203', 'Php, Java and C#', 8, 205, 130.00, 10),
	('1021031204', 'SAD at NAIT', 8, 200, 10.00, 10),
	('1021031205', 'Business DATABASE', 8, 200, 190.00, 10),
	('1021031207', 'Oracle and Beyond', 8, 201, 120.00, 2),
	('1021031208', 'Flash and the Web', 7, 202, 130.00, 2),
	('1021031210', 'Web Design', 7, 203, 110.00, 0),
	('1021031211', 'Illustrator', 7, 204, 100.00, 1),
	('1021031212', 'Photoshop Starter', 7, 205, 150.00, 2),
	('1021031213', 'Flash and Fun', 7, 200, 140.00, 1),
	('1021031214', 'Indesign and Fun', 7, 201, 130.00, 1)


Insert into Author
	(LastName, FirstName)
Values
	('Smith', 'Sammy'),
	('Greens', 'George'),
	('Jones', 'Johnny'),
	('Davidson', 'David'),
	('Robertson', 'Rob'),
	('Abbots', 'Abe'),
	('Bakers', 'Bob'),
	('Caters', 'Clem'),
	('Semenko', 'Dave'),
	('Franky', 'Fran'),
	('Horton', 'Harry'),
	('Kelly', 'Kevin'),
	('Lambert', 'Larry'),
	('Johnson', 'Jon'),
	('Anderson', 'Ander'),
	('Peterson', 'Peter'),
	('Jensen', 'Jens'),
	('Issacsen', 'Issac')


Insert into AuthorTitle
	(AuthorCode, ISBN)
Values
	(100, '1021031040'),
	(101, '1021031040'),
	(103, '1021031040'),
	(100, '1021031041'),
	(101, '1021031042'),
	(102, '1021031042'),
	(103, '1021031043'),
	(104, '1021031044'),
	(105, '1021031045'),
	(106, '1021031046'),
	(107, '1021031047'),
	(108, '1021031048'),
	(109, '1021031049'),
	(110, '1021031050'),
	(101, '1021031051'),
	(102, '1021031052'),
	(103, '1021031053'),
	(104, '1021031054'),
	(105, '1021031054'),
	(105, '1021031055'),
	(106, '1021031056'),
	(107, '1021031057'),
	(108, '1021031058'),
	(109, '1021031059'),
	(110, '1021031059'),
	(100, '1021031061'),
	(101, '1021031063'),
	(102, '1021031064'),
	(103, '1021031065'),
	(104, '1021031066'),
	(105, '1021031068'),
	(106, '1021031069'),
	(107, '1021031070'),
	(108, '1021031071'),
	(109, '1021031072'),
	(108, '1021031072'),
	(100, '1021031073'),
	(101, '1021031074'),
	(108, '1021031075'),
	(108, '1021031076'),
	(108, '1021031077'),
	(106, '1021031079'),
	(107, '1021031079'),
	(108, '1021031079') 


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Dec 20, 2014', 1, 300, 75.00, 3.75 , 78.75 )
Insert into SaleDetail 
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3000, 1021031079, 75.00, 1, 75.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jan 10, 2015', 2, 301, 70.00, 3.50 , 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3001, 1021031077, 70.00, 1, 70.00)
 

Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jan 10, 2015', 3, 302, 70.00, 3.50 , 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3002, 1021031077, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jan 10, 2015', 4, 303, 70.00, 3.50 , 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3003, 1021031076, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jan 10, 2015', 5, 304, 60.00, 3.00 , 63.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3004, 1021031076, 60.00, 1, 60.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jan 10, 2015', 6, 305, 200.00, 10.00 , 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3005, 1021031075, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3005, 1021031074, 60.00, 1, 60.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3005, 1021031073, 50.00, 1, 50.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2015', 7, 306, 160.00, 8.00 , 168.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3006, 1021031072, 70.00, 1, 70.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3006, 1021031075, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2015', 8, 306, 200.00, 10.00 , 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3007, 1021031042, 100.00, 1, 100.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3007, 1021031043, 100.00, 1, 100.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2015', 9, 305, 100.00, 5.00 , 105.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3008, 1021031074, 50.00, 1, 50.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3008, 1021031075, 50.00, 1, 50.00)

Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2015', 10, 306, 200.00, 10.00 , 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3009, 1021031055, 80.00, 1, 80.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3009, 1021031054, 70.00, 1, 70.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3009, 1021031053, 50.00, 1, 50.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2015', 11, 306, 50.00, 2.50 , 52.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3010, 1021031053, 50.00, 1, 50.00)

Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 15, 2015', 12, 301, 60.00, 3.00 , 63.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3011, 1021031056, 60.00, 1, 60.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 13, 302, 50.00, 2.50 , 52.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3012, 1021031057, 50.00, 1, 50.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 14, 303, 80.00, 4.00 , 84.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3013, 1021031058, 80.00, 1, 80.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 15, 304, 60.00, 3.00, 63.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3014, 1021031059, 60.00, 1, 60.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 16, 305, 200.00, 10.00, 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3015, 1021031042, 100.00, 1, 100.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3015, 1021031043, 100.00, 1, 100.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 19, 306, 100.00, 5.00, 105.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3016, 1021031077, 50.00, 1, 50.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3016, 1021031079, 50.00, 1, 50.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 16, 305, 160.00, 8.00, 168.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3017, 1021031046, 80.00, 1, 80.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3017, 1021031047, 80.00, 1, 80.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 15, 305, 180.00, 9.00, 189.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3018, 1021031048, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3018, 1021031049, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Nov 10, 2015', 14, 306, 400.00, 20.00, 420.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3019, 1021031064, 80.00, 2, 160.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3019, 1021031063, 80.00, 3, 240.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'May 10, 2015', 13, 300, 200.00, 10.00, 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3020, 1021031042, 100.00, 1, 100.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3020, 1021031043, 100.00, 1, 100.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'May 10, 2015', 23, 301, 60.00, 3.00, 63.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3021, 1021031076, 60.00, 1, 60.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'May 10, 2015', 24, 302, 100.00, 5.00, 105.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3022, 1021031077, 50.00, 2, 100.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'May 10, 2015', 25, 303, 160.00, 8.00, 168.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3023, 1021031066, 80.00, 2, 160.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'May 10, 2015', 26, 304, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3024, 1021031063, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'May 10, 2015', 22, 305, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3025, 1021031064, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jun 10, 2015', 21, 306, 80.00, 4.00, 84.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3026, 1021031041, 80.00, 1, 80.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jun 10, 2015', 22, 305, 160.00, 8.00, 168.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3027, 1021031042, 80.00, 2, 160.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jun 10, 2015', 9, 305, 180.00, 9.00, 189.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3028, 1021031043, 90.00, 2, 180.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jun 10, 2015', 10, 305, 180.00, 9.00, 189.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3029, 1021031044, 90.00, 2, 180.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jun 10, 2015', 11, 306, 180.00, 9.00, 189.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3030, 1021031048, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3030, 1021031049, 90.00, 1, 90.00)

Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jun 10, 2012', 11, 306, 90.00, 4.50, 94.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3031, 1021031048, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Jul 10, 2015', 13, 301 , 200.00, 10.00, 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3032, 1021031046, 100.00, 1, 100.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3032, 1021031047, 100.00, 1, 100.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2018', 14, 302 , 180.00, 9.00, 189.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3033, 1021031050, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3033, 1021031051, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 15, 303 , 160.00, 8.00, 168.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3034, 1021031051, 80.00, 1, 80.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3034, 1021031053, 80.00, 1, 80.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 12, 300 , 180.00, 9.00, 189.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3035, 1021031044, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3035, 1021031045, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 16, 304 , 180.00, 9.00, 189.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3036, 1021031048, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3036, 1021031049, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 11, 305 , 360.00, 18.00, 378.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3037, 1021031048, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3037, 1021031049, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3037, 1021031050, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3037, 1021031051, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 12, 306, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3038, 1021031040, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 23, 305, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3039, 1021031041, 70.00, 1, 70.00)

Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 24, 305, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3040, 1021031042, 70.00, 1, 70.00)

Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 25, 306, 70.00 , 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3041, 1021031043, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 26, 306, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3042, 1021031044, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 10, 2021', 17, 301, 70.00 , 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3043, 1021031045, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 19, 2021', 18, 302, 140.00, 7.00, 147.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3044, 1021031046, 70.00, 1, 70.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3044, 1021031047, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 19, 2021', 19, 303, 140.00, 7.00, 147.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3045, 1021031048, 70.00, 1, 70.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3045, 1021031049, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'Oct 20, 2021', 10, 304, 140.00, 7.00, 147.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3046, 1021031050, 70.00, 1, 70.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3046, 1021031051, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 3, 2021', 21, 305, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3047, 1021031052, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 3, 2021', 22, 306, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3048, 1021031053, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 3, 2021', 23, 310, 70.00 , 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3049, 1021031054, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 3, 2021', 24, 310, 70.00, 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3050, 1021031055, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 3, 2021', 25, 313, 70.00 , 3.50, 73.50)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3051, 1021031056, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 10, 2021', 26, 313, 200.00, 10.00 , 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3052, 1021031208, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3052, 1021031210, 60.00, 1, 60.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3052, 1021031211, 50.00, 1, 50.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 11, 2021', 26, 313, 140.00, 7.00, 147.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3053, 1021031204, 70.00, 1, 70.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3053, 1021031205, 70.00, 1, 70.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 12, 2021', 21, 312, 500.00, 25.00 , 525.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3054, 1021031205, 50.00, 10, 500.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 12, 2021', 22, 311, 700.00, 35.00, 735.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3055, 1021031207, 70.00, 10, 700.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 12, 2021', 23, 310 , 360.00, 18.00, 378.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3056, 1021031200, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3056, 1021031201, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3056, 1021031203, 90.00, 1, 90.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3056, 1021031208, 90.00, 1, 90.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 12, 2021', 24, 309, 400.00, 20.00, 420.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3057, 1021031203, 80.00, 2, 160.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3057, 1021031204, 80.00, 3, 240.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 13, 2021', 25, 309, 200.00, 10.00, 210.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3058, 1021031204, 100.00, 1, 100.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3058, 1021031205, 100.00, 1, 100.00)


Insert into Sale
	(SaleDate, CustomerNumber, EmployeeNumber, SubTotal, GST, Total)
Values
	( 'March 13, 2021', 26, 309, 600.00 , 30.00 , 630.00)
Insert into SaleDetail
	(SaleNumber, ISBN, SellingPrice, Quantity, Amount)
Values
	(3059, 1021031205, 60.00, 10, 600.00)
