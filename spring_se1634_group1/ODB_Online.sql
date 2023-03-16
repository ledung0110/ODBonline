create database ODB
CREATE TABLE [Account] (
	[ID]			BIGINT IDENTITY (1, 1),
	[Username]		VARCHAR (32) NOT NULL,
	[Password]		VARCHAR (64) NOT NULL,
	[IsAdmin] BIT NOT NULL DEFAULT 0,	
	[IsConfirmed] BIT NOT NULL DEFAULT 0
	PRIMARY KEY		([ID]),
	UNIQUE			([Username]),
);

CREATE TABLE [User] (
	[ID]			BIGINT,
	[Fullname]		NVARCHAR (MAX),
	[Email]			NVARCHAR (MAX) NOT NULL,
	[Phone]			VARCHAR (12)
	PRIMARY KEY		([ID]),
	FOREIGN KEY		([ID]) REFERENCES [Account]([ID]) ON DELETE CASCADE,
);
CREATE TABLE Token (
  [ID] BigINT PRIMARY KEY IDENTITY(1,1),
  [Token] VARCHAR(MAX) NOT NULL,
  [CreatedAt] DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
CREATE PROC [sp_create_account]
	@username		VARCHAR (32),
	@password		VARCHAR (64),
	@email			NVARCHAR (320)
	AS
BEGIN
	-- Create Account
	INSERT INTO [Account]([Username], [Password]) VALUES (@username, @password);

	-- Create User
	INSERT INTO [User]([ID],[Fullname], [Email]) 
	VALUES (
		(SELECT [ID] FROM [Account] WHERE [Username] = @username),
		@username,
		@email
		
	);
END;

GO
CREATE TRIGGER TokenCleanupTrigger
ON Token
FOR INSERT, UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  DELETE FROM Token
  WHERE CreatedAt < DATEADD(MINUTE, -30, SYSUTCDATETIME());
END;
CREATE TABLE Debt (
  [ID] BIGINT PRIMARY KEY IDENTITY(1,1),
  [UserID] BIGINT,
  [Name] NVARCHAR(MAX) Not Null,
  [Address] NVARCHAR(MAX),
  [Phone] VARCHAR(12),
  [Email] VARCHAR(255),
  [TotalDebt] FLOAT,
  [CreatedAt] DATETIME,
  [UpdatedAt] DATETIME
  FOREIGN KEY ([UserID]) REFERENCES [User]([ID]) ,
);
CREATE TABLE DebtDetail (
  [ID] BIGINT PRIMARY KEY IDENTITY(1,1),
  [DebtID] BIGINT,
  [Note] NVARCHAR(255),
  [DebtType] BIT,
  [Amount] FLOAT,
  [Image] VARCHAR(MAX),
  [DebtCreatedAt] DATETIME,
  [DateCreatedAt] DATETIME,
  CONSTRAINT fk_debt_details_debt_id FOREIGN KEY (DebtID) REFERENCES Debt(ID)
);
CREATE TABLE [Configuration] (
  [ID] BIGINT PRIMARY KEY IDENTITY(1,1),
  [Key] NVARCHAR(MAX),
  [Value] NVARCHAR(MAX),
  [CreatedAt] DATETIME,
  [UpdatedAt] DATETIME,
  
);
