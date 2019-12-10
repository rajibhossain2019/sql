CREATE TABLE Examples.Gadget

(

GadgetId int IDENTITY(1,1) NOT NULL CONSTRAINT PKGadget PRIMARY KEY,

GadgetCode varchar(10) NOT NULL 

);

select * from examples.gadget



INSERT INTO Examples.Gadget (GadgetCode)

VALUES ('Gadget'), ('Gadget'), ('Gadget');



SELECT * FROM Examples.Gadget;



DELETE FROM Examples.Gadget WHERE GadgetId in (2,3);

 

SELECT * FROM Examples.Gadget;



ALTER TABLE Examples.Gadget

ADD CONSTRAINT AKGadget UNIQUE (GadgetCode);



CREATE TABLE Examples.GroceryItem

(

ItemCost smallmoney NULL,

CONSTRAINT CHKGroceryItem_ItemCostRange

Check (ItemCost > 0 AND ItemCost < 1000)

);



SELECT * FROM Examples.GroceryItem;



INSERT INTO Examples.GroceryItem 

VALUES (300.95);



select * from Examples.GroceryItem

;



create table Examples.Message

(

MessageTag char(5) NOT NULL,

Comment nvarchar (max) NULL

);



ALTER TABLE Examples.Message

ADD CONSTRAINT CHKMessage_MassegeTagFormat

CHECK (MessageTag LIKE '[A-Z]-[0-9][0-9][0-9]');



ALTER TABLE Examples.Message

ADD CONSTRAINT CHKMessage_CommentNotEmpty

CHECK (LEN(COMMENT) > 0 );



INSERT INTO Examples.Message (MessageTag, Comment)

VALUES ('Z-956','YES I LIKE'); 