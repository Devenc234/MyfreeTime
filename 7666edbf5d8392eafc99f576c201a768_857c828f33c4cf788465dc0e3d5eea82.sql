SPOOL myspoollog.txt
SET ECHO ON
DROP TABLE Customers CASCADE CONSTRAINT;
DROP TABLE Distributor CASCADE CONSTRAINT;
DROP TABLE Store CASCADE CONSTRAINT;
DROP TABLE movies CASCADE CONSTRAINT;
DROP TABLE movieInventory CASCADE CONSTRAINT;
DROP TABLE MovieCost CASCADE CONSTRAINT;
DROP TABLE Catalogs CASCADE CONSTRAINT ;
DROP TABLE RentOrder CASCADE CONSTRAINT;
DROP TABLE RentFees CASCADE CONSTRAINT;


CREATE TABLE Customers
	(CustID			NUMBER(5),
	CustPhone		NUMBER(20) NOT NULL,	
	CustAddress		VARCHAR2(50),
	CustCity		    VARCHAR2(50),
	CustState		VARCHAR2(50),
	CustZipCode	        VARCHAR2(50),	
        CustOderHistory		int,
        CustPaymentInfo		int,
        CONSTRAINT CustID_PK PRIMARY KEY (CustID));

CREATE TABLE Distributor
	(DistributorID	NUMBER(5)	NOT NULL,
	CompanyName  int,
	PhoneNumber  VARCHAR2(30),
	OrderHistory int,	
        CONSTRAINT DistributorID_PK PRIMARY KEY (DistributorID));

 CREATE TABLE Store
	(StoreID	NUMBER(5),
	StoreName	VARCHAR2 (20),
	StoreAddress	VARCHAR2 (50),
        StorePhoneNumber VARCHAR2 (20),
        CONSTRAINT StoreID_PK PRIMARY KEY (StoreID));

CREATE TABLE movies(
        MovieID NUMBER(5),
        Genre VARCHAR2 (10),
        title VARCHAR2 (50),
        directors VARCHAR2 (50),
        length int,
        actors VARCHAR2 (50),
        awards int,
        rating int,
       CONSTRAINT MovieID_PK PRIMARY KEY (MovieID));

 CREATE TABLE movieInventory(
    InventoryID NUMBER(5),
    MovieID int,
    format varchar2(20),
    quantityDVD VARCHAR2 (10),
    quantityVHS VARCHAR2 (10),
    CONSTRAINT InventoryID_PK PRIMARY KEY (InventoryID),
    CONSTRAINT MovieID_FK FOREIGN KEY (MovieID) REFERENCES movies (MovieID));

CREATE TABLE movieCost(
   MovieCostID NUMBER(5),
    MovieID int,
    DistributorID int,
    wholesalePriceDVD int,
    wholesalePriceVHS int,
    CONSTRAINT MovieCostID_PK PRIMARY KEY (MovieCostID),
    CONSTRAINT MovieID_FK FOREIGN KEY (MovieID) REFERENCES movies (MovieID),
    CONSTRAINT DistributorID_FK FOREIGN KEY ( DistributorID) REFERENCES  Distributor ( DistributorID));

 CREATE TABLE catalogs(
    catalogID NUMBER(5),
    DistributorID int,
    DateReleased int,
    CONSTRAINT catalogID_PK PRIMARY KEY (catalogID),
    CONSTRAINT  DistributorID_FK FOREIGN KEY ( DistributorID) REFERENCES  Distributor ( DistributorID));


 CREATE TABLE RentOrder(
    RentalOrderID NUMBER(5),
    MovieID int,
    CustID Int,
    rentedOutDate int,
    DueDate int,
    ReturnDate int,
    CONSTRAINT RentOrderID_PK PRIMARY KEY (RentOrderID),
    CONSTRAINT MovieID_FK FOREIGN KEY (MovieID) REFERENCES movies (MovieID),
    CONSTRAINT CustID_FK FOREIGN KEY (CustID) REFERENCES Customers (CustID));

 CREATE TABLE RentFees (
    RentFeesID NUMBER(5),
    RentalOrderID int,
    CustID int,
    rentPrice int NOT NULL,
    DamageFees int,
    MovieRewindFees int,
    Taxes int,
    lateFees int,
    discount int,
    CONSTRAINT RentFeesID_PK PRIMARY KEY (RentFeesID),
    CONSTRAINT RentOrderID_FK FOREIGN KEY (RentOrderID) REFERENCES RentOrder(RentOrderID),
    CONSTRAINT CustID_FK FOREIGN KEY ( CustID) REFERENCES Customers (CustID));

SPOOL OFF




