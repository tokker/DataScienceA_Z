USE [DSTraining]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_OfficeSupplies_CustomerList]    Script Date: 4/18/2025 8:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dávid Tokovics
-- Create date: 20250418
-- Description:	RAW -> WRK
-- =============================================
ALTER PROC [dbo].[BLD_WRK_FakeNamesCanada]

AS
BEGIN

if OBJECT_ID('FakeNamesCanada') is not null
drop table FakeNamesCanada

create table FakeNamesCanada(
	  [Number]			varchar(10)	
      ,[Gender]			varchar(100)
      ,[GivenName]		varchar(100)
      ,[Surname]		varchar(100)
      ,[StreetAddress]	varchar(100)
      ,[City]			varchar(100)
      ,[ZipCode]		varchar(7)
      ,[CountryFull]	varchar(100)
      ,[Birthday]		date
      ,[Balance]		float
      ,[InterestRate]	float
	  )


truncate table FakeNamesCanada


insert into FakeNamesCanada
(
	[Number]
	,[Gender]
	,[GivenName]
	,[Surname]
	,[StreetAddress]
	,[City]
	,[ZipCode]
	,[CountryFull]
	,[Birthday]
	,[Balance]
	,[InterestRate]		
)
select 
	  [Number]
      ,[Gender]
      ,[GivenName]
      ,[Surname]
      ,[StreetAddress]
      ,[City]
      ,case when [ZipCode] like '___ ___' then [ZipCode] else NULL end
      ,[CountryFull]
      ,case when isdate([Birthday]) = 1 then [Birthday] else NULL end
      ,case when isnumeric(Balance) = 1 then [Balance] else NULL end
      ,[InterestRate]
from RAW_FakeNamesCanada

END
