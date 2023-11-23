IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[tr_LOG_ClienteD]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1) 
DROP TRIGGER [dbo].[tr_LOG_ClienteD]
GO
CREATE TRIGGER [tr_LOG_ClienteD] ON [dbo].[Cliente] FOR DELETE AS
INSERT LOG_Cliente
(
	Id_Cliente	
	,Nome	
	,Endereco	
	,Cidade	
	,Bairro	
	,Estado	
	,Cep	
	,Telefone	
	,Email	
	,Data_Nascimento,	
	Usuario_LOG,
	Data_LOG,
	Operacao_LOG
)
SELECT	d.Id_Cliente,
		d.Nome,
		d.Endereco,
		d.Cidade,
		d.Bairro,
		d.Estado,	
		d.Cep,
		d.Telefone,
		d.Email,
		d.Data_Nascimento,
		CONVERT(VARCHAR(30),SUSER_SNAME()),
		GETDATE(),
		'D'
FROM	deleted d
GO

