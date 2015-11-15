USE Examen
GO
CREATE TABLE PersonType(
PersonType nchar(2) PRIMARY KEY NOT NULL,
Description nvarchar(50) NOT NULL
)
GO
INSERT INTO PersonType (PersonType, Description)
VALUES ('IN', 'Insider')
INSERT INTO PersonType (PersonType, Description)
VALUES ('EM', 'Employeer')
INSERT INTO PersonType (PersonType, Description)
VALUES ('SP', 'Service Partner')
INSERT INTO PersonType (PersonType, Description)
VALUES ('SC', 'Service Customer')
INSERT INTO PersonType (PersonType, Description)
VALUES ('VC', 'Value Customer')
INSERT INTO PersonType (PersonType, Description)
VALUES ('GC', 'Great Customer')
GO
ALTER TABLE Person
ADD CONSTRAINT FK_Person_PersonType FOREIGN KEY (PersonType)
REFERENCES PersonType(PersonType)
GO
