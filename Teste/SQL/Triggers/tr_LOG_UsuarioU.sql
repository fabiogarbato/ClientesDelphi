IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[tr_LOG_UsuarioU]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1) 
DROP TRIGGER [dbo].[tr_LOG_UsuarioU]
GO
CREATE TRIGGER [tr_LOG_UsuarioU] ON [dbo].[Usuario] FOR UPDATE AS
INSERT LOG_Usuario
(
	Id_Usuario	
	,Usuario	
	,Senha,	
	Usuario_LOG,
	Data_LOG,
	Operacao_LOG
)
SELECT	t.Id_Usuario	
		,t.Usuario	
		,t.Senha,	
		CONVERT(VARCHAR(30),SUSER_SNAME()),
		GETDATE(),
		'U'
FROM	Usuario t
INNER JOIN inserted i ON i.Id_Usuario = t.Id_Usuario
GO