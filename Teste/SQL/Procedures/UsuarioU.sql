if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsuarioU]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UsuarioU]
GO

CREATE PROCEDURE dbo.UsuarioU
    @Id_Usuario INT,
    @Usuario NVARCHAR(50), 
    @Senha NVARCHAR(50)    
AS
BEGIN
    UPDATE Usuario SET Usuario = @Usuario, Senha = @Senha
    WHERE Id_Usuario = @Id_Usuario;
END
RETURN

GO