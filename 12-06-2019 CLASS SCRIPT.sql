DROP TABLE IF EXISTS Examples.Widget;
CREATE TABLE Examples.Widget
(
	WidgetId	int CONSTRAINT PKWidget PRIMARY KEY,
	RowLastModifiedTime datetime2 (0) NOT NULL
);

ALTER TABLE Examples.Widget
  ADD CONSTRAINT DFLTWidget_RowlastModifiedTime
		DEFAULT (SYSDATETIME()) FOR RowLastmodifiedTime;

INSERT INTO Examples.Widget (WidgetId) VALUES (3);
UPDATE Examples.Widget SET RowLastM odifiedTime = DEFAULT;
SELECT * FROM Examples.Widget;
