IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[tr_LOG_UsuarioD]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1) 
DROP TRIGGER [dbo].[tr_LOG_UsuarioD]
GO
CREATE TRIGGER [tr_LOG_UsuarioD] ON [dbo].[Usuario] FOR DELETE AS
INSERT LOG_Usuario
(
	Id_Usuario	
	,Usuario	
	,Senha,	
	Usuario_LOG,
	Data_LOG,
	Operacao_LOG
)
SELECT	d.Id_Usuario	
		,d.Usuario	
		,d.Senha,	
		CONVERT(VARCHAR(30),SUSER_SNAME()),
		GETDATE(),
		'D'
FROM	deleted d
GO

