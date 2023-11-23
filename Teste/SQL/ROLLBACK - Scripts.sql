IF OBJECT_ID('Cliente') IS NOT NULL
BEGIN
	DROP TABLE Cliente
END

IF OBJECT_ID('Usuario') IS NOT NULL
BEGIN
	DROP TABLE Usuario
END

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOG_Cliente]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[LOG_Cliente] 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOG_Usuario]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	DROP TABLE [dbo].[LOG_Usuario] 
GO



