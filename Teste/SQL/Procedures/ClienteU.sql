IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ClienteU]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[ClienteU]
GO

CREATE PROCEDURE dbo.ClienteU
    @Id_Cliente INT,
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
    UPDATE Cliente SET 
        Nome = @Nome, 
        Endereco = @Endereco, 
        Cidade = @Cidade,
        Bairro = @Bairro, 
        Estado = @Estado, 
        Cep = @Cep, 
        Telefone = @Telefone,
        Email = @Email, 
        Data_Nascimento = @Data_Nascimento
    WHERE Id_Cliente = @Id_Cliente;
END
RETURN

GO
