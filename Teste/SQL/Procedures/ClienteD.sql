if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClienteD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ClienteD]
GO

CREATE proc dbo.ClienteD

(
	@Id_Cliente 	INT
)

AS

DELETE FROM Cliente WHERE Id_Cliente = @Id_Cliente;

RETURN

GO