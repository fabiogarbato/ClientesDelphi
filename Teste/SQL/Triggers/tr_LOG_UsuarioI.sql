IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[tr_LOG_UsuarioI]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1) 
DROP TRIGGER [dbo].[tr_LOG_UsuarioI]
GO
CREATE TRIGGER [tr_LOG_UsuarioI] ON [dbo].[Usuario] FOR INSERT AS
INSERT LOG_Usuario
(
	Id_Usuario	
	,Usuario	
	,Senha,	
	Usuario_LOG,
	Data_LOG,
	Operacao_LOG
)
SELECT	i.Id_Usuario,
		i.Usuario,
		i.Senha,
		CONVERT(VARCHAR(30),SUSER_SNAME()),
		GETDATE(),
		'I'
FROM	inserted i
GO

