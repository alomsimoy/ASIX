CREATE TRIGGER ChristmasUpdate
ON Articles WITH ENCRYPTION --Para que no pueda verse el código
FOR UPDATE
AS
	BEGIN
		IF UPDATE (Code)
			BEGIN
				
			END
	END