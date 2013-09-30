USE SPortalDb

GO
ALTER TABLE Post 
ADD PostTypeID INT FOREIGN KEY (PostTypeID) REFERENCES PostType (PostTypeID)

GO
ALTER TABLE Users
ADD Rating INT

GO 
INSERT INTO PostType (Type) VALUES ('Parent')

GO 
INSERT INTO PostType (Type) VALUES ('Child')