--Kai He
--Project: SQL Saturday
--Comp 440



CREATE PROCEDURE insertPresentation
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


CREATE PROCEDURE insertAllPresentation(
       @pTitle varchar(255),
	   @pSpeaker varchar(50),
	   @pLevel varchar(50),
	   @pEvent varchar(50))
  AS
    IF EXISTS (SELECT TOP 1 ID FROM Event WHERE city=@pEvent)
    BEGIN TRY
	   INSERT INTO Presentation
	   (title,difficulty)
	   VALUES
	   (@pTitle,@pLevel)
	   INSERT INTO Person
	   (name)
	   VALUES
	   (@pSpeaker)
	   INSERT INTO PresentationEvent
	   (Presentation_id, Event_id)
	   VALUES
       (SCOPE_IDENTITY(), (SELECT TOP 1 ID FROM Event WHERE
		city=@pEvent));
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
	ELSE
	BEGIN
	  PRINT('City not found');
	END




