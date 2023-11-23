if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vCliente]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vCliente]
GO

create view vCliente as

SELECT
	Id_Cliente	
	,Nome	
	,Endereco	
	,Cidade	
	,Bairro	
	,Estado	
	,Cep	Telefone	
	,Email	
	,Data_Nascimento
FROM 
	Cliente
	
GO