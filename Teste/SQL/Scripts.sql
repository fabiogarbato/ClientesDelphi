IF OBJECT_ID('Cliente') IS NULL
BEGIN
	CREATE TABLE Cliente
	(
		Id_Cliente INT NOT NULL IDENTITY PRIMARY KEY,
		Nome VARCHAR(50) NULL,
		Endereco VARCHAR(250) NULL,
		Cidade VARCHAR(250) NULL,
		Bairro VARCHAR(100) NULL,
		Estado VARCHAR(2) NULL,
		Cep VARCHAR(10) NULL,
		Telefone VARCHAR(14) NULL,
		Email VARCHAR(250) NULL,
		Data_Nascimento DATETIME NULL
	)
END

IF OBJECT_ID('Usuario') IS NULL
BEGIN
	CREATE TABLE Usuario
	(
		Id_Usuario INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		Usuario VARCHAR(50) NOT NULL,
		Senha VARCHAR(50) NOT NULL,		
	)
END

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOG_Cliente]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[LOG_Cliente] (
	Id_Cliente INT NOT NULL,
	Nome VARCHAR(50) NULL,
	Endereco VARCHAR(250) NULL,
	Cidade VARCHAR(250) NULL,
	Bairro VARCHAR(100) NULL,
	Estado VARCHAR(2) NULL,
	Cep VARCHAR(10) NULL,
	Telefone VARCHAR(14) NULL,
	Email VARCHAR(250) NULL,
	Data_Nascimento DATETIME NULL,
	[Usuario_LOG] [varchar] (30) ,
	[Data_LOG] [datetime] ,
	[Operacao_LOG] [char] (1)
) ON [PRIMARY]
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOG_Usuario]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[LOG_Usuario] (
	Id_Usuario INT NULL,
	Usuario VARCHAR(50) NULL,
	Senha VARCHAR(50) NULL,	
	[Usuario_LOG] [varchar] (30) ,
	[Data_LOG] [datetime] ,
	[Operacao_LOG] [char] (1)
) ON [PRIMARY]
GO

INSERT INTO Usuario(Usuario, Senha) VALUES ('admin', 'admin')

