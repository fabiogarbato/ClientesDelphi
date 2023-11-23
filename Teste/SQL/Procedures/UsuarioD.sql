if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsuarioD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UsuarioD]
GO

CREATE proc dbo.UsuarioD

(
	@Id_Usuario 	INT
)

AS

DELETE FROM Usuario WHERE Id_Usuario = @Id_Usuario;

RETURN

GO