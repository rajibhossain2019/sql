CREATE TABLE Examples.Parameter

(

ParameterId int NOT NULL IDENTITY(1,1) CONSTRAINT PKParameter PRIMARY KEY,

Value1 varchar(20) NOT NULL,

Value2 varchar(20) NOT NULL

);



select *from Examples.Parameter



CREATE PROCEDURE Examples.Parameter_Insert

@Value1 varchar(20) ='No entry given',

@Value2 varchar(20) ='No entry given'



AS

SET NOCOUNT ON;

insert into Examples.Parameter(Value1,Value2)

Values (@Value1,@Value2);



SELECT * FROM Examples.Parameter



EXECUTE Examples.Parameter_Insert;



EXECUTE Examples.Parameter_Insert 'some entry';



EXECUTE Examples.Parameter_Insert 'More Entry','More Entry';



Execute Examples.Parameter_Insert @Value1 = 'Other Entry';



Select * from Examples.Parameter



ALTER PROCEDURE Examples.Parameter_Insert

@Value1 varchar(20) ='No Entry Given',

@Value2 varchar(20) ='No Entry Given' OUTPUT,

@NewParameterId int = NULL OUTPUT

AS

SET NOCOUNT ON;

SET @Value1=UPPER(@Value1);

SET @Value2=LOWER(@Value2);



INSERT INTO Examples.Parameter(Value1,Value2)

VALUES (@Value1,@Value2);



SET @NewParameterId=SCOPE_IDENTITY();



SELECT * FROM Examples.Parameter



DECLARE @Value1 varchar(20) ='Test',

@Value2 varchar(20) ='Test',

@NewParameterId int =-200;



EXECUTE Examples.Parameter_Insert @Value1 = @Value1,

@Value2 = @Value2 OUTPUT,

@NewParameterId = @NewParameterId OUTPUT;



SELECT @Value1 AS Value1, @Value2 AS Value2, @NewParameterId AS NewParameterID;



SELECT * FROM Examples.Parameter

WHERE ParameterId = @NewParameterId;



CREATE PROCEDURE SimpleReturnValue

AS 

DECLARE @NoOp int;

DECLARE @ReturnCode int;
EXECUTE @ReturnCode = SimpleReturnValue;
SELECT @ReturnCode as ReturnCode;

You see the output as:

-----------

CREATE PROCEDURE DoOperation
(
	@Value  int
)
--Procedure returns via return code:
-- 1 - successful execution, with 0 entered
-- 0 - successful execution
-- -1 - invalid, NULL input
AS
	IF @Value = 0
		RETURN 1;
	else IF @Value IS NULL
		RETURN -1
	ELSE RETURN 0;

DECLARE @ReturnCode int;
EXECUTE @ReturnCode = DoOperation @Value = NULL;
SELECT  @ReturnCode,
		CASE @ReturnCode, WHEN 1 THEN 'Success, 0
Entered'
						  WHEN -1 THEN 'Invalid Input'
						  WHEN 0 THEN 'Success'
		END as ReturnMeaning