CREATE TRIGGER ChristmasUpdate
ON Articles WITH ENCRYPTION --Para que no pueda verse el c�digo
FOR UPDATE
AS
	BEGIN
		IF UPDATE (Code)
			BEGIN
				
			END
	END