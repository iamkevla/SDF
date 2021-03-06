IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SDF')
	DROP DATABASE [SDF]
GO

CREATE DATABASE [SDF]  ON (NAME = N'SDF_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\SDF_Data.MDF' , SIZE = 2, FILEGROWTH = 10%) LOG ON (NAME = N'SDF_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\SDF_Log.LDF' , SIZE = 1, FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'SDF', N'autoclose', N'true'
GO

exec sp_dboption N'SDF', N'bulkcopy', N'false'
GO

exec sp_dboption N'SDF', N'trunc. log', N'true'
GO

exec sp_dboption N'SDF', N'torn page detection', N'true'
GO

exec sp_dboption N'SDF', N'read only', N'false'
GO

exec sp_dboption N'SDF', N'dbo use', N'false'
GO

exec sp_dboption N'SDF', N'single', N'false'
GO

exec sp_dboption N'SDF', N'autoshrink', N'true'
GO

exec sp_dboption N'SDF', N'ANSI null default', N'false'
GO

exec sp_dboption N'SDF', N'recursive triggers', N'false'
GO

exec sp_dboption N'SDF', N'ANSI nulls', N'false'
GO

exec sp_dboption N'SDF', N'concat null yields null', N'false'
GO

exec sp_dboption N'SDF', N'cursor close on commit', N'false'
GO

exec sp_dboption N'SDF', N'default to local cursor', N'false'
GO

exec sp_dboption N'SDF', N'quoted identifier', N'false'
GO

exec sp_dboption N'SDF', N'ANSI warnings', N'false'
GO

exec sp_dboption N'SDF', N'auto create statistics', N'true'
GO

exec sp_dboption N'SDF', N'auto update statistics', N'true'
GO

if( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) )
	exec sp_dboption N'SDF', N'db chaining', N'false'
GO

use [SDF]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_createWireframe]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_createWireframe]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_decreaseFeatureComplexity]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_decreaseFeatureComplexity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_deleteGroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_deleteGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_deleteRequirement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_deleteRequirement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_deleteproject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_deleteproject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_editFeature]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_editFeature]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_editGroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_editGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_editProject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_editProject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_editRequirement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_editRequirement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_generateFeatures]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_generateFeatures]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getFeatures]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getFeatures]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getGroupID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getGroupID]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getGroups]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getGroups]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getProjects]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getProjects]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getReferences]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getReferences]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getRequirements]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getRequirements]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getVersions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getVersions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_getWireFrames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_getWireFrames]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_increaseFeatureComplexity]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_increaseFeatureComplexity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_insertGroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_insertGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_insertProject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_insertProject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_insertRequirement]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_insertRequirement]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ap_jumpQueue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ap_jumpQueue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu__private_addError]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu__private_addError]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu__private_addFailure]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu__private_addFailure]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu__private_createTestResult]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu__private_createTestResult]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu__private_showTestResult]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu__private_showTestResult]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu_describe]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu_describe]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu_error]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu_error]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu_failure]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu_failure]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu_runTestSuite]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu_runTestSuite]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu_runTests]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu_runTests]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsu_showTestResults]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[tsu_showTestResults]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_References]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_References]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblComplexity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblComplexity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblFeatures]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblFeatures]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblGroups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblGroups]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblProjects]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblProjects]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblReleases]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblReleases]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblRequirements]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblRequirements]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblRequirementsHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblRequirementsHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblVersions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblVersions]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblWireframes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblWireframes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsuActiveTest]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tsuActiveTest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsuErrors]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tsuErrors]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsuFailures]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tsuFailures]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsuLastTestResult]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tsuLastTestResult]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tsuTestResults]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tsuTestResults]
GO

if not exists (select * from master.dbo.syslogins where loginname = N'dsSDF')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SDF', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'dsSDF', null, @logindb, @loginlang
END
GO

if not exists (select * from dbo.sysusers where name = N'dsSDF')
	EXEC sp_grantdbaccess N'dsSDF', N'dsSDF'
GO

if not exists (select * from dbo.sysusers where name = N'guest' and hasdbaccess = 1)
	EXEC sp_grantdbaccess N'guest'
GO

if not exists (select * from dbo.sysusers where name = N'sp_exec')
	EXEC sp_addrole N'sp_exec'
GO

exec sp_addrolemember N'db_datareader', N'dsSDF'
GO

exec sp_addrolemember N'db_datawriter', N'dsSDF'
GO

exec sp_addrolemember N'sp_exec', N'dsSDF'
GO

CREATE TABLE [dbo].[tblComplexity] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Complexity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Colour] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblFeatures] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Feature] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[XCoord] [int] NULL ,
	[YCoord] [int] NULL ,
	[ComplexityID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblGroups] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[GroupName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblProjects] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProjectName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Description] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ParentID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblReleases] (
	[Release] [int] IDENTITY (1, 1) NOT NULL ,
	[UptoVersion] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblRequirements] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[groupID] [int] NULL ,
	[requirement] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[verb] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[noun] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[projectID] [int] NULL ,
	[Queue] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblRequirementsHistory] (
	[ID] [int] NOT NULL ,
	[GroupID] [int] NULL ,
	[Requirement] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectID] [int] NULL ,
	[Verb] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Noun] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dateEdited] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblVersions] (
	[Version] [int] IDENTITY (1, 1) NOT NULL ,
	[PositionInQueue] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tblWireframes] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectID] [int] NOT NULL ,
	[GroupID] [int] NOT NULL ,
	[X1] [int] NOT NULL ,
	[Y1] [int] NOT NULL ,
	[Width] [int] NOT NULL ,
	[Height] [int] NOT NULL ,
	[html] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tsuActiveTest] (
	[isError] [bit] NOT NULL ,
	[isFailure] [bit] NOT NULL ,
	[procedureName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[message] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tsuErrors] (
	[testResultID] [int] NOT NULL ,
	[test] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[message] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tsuFailures] (
	[testResultID] [int] NOT NULL ,
	[test] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[message] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tsuLastTestResult] (
	[suite] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[success] [bit] NULL ,
	[testCount] [int] NULL ,
	[failureCount] [int] NULL ,
	[errorCount] [int] NULL ,
	[startTime] [datetime] NULL ,
	[stopTime] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tsuTestResults] (
	[testResultID] [int] IDENTITY (1, 1) NOT NULL ,
	[startTime] [datetime] NOT NULL ,
	[stopTime] [datetime] NULL ,
	[runs] [int] NOT NULL ,
	[testName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblComplexity] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblComplexity] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblFeatures] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblFeatures] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblGroups] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblGroups] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblProjects] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblProjects] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblReleases] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblReleases] PRIMARY KEY  CLUSTERED 
	(
		[Release]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblRequirements] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblRequirements] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblRequirementsHistory] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblRequirementsHistory] PRIMARY KEY  CLUSTERED 
	(
		[ID],
		[dateEdited]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblVersions] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblVersion] PRIMARY KEY  CLUSTERED 
	(
		[Version]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblWireframes] WITH NOCHECK ADD 
	CONSTRAINT [PK_tblWireframes] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblFeatures] ADD 
	CONSTRAINT [DF_tblFeatures_ComplexityID] DEFAULT (4) FOR [ComplexityID]
GO

ALTER TABLE [dbo].[tblGroups] ADD 
	CONSTRAINT [ch_nameunique] UNIQUE  NONCLUSTERED 
	(
		[GroupName]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblProjects] ADD 
	CONSTRAINT [CH_pROJECTNAME] UNIQUE  NONCLUSTERED 
	(
		[ProjectName]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tblRequirementsHistory] ADD 
	CONSTRAINT [DF_tblRequirementsHistory_dateEdited] DEFAULT (getdate()) FOR [dateEdited]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE VIEW vw_References
AS 
		Select 
			f.[ID] as FeatureID, 
			f.Feature,
			x.RequirementID
		from 
			tblFeatures f
		inner join
			( Select 
				[ID] as RequirementID,
				rtrim(verb)+Noun as Feature
			  from 
				tblRequirements) X
			on x.Feature = f.Feature 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  SELECT  ON [dbo].[vw_References]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO






CREATE      procedure ap_createWireframe
@ProjectID as int, 
@GroupID as int,
@X1 as int,
@Y1 as int,
@Width as int,
@height as int



as

-- need to check that there is atleat one Feature block included with the space.

	Select 
		f.[ID] as FestureID
	from 
		tblFeatures f 
	inner join
		vw_References m on m.FeatureID = f.[ID] 
	inner join
		tblRequirements r on r.[ID] = m.RequirementID 	
	where 
		r.groupID = 7 --@GroupID
		and r.projectID = 1 -- @projectID
		and f.Xcoord between @x1 and (@x1+@width)
		and f.Ycoord between @Y1 and (@Y1+@height)
		

if (@@rowcount <> 0)

	Begin 
		begin Tran t1	
		



		
		-- create new wireframe
	
		Insert into 
			tblWireFrames (ProjectID, GroupID, X1, Y1, WIDTH, HEIGHT)
		values
			(@ProjectID, @GroupID, @X1, @Y1, @WIDTH, @HEIGHT )


		commit tran t1


	end	















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_createWireframe]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




create       procedure ap_decreaseFeatureComplexity
@FeatureID as int



as


SET NOCOUNT ON

declare @ErrorCode int
Select @ErrorCode = @@Error

declare @ComplexityID int

Select 
	@ComplexityID = ComplexityID 
from 
	tblFeatures with (nolock)
where 	
	[id]= @FeatureID;
Select @ErrorCode = @@Error


if @ErrorCode = 0
Begin
	If @ComplexityID > 1
		begin
			-- update existing feature
			update 
				tblFeatures 
			set 
				ComplexityID = ComplexityID -1 
			where [id]= @FeatureID;
			Select @ErrorCode = @@Error
		end
end


SET NOCOUNT OFF


Return(@ErrorCode)




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_decreaseFeatureComplexity]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE      procedure ap_deleteGroup
@id as int 


as


Declare @ErrorCode int
Select @ErrorCode = @@Error

If @ErrorCode = 0
Begin
	
	-- Todo:check if requirement exists

	-- delete existing requirement
	delete from 
		tblGroups
	where [id]= @id;
	Select @ErrorCode = @@Error
end

return(@ErrorCode)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_deleteGroup]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE       procedure ap_deleteRequirement
@id as int 


as

set nocount on


-- TODO: check if the requirement has infact been changed

Declare @ErrorCode int
Select @ErrorCode = @@Error


Declare @TransactionCountOnEntry int
If @ErrorCode = 0
Begin
   Select @TransactionCountOnEntry = @@TranCount
   BEGIN TRANSACTION
End

If @ErrorCode = 0
Begin	
	-- copy requirement into tblRequirementsHistory
	Insert into 
		tblRequirementsHistory 
	select 
		@id as [ID],
		groupId, 
		Requirement,
		ProjectID,
		Verb,
		Noun,	
		getdate() as dateEdited 
	from 
		tblRequirements 
	where 
		[id] = @id;
	Select @ErrorCode = @@Error
end

If @ErrorCode = 0
Begin
	-- delete existing requirement
	delete from 
		tblRequirements 
	where [id]= @id;
	Select @ErrorCode = @@Error
end

If @@TranCount > @TransactionCountOnEntry
Begin
   If @ErrorCode = 0
      COMMIT TRANSACTION
   Else
      ROLLBACK TRANSACTION
End

Set nocount off


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_deleteRequirement]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE       procedure ap_deleteproject
@id as int 


as

SET NOCOUNT ON

Declare @ErrorCode int
Select @ErrorCode = @@Error

If @ErrorCode = 0
Begin
	-- Todo: Check if Project exists


	-- Todo: Check if Project has any existing requirements
	


	-- delete project record	
	delete from 
		tblProjects
	where [id]= @id;
	Select @ErrorCode = @@Error
end


return(@ErrorCode)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_deleteproject]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




create      procedure ap_editFeature
@id as int, 
@Xcoord as int,
@ycoord as int


as


SET NOCOUNT ON

declare @ErrorCode int
Select @ErrorCode = @@Error

if @ErrorCode = 0
Begin
	-- update existing feature
	update 
		tblFeatures 
	set 
		Xcoord = @Xcoord,
		Ycoord = @Ycoord 
	where [id]= @id;
	Select @ErrorCode = @@Error
end


SET NOCOUNT OFF


Return(@ErrorCode)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_editFeature]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO






CREATE      procedure ap_editGroup
@id as int, 
@Groupname as varchar(50),
@ProjectID as int = null


as


SET NOCOUNT ON

declare @ErrorCode int
Select @ErrorCode = @@Error

if @ErrorCode = 0
Begin
	-- update existing group name
	update 
		tblGroups 
	set 
		GroupName = @GroupName,
		ProjectID = @projectID 
	where [id]= @id;
	Select @ErrorCode = @@Error
end


SET NOCOUNT OFF


Return(@ErrorCode)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_editGroup]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE    procedure ap_editProject
@id as int, 
@Projectname as varchar(50),
@Description as varchar(200)= null,
@ParentID as int = null


as


-- update existing Project name
update 
	tblProjects 
set 
	ProjectName = @ProjectName,
	[Description] = @Description,
	ParentId = @ParentID 
where [id]= @id;







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_editProject]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO






CREATE      procedure ap_editRequirement
@id as int, 
@requirement as varchar(200),
@GroupID as int,
@ProjectID as int,
@verb as varchar(20),
@noun as varchar(20)


as
-- check if the requirement has infact been changed

begin Tran t1	

-- copy requirement into tblRequirementsHistory
Insert into 
	tblRequirementsHistory 
select 
	@id as [ID],
	groupId, 
	Requirement,
	projectID, 
	verb,
	noun,
	getdate() as dateEdited

from 
	tblRequirements 
where 
	[id] = @id;



-- update existing requirement
update 
	tblRequirements 
set 
	Requirement = @Requirement,
	GroupID = @GroupId,
	ProjectID = @ProjectID,
	verb = @verb,
	noun = @noun 
where [id]= @id;

commit tran t1





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_editRequirement]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO











CREATE   procedure ap_generateFeatures
@ProjectID as int, 
@GroupID as int



as
-- get a List of the verbNouns from the requirements

	Select distinct
		rtrim(verb)+Noun as verbNoun
	into #tmpFeatures 
	from 
		tblRequirements with (nolock)
	where 
		projectID =  @projectID 
		and groupID = @groupID


  --  select * from #tmpFeatures
  -- print @@rowcount	



if (@@rowcount <> 0)
	Begin 
		begin Tran t1	
		-- Remove those that should not exist...



		
		-- insert those that do not exist
	
		Insert into 
			tblFeatures (Feature)
		Select 
			verbNoun as Feature
		from 
			#tmpFeatures
		Where 
			verbNoun not in (select Feature from tblFeatures)


		commit tran t1


	end	




drop table #tmpFeatures







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_generateFeatures]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE       procedure ap_getFeatures
@GroupID int



as


select  distinct
	f.[id],
	f.Feature,
	f.Xcoord,
	f.Ycoord,
	f.ComplexityID,
	c.Colour
from 
	tblFeatures f with (nolock)
left join
	tblComplexity c with (nolock) on c.[ID] = f.complexityID  
					
inner join 
	vw_References j with (nolock)  on f.ID = j.FeatureID
inner join
	tblRequirements r with (nolock)	
	on j.RequirementID = r.ID
			and r.GroupID = @GroupID   ;


return(0)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getFeatures]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE      procedure ap_getGroupID
@groupname Varchar(50),
@ProjectID int = null,
@ID int OUTPUT


as




select 
	@ID = [id]
from 
	tblGroups with (nolock)
where groupname=@groupname;

if ( @id is null) -- does not exist so create it
	begin
		insert into tblGroups (groupname,projectID) values (@groupname,@ProjectID)
	
		Select @id = @@identity
	end



return(0)









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getGroupID]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE   procedure ap_getGroups



as


select 
	g.[id],
	g.groupname,
	g.projectID,
	p.projectname
from 
	tblGroups g with (nolock)
left join
	tblProjects p with (nolock)
		on p.[ID] = g.ProjectID;


return(0)






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getGroups]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE   procedure ap_getProjects


as


select 
	[id],
	ProjectName,
	[Description],
	ParentID
from 
	tblProjects with (nolock);


return(0)






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getProjects]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO






create      procedure ap_getReferences
@FeatureID int



as


select 
	RequirementID
From vw_References with (nolock)
where 
	FeatureID = @FeatureID


return(0)









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getReferences]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO











CREATE           procedure ap_getRequirements 

@ProjectID as int = 1

as



select 
	r.[id],
	r.groupID,
	g.groupname,
	r.requirement,
	r.projectID,
	r.verb,
	r.noun,
	r.queue,
	v.version 
	
from 
	tblRequirements  r with (nolock)
left join 
	tblGroups g with (nolock)
		 on g.[id] = r.groupid
left join
	tblVersions v with (nolock)
		on v.PositionInQueue = r.Queue
where r.projectID = @ProjectID
order by r.queue asc;

return(0)










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getRequirements]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








create        procedure ap_getVersions
@ProjectID int



as


select  
	Version
	,PositionInQueue
from 
	tblVersions with (nolock) ;


return(0)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getVersions]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO








create    procedure ap_getWireFrames
@ProjectId as int,
@groupID as int


as


select 
	[id],
	[Name],
	[X1],
	Y1,
	Width,
	Height
	
from 
	tblWireframes with (nolock)
where
	ProjectID = @ProjectID
	and GroupID = @GroupID	;


return(0)







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_getWireFrames]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE        procedure ap_increaseFeatureComplexity
@FeatureID as int



as


SET NOCOUNT ON

declare @ErrorCode int
Select @ErrorCode = @@Error

declare @ComplexityID int

Select 
	@ComplexityID = ComplexityID 
from 
	tblFeatures with (nolock)
where 	
	[id]= @FeatureID;
Select @ErrorCode = @@Error


if @ErrorCode = 0
Begin
	If @ComplexityID < 4
		begin
			-- update existing feature
			update 
				tblFeatures 
			set 
				ComplexityID = ComplexityID+1 
			where [id]= @FeatureID;
			Select @ErrorCode = @@Error
		end
end


SET NOCOUNT OFF


Return(@ErrorCode)





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_increaseFeatureComplexity]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE    procedure ap_insertGroup 
@GroupName as varchar(200),
@ProjectID as int = null


as


insert into tblGroups (GroupName,ProjectID) values (@GroupName,@ProjectID)




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_insertGroup]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE     procedure ap_insertProject
@ProjectName as varchar(50),
@Description as varchar(200) = null,
@ParentID as int = null


as

Declare @ErrorCode int
Select @ErrorCode = @@Error


If @ErrorCode = 0
Begin
	insert into 
		tblProjects (ProjectName, [Description], ParentID ) 
	values 
		(@ProjectName, @Description, @ParentID)
   	Select @ErrorCode = @@Error
End




return(@ErrorCode)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_insertProject]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE        procedure ap_insertRequirement 
@requirement as varchar(200),
@groupid as int = 1,
@projectID as int = 1,
@Verb as varchar(20),
@Noun as varchar(20)


as


declare @lastInQueue as int



-- determine what the last ID in the queue is

Select  @lastinQueue =  
max(queue) +1
from tblRequirements; 

-- if null it must be the first record
if (@lastinQueue is null)
	select @lastinQueue =1





insert into 
	tblRequirements (
		Requirement, 
		GroupID,
		ProjectID,
		Verb,
		Noun,
		Queue
	) 
values (
	@requirement,
	@GroupID,
	@ProjectID,
	@Verb,
	@Noun,
	@lastinQueue)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_insertRequirement]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO









CREATE            procedure ap_jumpQueue
@QueueJumper as int, 
@inFrontOf as int



as
-- get where it is in the queue and store it

declare @QueueID as int

Select @QueueID = Queue from tblRequirements where [id] = @inFrontOf  



declare @oldQueue as int

Select @oldQueue = Queue from tblRequirements where [id] = @QueueJumper


begin Tran t1	

if (@QueueID < @oldQueue)
	Begin 
	
		update 
			tblRequirements 
		set 
			Queue = Queue +1
		where 
			Queue between @QueueID and @oldQueue -1;
	
	end

else

	Begin
	
		update 
			tblRequirements
		set
			Queue= Queue -1
		where 
			Queue between @QueueID and @oldQueue +1;
	end	


update 
	tblRequirements
set 
	Queue = @QueueID
where
	[ID] = @QueueJumper



commit tran t1











GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

GRANT  EXECUTE  ON [dbo].[ap_jumpQueue]  TO [sp_exec]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE   PROCEDURE tsu__private_addError @test NVARCHAR(255), @errorMessage NVARCHAR(255)
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure makes an internal notice when an error has occurred. 
-- PARAMETERS:      @test               The name of the test
--                  @errorMessage       A description of the error
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

AS
SET NOCOUNT ON
DECLARE @id INTEGER
SET @id=(SELECT MAX(testResultID) FROM tsuTestResults)

INSERT INTO tsuErrors( test, message, testResultID) VALUES(@test,@errorMessage, @id)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE   PROCEDURE tsu__private_addFailure @test NVARCHAR(255), @errorMessage NVARCHAR(255)
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure makes an internal notice when a failure has occurred. 
-- PARAMETERS:      @test               The name of the test
--                  @errorMessage       A description of the failure
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
AS
SET NOCOUNT ON
DECLARE @id INTEGER
SET @id=(SELECT MAX(testResultID) FROM tsuTestResults)

INSERT INTO tsuFailures( test, message, testResultID) VALUES(@test,@errorMessage, @id)




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE tsu__private_createTestResult @suiteName NVARCHAR(255)=''
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure intializes the testrsult before the 
--                  tests in a suite are called.
-- PARAMETERS:      @suiteName          The name of the testsuite
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
AS 
INSERT INTO tsuTestResults
	( runs, testName, startTime) 
VALUES (0,@suiteName, GetDate())
IF @@ERROR <>0 
	RETURN 100




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE  PROCEDURE tsu__private_showTestResult 
    @testResultID INTEGER 
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure prints the results of testing a suite.
-- PARAMETERS:      @testResultID        The testresult is shown for this ID
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA    
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @outstr NVARCHAR(120)
	SET @outstr=(SELECT 'Testsuite: ' + testName + ' (' + LTRIM(STR(runs)) + ' tests )' 
				+ ' execution time: '  + LTRIM(STR(datediff(ms,startTime,stopTime))) + ' ms.'
			FROM tsuTestResults WHERE TestResultID=@testResultID)

	PRINT @outstr

	DECLARE msgcursor CURSOR FOR 
		SELECT '>>> Test: ' + test + '     '  + message FROM tsuErrors	
		WHERE testResultID=@testResultID UNION ALL
		SELECT '>>> Test: ' + test + '     '  + message FROM tsuFailures
		WHERE testResultID=@testResultID 
	FOR READ ONLY
	OPEN msgcursor
	FETCH NEXT FROM msgcursor INTO @outstr
	WHILE @@FETCH_STATUS =0 
	BEGIN
		PRINT @outstr
		FETCH NEXT FROM msgcursor INTO @outstr
	END
	CLOSE msgcursor
	DEALLOCATE msgcursor
END





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE tsu_describe
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure returns information about all testcases 
--                  in the database.
-- PARAMETERS:      None
-- RETURNS:         Recordset with fields:
--                      TESTNAME:       the name of the test stored procedure 
--                      SUITE:          the name of the testsuite, or blank if 
--                                      the test does not belong to a suite. 
--                      HASSETUP:       1 if the suite has a setup procedure.
--                      HASTEARDOWN:    1 if the suite has a teardown procedure.    
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

AS

SET NOCOUNT ON 

DECLARE @testcase sysname
DECLARE @testcase_prefix_removed sysname
DECLARE @ErrorSave INT
DECLARE @ErrorExec INT
DECLARE @hasSetup BIT
DECLARE @hasTearDown BIT
DECLARE @suitePrefixIndex INT

DECLARE @suite sysname
DECLARE @testPrefix varchar(10)
DECLARE @lengthOfTestPrefix INTEGER
DECLARE @LikeUnderscore char(3)
DECLARE @setupLikeExpression VARCHAR(255)
DECLARE @teardownLikeExpression VARCHAR(255)

SET @LikeUnderscore ='[_]'
SET @testPrefix='ut' + @LikeUnderscore
SET @lengthOfTestPrefix=3

CREATE TABLE #result (
 TESTNAME sysname,
 SUITE sysname,
 HASSETUP bit,
 HASTEARDOWN bit
)

DECLARE testcases_cursor CURSOR FOR 
	select name from sysobjects where xtype='P' and name LIKE  @testPrefix + '%'

OPEN testcases_cursor

FETCH NEXT FROM testcases_cursor INTO @testcase

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @hasSetup=0
    SET @hasTearDown=0
    SET @suite=''

    SET @testcase_prefix_removed=RIGHT(@testcase,LEN( @testcase)-@lengthOfTestPrefix)

    IF @testcase_prefix_removed LIKE '%' +@LikeUnderscore+ '%'  
    BEGIN
	SET @suitePrefixIndex=CHARINDEX ( '_', @testcase_prefix_removed  ) 
	SET @suite= LEFT(@testcase_prefix_removed, @suitePrefixIndex - 1)
            SET @setupLikeExpression=@testPrefix +  @suite + @LikeUnderscore  + 'SetUp'
            SET @hasSetup= (select count(*) from sysobjects where xtype='P' and name LIKE @setupLikeExpression )

            SET @teardownLikeExpression=@testPrefix +  @suite + @LikeUnderscore  + 'TearDown'
	SET @hasTearDown= (select count(*) from sysobjects where xtype='P' and name LIKE @teardownLikeExpression )
    END

    IF NOT((@hasSetup=1 AND (@testcase LIKE @setupLikeExpression)) OR ( @hasTearDown=1 AND (@testcase LIKE @teardownLikeExpression)))
    BEGIN	
	 INSERT INTO  #result ( TESTNAME ,
				 SUITE,
				 HASSETUP,
				 HASTEARDOWN )
	 VALUES (@testcase, @suite,@hasSetup,@hasTearDown)
    END	
    FETCH NEXT FROM testcases_cursor  INTO @testcase
END
 
CLOSE testcases_cursor
DEALLOCATE testcases_cursor

SELECT TESTNAME, SUITE, HASSETUP, HASTEARDOWN FROM #result





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE PROCEDURE tsu_error 
	@errorNr INT 
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure can be called by a unit test when an
--                  error occurs. Normally this should not be necessary, the 
--                  runTestSuite procedure does this automatically. 
-- PARAMETERS:      @errorNr        An error number
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA        
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @msg NVARCHAR(255)

	IF @errorNr=14000 -- User defined error message generated by RAISERRROR 
	BEGIN
		SET @msg='User defined error'
	END
	ELSE
	BEGIN
		SET @msg=(SELECT 'Severity:' + CAST([severity] AS VARCHAR(10)) + ' Description:' + [description] FROM master.dbo.[sysmessages] 
			        WHERE [error]=@errorNr)
	END
	UPDATE tsuActiveTest 	
		SET 
			IsError=1, 
			IsFailure=0,
			message=@msg
END







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE  PROCEDURE tsu_failure 
	@message NVARCHAR(255)
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure should be called by a unit test when a
--                  test fails. 
-- PARAMETERS:      @message        A description of the failure
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA            
AS
BEGIN
	SET NOCOUNT ON
	UPDATE tsuActiveTest 	
		SET 
			IsFailure=1, 
			isError=0,
			message=ISNULL(@message,'(no description)')
END




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO






CREATE PROCEDURE tsu_runTestSuite @suite NVARCHAR(255)
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure runs all the tests in a testsuite.
--                  It creates an entry in tsuTestResults with the results.
--                  As this procedure does not produce any graphical output, you
--                  should generally not call this procedure directly, instead
--                  look at tsu_runTests.
-- PARAMETERS:      @suite        The name of the suite
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA            
AS
BEGIN

SET NOCOUNT ON 

BEGIN TRANSACTION 

DECLARE @testcase sysname
DECLARE @hasSetup BIT
DECLARE @hasTearDown BIT
DECLARE @failure BIT
DECLARE @testPrefix CHAR(3)
DECLARE @setupError INT
DECLARE @tearDownError INT
DECLARE @procedureError INT
DECLARE @countTests INT
DECLARE @isError BIT
DECLARE @isFailure BIT
DECLARE @procedureName NVARCHAR(255)
DECLARE @message NVARCHAR(200)
DECLARE @retVal INT

SET @countTests=0


DECLARE @spName NVARCHAR(255)
SET @testPrefix='ut_'

CREATE TABLE #result (
	 TESTNAME sysname,
	 SUITE sysname,
	 HASSETUP bit,
	 HASTEARDOWN bit
)

INSERT INTO #result EXECUTE tsu_describe
IF @@ERROR<>0 
BEGIN
	ROLLBACK TRANSACTION 
	RETURN 100
END

	
EXEC @retVal=tsu__private_CreateTestResult
IF @@ERROR<>0 OR @retVal<>0
BEGIN
	ROLLBACK TRANSACTION 
	RETURN 100
END

DECLARE testcases_cursor CURSOR FOR 
	SELECT TESTNAME, HASSETUP, HASTEARDOWN FROM #result 
		WHERE SUITE=@suite 
	ORDER BY TESTNAME

OPEN testcases_cursor

FETCH NEXT FROM testcases_cursor INTO @testcase, @hasSetup, @hasTearDown
WHILE @@FETCH_STATUS = 0
BEGIN
	DELETE FROM  tsuActiveTest;
	INSERT INTO tsuActiveTest (isError,isFailure,message) VALUES (0,0,'')
	SET @countTests=@countTests+1

	SET ARITHABORT OFF

	SET @setupError=0
	SET @tearDownError=0
	SET @procedureError=0

	SET XACT_ABORT OFF

	SAVE TRANSACTION testTran

	IF @hasSetup =1
	BEGIN
		UPDATE tsuActiveTest 
			SET procedureName=@testcase+ '(in SetUp)'
		SET @spName=@testPrefix +  @suite + '_SetUp'
		EXEC @spName
		SET @setupError=@@ERROR
		IF (@setupError <> 0) 
			EXEC tsu_error @setupError
	END
	IF @setupError= 0
	BEGIN
		UPDATE tsuActiveTest 
			SET procedureName=@testcase
		EXEC @testcase
		SET @procedureError=@@ERROR
		SET @failure=(SELECT isFailure FROM tsuActiveTest)
		IF (@procedureError <> 0 AND @setupError=0 AND @failure=0)  -- Only show the first error 
			EXEC tsu_error @procedureError
	END

	IF @hasTearDown=1
	BEGIN
		UPDATE tsuActiveTest 
			SET procedureName=@testcase+ '(in TearDown)'
		SET @spName=@testPrefix +  @suite + '_TearDown'
		EXEC @spName
		SET @tearDownError=@@ERROR
		IF (@tearDownError <> 0 AND @setupError = 0 AND @failure=0 AND @procedureError = 0 )
			EXEC tsu_error @tearDownError  -- Only show the first error 
	END
	
	-- Copy the test result to local variables, then Do a Rollback and restore the state of the database 
	


	SET @isError = (SELECT isError FROM tsuActiveTest )
	SET @isFailure=(SELECT isFailure FROM tsuActiveTest)
	SET @procedureName=(SELECT procedureName FROM tsuActiveTest)
	SET @message=(SELECT message FROM tsuActiveTest)
		
	ROLLBACK TRANSACTION testTran


	IF @isError=1
	    EXEC tsu__private_addError @procedureName, @message
	ELSE IF @isFailure=1
	    EXEC tsu__private_addFailure @procedureName, @message

	FETCH NEXT FROM testcases_cursor  INTO @testcase, @hasSetup, @hasTearDown
END
 
CLOSE testcases_cursor
DEALLOCATE testcases_cursor

UPDATE tsuTestResults
	SET stopTime=getdate(), 
	       runs=@countTests
	WHERE testResultID= (SELECT MAX(testResultId) FROM tsuTestResults)

COMMIT TRANSACTION
END















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE tsu_runTests
	@suite NVARCHAR(255)='' OUTPUT,
	@success BIT = 0 OUTPUT,
	@testCount INTEGER = 0 OUTPUT,
	@failureCount INTEGER = 0 OUTPUT,
	@errorCount INTEGER = 0 OUTPUT
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This is the procedure you call when you want to run 
--                  the tests and look at the result. It may also be called 
--                  from code. Statistics are returned in the output parameters,
--                  and in the table tsuLastTestResult
--                  
-- PARAMETERS:      @suite          Optional name of a suite, if this is not
--                                  provided all tests in the database will be
--                                  executed.
--                  @success        1 if all tests were successful.  
--                  @testCount      The number of tests executed.
--                  @failureCount   The number of failing tests.
--                  @errorCount     The number of tests with errors.
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA         
AS
BEGIN
SET NOCOUNT ON
DECLARE @testsuite NVARCHAR(255)
DECLARE @lastTestResultID INTEGER
DECLARE @startTime DATETIME
DECLARE @stopTime DATETIME
SET @success=0
SET @testCount=0
SET @failureCount=0
SET @errorCount=0

IF @suite='' OR @suite IS NULL SET @suite='%' 

CREATE TABLE #tests (
	 TESTNAME sysname,
	 SUITE sysname,
	 HASSETUP bit,
	 HASTEARDOWN bit
)

INSERT INTO #tests EXECUTE tsu_describe

DECLARE testsuites_cursor CURSOR FOR 
	SELECT DISTINCT SUITE FROM #tests 
	WHERE SUITE LIKE @suite
	ORDER BY SUITE 
OPEN testsuites_cursor

SET @startTime=GetDate()
PRINT REPLICATE ( '=' , 80 ) 
PRINT ' Run tests starts:' + CAST(@startTime AS VARCHAR(30))

FETCH NEXT FROM testsuites_cursor INTO @testsuite
WHILE @@FETCH_STATUS = 0
BEGIN
	EXEC tsu_runTestSuite @testsuite	
	SET @lastTestResultID=(SELECT MAX(testResultID) FROM tsuTestResults)
	SET @testCount= @testCount+ (SELECT runs FROM tsuTestResults 
					 WHERE testResultID=@lastTestResultID)
	SET @failureCount= @failureCount+ (SELECT COUNT(*) FROM tsuFailures 
 					    WHERE testResultID=@lastTestResultID)
	SET @errorCount= @errorCount+ (SELECT COUNT(*) FROM tsuErrors 
					 WHERE testResultID=@lastTestResultID)


	FETCH NEXT FROM testsuites_cursor  INTO @testsuite
END
SET @stopTime=GetDate()
IF @failureCount=0 and @errorCount=0 
	 SET @success=1	

CLOSE testsuites_cursor
DEALLOCATE testsuites_cursor

PRINT REPLICATE ( '=' , 80 ) 

EXEC tsu_showTestResults @startTime, @stopTime

PRINT REPLICATE ( '-' , 80 ) 
PRINT ' Run tests ends:' + CAST(@stopTime AS VARCHAR(30))
PRINT ' Summary:'
PRINT '     ' + LTRIM(STR(@testCount)) + ' tests, of which ' + 
          LTRIM(STR(@failureCount)) + ' failed and ' + 
          LTRIM(STR(@errorCount)) + ' had an error.'
PRINT ''
IF @success=1 
	PRINT '     SUCCESS!'
ELSE
	PRINT '     FAILURE!'

PRINT REPLICATE ( '-' , 80 ) 
PRINT REPLICATE ( '=' , 80 ) 
--
--# According to Knownledge base article Q313861 a recordset will not return to ADO if the
--# stored procedure fails with a severe error. As a work around, the result of the
--# last test is saved to the table tsuLastTestResult
--
DELETE FROM tsuLastTestResult
INSERT INTO tsuLastTestResult ( suite, success, testCount, failureCount, errorCount, startTime, stopTime)
	VALUES (@suite, @success, @testCount, @failureCount, @errorCount, @startTime, @stopTime)
	
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO






CREATE    PROCEDURE tsu_showTestResults 
	@startTime datetime=NULL,
	@endTime datetime=NULL 
-- GENERAL INFO:    This stored procedure is a part of the tsqlunit
--                  unit testing framework. It is open source software
--                  available at http://tsqlunit.sourceforge.net
--
-- DESCRIPTION:     This procedure shows the result of all tests done, or 
--                  all tests within a certain period.
-- PARAMETERS:      @suite        The name of the suite
--
-- RETURNS:         Nothing
-- 
-- VERSION:         tsqlunit-0.9
-- COPYRIGHT:
--    Copyright (C) 2002  Henrik Ekelund 
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>
--
--    This library is free software; you can redistribute it and/or
--    modify it under the terms of the GNU Lesser General Public
--    License as published by the Free Software Foundation; either
--    version 2.1 of the License, or (at your option) any later version.
--
--    This library is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--    Lesser General Public License for more details.
--
--    You should have received a copy of the GNU Lesser General Public
--    License along with this library; if not, write to the Free Software
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA     
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @testResultID INTEGER
	IF @startTime IS NULL 
		SET @startTime=CONVERT(DATETIME,'1900-01-01',121)
	IF @endTime IS NULL 
		SET @endTime=CONVERT(DATETIME,'2100-01-01',121)
	DECLARE cursorTestResultID CURSOR FOR
	       SELECT testResultID FROM tsuTestResults WHERE 
		startTime>= CAST(@startTime AS timestamp) AND 
		stopTime <= @endTime 
		ORDER BY startTime
	OPEN cursorTestResultID
	FETCH NEXT FROM cursorTestResultID INTO @testResultID
	WHILE @@FETCH_STATUS =0 
	BEGIN
		EXEC tsu__private_showTestResult @testResultID
		FETCH NEXT FROM cursorTestResultID INTO @testResultID
	END
	CLOSE cursorTestResultID
	DEALLOCATE cursorTestResultID
END






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

