USE [PWS]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCounts]    Script Date: 01-Sep-20 7:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetCounts]-- 'Frances','apt','india'

AS
Begin
    SELECT Count(*) as Wars FROM dbo.tbl_Wars WHERE IsActive=1
    
    SELECT Count(*) as WarDetails FROM dbo.tbl_War_Details WHERE IsActive=1
    
    SELECT Count(*) as WarStories FROM dbo.tbl_War_Story WHERE IsActive=1
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ManageAboutUS]    Script Date: 01-Sep-20 7:48:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ManageWar_Details]    Script Date: 01-Sep-20 7:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ManageWar_Details]
@WarDetailID int=0,
@WarID int=0,
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
		    Select * from tbl_War_Details wd inner join tbl_Wars w on w.WarID=wd.WarID 
            where
			(@Title='' or wd.Title=@Title)
			order by wd.Title asc
		   End
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ManageWar_Story]    Script Date: 01-Sep-20 7:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ManageWar_Story]
@WarStoryID int=0,
@WarID int=0,
@WarDetailID int=0,
@Description text,
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
	INSERT INTO [dbo].[tbl_War_Story]
           ([WarDetailID]                   
           ,[Description]
           ,[IsActive])
     VALUES
           (@WarDetailID,@Description,@IsActive)
           Select * from tbl_War_Story
		   end
           
		   if(@Action='Update')	
		   Begin
		    UPDATE [dbo].[tbl_War_Story]
            SET [WarDetailID] = @WarDetailID
            ,[Description] = @Description
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
		    Select * from tbl_War_Story ws inner join tbl_War_Details wd on ws.WarDetailID=wd.WarDetailID inner join tbl_Wars w on w.WarID=wd.WarID 
            where
			wd.WarID=@WarID and
            wd.WarDetailID=@WarDetailID
			order by wd.Title asc
		   End
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ManageWars]    Script Date: 01-Sep-20 7:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ManageWars]
@WarID int=0,
@Title varchar(1500)='',
@Description varchar(500)='',
@Image varchar(500)='',
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
			(@Title='' or Title=@Title)
			order by Title asc
		   End
END

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 01-Sep-20 7:48:27 PM ******/
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
/****** Object:  Table [dbo].[tbl_AboutUS]    Script Date: 01-Sep-20 7:48:27 PM ******/
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
/****** Object:  Table [dbo].[tbl_User]    Script Date: 01-Sep-20 7:48:27 PM ******/
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
/****** Object:  Table [dbo].[tbl_War_Details]    Script Date: 01-Sep-20 7:48:27 PM ******/
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
/****** Object:  Table [dbo].[tbl_War_Story]    Script Date: 01-Sep-20 7:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_War_Story](
	[WarStoryID] [int] IDENTITY(1,1) NOT NULL,
	[WarDetailID] [int] NULL,
	[Description] [text] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_War_Story] PRIMARY KEY CLUSTERED 
(
	[WarStoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_War_Story_Tags]    Script Date: 01-Sep-20 7:48:27 PM ******/
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
/****** Object:  Table [dbo].[tbl_Wars]    Script Date: 01-Sep-20 7:48:27 PM ******/
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
