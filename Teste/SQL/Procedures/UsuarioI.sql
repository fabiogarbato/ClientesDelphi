if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsuarioI]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UsuarioI]
GO

CREATE PROCEDURE dbo.UsuarioI
    @Usuario NVARCHAR(50), 
    @Senha NVARCHAR(50)    
AS
BEGIN
    INSERT INTO Usuario(Usuario, Senha)
	VALUES(@Usuario, @Senha)
END
RETURN

GO