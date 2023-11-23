IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ClienteI]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[ClienteI]
GO

CREATE PROCEDURE dbo.ClienteI
    @Nome NVARCHAR(100), 
    @Endereco NVARCHAR(150),
    @Cidade NVARCHAR(100),
    @Bairro NVARCHAR(100),
    @Estado NVARCHAR(50),
    @Cep NVARCHAR(20),
    @Telefone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Data_Nascimento DATE
AS
BEGIN
    INSERT INTO Cliente(Nome, Endereco, Cidade, Bairro, Estado, Cep, Telefone, Email, Data_Nascimento)
    VALUES(@Nome, @Endereco, @Cidade, @Bairro, @Estado, @Cep, @Telefone, @Email, @Data_Nascimento)
END
RETURN

GO
