create database czonlineclothingstore;
use czonlineclothingstore;

CREATE TABLE ClothingCategory (
    categoryid INT PRIMARY KEY,
    categoryname VARCHAR(255)
);

CREATE TABLE ClothingItems (
    itemid INT PRIMARY KEY,
    itemname VARCHAR(255),
    materials VARCHAR(255),
    colors VARCHAR(255),
    sizes VARCHAR(255),
    brands VARCHAR(255),
    categoryid INT,
    FOREIGN KEY (categoryid) REFERENCES ClothingCategory(categoryid)
);

CREATE TABLE Suppliers (
    supplierid INT PRIMARY KEY,
    name VARCHAR(255),
    contactno VARCHAR(255)
);

CREATE TABLE SupplierItems (
    supplieritemid INT PRIMARY KEY,
    supplierid INT,
    itemid INT,
    FOREIGN KEY (supplierid) REFERENCES Suppliers(supplierid),
    FOREIGN KEY (itemid) REFERENCES ClothingItems(itemid)
);

CREATE TABLE Stock (
    stockid INT PRIMARY KEY,
    quantity INT,
    itemid INT,
    FOREIGN KEY (itemid) REFERENCES ClothingItems(itemid)
);

CREATE TABLE Discounts (
    discountid INT PRIMARY KEY,
    discountpercentage DECIMAL(5, 2),
    duration VARCHAR(255),
    status VARCHAR(255),
    itemid INT,
    FOREIGN KEY (itemid) REFERENCES ClothingItems(itemid)
);

CREATE TABLE Customers (
    customerid INT PRIMARY KEY,
    name VARCHAR(255),
    contactno VARCHAR(255),
    shippingaddr VARCHAR(255)
);

CREATE TABLE Orders (
    orderid INT PRIMARY KEY,
    orderstatus VARCHAR(255),
    paymentstatus VARCHAR(255),
    orderdate DATE,
    customerid INT,
    FOREIGN KEY (customerid) REFERENCES Customers(customerid)
);

CREATE TABLE OrderedItems (
    ordereditemid INT PRIMARY KEY,
    size VARCHAR(255),
    color VARCHAR(255),
    material VARCHAR(255),
    quantity INT,
    orderid INT,
    itemid INT,
    FOREIGN KEY (orderid) REFERENCES Orders(orderid),
    FOREIGN KEY (itemid) REFERENCES ClothingItems(itemid)
);

CREATE TABLE Delivery (
    deliveryid INT PRIMARY KEY,
    deliverystatus VARCHAR(255),
    deliverydate DATE,
    orderid INT,
    customerid INT,
    FOREIGN KEY (orderid) REFERENCES Orders(orderid),
    FOREIGN KEY (customerid) REFERENCES Customers(customerid)
);

CREATE TABLE Income (
    incomeid INT PRIMARY KEY,
    payments VARCHAR(255),
    amount DECIMAL(10, 2),
    orderid INT,
    FOREIGN KEY (orderid) REFERENCES Orders(orderid)
);

CREATE TABLE Employees (
    empid INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(255),
    contactno VARCHAR(255),
    orderid INT,
    customerid INT,
    FOREIGN KEY (orderid) REFERENCES Orders(orderid),
    FOREIGN KEY (customerid) REFERENCES Customers(customerid)
);

select * from Customers;
select * from Orders;
select * from OrderedItems;
select * from ClothingItems;

INSERT into Customers values (100,'Minori Perera',0765631123,'Cmb Union Place');
INSERT into Customers values (101,'Pinki Roshani',0772256981,'Kurunegala');
INSERT into Customers values (102,'Naori Perera',0711434464,'Kandy');
INSERT into Customers values (103,'Miyuki Perera',0711434444,'Kandy');
INSERT into Customers values (104,'Tevin Perera',0711434455,'Ratnapura');

INSERT into Orders values (200,'processing','fullpayment','2023-08-01',100);
INSERT into Orders values (201,'processing','advancedpayment','2023-08-02',101);
INSERT into Orders values (202,'processing','fullpayment','2023-08-03',102);
INSERT into Orders values (203,'processing','advancedpayment','2023-08-03',103);
INSERT into Orders values (204,'processing','fullpayment','2023-08-03',104);

INSERT into OrderedItems values (300,'m','pink','cotton',2,200,800);
INSERT into OrderedItems values (301,'s','white','cotton',1,201,801);
INSERT into OrderedItems values (302,'l','black','cotton',2,202,802);
INSERT into OrderedItems values (303,'l','black','cotton',2,203,803);
INSERT into OrderedItems values (304,'xl','grey','cotton',5,204,804);

INSERT into ClothingItems values (800,'highneck','cotton','pink','m','prada',700);
INSERT into ClothingItems values (801,'highneck','cotton','white','s','ysl',701);
INSERT into ClothingItems values (802,'highneck','cotton','black','l','louisv',702);
INSERT into ClothingItems values (803,'highneck','cotton','black','l','louisv',703);
INSERT into ClothingItems values (804,'lowneck','linen','grey','l','louisv',704);

INSERT into ClothingCategory values (700,'dress');
INSERT into ClothingCategory values (701,'shirt');
INSERT into ClothingCategory values (702,'tshirt');
INSERT into ClothingCategory values (703,'skirt');
INSERT into ClothingCategory values (704,'shirt');

INSERT into Suppliers values (900,'Saman',0756592886);
INSERT into Suppliers values (901,'Mike',0756592006);
INSERT into Suppliers values (902,'John',0756511886);
INSERT into Suppliers values (903,'Yumi',0756511847);
INSERT into Suppliers values (904,'Jacob',0756511856);

INSERT into SupplierItems values (1000,900,800);
INSERT into SupplierItems values (1001,901,801);
INSERT into SupplierItems values (1002,902,802);
INSERT into SupplierItems values (1003,903,803);
INSERT into SupplierItems values (1004,904,804);

INSERT into Stock values (1100,20,800);
INSERT into Stock values (1101,10,801);
INSERT into Stock values (1102,10,802);
INSERT into Stock values (1103,10,803);
INSERT into Stock values (1104,20,804);

INSERT into Discounts values (1200,20.00,'1month','active',800);
INSERT into Discounts values (1201,50.00,'2month','expired',801);
INSERT into Discounts values (1202,50.00,'1month','disable',802);
INSERT into Discounts values (1203,50.00,'1month','active',803);
INSERT into Discounts values (1204,10.00,'3month','active',804);

INSERT into Delivery values (400,'delivered','2023-08-03',200,100);
INSERT into Delivery values (401,'delivered','2023-08-05',201,101);
INSERT into Delivery values (402,'delivered','2023-08-02',202,102);
INSERT into Delivery values (403,'delivered','2023-08-03',203,103);
INSERT into Delivery values (404,'delivered','2023-08-04',204,104);

INSERT into Income values (500,'done',5000.00,200);
INSERT into Income values (501,'done',10000.00,201);
INSERT into Income values (502,'done',20000.00,202);
INSERT into Income values (503,'done',10000.00,203);
INSERT into Income values (504,'done',20000.00,204);

INSERT into Employees values (600,'Jake','assistant',0765636120,200,100);
INSERT into Employees values (601,'Cady','assistant',0765636100,201,101);
INSERT into Employees values (602,'Jill','assistant',0765636200,202,102);
INSERT into Employees values (603,'Kiki','assistant',0765636211,203,103);
INSERT into Employees values (604,'Jiji','assistant',0765636222,204,104);

SELECT
    C.customerid,
    C.name AS customername,
    O.orderid,
    O.orderstatus,
    O.paymentstatus,
    D.deliverystatus,
    CI.itemname,
    OI.size
FROM Customers AS C
JOIN Orders AS O ON C.customerid = O.customerid
JOIN Delivery AS D ON O.orderid = D.orderid
JOIN OrderedItems AS OI ON O.orderid = OI.orderid
JOIN ClothingItems AS CI ON OI.itemid = CI.itemid
WHERE C.customerid = 102;

DELETE FROM Orders
WHERE orderid = 101;

UPDATE Orders
SET orderstatus = 'Cancelled'
WHERE orderid = 202;
select * from Orders;

DELIMITER //
CREATE PROCEDURE GetAllOrdersByCategory(IN categoryname VARCHAR(255))
BEGIN
    SELECT C.*, O.*
    FROM Customers AS C
    JOIN Orders AS O ON C.customerid = O.customerid
    JOIN OrderedItems AS OI ON O.orderid = OI.orderid
    JOIN ClothingItems AS CI ON OI.itemid = CI.itemid
    WHERE CI.categoryid = (SELECT categoryid FROM ClothingCategory WHERE categoryname = categoryname);
END //
DELIMITER ;



CREATE VIEW SupplierProductStockAllSummary AS
SELECT S.name AS name, CI.itemname, ST.quantity
FROM Suppliers AS S
JOIN SupplierItems AS SI ON S.supplierid = SI.supplierid
JOIN ClothingItems AS CI ON SI.itemid = CI.itemid
JOIN Stock AS ST ON CI.itemid = ST.itemid;


DELIMITER //
CREATE TRIGGER UpdateStockQuantityOfClotingItemsOnPayment
AFTER UPDATE ON Orders FOR EACH ROW
BEGIN
    IF NEW.paymentstatus = 'Full payment' THEN
        UPDATE Stock
        SET quantity = quantity - (SELECT SUM(quantity) FROM OrderedItems WHERE orderid = NEW.orderid)
        WHERE itemid IN (SELECT itemid FROM OrderedItems WHERE orderid = NEW.orderid);
    END IF;
END //
DELIMITER ;

CREATE ROLE databaseadmin;
CREATE ROLE stockkeeper;

CREATE user 'adminuser'@'localhost' identified by '1234';
CREATE user 'stockuser'@'localhost' identified by '1111';

GRANT ALL privileges on czonlineclothingstore.* to 'adminuser'@'localhost';
GRANT select, insert, update, delete on czonlineclothingstore.Stock to 'stockuser'@'localhost';

GRANT databaseadmin to 'adminuser'@'localhost';
GRANT stockkeeper to 'stockuser'@'localhost';
