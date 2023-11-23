if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vUsuario]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vUsuario]
GO

create view vUsuario as

SELECT
	Id_Usuario,
	Usuario,
	Senha
FROM 
	Usuario

GO