USE [PWS]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCounts]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetCounts]-- 'Frances','apt','india'

AS
Begin
    SELECT Count(*) as Wars FROM dbo.tbl_Wars 
    
    SELECT Count(*) as WarDetails FROM dbo.tbl_War_Details 
    
    SELECT Count(*) as WarStories FROM dbo.tbl_War_Story 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ManageAboutUS]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ManageAboutUS]
@AboutusShortDesc text='',
@AboutusDescription text='',
@Action varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    if(@Action='Insert')
	Begin
	Declare @Desc varchar(200)
	set @Desc=(Select isnull([AboutusShortDesc],'') from [tbl_AboutUS])
	if(isnull(@Desc,'')='')
	Begin
	INSERT INTO [dbo].[tbl_AboutUS]([AboutusShortDesc],[AboutusDescription]) VALUES (@AboutusShortDesc,@AboutusDescription)
    Select * from tbl_AboutUS
	END
	ELSE	
	BEGIN
	UPDATE [dbo].[tbl_AboutUS]  SET [AboutusShortDesc] = @AboutusShortDesc ,[AboutusDescription] = @AboutusDescription         
    Select * from tbl_AboutUS
	END
    END
    if(@Action='Search')
	Begin
    Select AboutusShortDesc from tbl_AboutUS
    Select AboutusDescription from tbl_AboutUS
    END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ManageWar_Details]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ManageWar_Details]
@WarDetailID int=0,
@WarID int=0,
@WarTitle varchar(1500)='',
@Title varchar(1500)='',
@Description varchar(500)='',
@IsActive bit,
@Action varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@Action='Insert')
	Begin
    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_War_Details]
           ([WarID]
           ,[Title]           
           ,[Description]
           ,[IsActive])
     VALUES
           (@WarID,@Title,@Description,@IsActive)
           Select * from tbl_War_Details
		   end
           
		   if(@Action='Update')	
		   Begin
		    UPDATE [dbo].[tbl_War_Details]
            SET [Title] = @Title
            ,[WarID] = @WarID
            ,[Description] = @Description
            ,[IsActive] = @IsActive            
             WHERE WarDetailID=@WarDetailID
             Select * from tbl_War_Details
		   End

		   if(@Action='Delete')	
		   Begin
		    Delete from tbl_War_Details where WarID=@WarID
            Select * from tbl_War_Details
		   End

		   if(@Action='Search')	
		   Begin
		    Select wd.*, w.WarID as MainWarID, w.Title as WarTitle from tbl_War_Details wd inner join tbl_Wars w on w.WarID=wd.WarID 
            where
			(@Title='' or wd.Title like '%'+@Title+'%')AND
            (@WarID=0 or wd.WarID=@WarID)AND
            (@WarDetailID=0 or WarDetailID=@WarDetailID) AND
            (@WarTitle='' or w.Title=@WarTitle)
			order by wd.Title asc
		   End
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ManageWar_Story]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ManageWar_Story]
@WarStoryID int=0,
@WarID int=0,
@WarDetailID int=0,
@Title	varchar(500)='',
@ShortDescription varchar(1500)	='',
@Description text='',
@Image	varchar(1500)='',
@IsActive bit,
@WarDetailTitle varchar(1500)='',
@Action varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@Action='Insert')
	Begin
    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_War_Story]
           ([WarID]
		   ,[WarDetailID]
		   ,[Title] 
		   ,[ShortDescription]                  
           ,[Description]
		   ,[Image]
           ,[IsActive])
     VALUES
           (@WarID,@WarDetailID,@Title,@ShortDescription,@Description,@Image,@IsActive)
           Select * from tbl_War_Story
		   end
           
		   if(@Action='Update')	
		   Begin
		    UPDATE [dbo].[tbl_War_Story]
            SET 
			 [WarID] = @WarID
			,[WarDetailID] = @WarDetailID
			,[Title] = @Title
			,[ShortDescription] = @ShortDescription
            ,[Description] = @Description
			,[Image] = @Image
            ,[IsActive] = @IsActive            
             WHERE WarStoryID=@WarStoryID
             Select * from tbl_War_Story
		   End

		   if(@Action='Delete')	
		   Begin
		    Delete from tbl_War_Story where WarStoryID=@WarStoryID
            Select * from tbl_War_Story
		   End

		   if(@Action='Search')	
		   Begin
		    Select ws.*,wd.WarDetailID as WDID, wd.Title as WDTitle, w.WarID as WID, w.Title as WTitle from tbl_War_Story ws inner join tbl_War_Details wd on ws.WarDetailID=wd.WarDetailID inner join tbl_Wars w on w.WarID=wd.WarID 
            where
			(@Title='' or wd.Title=@Title)AND
			(@WarID=0 or ws.WarID=@WarID)AND
            (@WarStoryID=0 or ws.WarStoryID=@WarStoryID)AND
            (@WarDetailID=0 or ws.WarDetailID=@WarDetailID) AND
            (@WarDetailTitle='' or wd.Title=@WarDetailTitle)
			order by wd.Title asc
		   End

		   if(@Action='Latest')	
		   Begin
		    Select top 3 ws.*,wd.WarDetailID as WDID, wd.Title as WDTitle, w.WarID as WID, w.Title as WTitle from tbl_War_Story ws inner join tbl_War_Details wd on ws.WarDetailID=wd.WarDetailID inner join tbl_Wars w on w.WarID=wd.WarID 
            order by ws.WarStoryID desc
		   End
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ManageWars]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ManageWars]
@WarID int=0,
@Title varchar(1500)='',
@Description varchar(500)='',
@Image varchar(500)='',
@IsActive int=0,
@Action varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@Action='Insert')
	Begin
    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Wars]
           ([Title]
           ,[Image]
           ,[Description]
           ,[IsActive])
     VALUES
           (@Title,@Image,@Description,@IsActive)
           Select * from tbl_Wars
		   end
		   if(@Action='Update')	
		   Begin
		    UPDATE [dbo].[tbl_Wars]
            SET [Title] = @Title
            ,[Image] = @Image
            ,[Description] = @Description
            ,[IsActive] = @IsActive            
             WHERE WarID=@WarID
             Select * from tbl_Wars
		   End

		   if(@Action='Delete')	
		   Begin
		    Delete from tbl_Wars where WarID=@WarID
            Select * from tbl_Wars
		   End

		   if(@Action='Search')	
		   Begin
		    Select * from tbl_Wars 
            where
			(@Title='' or Title=@Title) AND
            (@WarID=0 or WarID=@WarID)
			order by Title asc
		   End
END


GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[UserLogin]-- 'Frances','apt','india'
(
@UserName varchar(200),
@Password varchar(200)
)
AS
Begin
    SELECT * FROM dbo.tbl_User WHERE (Email=@UserName or UserName=@UserName) AND Password=@Password
END


GO
/****** Object:  Table [dbo].[tbl_AboutUS]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AboutUS](
	[AboutusShortDesc] [text] NULL,
	[AboutusDescription] [text] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[UserName] [varchar](200) NULL,
	[Password] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_War_Details]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_War_Details](
	[WarDetailID] [int] IDENTITY(1,1) NOT NULL,
	[WarID] [int] NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_War_Details] PRIMARY KEY CLUSTERED 
(
	[WarDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_War_Story]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_War_Story](
	[WarStoryID] [int] IDENTITY(1,1) NOT NULL,
	[WarID] [int] NULL,
	[WarDetailID] [int] NULL,
	[Title] [varchar](500) NULL,
	[ShortDescription] [varchar](1500) NULL,
	[Description] [text] NULL,
	[Image] [varchar](1500) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_War_Story] PRIMARY KEY CLUSTERED 
(
	[WarStoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_War_Story_Tags]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_War_Story_Tags](
	[WarStoryTagID] [int] IDENTITY(1,1) NOT NULL,
	[WarStoryID] [int] NULL,
	[Title] [varchar](500) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_War_Story_Tags] PRIMARY KEY CLUSTERED 
(
	[WarStoryTagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Wars]    Script Date: 07-Sep-20 5:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Wars](
	[WarID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[Image] [varchar](500) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_Wars] PRIMARY KEY CLUSTERED 
(
	[WarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_AboutUS] ([AboutusShortDesc], [AboutusDescription], [IsActive]) VALUES (N'<p>sfsdfsdfsdf<br></p>', N'<p>dsfdsfsdfsdf<br></p>', NULL)
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([UserID], [FirstName], [LastName], [Email], [MobileNo], [UserName], [Password]) VALUES (1, N'Admin', N'User', N'Admin@gmail.com', N'0', N'Admin', N'Admin@123')
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
SET IDENTITY_INSERT [dbo].[tbl_War_Details] ON 

INSERT [dbo].[tbl_War_Details] ([WarDetailID], [WarID], [Title], [Description], [IsActive]) VALUES (2, 3, N'BARTON Iselin Ross - Porirua Cemetery ', N'NA', 0)
INSERT [dbo].[tbl_War_Details] ([WarDetailID], [WarID], [Title], [Description], [IsActive]) VALUES (3, 3, N'BOULD (Chas) Charles  William Hensman  -  Johnsonville', N'NA', 0)
SET IDENTITY_INSERT [dbo].[tbl_War_Details] OFF
SET IDENTITY_INSERT [dbo].[tbl_War_Story] ON 

INSERT [dbo].[tbl_War_Story] ([WarStoryID], [WarID], [WarDetailID], [Title], [ShortDescription], [Description], [Image], [IsActive]) VALUES (2, 3, 2, N'fghgffghf', N'fghfghfgh', N'<p><br></p><p></p><p>ghfghfghfgh</p>', N'assets/wp-content/Images/Wars/RQppth_download.jfif', 0)
SET IDENTITY_INSERT [dbo].[tbl_War_Story] OFF
SET IDENTITY_INSERT [dbo].[tbl_Wars] ON 

INSERT [dbo].[tbl_Wars] ([WarID], [Title], [Description], [Image], [IsActive]) VALUES (3, N'Boer War', N'NA', N'assets/wp-content/Images/Wars/LNJYqz_boer.jpg', 0)
INSERT [dbo].[tbl_Wars] ([WarID], [Title], [Description], [Image], [IsActive]) VALUES (4, N'World War One', N'NA', N'assets/wp-content/Images/Wars/ChXecw_ww1.jpg', 0)
INSERT [dbo].[tbl_Wars] ([WarID], [Title], [Description], [Image], [IsActive]) VALUES (5, N'World War Two', N'NA', N'assets/wp-content/Images/Wars/QjM2u_ww2.jpg', 0)
INSERT [dbo].[tbl_Wars] ([WarID], [Title], [Description], [Image], [IsActive]) VALUES (6, N'Nelson and Others', N'NA', N'assets/wp-content/Images/Wars/E323c_Nelsonandothers.jpg', 0)
SET IDENTITY_INSERT [dbo].[tbl_Wars] OFF
