IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[tr_LOG_ClienteI]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1) 
DROP TRIGGER [dbo].[tr_LOG_ClienteI]
GO
CREATE TRIGGER [tr_LOG_ClienteI] ON [dbo].[Cliente] FOR INSERT AS
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
SELECT	i.Id_Cliente,
		i.Nome,
		i.Endereco,
		i.Cidade,
		i.Bairro,
		i.Estado,	
		i.Cep,
		i.Telefone,
		i.Email,
		i.Data_Nascimento,
		CONVERT(VARCHAR(30),SUSER_SNAME()),
		GETDATE(),
		'I'
FROM	inserted i
GO

