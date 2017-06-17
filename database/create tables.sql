DROP TABLE IF EXISTS KeyValuePairs;
DROP TABLE IF EXISTS AdditionalTaxes;
DROP TABLE IF EXISTS DeductionsAndCredits;
DROP TABLE IF EXISTS TaxInfo;
DROP TABLE IF EXISTS BudgetInputs;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users
( 
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
	Username TEXT NOT NULL UNIQUE, 
	Password TEXT NOT NULL,
	Salt TEXT NOT NULL
);

CREATE TABLE BudgetInputs
( 
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
	UserId INTEGER NOT NULL, 
	Type TEXT NOT NULL,
	RowNum INTEGER NOT NULL, 
	Label TEXT, 
	Monthly NUMERIC, 
	PreTax INTEGER, 
	FOREIGN KEY(UserId) REFERENCES Users(Id) 
);

CREATE TABLE TaxInfo
( 
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
	UserId INTEGER NOT NULL, 
	FilingStatus INTEGER,
	Exemptions INTEGER,
	State INTEGER,
	FOREIGN KEY(UserId) REFERENCES Users(Id) 
);

CREATE TABLE DeductionsAndCredits
(
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
	TaxInfoId INTEGER NOT NULL, 
	FederalOrState TEXT NOT NULL,
	DeductionOrCredit TEXT NOT NULL,
	RowNum INTEGER NOT NULL, 
	Label TEXT, 
	Amount NUMERIC, 
	FOREIGN KEY(TaxInfoId) REFERENCES TaxInfo(Id) 
);

CREATE TABLE AdditionalTaxes
(
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
	TaxInfoId INTEGER NOT NULL, 
	RowNum INTEGER NOT NULL, 
	Label TEXT, 
	Amount NUMERIC, 
	FOREIGN KEY(TaxInfoId) REFERENCES TaxInfo(Id) 
);

CREATE TABLE KeyValuePairs
( 
	Key TEXT NOT NULL PRIMARY KEY UNIQUE, 
	Value TEXT NOT NULL
);



