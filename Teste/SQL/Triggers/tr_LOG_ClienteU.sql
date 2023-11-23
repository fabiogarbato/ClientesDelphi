IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[tr_LOG_ClienteU]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1) 
DROP TRIGGER [dbo].[tr_LOG_ClienteU]
GO
CREATE TRIGGER [tr_LOG_ClienteU] ON [dbo].[Cliente] FOR UPDATE AS
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
SELECT	t.Id_Cliente,
		t.Nome,
		t.Endereco,
		t.Cidade,
		t.Bairro,
		t.Estado,	
		t.Cep,
		t.Telefone,
		t.Email,
		t.Data_Nascimento,
		CONVERT(VARCHAR(30),SUSER_SNAME()),
		GETDATE(),
		'U'
FROM	Cliente t
INNER JOIN inserted i ON i.Id_Cliente = t.Id_Cliente
GO

