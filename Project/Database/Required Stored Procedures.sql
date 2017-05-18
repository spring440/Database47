--Kai He
--Project: SQL Saturday
--Comp 440

ALTER PROCEDURE insertPresentation
	@speaker varchar(100), 
	@presentation varchar(255)
AS
    DECLARE @presentationID INT
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		DECLARE @first_name varchar(50)
		DECLARE @last_name varchar(50)
		SET @first_name = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1);
		SET @last_name = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1));

		IF EXISTS(SELECT title FROM Persentation WHERE title = @presentation)
		BEGIN
			PRINT 'ERROR'
			RETURN
		END

		IF NOT EXISTS(SELECT first_name, last_name FROM Persons WHERE first_name = @first_name AND last_name = @last_name)
		BEGIN
			
			INSERT INTO Persons VALUES (NULL, NULL,@first_name, @last_name, NULL, NULL,NULL, NULL,NULL);
		END
	
		IF NOT EXISTS(SELECT title FROM Presentation WHERE title = @presentation)
	    BEGIN
		
		   INSERT INTO Presentation
		   (title) VALUES (@presentation)
		   SET @presentationID = SCOPE_IDENTITY();
	    END
	    ELSE
	    BEGIN
		
		SET @presentationID = (SELECT TOP 1 ID FROM Presentation WHERE title = @presentation)
		END
	END TRY
	BEGIN CATCH
		PRINT 'ERROR'
    END CATCH
END 


