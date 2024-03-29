USE [master]
GO
/****** Object:  Database [EBay]    Script Date: 08/02/2011 16:29:49 ******/
CREATE DATABASE [EBay] ON  PRIMARY 
( NAME = N'EBay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EBay.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EBay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EBay_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EBay] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EBay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EBay] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [EBay] SET ANSI_NULLS OFF
GO
ALTER DATABASE [EBay] SET ANSI_PADDING OFF
GO
ALTER DATABASE [EBay] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [EBay] SET ARITHABORT OFF
GO
ALTER DATABASE [EBay] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [EBay] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [EBay] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [EBay] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [EBay] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [EBay] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [EBay] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [EBay] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [EBay] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [EBay] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [EBay] SET  DISABLE_BROKER
GO
ALTER DATABASE [EBay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [EBay] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [EBay] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [EBay] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [EBay] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [EBay] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [EBay] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [EBay] SET  READ_WRITE
GO
ALTER DATABASE [EBay] SET RECOVERY FULL
GO
ALTER DATABASE [EBay] SET  MULTI_USER
GO
ALTER DATABASE [EBay] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [EBay] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'EBay', N'ON'
GO
USE [EBay]
GO
/****** Object:  StoredProcedure [dbo].[Testing]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Testing]
    @StudentID int
as
    
begin
    select Topic_ID_pk_bi, Topic_Name_vc, Topic_Description_t 
    from EBay_Topic
    where Studen_ID_fk_bi = @StudentID;
end;
GO
/****** Object:  Table [dbo].[Ebay_Ticker]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ebay_Ticker](
	[Ticker_ID_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[DateTime_sdt] [smalldatetime] NOT NULL,
	[isVisible_b] [bit] NOT NULL,
	[Ticker_text] [text] NOT NULL,
 CONSTRAINT [PK_Ebay_Ticker] PRIMARY KEY CLUSTERED 
(
	[Ticker_ID_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ebay_Ticker] ON
INSERT [dbo].[Ebay_Ticker] ([Ticker_ID_bi], [DateTime_sdt], [isVisible_b], [Ticker_text]) VALUES (1, CAST(0x9EEA04B0 AS SmallDateTime), 1, N'malli raava neeve malli raava nee oopire nne')
INSERT [dbo].[Ebay_Ticker] ([Ticker_ID_bi], [DateTime_sdt], [isVisible_b], [Ticker_text]) VALUES (2, CAST(0x9EEA04B0 AS SmallDateTime), 1, N'omg wahst is this')
INSERT [dbo].[Ebay_Ticker] ([Ticker_ID_bi], [DateTime_sdt], [isVisible_b], [Ticker_text]) VALUES (3, CAST(0x9EEA04B1 AS SmallDateTime), 1, N'this is gonna overturn DC')
INSERT [dbo].[Ebay_Ticker] ([Ticker_ID_bi], [DateTime_sdt], [isVisible_b], [Ticker_text]) VALUES (4, CAST(0x9EEA04B9 AS SmallDateTime), 1, N'is it plzz dont say that I dont want ammamma to struggle')
SET IDENTITY_INSERT [dbo].[Ebay_Ticker] OFF
/****** Object:  Table [dbo].[EBay_TempStudent]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EBay_TempStudent](
	[Student_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[Username_vc] [varchar](35) NOT NULL,
	[Password_vc] [varchar](32) NOT NULL,
	[Student_Name_vc] [varchar](30) NOT NULL,
	[IsAdmin_bool] [bit] NOT NULL,
	[Hostel_nc] [nchar](4) NOT NULL,
	[BITS_ID_vc] [char](12) NOT NULL,
	[Room_No_nc] [nchar](3) NOT NULL,
	[Phone_No_vc] [nchar](10) NULL,
	[PhotoURL] [varchar](50) NULL,
	[Signup_Time_sdt] [smalldatetime] NOT NULL,
	[SecurityKey_nc] [nchar](30) NOT NULL,
	[ItemsCloud_vc] [varchar](150) NULL,
	[StudentsCloud_vc] [varchar](150) NULL,
 CONSTRAINT [PK_EBay_TempStudent] PRIMARY KEY CLUSTERED 
(
	[Student_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EBay_TempStudent] ON
INSERT [dbo].[EBay_TempStudent] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Signup_Time_sdt], [SecurityKey_nc], [ItemsCloud_vc], [StudentsCloud_vc]) VALUES (500, N'ishansaxena2021@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', N'ishan', 0, N'AH 4', N'2009a7ps084g', N'342', N'9049853452', N'default.jpg', CAST(0x9EE4004F AS SmallDateTime), N'KQTCKGVRWANTJSKKPGGWHXWKFTKAMW', N'', N'')
SET IDENTITY_INSERT [dbo].[EBay_TempStudent] OFF
/****** Object:  Table [dbo].[EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EBay_Student](
	[Student_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[Username_vc] [varchar](35) NULL,
	[Password_vc] [varchar](32) NOT NULL,
	[Student_Name_vc] [varchar](30) NOT NULL,
	[IsAdmin_bool] [bit] NOT NULL,
	[Hostel_nc] [nchar](4) NOT NULL,
	[BITS_ID_vc] [char](12) NOT NULL,
	[Room_No_nc] [nchar](3) NOT NULL,
	[Phone_No_vc] [nchar](10) NULL,
	[PhotoURL] [varchar](50) NULL,
	[Last_Login_Time_sdt] [smalldatetime] NULL,
	[Signup_Time_sdt] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EBay_Student] PRIMARY KEY CLUSTERED 
(
	[Student_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EBay_Student] ON
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (1, N'Nithanaroy@gmail.com', N'94a21e06f4a0609c7b87cac9f4873a3c', N'Nitin Pasumarthy', 1, N'CH 1', N'2008B3A7567G', N'330', N'9049268835', N'2008B3A7567G.jpg', NULL, CAST(0x9EC90322 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (3, N'7000puli@gmail.com', N'7979ea25f4a2875a4a72b1b0fe632438', N'NagaRaju B', 0, N'AH 2', N'2008A7PS084G', N'255', N'9975570406', N'2008A7PS084G.jpg', NULL, CAST(0x9EC90429 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (4, N'saket9999@gmail.com', N'52a1d3e0182cbbf406bbe9d24994bcf0', N'Saket', 1, N'AH 1', N'2008A7PS094G', N'151', N'9049268877', N'2008A7PS094G.jpg', NULL, CAST(0x9EC9054B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (5, N'naren596@gmail.com', N'03f323d6ab38fae75a1dc8a36219adc4', N'Narendra Kunapareddy', 1, N'AH 2', N'2008B3A7596G', N'304', N'9765763023', N'2008B3A7596G.jpg', NULL, CAST(0x9ECA0373 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (6, N'rakesh.kumarbits@gmail.com', N'6513c3cf7be338a7e1a536c38d5ec043', N'Bablu Kumar', 0, N'CH 6', N'2000a1ps000g', N'168', N'9860931546', N'2000a1ps000g.jpg', NULL, CAST(0x9ECA041C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (7, N'raghuveer553@gmail.com', N'ac604da87c4879cd5eb151940c7c8deb', N'Madala Naveen Raghuveer', 0, N'AH 2', N'2008C6PS640G', N'243', N'9561745878', N'2008C6PS640G.jpg', NULL, CAST(0x9ECA055D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (9, N'ch.sheethal@gmail.com', N'5ff88d1310e0285e1ee87930672d22bf', N'shiva sheethal', 0, N'AH 2', N'2008a7ps112g', N'213', N'9049629448', N'2008a7ps112g.jpg', NULL, CAST(0x9ECB02CC AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (10, N'gvrocksnow@gmail.com', N'90bf3c9477bf96036dac7b56991cf88c', N'GVSS Pavan Kumar', 0, N'AH 1', N'2008A4PS122G', N'123', N'9049629761', N'2008A4PS122G.jpg', NULL, CAST(0x9ECB02F5 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (11, N'dhashrath@gmail.com', N'0a512cb2fec528a1dddc07aefcb38bd7', N'Dhashrath', 0, N'CH 1', N'2007A7B1074G', N'210', N'9637013773', N'2007A7B1074G.jpg', NULL, CAST(0x9ECB033F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (12, N'f2007584@bits-goa.ac.in', N'e6c6a9b33685ce018c679a892cf7ecc2', N'Himanshu Yadav', 0, N'CH 1', N'2007B4A8584G', N'382', N'9823631623', N'2007B4A8584G.jpg', NULL, CAST(0x9ECB0348 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (13, N'adityagoing@gmail.com', N'c4156486bf88982301a7e86243f62064', N'Aditya Agarwal', 0, N'AH 6', N'2008A1PS240G', N'262', N'9765580434', N'2008A1PS240G.jpg', NULL, CAST(0x9ECB0379 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (14, N'addittya@gmail.com', N'172346606e1d24062e891d537e917a90', N'Aditya Bhansali', 0, N'CH 1', N'2007C6PS488G', N'362', N'9326514334', N'2007C6PS488G.jpg', NULL, CAST(0x9ECB039D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (15, N'f2009599@bits-goa.ac.in', N'ccb386df1177c240e49132d92def17cb', N'Debanjum Singh Solanky', 0, N'AH 3', N'2009B4A8599G', N'358', N'8888312783', N'2009B4A8599G.jpg', NULL, CAST(0x9ECB03A0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (16, N'mehul.agarwal20@gmail.com', N'e6c6a9b33685ce018c679a892cf7ecc2', N'Mehul Agarwal', 0, N'AH 2', N'2008A8PS242G', N'132', N'9730597534', N'2008A8PS242G.jpg', NULL, CAST(0x9ECB03AB AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (17, N'srbhatia10@yahoo.com', N'f29a0ecbd9e622502f89b291b1ec9c69', N'Saurabh Bhatia', 0, N'AH 8', N'2010a3ps099g', N'346', N'9158583276', N'2010a3ps099g.jpg', NULL, CAST(0x9ECB03B8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (18, N'sasidharevuru@gmail.com', N'810542d4e33044e962ea1ff069e6ce0f', N'sasidhar', 0, N'AH 1', N'2008a7ps064g', N'111', N'8983867545', N'2008a7ps064g.jpg', NULL, CAST(0x9ECB0414 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (19, N'f2008441@bits-goa.ac.in', N'842181890290246f02acb533a0f61e37', N'Smarjeet', 0, N'AH 1', N'2008A3PS441G', N'252', N'9049268989', N'2008A3PS441G.jpg', NULL, CAST(0x9ECB042C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (20, N'saurabh.bitsg@gmail.com', N'e6c6a9b33685ce018c679a892cf7ecc2', N'Saurabh,  266', 0, N'CH 1', N'2007B1A4474G', N'266', N'9923044315', N'2007B1A4474G.jpg', NULL, CAST(0x9ECB048F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (21, N'f2008232@bits-goa.ac.in', N'c646a37a8a16ce841a8232a1e3ceceb5', N'Aditya Sood', 0, N'AH 1', N'2008A3PS232G', N'103', N'9423504039', N'2008A3PS232G.jpg', NULL, CAST(0x9ECB0494 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (22, N'vemulaneelesh@gmail.com', N'ae7a14591aaf8d474cdb3f92111c923e', N'Neelesh', 0, N'CH 1', N'2007A7PS120G', N'333', N'8105568977', N'2007A7PS120G.jpg', NULL, CAST(0x9ECB04E1 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (23, N'chandan.aditya@gmail.com', N'c255cced3b7f2436b2ccf45163ec236c', N'aditya narayan patra', 0, N'CH 2', N'2010h140021g', N'123', N'9975566801', N'2010h140021g.jpg', NULL, CAST(0x9ECB04EC AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (24, N'gauravnarra@gmail.com', N'eca047c67bb2dd313e3f5033dee08b41', N'N Gaurav Reddy', 0, N'AH 7', N'2010A7PS165G', N'364', N'9975570554', N'2010A7PS165G.jpg', NULL, CAST(0x9ECB04ED AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (25, N'goel.rajat.12@gmail.com', N'4a15b677c3fcd87b6c3b838f55ecc62d', N'Rajat Goel', 0, N'CH 1', N'2007A8PS260G', N'301', N'7875815526', N'2007A8PS260G.jpg', NULL, CAST(0x9ECB0526 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (26, N'deepanshumehndiratta@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Deepanshu Mehndiratta', 0, N'CH 3', N'2010A1PS455G', N'301', N'9637803686', N'2010A1PS455G.jpg', NULL, CAST(0x9ECB0544 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (27, N'sharan1130@gmail.com', N'b148832eaa443516f01bfd96fe5802e5', N'sharan biradar', 0, N'AH 8', N'2010a8ps261g', N'146', N'0898386102', N'2010a8ps261g.jpg', NULL, CAST(0x9ECB057D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (28, N'gobar@mailinator.com', N'dd897bf8dc0dfc0806856d604c789332', N'gobardhan', 0, N'AH 1', N'2008b1c6002g', N'999', N'9876543212', N'2008b1c6002g.jpg', NULL, CAST(0x9ECB059E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (29, N'yunus157@gmail.com', N'44e50f779e83bfbd51acf855353ac5e8', N'Yunus Akhtar', 0, N'CH 1', N'2007A3PS157G', N'209', N'9420819310', N'2007A3PS157G.jpg', NULL, CAST(0x9ECC0019 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (30, N'nikhilkhicha@gmail.com', N'b18d6b8fc4d3d2308b023877dd02e48b', N'Nikhil Khicha', 0, N'AH 7', N'2010A4PS182G', N'248', N'8888312788', N'2010A4PS182G.jpg', NULL, CAST(0x9ECC002B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (31, N'kisan_patro786@yahoo.com', N'fb0dbd3051227208e0c7362d1bd714af', N'Kisan', 0, N'AH 6', N'2008a4ps394g', N'136', N'9049269025', N'2008a4ps394g.jpg', NULL, CAST(0x9ECC003C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (32, N'raviyogesh@gmail.com', N'd08277b05e05caeda2bf75747726e937', N'Ravi', 0, N'CH 3', N'2006B2A4474G', N'334', N'8149189342', N'2006B2A4474G.jpg', NULL, CAST(0x9ECC0041 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (33, N'Brisingr.Y@gmail.com', N'0818aff6dc848d34fd3237bbf8e5db8f', N'Nishanth Reddy', 0, N'AH 2', N'2008A1PS470G', N'325', N'9618160074', N'2008A1PS470G.jpg', NULL, CAST(0x9ECC0047 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (34, N'raj.varma98@yahoo.com', N'fb01a15918614106f25a30ce34c00555', N'rajendra ', 0, N'AH 2', N'2008A7PS066G', N'333', N'9049442472', N'2008A7PS066G.jpg', NULL, CAST(0x9ECC0048 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (35, N'thelonestrider@gmail.com', N'7c8aadbe8a8de8b09f93b784c9b6215b', N'Charith Kandala', 0, N'AH 3', N'2009A1PS502G', N'261', N'9637244331', N'2009A1PS502G.jpg', NULL, CAST(0x9ECC004A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (36, N'sunkara.sriteja@gmail.com', N'6eea9b7ef19179a06954edd0f6c05ceb', N'teja', 0, N'AH 2', N'2008a3ps099g', N'205', N'9657295754', N'2008a3ps099g.jpg', NULL, CAST(0x9ECC004D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (37, N'neo.dcm@gmail.com', N'7d94f2c17ddfe614c3d0c95168106c6b', N'Chinmay Deshpande', 0, N'AH 2', N'2008A8PS291G', N'306', N'9850886276', N'2008A8PS291G.jpg', NULL, CAST(0x9ECC0052 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (38, N'vkvijaykrishn@gmail.com', N'77e54faf6770fa1ceb557b079f152f20', N'vijay krishn', 0, N'AH 3', N'2009a8ps271g', N'229', N'9960074555', N'2009a8ps271g.jpg', NULL, CAST(0x9ECC0055 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (39, N'satyadeepak1692@gmail.com', N'5e31f2fdb59edcbbf8bd0eb6cab53367', N'satyadeepak Av', 0, N'AH 3', N'2009a8ps266g', N'324', N'9637244245', N'2009a8ps266g.jpg', NULL, CAST(0x9ECC0055 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (40, N'f2010586@bits-goa.ac.in', N'd36f4a419688139e3c1834b5874e6829', N'Chirag Jain', 0, N'AH 8', N'2010B3PS586G', N'218', N'9158537149', N'2010B3PS586G.jpg', NULL, CAST(0x9ECC0056 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (41, N'akshat_simba@yahoo.co.in', N'ef15d8edd00a6960c9c16937cbf14212', N'Akshat ', 0, N'AH 5', N'2009A4PS332G', N'310', N'9158058019', N'2009A4PS332G.jpg', NULL, CAST(0x9ECC0059 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (42, N'uttej.vinny@gmail.com', N'c09d2644aa265a0b675c380b14fe0922', N'Uttej', 0, N'AH 2', N'2008C6PS650G', N'150', N'9049629768', N'2008C6PS650G.jpg', NULL, CAST(0x9ECC005A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (43, N'f2008703@bits-goa.ac.in', N'6d25a9490f75641c3b6d06410e4a86df', N'PABBA PHANINDRA BABU', 0, N'AH 2', N'2008B1A8703G', N'124', N'9860343763', N'2008B1A8703G.jpg', NULL, CAST(0x9ECC005B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (44, N'anchit008@gmail.com', N'6478b0688ed1862fc6112cf2e66318df', N'Anchit Agarwal', 0, N'CH 3', N'2010C6PS008G', N'233', N'9545393869', N'2010C6PS008G.jpg', NULL, CAST(0x9ECC005B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (45, N'srajesh42@gmail.com', N'e8caa0d265731b98da8c4f18b194c8a1', N'Rajesh Somavarapu', 0, N'CH 1', N'2007C6PS535G', N'332', N'8600308175', N'2007C6PS535G.jpg', NULL, CAST(0x9ECC005C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (46, N'adi.mdkk@gmail.com', N'd5c7abb7f0c7f878f1ddc6dadcbbf0c2', N'ATUL', 0, N'CH 3', N'2010A4PS024G', N'318', N'9545970851', N'2010A4PS024G.jpg', NULL, CAST(0x9ECC005C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (47, N'sudeepgupta412@gmail.com', N'975ecb719692fa2bc7255b0c2dd2f3a4', N'Sudeep Gupta', 0, N'AH 4', N'2009B1A3663G', N'241', N'9766300508', N'2009B1A3663G.jpg', NULL, CAST(0x9ECC005E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (48, N'asheshkaushik@gmail.com', N'7345435cb9796277eae15236643f257e', N'Ashesh Kaushik', 0, N'AH 4', N'2009B3A3466G', N'250', N'9503817733', N'2009B3A3466G.jpg', NULL, CAST(0x9ECC005E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (49, N'f2009139@bits-goa.ac.in', N'eba56f903da3a3de57405284dae6e63e', N'Vipul Pandey', 0, N'AH 4', N'2009a7ps139g', N'330', N'9637423519', N'2009a7ps139g.jpg', NULL, CAST(0x9ECC005E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (50, N'vermaprakhar@rocketmail.com', N'5622c4d69d3448981fdb6f9d850e1543', N'Prakhar', 0, N'AH 5', N'2010A8PS551G', N'128', N'7276771628', N'2010A8PS551G.jpg', NULL, CAST(0x9ECC005F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (51, N'akshatagha@gmail.com', N'1eb12c40288931a1dcd880b5342938ef', N'Akshat Agha', 0, N'AH 4', N'2009A4PS380g', N'336', N'9665543322', N'2009A4PS380g.jpg', NULL, CAST(0x9ECC0060 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (52, N'saketh.ganti@gmail.com', N'd7dbbff71bbc15641c72120001c63f8c', N'Saketh ', 0, N'AH 2', N'2008A3PS189G', N'356', N'9049268861', N'2008A3PS189G.jpg', NULL, CAST(0x9ECC0062 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (53, N'f2008543@bits-goa.ac.in', N'cc914e96b7c089867bb56283ced2c8c2', N'Bharath', 0, N'AH 2', N'2008B5A4543G', N'103', N'7276776916', N'2008B5A4543G.jpg', NULL, CAST(0x9ECC0063 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (54, N'f2008095@bits-goa.ac.in', N'13407a1a262f614a8e3f07c41c3aa873', N'Abhijit', 0, N'AH 6', N'2008A7PS095G', N'313', N'9545327515', N'2008A7PS095G.jpg', NULL, CAST(0x9ECC0063 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (55, N'rohit.vijayvargiya@gmail.com', N'1816d319d3d55598f8fcbc1f4f90fe64', N'rohit', 0, N'AH 7', N'2010a1ps356g', N'356', N'9923487871', N'2010a1ps356g.jpg', NULL, CAST(0x9ECC0066 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (56, N'sandeepkandukoori063@gmail.com', N'31616d0a493c1326cc0ee4ba595d4b4a', N'sandeep kumar', 0, N'AH 6', N'2008a3ps063g', N'121', N'9850556583', N'2008a3ps063g.jpg', NULL, CAST(0x9ECC0066 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (57, N'anishbarjatya@gmail.com', N'890c2be857c94c08bf70ca5e5211f090', N'ANISH BARJATYA', 0, N'AH 2', N'2008B1A8671G', N'116', N'9049268884', N'2008B1A8671G.jpg', NULL, CAST(0x9ECC0066 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (58, N'prudhviraj019@gmail.com', N'7b0391feb2e0cd271f1cf39aafb4376f', N'Prudhvi Raj', 0, N'AH 1', N'2008A7PS019G', N'336', N'9049080891', N'2008A7PS019G.jpg', NULL, CAST(0x9ECC0068 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (59, N'btetarbe@gmail.com', N'08ad7f7e3b0948a6883d20597813c8a0', N'Bhaskar Tetarbe', 0, N'AH 7', N'2010A8PS278G', N'348', N'7709003118', N'2010A8PS278G.jpg', NULL, CAST(0x9ECC0068 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (60, N'prudhviraj367@gmail.com', N'f7c5228e97cfddae1d8ccd56f03ff978', N'prudhviraj', 0, N'AH 6', N'2008a1ps904g', N'337', N'9823331701', N'2008a1ps904g.jpg', NULL, CAST(0x9ECC0069 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (61, N'adsugandhi@gmail.com', N'54845f992c767783b705b5bf85766768', N'Anurag Sugandhi', 0, N'AH 5', N'2009a4ps704g', N'219', N'8055945753', N'2009a4ps704g.jpg', NULL, CAST(0x9ECC0069 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (62, N'kat479@gmail.com', N'd145a0ce82a54b8160d32ad65b63cd0a', N'Sampath Karthik', 0, N'AH 1', N'2008A4PS160G', N'221', N'9923950341', N'2008A4PS160G.jpg', NULL, CAST(0x9ECC006D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (63, N'n.paul.1424@gmail.com', N'838ff7383b5c29148b85443f283a6656', N'Nishanth Paul', 0, N'AH 7', N'2010A4PS039G', N'251', N'8888818014', N'2010A4PS039G.jpg', NULL, CAST(0x9ECC006E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (64, N'rdhvma007@gmail.com', N'5e113f90fd2cd9a7ee3e813138de4aed', N'Harish', 0, N'AH 8', N'2010A4PS214G', N'303', N'7276771584', N'2010A4PS214G.jpg', NULL, CAST(0x9ECC0070 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (65, N'kirans.bharadwaj.569@gmail.com', N'b6e84b4c52f8a0e89580f717d40adfc8', N'kiran s bharadwaj', 0, N'CH 2', N'2007b5a3569g', N'324', N'9096869503', N'2007b5a3569g.jpg', NULL, CAST(0x9ECC0072 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (66, N'sandyprime@gmail.com', N'53ec1bd11ba820716665bc8f24d04613', N'SANDEEP M S ', 0, N'AH 3', N'2009a3ps110g', N'317', N'9552435402', N'2009a3ps110g.jpg', NULL, CAST(0x9ECC0077 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (67, N'mjrockie@gmail.com', N'e691cb702f5d25642aa87009ef1948f8', N'Mayank jain', 0, N'AH 8', N'2010a1ps481g', N'339', N'9158322142', N'2010a1ps481g.jpg', NULL, CAST(0x9ECC0077 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (68, N'rchoubey322@gmail.com', N'fc001c21054817384c39e23c03febdd5', N'Raghav Choubey', 0, N'AH 6', N'2008B3A7618G', N'322', N'9049268784', N'2008B3A7618G.jpg', NULL, CAST(0x9ECC0078 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (69, N'vinay0003@gmail.com', N'b3f93818866cc377084460b3f17c2c51', N'N Vinay Kumar', 0, N'CH 1', N'2007A1PS456G', N'316', N'9011183507', N'2007A1PS456G.jpg', NULL, CAST(0x9ECC007E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (70, N'yvk333@gmail.com', N'ac166d5a2d69b3a87d5bd0ee19508eec', N'vamsikrishna', 0, N'AH 3', N'2009A3PS185G', N'333', N'9637244236', N'2009A3PS185G.jpg', NULL, CAST(0x9ECC0080 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (71, N'jaybhukhanwala@gmail.com', N'9682b07a0114c5a53ad671c04f2301e4', N'Jay', 0, N'AH 1', N'2008A3PS043G', N'107', N'9049629778', N'2008A3PS043G.jpg', NULL, CAST(0x9ECC0080 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (72, N'pjaswanthreddy@gmail.com', N'b4a6979cad400cd1163bafcda05c0478', N'Jaswanth Reddy', 0, N'AH 8', N'2010b4ps467g', N'359', N'9975566036', N'2010b4ps467g.jpg', NULL, CAST(0x9ECC0086 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (73, N'jyoth2sagar@gmail.com', N'2d4fdc4afbabd62bae178720c6e125ad', N'JyothKumar', 0, N'AH 1', N'2008A3PS204G', N'236', N'9049269049', N'2008A3PS204G.jpg', NULL, CAST(0x9ECC0087 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (74, N'tvss93@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'tvss pavan kumar', 0, N'AH 7', N'2010a8ps292g', N'302', N'9730597691', N'2010a8ps292g.jpg', NULL, CAST(0x9ECC0087 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (75, N'chandrahas.muvvala@gmail.com', N'49412d54932d9259e26996f43f71f744', N'Chandrahas M', 0, N'CH 3', N'2010B1PS593G', N'111', N'8888312947', N'2010B1PS593G.jpg', NULL, CAST(0x9ECC0088 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (76, N'ninmander@gmail.com', N'2e2020844dcce6e66cf411c53f6ead62', N'Ninad', 0, N'CH 3', N'2010A8PS322G', N'121', N'8888312943', N'2010A8PS322G.jpg', NULL, CAST(0x9ECC008B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (77, N'shubham.brainy@gmail.com', N'3b6beb51e76816e632a40d440eab0097', N'Shubham', 0, N'AH 2', N'2008A3PS069G', N'240', N'9503817804', N'2008A3PS069G.jpg', NULL, CAST(0x9ECC008F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (78, N'aditya061111991@gmail.com', N'd965fd45d0ab74878984894231b24e46', N'aditya prakash', 0, N'AH 5', N'2009a8ps308g', N'140', N'9326111380', N'2009a8ps308g.jpg', NULL, CAST(0x9ECC009E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (79, N'ajayg594@gmail.com', N'20e39dedcce7c9bc92a0d96302ea0c14', N'ajay kumar gaddam', 0, N'AH 3', N'2009C6PS594G', N'330', N'9637423633', N'2009C6PS594G.jpg', NULL, CAST(0x9ECC009F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (80, N'h2009040@bits-goa.ac.in', N'd119a610c830cbdda0a22df20930693d', N'Ajit  kohir', 0, N'CH 6', N'2009H112040G', N'268', N'9552520018', N'2009H112040G.jpg', NULL, CAST(0x9ECC00A8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (81, N'f2006637@bits-goa.ac.in', N'886f170ef569df7f0306a5644cec0616', N'T Narendra Kumar Reddy', 0, N'CH 3', N'2006B1A4637G', N'102', N'8390048661', N'2006B1A4637G.jpg', NULL, CAST(0x9ECC00AA AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (82, N'bravo.achillies@gmail.com', N'fd9ab41e47a9ef4f6477a8a000bf404f', N'ARJUN MOHAN', 0, N'AH 2', N'2008A4PS269G', N'142', N'9765663530', N'2008A4PS269G.jpg', NULL, CAST(0x9ECC00AD AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (83, N'waghamode.prathamesh@gmail.com', N'bccfe335322c911c98d870db24ff5fad', N'Prathamesh Waghamode', 0, N'AH 5', N'2009C6PS392G', N'335', N'7588587981', N'2009C6PS392G.jpg', NULL, CAST(0x9ECC00B6 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (84, N'kc0811@gmail.com', N'38b5c00bc4a90ed1652be1394a144e13', N'KRISHNA CHAITHANYA', 0, N'AH 3', N'2009B5A8546G', N'307', N'0966591053', N'2009B5A8546G.jpg', NULL, CAST(0x9ECC00BD AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (85, N'abhinav1990@gmail.com', N'9621584deced392d996662dfffebf097', N'Abhinav', 0, N'AH 1', N'F2008A3PS42G', N'250', N'9049629750', N'F2008A3PS42G.jpg', NULL, CAST(0x9ECC00C4 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (86, N'nisheethnimmagadda@gmail.com', N'97bbf82c1d499d015e109b4a1066471d', N'Nisheeth', 0, N'AH 2', N'2008B1A4687G', N'227', N'8983865571', N'2008B1A4687G.jpg', NULL, CAST(0x9ECC0183 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (87, N'harsha.92rockon@gmail.com', N'4fd117162d0f50210d502915d8a2770b', N'Harsha', 0, N'AH 3', N'2009B4A1530G', N'222', N'8928167043', N'2009B4A1530G.jpg', NULL, CAST(0x9ECC01C1 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (88, N'marwaha.sajal@gmail.com', N'777ea022ff5b22500333546dde41a1a7', N'Sajal Marwaha', 0, N'CH 3', N'2010A7PS049G', N'325', N'9975570603', N'2010A7PS049G.jpg', NULL, CAST(0x9ECC022F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (89, N'mail2venkat.prasad@gmail.com', N'654a660db792bb595d4d6913788cb390', N'venkat', 0, N'CH 3', N'2010A1PS412G', N'316', N'9096190867', N'2010A1PS412G.jpg', NULL, CAST(0x9ECC0241 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (90, N'vmk.mohankrishna@gmail.com', N'9b1ece06c282232813e534c294be634b', N'mohan krishna', 0, N'CH 2', N'2007a8ps254g', N'202', N'9823606694', N'2007a8ps254g.jpg', NULL, CAST(0x9ECC025D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (91, N'djnghtcrwlr@gmail.com', N'a4772b35593e0cb5a13a0cb39a68ebcb', N'Vamsi ram chavali', 0, N'CH 1', N'2007B1A8490G', N'232', N'9923044037', N'2007B1A8490G.jpg', NULL, CAST(0x9ECC0263 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (92, N'admin@shiladityamandal.co.cc', N'9cab6eefa5182ff575dfe9d9e78216e7', N'shiladitya', 0, N'AH 7', N'2010c6ps632g', N'309', N'9561989755', N'2010c6ps632g.jpg', NULL, CAST(0x9ECC026A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (93, N'mj.ekomek@gmail.com', N'aa56fc15ece62514e8a66d00123b66c7', N'Mohit J', 0, N'AH 6', N'2008B3A4496G', N'234', N'9049268790', N'2008B3A4496G.jpg', NULL, CAST(0x9ECC0318 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (94, N'abhiabhirpanzer@gmail.com', N'd9d50b33432e5585433a10d3282305cb', N'Abhishek Ravi', 0, N'AH 1', N'2008A4PS056G', N'254', N'9850576914', N'2008A4PS056G.jpg', NULL, CAST(0x9ECC033A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (95, N'rithinreddyk@gmail.com', N'115fae11ed93372b22bd1bb8eb25831b', N'Rithin', 0, N'AH 8', N'2010A8PS336g', N'306', N'8983863393', N'2010A8PS336g.jpg', NULL, CAST(0x9ECC0344 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (96, N'adarshnb@gmail.com', N'703c1764f2fcc143e82430acdfff85d3', N'Adarsh', 0, N'AH 2', N'2008B1A8673G', N'309', N'9975102346', N'2008B1A8673G.jpg', NULL, CAST(0x9ECC0347 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (97, N'aditya.warrior1989@gmail.com', N'6508271553a7d8367d239e2624316bd0', N'aditya', 0, N'AH 2', N'2008b3a1628g', N'136', N'9503439296', N'2008b3a1628g.jpg', NULL, CAST(0x9ECC0361 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (98, N'priyalmht3@gmail.com', N'6609ff57b26ac81c292be239e90bdc46', N'Priyal Mehta', 0, N'AH 4', N'2009A3PS170G', N'140', N'9637244380', N'2009A3PS170G.jpg', NULL, CAST(0x9ECC0361 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (99, N'anand.prateek18@gmail.com', N'cc3460fbdf75c9693566146e53f5c922', N'prateek anand', 0, N'AH 3', N'2009a8ps355g', N'113', N'9552435342', N'2009a8ps355g.jpg', NULL, CAST(0x9ECC0377 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (100, N'kashh03@gmail.com', N'1f59dab9a5a9409681259165c1eb87f7', N'kashish', 0, N'AH 3', N'2009a7ps169g', N'237', N'9657272621', N'2009a7ps169g.jpg', NULL, CAST(0x9ECC0382 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (101, N'shivangi25@gmail.com', N'188fc85dbb6730f701322d3e9836cc29', N'Shivangi Singh', 0, N'CH 4', N'2008C6PS510G', N'160', N'9960624041', N'2008C6PS510G.jpg', NULL, CAST(0x9ECC038B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (102, N'budhi15@yahoo.co.in', N'd6a5b6136b56e10a6da16a6651d5ee70', N'Pulkit Budhiraja', 0, N'CH 1', N'2007B1A7475G', N'261', N'9923600221', N'2007B1A7475G.jpg', NULL, CAST(0x9ECC0398 AS SmallDateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (103, N'bkaushik14@gmail.com', N'6a80f05abb330d1f1bb963fcd947b7d2', N'Kaushik B', 0, N'AH 2', N'2008A3PS211G', N'102', N'9561939654', N'2008A3PS211G.jpg', NULL, CAST(0x9ECC039F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (104, N'f2008118@bits-goa.ac.in', N'4f885c27ebed7954713ffb2652bee073', N'Nikhil Collooru', 0, N'AH 1', N'2008A7PS118G', N'211', N'9049268865', N'2008A7PS118G.jpg', NULL, CAST(0x9ECC03B7 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (105, N'ishwark7@gmail.com', N'1a1ffb364c8132ef1d3911252de2cea3', N'Ishwar', 0, N'AH 6', N'2008B3A7300G', N'321', N'9766860106', N'2008B3A7300G.jpg', NULL, CAST(0x9ECC03C4 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (106, N'nirmal9833@gmail.com', N'4a98b2f1a233f53a67c17995ee7f1755', N'Nirmal', 0, N'CH 1', N'2007b1a3477g', N'239', N'9921860418', N'2007b1a3477g.jpg', NULL, CAST(0x9ECC03E3 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (107, N'udaybhaskar1729@gmail.com', N'6eea9b7ef19179a06954edd0f6c05ceb', N'uday', 0, N'CH 1', N'2007a3ps140g', N'223', N'9049158398', N'2007a3ps140g.jpg', NULL, CAST(0x9ECC03E4 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (108, N'yhcscsk@gmail.com', N'56ebcbfee4b0d836008b8a8aa6aa96f2', N'srikanth ', 0, N'AH 3', N'2009c6ps426g', N'316', N'8928087583', N'2009c6ps426g.jpg', NULL, CAST(0x9ECC03ED AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (109, N'f2009516@bits-goa.ac.in', N'eab7c169c851f1462a140448a299d8a6', N'Siddharth Gupta', 0, N'AH 5', N'2009B4A7516G', N'223', N'9561957487', N'2009B4A7516G.jpg', NULL, CAST(0x9ECC03F6 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (110, N'sandyjuventus@gmail.com', N'3bf2ed99f42d5f162f3a9aa14d176d48', N'Sandeep', 0, N'CH 2', N'2007A4PS360G', N'113', N'9960359225', N'2007A4PS360G.jpg', NULL, CAST(0x9ECC040B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (111, N'nayak.saurabh26@gmail.com', N'2979184c8f6d04b96d19167dcaad97ea', N'Saurabh Nayak', 0, N'AH 5', N'2009B3A4511G', N'203', N'8097136907', N'2009B3A4511G.jpg', NULL, CAST(0x9ECC0423 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (112, N'blbhura1@gmail.com', N'3d7f65f5dcc8ef953f7d9a06f2477cc4', N'Bajrang', 0, N'AH 2', N'2008A8PS309G', N'113', N'9765580432', N'2008A8PS309G.jpg', NULL, CAST(0x9ECC046A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (113, N'maheshgandham7@gmail.com', N'88f364787d362c5ab87176ff6246d075', N'Mahesh Gandham', 0, N'AH 1', N'2008A7PS012G', N'237', N'9637089657', N'2008A7PS012G.jpg', NULL, CAST(0x9ECC0474 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (114, N'ud_sun@hotmail.com', N'f398b69086c184f2be3d07afcfcfc7fe', N'Uday', 0, N'CH 2', N'2010H141029G', N'134', N'9766372964', N'2010H141029G.jpg', NULL, CAST(0x9ECC0497 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (115, N'anujasharan.0406@gmail.com', N'0af1bfcc2ff04cf833f25fb26fd2a5ce', N'anuja sharan', 0, N'CH 5', N'2010b4ps619g', N'263', N'9637087456', N'2010b4ps619g.jpg', NULL, CAST(0x9ECC04C4 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (116, N'revanth1990@gmail.com', N'af3daa4aec0baf7042ba083f5eed1a2f', N'Revanth', 0, N'AH 2', N'2008a3ps170g', N'303', N'9960512292', N'2008a3ps170g.jpg', NULL, CAST(0x9ECC04CF AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (117, N'navateja.nava@gmail.com', N'ee27b6fc03454503dc2926569b5cf026', N'nava teja tummalapalli', 0, N'AH 1', N'2008c6ps474g', N'251', N'9049629788', N'2008c6ps474g.jpg', NULL, CAST(0x9ECC04F1 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (118, N'kedar2020@gmail.com', N'f3d8b0618094107b7a1a2578b8956a59', N'Kedar', 0, N'AH 3', N'2009A4PS046G', N'107', N'9404000840', N'2009A4PS046G.jpg', NULL, CAST(0x9ECC04F9 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (119, N'jayrambhia777@gmail.com', N'a6e52e8f82db98fbb361ddd0e04c4c28', N'Jay Rambhia', 0, N'AH 7', N'2010A4PS059G', N'259', N'0996711968', N'2010A4PS059G.jpg', NULL, CAST(0x9ECC052C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (120, N'phanimanoj@gmail.com', N'ed9debb0c456c7e346998ee414fa50bb', N'Manoj', 0, N'AH 1', N'2008A7PS072G', N'333', N'9923412939', N'2008A7PS072G.jpg', NULL, CAST(0x9ECC054A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (121, N'arpit.phenom@gmail.com', N'3c90e3eb04dbe22ef749d2878787ef43', N'Arpit Gupta', 0, N'AH 5', N'2009a8ps177g', N'357', N'9096870069', N'2009a8ps177g.jpg', NULL, CAST(0x9ECC0571 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (122, N'ank.bits@gmail.com', N'd2cba5d68f4129cc2cf0de71e3c8b53b', N'Ankit Asati', 0, N'AH 1', N'2008B3A8600G', N'235', N'9960602566', N'2008B3A8600G.jpg', NULL, CAST(0x9ECC057B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (123, N'akanksha.bitsg@gmail.com', N'12a90f1ad8c2a237a740f5be36702396', N'Akanksha', 0, N'CH 5', N'2009B2A3304G', N'127', N'9503817692', N'2009B2A3304G.jpg', NULL, CAST(0x9ECC0586 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (124, N'anubhav.khanduja@gmail.com', N'9fc9d606912030dca86582ed62595cf7', N'Anubhav Khanduja', 0, N'AH 2', N'2008A7PS119G', N'135', N'9049629482', N'2008A7PS119G.jpg', NULL, CAST(0x9ECC058F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (125, N'mohit.bitsgoa@gmail.com', N'5bb76328808236e65e1deb2a75cfc882', N'Mohit Batra', 0, N'AH 2', N'2008A4PS238G', N'357', N'9049269059', N'2008A4PS238G.jpg', NULL, CAST(0x9ECC059A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (126, N'mehulgolwala2007@yahoo.co.in', N'e49f33c71c91ad2de8707482be9db1bf', N'Mehul ', 0, N'CH 2', N'2007A1PS428g', N'105', N'9960363883', N'2007A1PS428g.jpg', NULL, CAST(0x9ECC059F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (127, N'shreya.kedi@gmail.com', N'098fb756d063116902c3ad6eaa34f6b3', N'Shreya Kedia', 0, N'CH 5', N'2009A7PS215G', N'104', N'9503434757', N'2009A7PS215G.jpg', NULL, CAST(0x9ECD000D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (128, N'rachit.rana@gmail.com', N'1db2cd81f19741d67e4c7aef245a689e', N'Rachit Rana', 0, N'AH 2', N'2008A8PS226G', N'141', N'9049268787', N'2008A8PS226G.jpg', NULL, CAST(0x9ECD0016 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (129, N'arya69gates@gmail.com', N'9a7dc5b1084ea47cd7feab463e2181f5', N'ARYA', 0, N'AH 8', N'2010B4PS534G', N'326', N'0996756805', N'2010B4PS534G.jpg', NULL, CAST(0x9ECD0033 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (130, N'akshithrao@gmail.com', N'd3e2569e7347a3d61dee67ca8602784a', N'Akshith Rao', 0, N'AH 3', N'2009A4PS064G', N'112', N'9561713838', N'2009A4PS064G.jpg', NULL, CAST(0x9ECD0048 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (131, N'f2009221@bits-goa.ac.in', N'f1c5a2ca819652bdb3aba57475a2f514', N'MITESH', 0, N'AH 3', N'2009A3PS221G', N'334', N'9637423571', N'2009A3PS221G.jpg', NULL, CAST(0x9ECD0056 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (132, N'rkoemanoj@yahoo.co.in', N'd775f4e3d2c54ca78a66671ae6fdaf43', N'Manoj Kartik', 0, N'CH 1', N'2007A8PS250G', N'366', N'9822837062', N'2007A8PS250G.jpg', NULL, CAST(0x9ECD0062 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (133, N'tarinbansal@gmail.com', N'9a4fa35801d6dc77cda0843a44e2f759', N'Tarin Bansal', 0, N'AH 6', N'2008A8PS314G', N'111', N'9049269036', N'2008A8PS314G.jpg', NULL, CAST(0x9ECD00EA AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (134, N'rachit.k24@gmail.com', N'b53f57e1e80dd2baffc248bc85f5a79f', N'Rachit', 0, N'AH 5', N'2009b5a8543g', N'116', N'9673712939', N'2009b5a8543g.jpg', NULL, CAST(0x9ECD0269 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (135, N'vishnu.a009@gmail.com', N'f4843f082dfa143ff26c814c95fc0da0', N'Venkateswaran A', 0, N'AH 1', N'2008A3PS248G', N'142', N'9049654259', N'2008A3PS248G.jpg', NULL, CAST(0x9ECD0274 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (136, N'nikunj.bitsg@gmail.com', N'0222ee0bf8adf01e576b14ca1670a42f', N'Nikunj Jethava', 0, N'CH 1', N'2007A3PS149G', N'368', N'8904652296', N'2007A3PS149G.jpg', NULL, CAST(0x9ECD02AC AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (137, N'yashvardhanchoudhury@gmail.com', N'423b7e71697baf69872c1b2ab42c34d4', N'Yash Vardhan Choudhury', 0, N'AH 5', N'2010B1PS636G', N'344', N'9561930278', N'2010B1PS636G.jpg', NULL, CAST(0x9ECD031D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (138, N'omkarsayajihande@gmail.com', N'2423f55c0f4d71c0e84b571169ddc462', N'Omkar Hande', 0, N'AH 8', N'2010C6PS650G', N'325', N'9637014476', N'2010C6PS650G.jpg', NULL, CAST(0x9ECD035A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (139, N'f2007610@bits-goa.ac.in', N'e10adc3949ba59abbe56e057f20f883e', N'ravikiran ch1 279', 0, N'CH 1', N'2007b1a7610g', N'279', N'9764268373', N'2007b1a7610g.jpg', NULL, CAST(0x9ECD0365 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (140, N'sunket001@gmail.com', N'13725a729b1a3d56727d75d885da26df', N'sankeerth', 0, N'AH 3', N'2009a8ps258g', N'315', N'9552435396', N'2009a8ps258g.jpg', NULL, CAST(0x9ECD03F8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (141, N'srikarkasturi.12345@gmail.com', N'f427224849d5bfefd4bc500a45a73320', N'SRIKAR KASTURI', 0, N'CH 3', N'2010C6PS051G', N'223', N'9766176685', N'2010C6PS051G.jpg', NULL, CAST(0x9ECD03FF AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (142, N'tork.abhi@gmail.com', N'ba1d63b653b24a565ed436a0cfc5b3c9', N'Abhinav', 0, N'CH 1', N'2007B1A1528G', N'267', N'9923044317', N'2007B1A1528G.jpg', NULL, CAST(0x9ECD0422 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (143, N'f2008035@bits-goa.ac.in', N'5f4dcc3b5aa765d61d8327deb882cf99', N'Nidish Nair', 0, N'AH 1', N'2008A7PS035G', N'332', N'7709790823', N'2008A7PS035G.jpg', NULL, CAST(0x9ECD04BE AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (144, N'pratyakshsinghrawat@gmail.com', N'a2c18f37c29299af8db8230ec35e59cd', N'Pratyaksh  Rawat', 0, N'AH 2', N'2008B3A1527G', N'328', N'0996047414', N'2008B3A1527G.jpg', NULL, CAST(0x9ECD04DF AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (145, N'srinivas.21689@gmail.com', N'a84107eea92b01861e88af403431dc53', N'M Srinivas Chakravarthy', 0, N'CH 1', N'2007A1PS300G', N'151', N'9923282106', N'2007A1PS300G.jpg', NULL, CAST(0x9ECD04FF AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (146, N'rebel01.nilesh@gmail.com', N'16928d944b2d699f557d9f6a640a0465', N'Nilesh Gaurav', 0, N'CH 1', N'2007B5A7582G', N'303', N'9823623840', N'2007B5A7582G.jpg', NULL, CAST(0x9ECE005A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (147, N'f1fans.rohan@gmail.com', N'10638f0b9b513413012f68fe19a0b933', N'Rohan Handa', 0, N'AH 8', N'2010A1PS486G', N'138', N'8888312928', N'2010A1PS486G.jpg', NULL, CAST(0x9ECE0071 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (148, N'f2007903@bits-goa.ac.in', N'83e88a006f25b3c243da8cca31b10ad5', N'Shallabh', 0, N'CH 1', N'2007B2A4903G', N'338', N'9764679556', N'2007B2A4903G.jpg', NULL, CAST(0x9ECE017A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (149, N'mayankmaheshwari84@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Mayank', 0, N'CH 6', N'2009H112043G', N'271', N'9552518805', N'2009H112043G.jpg', NULL, CAST(0x9ECE02F5 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (150, N'esaxena2008@gmail.com', N'88a7f706af05e699a610206f79b73f07', N'Ekansh Saxena', 0, N'CH 2', N'2007A4PS320G', N'213', N'9011193347', N'2007A4PS320G.jpg', NULL, CAST(0x9ECE0301 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (151, N'ksachu999@gmail.com', N'0e83ab8149c54c989ef773ce7b26db8d', N'sachin', 0, N'AH 7', N'2010A3PS188G', N'208', N'7709790427', N'2010A3PS188G.jpg', NULL, CAST(0x9ECE033E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (152, N'shivanshtripathi@gmail.com', N'296f40a4e39acbe59d394a30863cbcf7', N'Shivansh Tripathi', 0, N'CH 3', N'2010B2PS655G', N'124', N'9975567024', N'2010B2PS655G.jpg', NULL, CAST(0x9ECE0438 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (153, N'achint.prakash@gmail.com', N'cf303a21bd73fa0bfe958ddae0569525', N'Achintya Prakash', 0, N'AH 6', N'2008A7PS105G', N'113', N'9923197081', N'2008A7PS105G.jpg', NULL, CAST(0x9ECE049A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (154, N'arunvvr001@gmail.com', N'e310b17c38521e835005cf860a96b300', N'Arun', 0, N'AH 8', N'2010A4PS210G', N'311', N'9637234396', N'2010A4PS210G.jpg', NULL, CAST(0x9ECE04AE AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (155, N'mohit.yadav1991@gmail.com', N'8f54675b90db15743747f1d9e6f3e2cc', N'Mohit Yadav', 0, N'AH 5', N'2009A3PS135G', N'218', N'8055551211', N'2009A3PS135G.jpg', NULL, CAST(0x9ECE04B8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (156, N'gvs.raviteja10@gmail.com', N'7ac448c2378618a42f28e086c9bf40d9', N'ravi teja', 0, N'AH 7', N'2010A4PS300G', N'303', N'9975566365', N'2010A4PS300G.jpg', NULL, CAST(0x9ECE04DE AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (157, N'adwaith.bits@gmail.com', N'7c6cc44d7b95cf8a5a9cf46973349531', N'Adwaith', 0, N'AH 8', N'2010B1PS435G', N'347', N'8888818029', N'2010B1PS435G.jpg', NULL, CAST(0x9ECE04E8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (158, N'arakadiri@gmail.com', N'1c63129ae9db9c60c3e8aa94d3e00495', N'aravind', 0, N'AH 8', N'2010b3ps428g', N'355', N'8888818023', N'2010b3ps428g.jpg', NULL, CAST(0x9ECE04FA AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (159, N'tarun.barange.09@gmail.com', N'445276677fab7fa1f318eddec0193db1', N'Tarun Barange', 0, N'AH 1', N'2008A3PS174G', N'145', N'9960589099', N'2008A3PS174G.jpg', NULL, CAST(0x9ECF005A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (160, N'yuvrajaneja@gmail.com', N'96550164cb9f07b1d3760b8cf7d3ccee', N'Yuvraj Aneja', 0, N'AH 5', N'2009A1PS276G', N'146', N'9096489844', N'2009A1PS276G.jpg', NULL, CAST(0x9ECF0068 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (161, N'pankajblazer@gmail.com', N'0b4e7a0e5fe84ad35fb5f95b9ceeac79', N'pankaj', 0, N'CH 1', N'2007B1A4454G', N'208', N'9960086179', N'2007B1A4454G.jpg', NULL, CAST(0x9ECF0370 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (162, N'yashbabar5@gmail.com', N'bfece73fbce831d7a78f41342332969a', N'Yash', 0, N'AH 2', N'2008A7PS093G', N'117', N'9561431423', N'2008A7PS093G.jpg', NULL, CAST(0x9ED002ED AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (163, N'palleprashanthreddy@gmail.com', N'7ebb146a121b8f96fe7a7d0a1bfe7278', N'palle prashanth reddy', 0, N'AH 7', N'2010a4ps296g', N'304', N'0997556375', N'2010a4ps296g.jpg', NULL, CAST(0x9ED00347 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (164, N'anandsatheendran@gmail.com', N'051426430c0329f5e6c10fbc1d06baf0', N'ANAND S', 0, N'AH 2', N'2008A8PS286G', N'337', N'9960505889', N'2008A8PS286G.jpg', NULL, CAST(0x9ED003A3 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (165, N'ambiliksunil@gmail.com', N'97c435c21d610dee5e9a94979bb10209', N'ambili', 0, N'CH 5', N'200845367678', N'308', N'9527057870', N'200845367678.jpg', NULL, CAST(0x9ED003E0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (166, N'czardozz@gmail.com', N'97db1846570837fce6ff62a408f1c26a', N'Aniket', 0, N'AH 3', N'2009B4A7619G', N'242', N'9921228373', N'2009B4A7619G.jpg', NULL, CAST(0x9ED00445 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (167, N'nikston17@gmaiL.com', N'a2550eeab0724a691192ca13982e6ebd', N'NIKHIL', 0, N'AH 2', N'2008A3PS032G', N'316', N'0997052821', N'2008A3PS032G.jpg', NULL, CAST(0x9ED0044B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (168, N'chirag.agarwalr@gmail.com', N'c33367701511b4f6020ec61ded352059', N'Chirag Agarwal', 0, N'AH 4', N'2009B4A7606G', N'326', N'9637423503', N'2009B4A7606G.jpg', NULL, CAST(0x9ED0044C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (169, N'pratik1491@gmail.com', N'789ad5a3a8ddea79eca073787b8ab683', N'Pratik Hegde', 0, N'AH 4', N'2009B4A4470G', N'234', N'9552518865', N'2009B4A4470G.jpg', NULL, CAST(0x9ED00451 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (170, N'yachit.mahajan@gmail.com', N'33dded1525507b1ec9a81d6bfa21938c', N'Yachit', 0, N'AH 5', N'2009A1PS195G', N'361', N'9657268714', N'2009A1PS195G.jpg', NULL, CAST(0x9ED00471 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (171, N'f2008039@bits-goa.ac.in', N'aadb33fb76cbe789255b909f51e92e07', N'Prashasti', 0, N'CH 4', N'2008A7PS039G', N'248', N'9049269014', N'2008A7PS039G.jpg', NULL, CAST(0x9ED00482 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (172, N'mention.animesh@gmail.com', N'856275180970fcb49b9e4e51fedf52dc', N'Animesh Srivastava', 0, N'AH 7', N'2010A3PS114G', N'139', N'9545111594', N'2010A3PS114G.jpg', NULL, CAST(0x9ED00482 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (173, N'poozi211@gmail.com', N'45330016ab5af571b3f0a368a4c1945a', N'Pooja ', 0, N'CH 4', N'2008c6ps611g', N'259', N'9764167177', N'2008c6ps611g.jpg', NULL, CAST(0x9ED0048C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (174, N'love_shah0001@yahoo.co.in', N'5f96b687217d217eaf081e118bc257ac', N'Love Shah', 0, N'AH 4', N'2009A4PS321G', N'318', N'9096869567', N'2009A4PS321G.jpg', NULL, CAST(0x9ED004A8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (175, N'akhilreddy90@gmail.com', N'8f80598016bda047501ee0f9453cd27a', N'Akhil', 0, N'AH 1', N'2008A4PS249G', N'325', N'9049268860', N'2008A4PS249G.jpg', NULL, CAST(0x9ED004A8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (176, N'akashc@gmail.com', N'0e592a4bea504127cc869b59c118d399', N'Akash Chaudhary', 0, N'CH 3', N'2010A7PS136G', N'328', N'7709016070', N'2010A7PS136G.jpg', NULL, CAST(0x9ED004B4 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (177, N'vinay.loves.guitar@gmail.com', N'6130bbc111f4e8a5df4ae1a409469d79', N'Vinayak', 0, N'AH 3', N'2009B3A4533G', N'248', N'8805154202', N'2009B3A4533G.jpg', NULL, CAST(0x9ED004C0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (178, N'ramsrigouthamg@gmail.com', N'779c582319fca094ef76d5d249ec3b86', N'Ramsri ', 0, N'CH 1', N'2007A3PS033G', N'326', N'9049679452', N'2007A3PS033G.jpg', NULL, CAST(0x9ED004C9 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (179, N'bmsrrulz@gmail.com', N'0d1955f67c745a1dd8031b140b2b9035', N'Bhuvan Rawal', 0, N'AH 2', N'2008A7PS078G', N'312', N'7276771540', N'2008A7PS078G.jpg', NULL, CAST(0x9ED004D2 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (180, N'shialeshbhala@gmail.com', N'e850522ecdab86c72f3304c290395344', N'shailesh bhala', 0, N'CH 1', N'2007B3A3607G', N'246', N'9823635932', N'2007B3A3607G.jpg', NULL, CAST(0x9ED0052B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (181, N'f2008577@bits-goa.ac.in', N'60f4555610aafdd2dce9b8301e507afa', N'Mihir', 0, N'AH 2', N'2008B4A8577G', N'343', N'9657294539', N'2008B4A8577G.jpg', NULL, CAST(0x9ED0052D AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (182, N'leenthegenieass@gmail.com', N'f486d78a14ad93eb181bcbe3c5e05400', N'Leena', 0, N'CH 4', N'2007B4A4394G', N'381', N'0976423788', N'2007B4A4394G.jpg', NULL, CAST(0x9ED0053C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (183, N'sumant1990@gmail.com', N'd8578edf8458ce06fbc5bb76a58c5ca4', N'sumant ', 0, N'AH 3', N'2009A7PS087G', N'348', N'9922927750', N'2009A7PS087G.jpg', NULL, CAST(0x9ED00543 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (184, N'saksham.bhatla@gmail.com', N'51061fa29878b97367587d3a4f5aa7d5', N'saksham bhatla', 0, N'AH 4', N'2009a8ps316g', N'251', N'9975570357', N'2009a8ps316g.jpg', NULL, CAST(0x9ED00549 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (185, N'tejask.2507@gmail.com', N'f4c46b98c6951fcd17c225f92d508f8e', N'Tejas Kalyanshetty', 0, N'AH 4', N'2009A3PS068G', N'221', N'9637423566', N'2009A3PS068G.jpg', NULL, CAST(0x9ED0055B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (186, N'mohit28bhatia@gmail.com', N'4a7ff8af51c6b95a9900937643db1f95', N'mohit bhatia', 0, N'AH 1', N'2008A4PS396G', N'129', N'9325319034', N'2008A4PS396G.jpg', NULL, CAST(0x9ED0056A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (187, N'chikupalod@gmail.com', N'fd50b1baeaf75e5950470c204aa74110', N'Neelesh Palod', 0, N'AH 7', N'2010b1ps669g', N'225', N'9413716490', N'2010b1ps669g.jpg', NULL, CAST(0x9ED00580 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (188, N'akashbhagwat@gmail.com', N'7e84a4dcba57255cb174a11a81eec64d', N'Akash Bhagwat', 0, N'AH 5', N'2009A1PS171G', N'340', N'9552520070', N'2009A1PS171G.jpg', NULL, CAST(0x9ED00592 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (189, N'ashwinbose123@gmail.com', N'7f7dfc889352c1ba25970502b5a8e2ec', N'ashwin ', 0, N'AH 8', N'2010A4PS033G', N'345', N'9975565916', N'2010A4PS033G.jpg', NULL, CAST(0x9ED10049 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (190, N'chirag.rox@gmail.com', N'befeaec7170493509f4245545c93f9d4', N'Chirag Shah', 0, N'AH 2', N'2008A1PS516G', N'138', N'9867642457', N'2008A1PS516G.jpg', NULL, CAST(0x9ED10257 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (191, N'hemuviru319@gmail.com', N'4c169791b4d504a80d393cbf8acc6808', N'Hemanth', 0, N'AH 1', N'2008B5A3523G', N'116', N'9637423661', N'2008B5A3523G.jpg', NULL, CAST(0x9ED10265 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (192, N'parth333@gmail.com', N'290da0a04bf4a63b6386a0ac51aa97bd', N'Parth Pooniwala', 0, N'AH 5', N'2009A7PS016G', N'214', N'9561517271', N'2009A7PS016G.jpg', NULL, CAST(0x9ED10332 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (193, N'prashant.srivastava227@gmail.com', N'b1ef741bee14a29acbe5686f59b62569', N'Prashant Srivastava', 0, N'AH 3', N'2009C6PS529G', N'253', N'9657269616', N'2009C6PS529G.jpg', NULL, CAST(0x9ED1037E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (194, N'deepkuckreja@gmail.com', N'e3d80cd0019d737aaad0106d118fb910', N'Deepak Kuckreja', 0, N'AH 6', N'2008b3a7651g', N'325', N'9763739125', N'2008b3a7651g.jpg', NULL, CAST(0x9ED103F3 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (195, N'vanfeuren01@gmail.com', N'2228d284f4ffabd401c9872bc5171d0b', N'Viren Kalsekar', 0, N'CH 2', N'2007A4PS236G', N'119', N'9860177204', N'2007A4PS236G.jpg', NULL, CAST(0x9ED20009 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (196, N'subiet.rastogi@gmail.com', N'70f77978466b9a3073d41c5e3fbbcfb1', N'Nishith', 0, N'CH 1', N'2007B3A3554G', N'155', N'9922953265', N'2007B3A3554G.jpg', NULL, CAST(0x9ED2001E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (197, N'f2007655@bits-goa.ac.in', N'e03e9d09785663f5dfca5413be728faa', N'Sanjay', 0, N'CH 2', N'2007B2A4655G', N'133', N'9881941982', N'2007B2A4655G.jpg', NULL, CAST(0x9ED20201 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (198, N'nisanthbits@gmail.com', N'2f467418794555bb82e36ceb26740f09', N'Nisanth', 0, N'AH 3', N'2009A7PS074G', N'202', N'9637423611', N'2009A7PS074G.jpg', NULL, CAST(0x9ED2027F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (199, N'srikanth.nelakuditi@gmail.com', N'caa0be054bd97f94f8d3795224e9243d', N'Srikanth', 0, N'AH 5', N'2010A3PS488G', N'257', N'8888083841', N'2010A3PS488G.jpg', NULL, CAST(0x9ED202C1 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (200, N'mirchis.gg@gmail.com', N'82e223f0b7d7db1275b2f19277c9dd7d', N'Phani Sarma', 0, N'AH 6', N'2008B3A8373G', N'352', N'8055553223', N'2008B3A8373G.jpg', NULL, CAST(0x9ED202FF AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (201, N'f2007060@bits-goa.ac.in', N'ec6cf3d1ef2a5f571a66163d5c89aa32', N'rachana', 0, N'CH 4', N'2007a7ps060g', N'173', N'9967354218', N'2007a7ps060g.jpg', NULL, CAST(0x9ED20330 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (202, N'santhoshrdd18@gmail.com', N'3fbc7f5d2d51853523c82252db294dcf', N'SANTOSH JINNA', 0, N'AH 2', N'2008A7PS103G', N'202', N'9960513133', N'2008A7PS103G.jpg', NULL, CAST(0x9ED20367 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (203, N'f2008559@bits-goa.ac.in', N'4bd758392f794673f8cb2a10e271b7c4', N'yogesh kumar jha', 0, N'AH 6', N'2008c6ps559g', N'137', N'9096213990', N'2008c6ps559g.jpg', NULL, CAST(0x9ED20382 AS SmallDateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (204, N'rishabhsinha89@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Rishabh Sinha', 0, N'CH 2', N'2007A8PS207G', N'327', N'9823343923', N'2007A8PS207G.jpg', NULL, CAST(0x9ED2041B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (205, N'vineetdhanawat@gmail.com', N'a1dc724be22f5c2dc6568c89d5c8cbbf', N'Vineet', 0, N'CH 2', N'2007A7PS039G', N'137', N'9881889152', N'2007A7PS039G.jpg', NULL, CAST(0x9ED20427 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (206, N'vikaasgoel.007@gmail.com', N'131f5a1bc4a2b2c911bf033eef2384d9', N'Vikas Goel', 0, N'AH 1', N'2008B3A7700G', N'206', N'9049269032', N'2008B3A7700G.jpg', NULL, CAST(0x9ED20455 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (207, N'parismulye@gmail.com', N'1126cce9ec51aeb0529394dd13245b07', N'paris mulye', 0, N'AH 4', N'2009A4PS367G', N'363', N'9637423483', N'2009A4PS367G.jpg', NULL, CAST(0x9ED30028 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (208, N'manojsundar91@gmail.com', N'b76f28137e07bfffd071866a18b618d5', N'Manoj Sundar', 0, N'AH 4', N'2009A8PS122G', N'310', N'9860916053', N'2009A8PS122G.jpg', NULL, CAST(0x9ED30472 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (209, N'laayla.malavika@gmail.com', N'cee5d8fb3c77266e90361b034acea821', N'Malavika', 0, N'CH 4', N'2010a1ps433g', N'312', N'9823228545', N'2010a1ps433g.jpg', NULL, CAST(0x9ED40001 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (210, N'sudhir.lakhlan@gmail.com', N'1e653dd53206e1484769f747bab203e2', N'Sudhir Kumar', 0, N'CH 6', N'2010H112442G', N'172', N'8087903047', N'2010H112442G.jpg', NULL, CAST(0x9ED40053 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (211, N'f2007189@bits-goa.ac.in', N'ad845a24a47deecbfa8396e90db75c6a', N'Adity', 0, N'CH 5', N'2007A3PS189G', N'259', N'9730598403', N'2007A3PS189G.jpg', NULL, CAST(0x9ED4005B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (212, N'saideepthi.bits@gmail.com', N'c02b914555875895f2d07d8601a0ad56', N'deepthi', 0, N'CH 4', N'2007a7ps083g', N'324', N'7875815363', N'2007a7ps083g.jpg', NULL, CAST(0x9ED402C4 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (213, N'abhijith200690@gmail.com', N'9aee390f19345028f03bb16c588550e1', N'Abhijith Reddy D', 0, N'CH 2', N'2007A4PS050G', N'203', N'9730597549', N'2007A4PS050G.jpg', NULL, CAST(0x9ED4031E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (214, N'sp.phanikiran@gmail.com', N'c7d08e09a44d2b453e7eeecebf0a8daf', N'phani kiran', 0, N'CH 1', N'2007a3ps171g', N'322', N'9370520430', N'2007a3ps171g.jpg', NULL, CAST(0x9ED40492 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (215, N'devanshu_seth@rediffmail.com', N'1e9e173d1213ceb075f93f7627e16d08', N'Devanshu', 0, N'CH 3', N'2010C6PS444G', N'327', N'8888083410', N'2010C6PS444G.jpg', NULL, CAST(0x9ED404B0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (216, N'guptaishant27@gmail.com', N'2163325815f99a29e567fdb2dfb616e2', N'Ishant Gupta', 0, N'AH 6', N'2008B4A4519G', N'245', N'9767570738', N'2008B4A4519G.jpg', NULL, CAST(0x9ED404EB AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (217, N'vaibhav0404@gmail.com', N'2483e14219cce6fe63d8ac91afc92618', N'Vaibhav', 0, N'AH 2', N'2008A7ps006g', N'121', N'9561431432', N'2008A7ps006g.jpg', NULL, CAST(0x9ED40518 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (218, N'sambhab001@gmail.com', N'1e795296c29be0d53b2ec0cceda805be', N'SAMBHAB', 0, N'AH 6', N'2008A8PS090G', N'323', N'9960665740', N'2008A8PS090G.jpg', NULL, CAST(0x9ED40523 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (219, N'f2007632@bits-goa.ac.in', N'e6c6a9b33685ce018c679a892cf7ecc2', N'Abhishek', 0, N'CH 1', N'2007B3A8632G', N'341', N'7587031413', N'2007B3A8632G.jpg', NULL, CAST(0x9ED50067 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (220, N'sagthegunner@gmail.com', N'0a0caab6baff4ab7957bc08f26f434c4', N'Sagar Premkumar', 0, N'CH 1', N'2007B4A1573G', N'372', N'9923795027', N'2007B4A1573G.jpg', NULL, CAST(0x9ED50098 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (221, N'tsathwik063@gmail.com', N'd3b90f946b52b712c7cf6a1b8ecba434', N'sathwik', 0, N'AH 4', N'2009a3ps063g', N'116', N'9637423480', N'2009a3ps063g.jpg', NULL, CAST(0x9ED5024A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (222, N'om.bitsian@gmail.com', N'204fb2dd8b13f144b49e966ff6d663ba', N'om prakash', 0, N'CH 6', N'2003B3TS862P', N'165', N'9657273053', N'2003B3TS862P.jpg', NULL, CAST(0x9ED50286 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (223, N'sasipkanth@gmail.com', N'ac67ede5a84eb5a1add7ff4440e9a485', N'sasikanth', 0, N'CH 1', N'2007a8ps213g', N'268', N'9823609016', N'2007a8ps213g.jpg', NULL, CAST(0x9ED502DA AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (224, N'sandilya1@gmail.com', N'f8b848423ea22d582d6fb47d4cbc8ef9', N'Sandilya Bhagi', 0, N'AH 8', N'2010A8PS346G', N'254', N'9975566924', N'2010A8PS346G.jpg', NULL, CAST(0x9ED502DE AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (225, N'pulkit141@gmail.com', N'dbf7b138de59d683e3f28c60b9798c7b', N'Pulkit Sharma', 0, N'CH 2', N'2007A3PS159G', N'321', N'9011183720', N'2007A3PS159G.jpg', NULL, CAST(0x9ED5030B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (226, N'f2007124@bits-goa.ac.in', N'15615013b0c5e9219d26a6540322ed82', N'Rakesh C', 0, N'CH 1', N'2007A7PS124G', N'238', N'9823623826', N'2007A7PS124G.jpg', NULL, CAST(0x9ED50335 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (227, N'harishj1729@gmail.com', N'7ec64d5a8a7f99fe29abdce9435d7ea5', N'Harish', 0, N'AH 5', N'2009B3A1288G', N'323', N'9545327808', N'2009B3A1288G.jpg', NULL, CAST(0x9ED50373 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (228, N'nishit_bg@yahoo.com', N'8274e8a9b14c2aeb3288c6a4d82b7343', N'Nishit H Patira', 0, N'AH 8', N'2010A8PS255G', N'209', N'7276773303', N'2010A8PS255G.jpg', NULL, CAST(0x9ED50469 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (229, N'chaitanya135@yahoo.co.in', N'3cd509071d765eb67dd2a7798d0145c4', N'Chaitanya Bhatt', 0, N'AH 7', N'2010B3PS487G', N'145', N'9689808699', N'2010B3PS487G.jpg', NULL, CAST(0x9ED50515 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (230, N'suri.bitsg@gmail.com', N'24efdd7229142932426e0cc27f802321', N'Surendra', 0, N'CH 2', N'2007C6PS460G', N'302', N'7875815429', N'2007C6PS460G.jpg', NULL, CAST(0x9ED50523 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (231, N'mstech89@gmail.com', N'8a68b5aa49eef8a3c9e4f1f82588c6b5', N'Mohit Shrivastava', 0, N'CH 1', N'2007A7PS026G', N'203', N'9730597635', N'2007A7PS026G.jpg', NULL, CAST(0x9ED5056C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (232, N'rakhe123kbl@gmail.com', N'6966dacc8064ea018316a1a98e6211f3', N'Rakesh Vaddadi', 0, N'AH 8', N'2010A7PS044G', N'205', N'9975565192', N'2010A7PS044G.jpg', NULL, CAST(0x9ED50571 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (233, N'f2008371@bits-goa.ac.in', N'322d188cb256edf960c84c23ae630e2d', N'Shatyajeet Parida', 0, N'AH 2', N'2008A4PS371G', N'348', N'8983862819', N'2008A4PS371G.jpg', NULL, CAST(0x9ED602B5 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (234, N'f2007136@bits-goa.ac.in', N'd83f6b7bf9c7a01ee023cd8848d7eb9c', N'Vinay Kumar', 0, N'CH 1', N'2007a3ps136g', N'219', N'8600308131', N'2007a3ps136g.jpg', NULL, CAST(0x9ED60332 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (235, N'nitishsinha.bits@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Nitish', 0, N'AH 3', N'2009C6PS620G', N'250', N'9637015721', N'2009C6PS620G.jpg', NULL, CAST(0x9ED603B7 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (236, N'kairavsai3300@gmail.com', N'b0863c6d48500edaf1238974202ed5b0', N'kairav', 0, N'AH 2', N'2008A7PS049G', N'204', N'9049268866', N'2008A7PS049G.jpg', NULL, CAST(0x9ED604DD AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (237, N'abhinav.ab07@gmail.com', N'ba1d63b653b24a565ed436a0cfc5b3c9', N'Abhinav Gadepalli', 0, N'CH 1', N'2007A8PS293G', N'230', N'9823912397', N'2007A8PS293G.jpg', NULL, CAST(0x9ED702AD AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (238, N'ankit.malpani@gmail.com', N'e6c6a9b33685ce018c679a892cf7ecc2', N'Ankit Malpani', 0, N'CH 1', N'2007a7ps013g', N'213', N'9881880537', N'2007a7ps013g.jpg', NULL, CAST(0x9ED7045F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (239, N'antorip.abraham@gmail.com', N'1df39112bcb539cf783744c704ae0719', N'Antorip Sahu', 0, N'AH 1', N'2008A3PS143G', N'355', N'9545934153', N'2008A3PS143G.jpg', NULL, CAST(0x9ED704A3 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (240, N'pratchit@gmail.com', N'ebb16cce2563c4684e9314c351f14570', N'Prathamesh Chittal', 0, N'AH 2', N'2008a3ps163g', N'111', N'9823617128', N'2008a3ps163g.jpg', NULL, CAST(0x9ED704ED AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (241, N'abhipsa.92@gmail.com', N'642f533fe27b410469ac5db6e1149dd0', N'Abhipsa Behera', 0, N'CH 4', N'2010c6ps413g', N'176', N'8888312748', N'2010c6ps413g.jpg', NULL, CAST(0x9ED80402 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (242, N'chunduruvikram@gmail.com', N'ea13a55a4d0c994d88049bca7fe68858', N'Vikram chunduru', 0, N'CH 1', N'2007a7ps047g', N'347', N'8600308129', N'2007a7ps047g.jpg', NULL, CAST(0x9ED80433 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (243, N'rahulrupani005@gmail.com', N'405aaff66082ffe7231d7c1f79926c17', N'Rahul Rupani', 0, N'AH 4', N'2009B5A4443G', N'143', N'9657280221', N'2009B5A4443G.jpg', NULL, CAST(0x9ED8043B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (244, N'f2008484@bits-goa.ac.in', N'f1fb1ea9a408b1f321062e86ec4bae3e', N'RAHUL YADAV', 0, N'AH 1', N'2008B3A7484G', N'125', N'9049629782', N'2008B3A7484G.jpg', NULL, CAST(0x9ED80478 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (245, N'f2007309@bits-goa.ac.in', N'b78dbbb4b259806e45ffc07bb4b4f6d6', N'akhil', 0, N'CH 2', N'2007a4ps309g', N'310', N'          ', N'2007a4ps309g.jpg', NULL, CAST(0x9ED804C6 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (246, N'rahul8703@gmail.com', N'0718e6a5755d9dead204aabd0680c989', N'Rahul Govindwar', 0, N'AH 6', N'2008B2A1592G', N'305', N'9421666930', N'2008B2A1592G.jpg', NULL, CAST(0x9ED80534 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (247, N'kaustubh1001@gmail.com', N'2aa14b46571298dc4570c968488f8125', N'kaustubh', 0, N'AH 5', N'2009a8ps342g', N'224', N'9545327829', N'2009a8ps342g.jpg', NULL, CAST(0x9ED80555 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (248, N'b.abhayrao@gmail.com', N'96c3dc50f0f1faa502cea772e5cb3219', N'abhay rao', 0, N'CH 1', N'2007A3PS166G', N'351', N'9561045476', N'2007A3PS166G.jpg', NULL, CAST(0x9ED9000F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (249, N'rachana.wagle@gmail.com', N'51288e3b468268a44f048f510f283631', N'Rachana Wagle', 0, N'CH 4', N'2007C6PS464G', N'210', N'9987220576', N'2007C6PS464G.jpg', NULL, CAST(0x9EDA0045 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (250, N'karansethi04@gmail.com', N'1afd611e757f5c956b3f868265da95f2', N'Karan Sethi', 0, N'AH 7', N'2010A1PS395G', N'313', N'0965485675', N'2010A1PS395G.jpg', NULL, CAST(0x9EDA0060 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (251, N'sagarisgod@gmail.com', N'9a164e49347cc405f6fff8da7ce4fe90', N'Sagar Yarnalkar', 0, N'CH 1', N'2007B3A3453G', N'167', N'9823623966', N'2007B3A3453G.jpg', NULL, CAST(0x9EDA053A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (252, N'f2007188@bits-goa.ac.in', N'9bf36a997356853e9671a95f696dd07f', N'Shrey', 0, N'CH 1', N'2007A4PS188G', N'221', N'9766366981', N'2007A4PS188G.jpg', NULL, CAST(0x9EDA0596 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (253, N'f2007004@bits-goa.ac.in', N'322ee6febf1686b7f056b48b62ea3b97', N'Amrita Patil', 0, N'CH 5', N'2007A3PS004G', N'375', N'9970846879', N'2007A3PS004G.jpg', NULL, CAST(0x9EDB0309 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (254, N'sidx123@rediffmail.com', N'c45133e0b016aa0f8c670696756ac1b7', N'Siddharth Sahoo', 0, N'AH 3', N'2009A8PS349G', N'123', N'9552435345', N'2009A8PS349G.jpg', NULL, CAST(0x9EDB0320 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (255, N'binitgoenka@gmail.com', N'6537efa596fdc46b9e4e3ea08a47069d', N'Binit Goenka', 0, N'CH 1', N'2007A8PS210G', N'271', N'7875815402', N'2007A8PS210G.jpg', NULL, CAST(0x9EDB0337 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (256, N'pawan.bitsgoa@gmail.com', N'52ca695efbc2c39c92eaf128f74b0bd7', N'pawan kumar', 0, N'AH 5', N'2009a1ps413g', N'135', N'9657737197', N'2009a1ps413g.jpg', NULL, CAST(0x9EDB0384 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (257, N'paulshuddhasattwa@gmail.com', N'7a3af604e52e2577b3f5b77e96f3e01d', N'shuddhasattwa paul', 0, N'AH 6', N'2008a8ps275g', N'141', N'9049269064', N'2008a8ps275g.jpg', NULL, CAST(0x9EDB03AA AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (258, N'f2008576@bits-goa.ac.in', N'97ec4bb4594b60c8f672a75392c5c322', N'Jatin Puri', 0, N'AH 6', N'2008Ba77576G', N'148', N'9822066432', N'2008Ba77576G.jpg', NULL, CAST(0x9EDB03AD AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (259, N'agarwal.apoorv.bits@gmail.com', N'09de7eb326bcca7e94f8b11a9af6142b', N'Apoorv Agarwal', 0, N'AH 2', N'2008A8PS283G', N'203', N'9049248561', N'2008A8PS283G.jpg', NULL, CAST(0x9EDB0415 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (260, N'charizard789456@yahoo.in', N'c62d929e7b7e7b6165923a5dfc60cb56', N'Rahul Anand', 0, N'CH 6', N'2009A8PS001G', N'000', N'9011100173', N'2009A8PS001G.jpg', NULL, CAST(0x9EDB0448 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (261, N'f2007077@bits-goa.ac.in', N'acc1856bcb77ff6a07efa866b838b48b', N'Abhishek', 0, N'CH 2', N'2007A7PS077G', N'224', N'9960359033', N'2007A7PS077G.jpg', NULL, CAST(0x9EDB04AE AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (262, N'kshamanksoni@gmail.com', N'911b1ca4b34d45a115afee01b1e4fbb9', N'Kshamank Soni', 0, N'CH 1', N'2007B3A4625G', N'207', N'9766724384', N'2007B3A4625G.jpg', NULL, CAST(0x9EDC00E0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (263, N'rahulrana681@gmail.com', N'26506ca4d6246ea9ebd4170671c3aaa4', N'Rahul Rana', 0, N'CH 2', N'2007A1PS206G', N'311', N'8805752952', N'2007A1PS206G.jpg', NULL, CAST(0x9EDC0431 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (264, N'mailtoprateek@gmail.com', N'ae2b1fca515949e5d54fb22b8ed95575', N'Prateek Gupta', 0, N'CH 1', N'2007A7PS078G', N'359', N'9011183485', N'2007A7PS078G.jpg', NULL, CAST(0x9EDC048E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (265, N'sujithn89@gmail.com', N'a3da86395fa4a58dcf43c98f20a867cb', N'sujith n', 0, N'CH 1', N'2007a8ps054g', N'120', N'9011183602', N'2007a8ps054g.jpg', NULL, CAST(0x9EDD0007 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (266, N'nishant.kakar@live.com', N'9cf0e877fb1bc88cfd577efaf62c7579', N'Nishant Kakar', 0, N'CH 1', N'2007A1PS478G', N'244', N'7875815371', N'2007A1PS478G.jpg', NULL, CAST(0x9EDD0031 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (267, N'f2006655@bits-goa.ac.in', N'3a6ad3cffd52913dfafce6761c0424a7', N'Rahul Sengupta', 0, N'CH 1', N'2006B2A3655G', N'158', N'9823636558', N'2006B2A3655G.jpg', NULL, CAST(0x9EDD00D9 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (268, N'sairanji@gmail.com', N'c6891798c7ebc6332850451597e7c8e5', N'ranjit kumar', 0, N'CH 6', N'2010h141430g', N'161', N'8600747567', N'2010h141430g.jpg', NULL, CAST(0x9EDD02F0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (269, N'srimanbonagiri23@gmail.com', N'8af25eb4ec5a973d91740733fd2db465', N'sriman', 0, N'AH 5', N'2009b1a8319g', N'349', N'9637145392', N'2009b1a8319g.jpg', NULL, CAST(0x9EDD0335 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (270, N'arjunvj3@gmail.com', N'afece9ac30a3514e87c0bfebf78cdf50', N'Arjun V J (Maestro)', 0, N'CH 1', N'2007a7PS037G', N'264', N'8446452885', N'2007a7PS037G.jpg', NULL, CAST(0x9EDD04D0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (271, N'sudarshan.choubey@gmail.com', N'af468280c8ab5869d213a8517084ea8e', N'Sudarshan', 0, N'CH 1', N'2007a7ps085g', N'231', N'7875814816', N'2007a7ps085g.jpg', NULL, CAST(0x9EDD0549 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (272, N'shrey325@gmail.com', N'eb5ba7c977d21014520ad3ee0432d10f', N'Shrey Vats', 0, N'CH 1', N'2007B1A8663G', N'107', N'9764058730', N'2007B1A8663G.jpg', NULL, CAST(0x9EDD056B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (273, N'alwayscool200560@gmail.com', N'72dabe497516c268bc78ed8a0f3c2a73', N'Ravi Teja', 0, N'CH 1', N'2006B4A1499G', N'142', N'9923309283', N'2006B4A1499G.jpg', NULL, CAST(0x9EDE024B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (274, N'athulramkumar@gmail.com', N'3bf07fd7efb4f2471e8c133f26b89843', N'Athul S Ramkumar', 0, N'CH 1', N'2007B4A3508G', N'375', N'9823623880', N'2007B4A3508G.jpg', NULL, CAST(0x9EDE03CB AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (275, N'tripathiwise@gmail.com', N'f7447a266bc47ff13350d8f8f5965184', N'nishith tripathi', 0, N'CH 1', N'2007A1PS398G', N'273', N'9637041033', N'2007A1PS398G.jpg', NULL, CAST(0x9EDE04A5 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (276, N'dylan.bits@gmail.com', N'6638070bc99321b316adbd95e6951f5b', N'Dylan Colaco', 0, N'AH 3', N'2009A3PS225G', N'241', N'9503676125', N'2009A3PS225G.jpg', NULL, CAST(0x9EDE04E2 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (277, N'mysticsenses@gmail.com', N'2830d97fa9b4779ebcae997aa646bc25', N'Sethu', 0, N'CH 1', N'2007A4PS303G', N'118', N'9049921070', N'2007A4PS303G.jpg', NULL, CAST(0x9EDE04EB AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (278, N'ishwini211@gmail.com', N'd33b3502ec2d6315778b2e3dc8d98060', N'ishita', 0, N'CH 5', N'2009b4a7624g', N'319', N'9637423553', N'2009b4a7624g.jpg', NULL, CAST(0x9EDF0016 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (279, N'raj.abhay03@gmail.com', N'5e1b9fe7afdc85e9ff94133c16d07b2a', N'abhay raj', 0, N'AH 6', N'2008B4A4359G', N'364', N'9096214082', N'2008B4A4359G.jpg', NULL, CAST(0x9EDF0256 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (280, N'karanragh@gmail.com', N'c6a05d422080b9f2b44bbc95a0459741', N'Karan ', 0, N'AH 2', N'2008A1PS507G', N'301', N'7709790810', N'2008A1PS507G.jpg', NULL, CAST(0x9EDF04BB AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (281, N'f2009049@bits-goa.ac.in', N'e10adc3949ba59abbe56e057f20f883e', N'Shabbar', 0, N'AH 3', N'2009a3ps049g', N'119', N'8983624950', N'2009a3ps049g.jpg', NULL, CAST(0x9EDF04D2 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (282, N'f2008479@bits-goa.ac.in', N'40eb95572d967a62183292ef5f78bf9a', N'Pawan', 0, N'AH 2', N'2008B5A4479G', N'104', N'9637449172', N'2008B5A4479G.jpg', NULL, CAST(0x9EDF0554 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (283, N'tiwari.dushyant.mail@gmail.com', N'7b4045de049b17eeeb4ea41a7562d57b', N'Dushyant Tiwari', 0, N'CH 1', N'2007B3A7583G', N'104', N'8657128725', N'2007B3A7583G.jpg', NULL, CAST(0x9EDF0566 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (284, N'jhawar.vikram@gmail.com', N'979addd981bebbf54e5406d452fee166', N'Vikram Jhawar', 0, N'AH 1', N'2008B1PS675G', N'153', N'9049629755', N'2008B1PS675G.jpg', NULL, CAST(0x9EE00021 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (285, N'nitishvarma@gmail.com', N'f07cd5f3c16a8b4455897a522bdd86b6', N'Nitish Varma', 0, N'CH 1', N'2007B5A8536G', N'378', N'9561988961', N'2007B5A8536G.jpg', NULL, CAST(0x9EE00030 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (286, N'snehanandan@gmail.com', N'e3090fec7b2c2a14e03337d0645efa36', N'Sneha', 0, N'CH 4', N'2007A4PS382G', N'373', N'9730597739', N'2007A4PS382G.jpg', NULL, CAST(0x9EE00062 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (287, N'dharmateja27@gmail.com', N'786045c3d9951acb68dafb91d1c2afd2', N'Dharma Teja V', 0, N'CH 1', N'2006B2A8641G', N'201', N'8390048662', N'2006B2A8641G.jpg', NULL, CAST(0x9EE000A0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (288, N'nikhilatbits@gmail.com', N'd287b475df42ea189020aed21bb959f4', N'y m nikhil', 0, N'CH 1', N'2007b4a7596g', N'321', N'9960350600', N'2007b4a7596g.jpg', NULL, CAST(0x9EE001A5 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (289, N'f2007408@bits-goa.ac.in', N'dffccf88df7375c79e4ebbc246df0824', N'Deekshith', 0, N'CH 1', N'2007C6PS408G', N'135', N'9764268498', N'2007C6PS408G.jpg', NULL, CAST(0x9EE00290 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (290, N'f2008427@bits-goa.ac.in', N'dba8bca0c1784375f5bc74429e323966', N'sahil malhotra', 0, N'AH 1', N'2008b3a4427g', N'222', N'9158058018', N'2008b3a4427g.jpg', NULL, CAST(0x9EE003EA AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (291, N'skbalaji14@gmail.com', N'1872ecb7cbf5bbf499a0f851c0444d55', N'S K Balaji', 0, N'CH 1', N'2007B4A7381G', N'233', N'9960555405', N'2007B4A7381G.jpg', NULL, CAST(0x9EE003FE AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (292, N'svyaji@gmail.com', N'f492aed1fbee9a373ffc0ecbb537bbe6', N'S Venkata Yaji', 0, N'AH 8', N'2010B3PS533G', N'350', N'9561951564', N'2010B3PS533G.jpg', NULL, CAST(0x9EE00559 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (293, N'rohan324@gmail.com', N'019b0b27113bc3d190958a6b7cf2c177', N'ROHAN KUMAR TRIPATHY', 0, N'CH 1', N'2007B4A8431G', N'236', N'9881883185', N'2007B4A8431G.jpg', NULL, CAST(0x9EE00583 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (294, N'mailforamrit@gmail.com', N'ac441e032e70cd1b08fcad4048cfe525', N'Amrit Pal', 0, N'AH 5', N'2009A1PS701G', N'217', N'9545261775', N'2009A1PS701G.jpg', NULL, CAST(0x9EE00597 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (295, N'manankgosalia@gmail.com', N'd0f57a5b114e1939d7a9fccf9fcf997d', N'manank gosalia', 0, N'CH 3', N'2010b4ps614g', N'122', N'7709010116', N'2010b4ps614g.jpg', NULL, CAST(0x9EE10003 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (296, N'nachiketkukade@yahoo.co.in', N'5060341c21f82c70e928bceed3d45419', N'Nachiket', 0, N'CH 1', N'2007B4A3591G', N'253', N'0738760427', N'2007B4A3591G.jpg', NULL, CAST(0x9EE10011 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (297, N'ameyastudent@gmail.com', N'55e3958a9df8085381939228037d655f', N'Ameya Joshi', 0, N'AH 7', N'2010A3PS005G', N'258', N'9867938499', N'2010A3PS005G.jpg', NULL, CAST(0x9EE10285 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (298, N'manasranjan143@gmail.com', N'9c3d7afbd6b1e71c96576bdc6ac925a1', N'Manas Ranjan', 0, N'AH 7', N'2006A1PS0277', N'101', N'9890134269', N'2006A1PS0277.jpg', NULL, CAST(0x9EE102F1 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (299, N'kalyan.joker00@gmail.com', N'7cadc818d0618ae0d016894b20e6a374', N'kalyan', 0, N'AH 3', N'2007a3ps182g', N'131', N'8805753212', N'2007a3ps182g.jpg', NULL, CAST(0x9EE10308 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (300, N'chaithanya.march1@gmail.com', N'edfadfc5e8471d38535d4f46a027d998', N'Chaithanya', 0, N'CH 1', N'2007b4a4581g', N'270', N'9637423452', N'2007b4a4581g.jpg', NULL, CAST(0x9EE1031A AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (301, N'nvn.bny@gmail.com', N'5f4dcc3b5aa765d61d8327deb882cf99', N'naveen benny', 0, N'AH 4', N'2009a4ps369g', N'344', N'7276778963', N'2009a4ps369g.jpg', NULL, CAST(0x9EE1031B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (302, N'f2007126@bits-goa.ac.in', N'6e82db8505c66ee8ab27da6819e65832', N'venkat kishan', 0, N'AH 3', N'2007A3PS126G', N'132', N'9970794764', N'2007A3PS126G.jpg', NULL, CAST(0x9EE1031E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (303, N'mi2.k2k@gmail.com', N'c16992e256427117fe379253548c07f4', N'Mihir Kulkarni', 0, N'AH 7', N'2010A4PS164G', N'352', N'9011009155', N'2010A4PS164G.jpg', NULL, CAST(0x9EE103B2 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (304, N'rohitoberoi327@gmail.com', N'ee6f5335c02581b3ba852cb2c0f27d60', N'Rohit Oberoi', 0, N'CH 2', N'2007A4PS327G', N'123', N'9370529207', N'2007A4PS327G.jpg', NULL, CAST(0x9EE103E1 AS SmallDateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (305, N'krunalkachadia@gmail.com', N'b62a6d6137b1097d4c2ad980fd1c0cf0', N'Krunal Patel', 0, N'AH 8', N'2010A7PS177G', N'327', N'8888083797', N'2010A7PS177G.jpg', NULL, CAST(0x9EE103F8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (306, N'vaibhav4u06@gmail.com', N'54489653fb9e8da76c4dbd03bda11ac2', N'Baibhaw Kumar', 0, N'AH 1', N'2008A7PS104G', N'207', N'9545572271', N'2008A7PS104G.jpg', NULL, CAST(0x9EE103FC AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (307, N'ralinop@hotmail.com', N'51a32d722dd3b81772a68c7449d5e62d', N'Ralino', 0, N'CH 1', N'2007B3A8516G', N'217', N'9822534992', N'2007B3A8516G.jpg', NULL, CAST(0x9EE103FD AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (308, N'pratikmania@gmail.com', N'bda3bfdfa868d04f4003838f5776f25e', N'Pratik Gupta', 0, N'CH 1', N'2007A7PS043G', N'243', N'9049502639', N'2007A7PS043G.jpg', NULL, CAST(0x9EE10430 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (309, N'psvvivek@gmail.com', N'ec409f06c37316a62945b77351443231', N'VIVEK DPSV', 0, N'AH 3', N'2009A4PS082G', N'133', N'9637423509', N'2009A4PS082G.jpg', NULL, CAST(0x9EE10438 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (310, N'jsamarth89@gmail.com', N'2efaeac3446d5a3c28856aa3aba65a02', N'Samarth', 0, N'CH 2', N'2007A8PS261G', N'136', N'9969252363', N'2007A8PS261G.jpg', NULL, CAST(0x9EE1054C AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (311, N'apurva2609@gmail.com', N'dd18768c125420f249359cef4b9c9863', N'apurva', 0, N'CH 5', N'2009A3PS194g', N'129', N'9764002609', N'2009A3PS194g.jpg', NULL, CAST(0x9EE10554 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (312, N'alok.sharma127@gmail.com', N'7dd348ab4a3b817e5f2f3322536699d7', N'Alok Sharma', 0, N'AH 3', N'2009C6PS623G', N'212', N'9637244237', N'2009C6PS623G.jpg', NULL, CAST(0x9EE20015 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (313, N'anuja707@gmail.com', N'de4f4d2b84e3ae4e6d7ab971b2bbac7f', N'Anuja', 0, N'CH 4', N'2008B3A4505G', N'151', N'7709790830', N'2008B3A4505G.jpg', NULL, CAST(0x9EE2002F AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (314, N'nitant.cool.gupta@gmail.com', N'b9c2538d92362e0e18e52d0ee9ca0c6f', N'Nitant', 0, N'AH 6', N'2008A4PS376G', N'307', N'9049268848', N'2008A4PS376G.jpg', NULL, CAST(0x9EE20044 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (315, N'shraybansal.bits@gmail.com', N'6fda27264f8154abdb6ed31bd701a8e5', N'Shray ', 0, N'CH 1', N'2007B2A7400G', N'256', N'9975857897', N'2007B2A7400G.jpg', NULL, CAST(0x9EE2007E AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (316, N'prathmeshpandey@gmail.com', N'79030890c05900056562d3fe769ecc74', N'prathmesh pandey', 0, N'AH 2', N'2008a7ps130g', N'346', N'9049268788', N'2008a7ps130g.jpg', NULL, CAST(0x9EE200B6 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (317, N'kedar191@gmail.com', N'60b47b5ae0ef8717aa63d2abcd1689f5', N'Kedar Pradhan', 0, N'AH 7', N'2010A4PS036G', N'255', N'9766373163', N'2010A4PS036G.jpg', NULL, CAST(0x9EE2018B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (318, N'f2007491@bits-goa.ac.in', N'827ccb0eea8a706c4c34a16891f84e7b', N'Sarvpriye Khetrapal', 0, N'CH 1', N'2007B5A7491G', N'309', N'9823634412', N'2007B5A7491G.jpg', NULL, CAST(0x9EE20285 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (319, N'ojha.saurabh81@gmail.com', N'133057facf49cbe6520b15a4d96ee395', N'saurabhojha', 0, N'AH 2', N'2008a7ps075g', N'130', N'9702130591', N'2008a7ps075g.jpg', NULL, CAST(0x9EE20394 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (320, N'shashanktodwal@gmail.com', N'dd328c05ddb6bca1068cdcf14056d5d6', N'Shashank Todwal', 0, N'CH 1', N'2007B5A7497G', N'329', N'9881472930', N'2007B5A7497G.jpg', NULL, CAST(0x9EE203D7 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (321, N'linkin_13_park@yahoo.co.in', N'ab56b4d92b40713acc5af89985d4b786', N'anonymous', 0, N'CH 4', N'2007a9ps007g', N'400', N'9881899824', N'2007a9ps007g.jpg', NULL, CAST(0x9EE20431 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (322, N'kvk.bitsg@gmail.com', N'674ee9b72570427a8d75addc9c5c11e9', N'kvki chaitanya', 0, N'CH 2', N'2007b3a7484g', N'120', N'9764596440', N'2007b3a7484g.jpg', NULL, CAST(0x9EE204C8 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (323, N'aafreen.h@gmail.com', N'8099233195079423bd8d258bf1edb0cc', N'aafreen', 0, N'CH 4', N'2008b4a3360g', N'138', N'9765580425', N'2008b4a3360g.jpg', NULL, CAST(0x9EE3001B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (324, N'akshat.goyal2@gmail.com', N'a48ea7e2bd3a239975abdf35c03e01ae', N'aabhas', 0, N'CH 2', N'2007b4a7597g', N'218', N'9545261812', N'2007b4a7597g.jpg', NULL, CAST(0x9EE30102 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (325, N'vishnuk@bits-goa.ac.in', N'5972793cc1718423517639938aae9100', N'Vishnu Vardhan', 0, N'CH 6', N'2009H129001G', N'280', N'9657295502', N'2009H129001G.jpg', NULL, CAST(0x9EE30215 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (326, N'bharathrokr10@gmail.com', N'0f9c5e4259f88b1788f7ad19ca79713d', N'Bharath', 0, N'AH 1', N'2008A4PS355G', N'339', N'8019786306', N'2008A4PS355G.jpg', NULL, CAST(0x9EE302E0 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (327, N'vikram.sidhu.007@gmail.com', N'df31ec9575f852e93450a048f89b2e78', N'vikramjit sidhu', 0, N'CH 3', N'2010A7PS179G', N'338', N'9975151247', N'2010A7PS179G.jpg', NULL, CAST(0x9EE40049 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (328, N'nishantsingh89@gmail.com', N'0e9aec569aefecabea2dbed59f5eb047', N'Nishant Singh', 0, N'AH 6', N'2008a8ps183g', N'226', N'9049269005', N'2008a8ps183g.jpg', NULL, CAST(0x9EE4008B AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (329, N'swastyk7@yahoo.com', N'87489523023db22ef65579468f7dca59', N'Swastik Mohapatra', 0, N'CH 1', N'2007B5A8567G', N'339', N'9960356644', N'2007B5A8567G.jpg', NULL, CAST(0x9EE400C9 AS SmallDateTime))
INSERT [dbo].[EBay_Student] ([Student_ID_pk_bi], [Username_vc], [Password_vc], [Student_Name_vc], [IsAdmin_bool], [Hostel_nc], [BITS_ID_vc], [Room_No_nc], [Phone_No_vc], [PhotoURL], [Last_Login_Time_sdt], [Signup_Time_sdt]) VALUES (330, N'ps.lakshmy@gmail.com', N'90c8607e3df8736b5aa5d9b02366752c', N'Lakshmy PS', 0, N'CH 4', N'2007A7PS057G', N'172', N'9503961489', N'2007A7PS057G.jpg', NULL, CAST(0x9EE403A0 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[EBay_Student] OFF
/****** Object:  Table [dbo].[Ebay_SoldItems]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ebay_SoldItems](
	[SItem_ID_pk_bi] [bigint] NOT NULL,
	[SStudent_ID_fk_bi] [bigint] NOT NULL,
	[SCategory_ID_fk_bi] [bigint] NOT NULL,
	[SItem_Name_vc] [varchar](30) NOT NULL,
	[SUpload_Time_sdt] [smalldatetime] NOT NULL,
	[SPrice_m] [money] NOT NULL,
	[SAuthor_vc] [varchar](30) NULL,
	[SDescription_t] [text] NULL,
	[SURL_vc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ebay_SoldItems_1] PRIMARY KEY CLUSTERED 
(
	[SItem_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ebay_SoldItems] ([SItem_ID_pk_bi], [SStudent_ID_fk_bi], [SCategory_ID_fk_bi], [SItem_Name_vc], [SUpload_Time_sdt], [SPrice_m], [SAuthor_vc], [SDescription_t], [SURL_vc]) VALUES (724, 1, 4, N'Epilogue', CAST(0x9EFD04EB AS SmallDateTime), 500.0000, N'None', N'', N'item_724.jpg')
/****** Object:  Table [dbo].[Ebay_SMS_Log_Mst]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ebay_SMS_Log_Mst](
	[Phone_c] [nchar](10) NOT NULL,
	[Date_d] [date] NOT NULL,
	[SMS_Sent_ti] [tinyint] NOT NULL,
 CONSTRAINT [PK_Ebay_SMS_Log_Mst] PRIMARY KEY CLUSTERED 
(
	[Phone_c] ASC,
	[Date_d] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of SMS sent from this mobile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ebay_SMS_Log_Mst', @level2type=N'COLUMN',@level2name=N'SMS_Sent_ti'
GO
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x24340B00 AS Date), 5)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x26340B00 AS Date), 15)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x27340B00 AS Date), 11)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x28340B00 AS Date), 9)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x29340B00 AS Date), 5)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x2A340B00 AS Date), 2)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x2B340B00 AS Date), 29)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x2C340B00 AS Date), 5)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x2D340B00 AS Date), 2)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x2E340B00 AS Date), 3)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x2F340B00 AS Date), 18)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x30340B00 AS Date), 12)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x31340B00 AS Date), 12)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x32340B00 AS Date), 10)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x33340B00 AS Date), 1)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x35340B00 AS Date), 9)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x36340B00 AS Date), 21)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x37340B00 AS Date), 12)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x38340B00 AS Date), 6)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x39340B00 AS Date), 29)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x3A340B00 AS Date), 1)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x3B340B00 AS Date), 64)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x3C340B00 AS Date), 37)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x3D340B00 AS Date), 18)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x3E340B00 AS Date), 14)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x3F340B00 AS Date), 3)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x45340B00 AS Date), 8)
INSERT [dbo].[Ebay_SMS_Log_Mst] ([Phone_c], [Date_d], [SMS_Sent_ti]) VALUES (N'7702907916', CAST(0x58340B00 AS Date), 6)
/****** Object:  Table [dbo].[Ebay_Feedback]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ebay_Feedback](
	[Sno_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[Read_bool] [bit] NOT NULL,
	[IPAddress_nc] [nchar](15) NOT NULL,
	[SentAt_sdt] [smalldatetime] NOT NULL,
	[Feedback_t] [text] NOT NULL,
 CONSTRAINT [PK_Ebay_Feedback] PRIMARY KEY CLUSTERED 
(
	[Sno_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ebay_Feedback] ON
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (2, 1, N'10.3.3.148     ', CAST(0x9ECB032D AS SmallDateTime), N'Such a nice site!!! you guys are \m/')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (3, 1, N'10.1.8.32      ', CAST(0x9ECB0479 AS SmallDateTime), N'Kudos mate ! Awesome Job :)')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (4, 1, N'10.1.8.20      ', CAST(0x9ECC005C AS SmallDateTime), N'This takes batch interaction to great level!!! Thats called creating an opportunity. Brilliant!')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (5, 1, N'10.1.8.20      ', CAST(0x9ECC0344 AS SmallDateTime), N'cudnt upload stuff for sale ...getting internal error ... at 1337 , 21-04-2011.')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (7, 1, N'10.1.8.20      ', CAST(0x9ECC0496 AS SmallDateTime), N'no reply option for received messages.
give us more lines for description. more than 1 gives an error.')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (8, 1, N'10.3.6.56      ', CAST(0x9ECC051F AS SmallDateTime), N'May be good if you could have a list view also, n sorting alphabetically or by price...')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (9, 1, N'10.4.1.140     ', CAST(0x9ECD01D8 AS SmallDateTime), N'10 times you try to upload, and you succeed only one time :(
Anyway, a very good site, extremely useful. Kudos to the developers!')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (10, 1, N'10.1.8.32      ', CAST(0x9ECD0322 AS SmallDateTime), N'forgot my password :(')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (11, 1, N'10.4.1.176     ', CAST(0x9ECD0444 AS SmallDateTime), N'how to reply back to a msg sent to me ??????????????????')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (12, 1, N'10.4.1.176     ', CAST(0x9ECD0447 AS SmallDateTime), N'how to reply to someone who mssged me ???????
plz pm The_Bloke on dc :))')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (14, 1, N'10.3.1.41      ', CAST(0x9ECE0590 AS SmallDateTime), N'i had entered a password while registering...
i am somehow not able to login with the same username and password...
and thr is no option of forgot password too...
pls check...
my id is :
2008A7PS002G')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (15, 1, N'10.1.8.30      ', CAST(0x9ECF006C AS SmallDateTime), N'you guys roxx 
awesome site 
kudos to developers
hats off __/\__
:)')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (16, 1, N'10.1.8.32      ', CAST(0x9ECF0554 AS SmallDateTime), N'great work guys \m/  ......')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (18, 1, N'10.1.8.31      ', CAST(0x9ED10310 AS SmallDateTime), N'Hey this is Nishanth. How do I reply to messages that I get? thanks! My email is n.paul.1424@gmail.com')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (19, 1, N'10.4.3.58      ', CAST(0x9ED50397 AS SmallDateTime), N'rishabhsinha89@gmail.com
kuch toh kar.kch site.')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (20, 1, N'10.3.3.94      ', CAST(0x9ED5054F AS SmallDateTime), N'Heyy guys!! gr8 job!! Noticed smthng trivial....u guys misspelt the word "designing" as "desgining" .')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (21, 1, N'10.1.8.31      ', CAST(0x9EDE0057 AS SmallDateTime), N'>While browsing for different items the items must be shown in list view instead of icons, coz then the full names of the items are not seen.
>change the default image of a item.')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (22, 1, N'10.1.8.31      ', CAST(0x9EDE0059 AS SmallDateTime), N'the idea is really awesome, but it is not implemented in the way it could be a lot more useful.')
INSERT [dbo].[Ebay_Feedback] ([Sno_bi], [Read_bool], [IPAddress_nc], [SentAt_sdt], [Feedback_t]) VALUES (23, 1, N'10.1.8.30      ', CAST(0x9EE0037F AS SmallDateTime), N'nice site :)')
SET IDENTITY_INSERT [dbo].[Ebay_Feedback] OFF
/****** Object:  Table [dbo].[Ebay_ErrorList]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ebay_ErrorList](
	[Sno_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorType_vc] [varchar](100) NOT NULL,
	[Error_Desctiption_t] [text] NOT NULL,
	[Time_sdt] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Ebay_ErrorList] PRIMARY KEY CLUSTERED 
(
	[Sno_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A Serial number for count on number of errors' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ebay_ErrorList', @level2type=N'COLUMN',@level2name=N'Sno_bi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tells where the error has occured. Eg: While sending mail etc...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ebay_ErrorList', @level2type=N'COLUMN',@level2name=N'ErrorType_vc'
GO
SET IDENTITY_INSERT [dbo].[Ebay_ErrorList] ON
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (142, N'ProfilePage.cs - insertItem_DetailsView_itemInserted', N'Cannot create a file when that file already exists.
, Stack -    at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.__Error.WinIOError()
   at System.IO.File.Move(String sourceFileName, String destFileName)
   at Profile_Default.insertItem_DetailsView_ItemInserted(Object sender, DetailsViewInsertedEventArgs e) in c:\Inetpub\wwwroot\Profile_page\Default.aspx.cs:line 244, Target Site - Void WinIOError(Int32, System.String)', CAST(0x9EDA059F AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (153, N'ProfilePage.cs - insertItem_DetailsView_itemInserted', N'Cannot create a file when that file already exists.
, Stack -    at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.__Error.WinIOError()
   at System.IO.File.Move(String sourceFileName, String destFileName)
   at Profile_Default.insertItem_DetailsView_ItemInserted(Object sender, DetailsViewInsertedEventArgs e) in c:\Inetpub\wwwroot\Profile_page\Default.aspx.cs:line 243, Target Site - Void WinIOError(Int32, System.String)', CAST(0x9EDB04DB AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (154, N'ProfilePage.cs - UpdateUploadedPic', N'Index was outside the bounds of the array., Stack -    at Profile_Default.UpdateUploadedPicName(String imgName) in c:\Inetpub\wwwroot\Profile_page\Default.aspx.cs:line 285, Target Site - Void UpdateUploadedPicName(System.String)', CAST(0x9EDD006B AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (157, N'Adv Search', N'Cannot find table 0., Stack -    at System.Data.DataTableCollection.get_Item(Int32 index)
   at Advanced_Search_Default.Page_Load(Object sender, EventArgs e) in c:\Inetpub\wwwroot\Advanced_Search\Default.aspx.cs:line 101, Target Site - System.Data.DataTable get_Item(Int32)', CAST(0x9EDD055F AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (161, N'Adv Search - Btn Click', N'Cannot find table 0., Stack -    at System.Data.DataTableCollection.get_Item(Int32 index)
   at Advanced_Search_Default.CallSearch_DataBind(Int32 count, Int32[] indexes, String[] searchKeys) in c:\Inetpub\wwwroot\Advanced_Search\Default.aspx.cs:line 227
   at Advanced_Search_Default.Search_Button_Click(Object sender, EventArgs e) in c:\Inetpub\wwwroot\Advanced_Search\Default.aspx.cs:line 183, Target Site - System.Data.DataTable get_Item(Int32)', CAST(0x9EDD0562 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (162, N'Common Functions - Image Processing', N'Parameter is not valid., Stack -    at System.Drawing.Bitmap..ctor(String filename)
   at CommonFunctions.ImageProcessing(String saveLocation, FileUpload imageUpload, String filename, String purpose) in c:\Inetpub\wwwroot\App_Code\CommonQueries\CommonFunctions.cs:line 137, Target Site - Void .ctor(System.String)', CAST(0x9EDF01FD AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (170, N'ProfilePage.cs - insertItem_DetailsView_itemInserted', N'Cannot create a file when that file already exists.
, Stack -    at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.__Error.WinIOError()
   at System.IO.File.Move(String sourceFileName, String destFileName)
   at Profile_Default.insertItem_DetailsView_ItemInserted(Object sender, DetailsViewInsertedEventArgs e) in c:\Inetpub\wwwroot\Profile_page\Default.aspx.cs:line 244, Target Site - Void WinIOError(Int32, System.String)', CAST(0x9EE004F0 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (172, N'ProfilePage.cs - insertItem_DetailsView_itemInserted', N'Cannot create a file when that file already exists.
, Stack -    at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.__Error.WinIOError()
   at System.IO.File.Move(String sourceFileName, String destFileName)
   at Profile_Default.insertItem_DetailsView_ItemInserted(Object sender, DetailsViewInsertedEventArgs e) in c:\Inetpub\wwwroot\Profile_page\Default.aspx.cs:line 243, Target Site - Void WinIOError(Int32, System.String)', CAST(0x9EE004F3 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (174, N'ProfilePage.cs - Item Image Deleting ID : 543', N'Index was outside the bounds of the array., Stack -    at Profile_Default.UploadedItems_ListView_ItemDeleting(Object sender, ListViewDeleteEventArgs e) in c:\Inetpub\wwwroot\Profile_page\Default.aspx.cs:line 390, Target Site - Void UploadedItems_ListView_ItemDeleting(System.Object, System.Web.UI.WebControls.ListViewDeleteEventArgs)', CAST(0x9EE102E4 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (176, N'Send SMS to 9049268835. Mobile used - 7702907916', N'The remote server returned an error: (500) Internal Server Error., Stack -    at System.Net.HttpWebRequest.GetResponse()
   at MyThreads.send_sms() in c:\Inetpub\wwwroot\App_Code\CommonQueries\Mailing_Messaging_Thread.cs:line 56, Target Site - System.Net.WebResponse GetResponse()', CAST(0x9EE404D9 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (177, N'Sending Mail: 7000puli@gmail.com,naren596@gmail.com', N'Failure sending mail., Stack -    at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at MyThreads.byGmail(), Target Site - Void Send(System.Net.Mail.MailMessage)', CAST(0x9EEA04C9 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (178, N'Sending Mail: 7000puli@gmail.com,naren596@gmail.com', N'Failure sending mail., Stack -    at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at MyThreads.byGmail() in c:\eBay\App_Code\CommonQueries\Mailing_Messaging_Thread.cs:line 104, Target Site - Void Send(System.Net.Mail.MailMessage)', CAST(0x9EEA04D8 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (179, N'Sending Mail: 7000puli@gmail.com,naren596@gmail.com', N'Failure sending mail., Stack -    at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at MyThreads.byGmail() in c:\eBay\App_Code\CommonQueries\Mailing_Messaging_Thread.cs:line 104, Target Site - Void Send(System.Net.Mail.MailMessage)', CAST(0x9EEA04D8 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (180, N'Sending Mail: 7000puli@gmail.com,naren596@gmail.com', N'Failure sending mail., Stack -    at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at MyThreads.byGmail() in c:\eBay\App_Code\CommonQueries\Mailing_Messaging_Thread.cs:line 104, Target Site - Void Send(System.Net.Mail.MailMessage)', CAST(0x9EEA057F AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (181, N'Sending Mail: 7000puli@gmail.com,naren596@gmail.com', N'The operation has timed out., Stack -    at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at MyThreads.byGmail() in c:\eBay\App_Code\CommonQueries\Mailing_Messaging_Thread.cs:line 104, Target Site - Void Send(System.Net.Mail.MailMessage)', CAST(0x9EFD04E6 AS SmallDateTime))
INSERT [dbo].[Ebay_ErrorList] ([Sno_bi], [ErrorType_vc], [Error_Desctiption_t], [Time_sdt]) VALUES (182, N'GetConversation', N'Failed to convert parameter value from a String to a Int64., Stack -    at System.Data.SqlClient.SqlParameter.CoerceValue(Object value, MetaType destinationType)
   at System.Data.SqlClient.SqlParameter.GetCoercedValue()
   at System.Data.SqlClient.SqlParameter.Validate(Int32 index, Boolean isCommandProc)
   at System.Data.SqlClient.SqlCommand.SetUpRPCParameters(_SqlRPC rpc, Int32 startCount, Boolean inSchema, SqlParameterCollection parameters)
   at System.Data.SqlClient.SqlCommand.BuildRPC(Boolean inSchema, SqlParameterCollection parameters, _SqlRPC& rpc)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, DbAsyncResult result)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.FillInternal(DataSet dataset, DataTable[] datatables, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, Int32 startRecord, Int32 maxRecords, String srcTable, IDbCommand command, CommandBehavior behavior)
   at System.Data.Common.DbDataAdapter.Fill(DataSet dataSet, String srcTable)
   at ProfilePage.GetConverstion(String ReplyID) in c:\eBay\App_Code\Profile_Queries\ProfilePage.cs:line 219
   at Profile_Default.helperGetConversation(String ReplyID) in c:\eBay\Profile_page\Default.aspx.cs:line 581, Target Site - System.Object CoerceValue(System.Object, System.Data.SqlClient.MetaType)', CAST(0x9F060039 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Ebay_ErrorList] OFF
/****** Object:  Table [dbo].[EBay_Category_Mst]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EBay_Category_Mst](
	[Category_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[Category_Name_vc] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EBay_Category_Mst] PRIMARY KEY CLUSTERED 
(
	[Category_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EBay_Category_Mst] ON
INSERT [dbo].[EBay_Category_Mst] ([Category_ID_pk_bi], [Category_Name_vc]) VALUES (1, N'Books')
INSERT [dbo].[EBay_Category_Mst] ([Category_ID_pk_bi], [Category_Name_vc]) VALUES (2, N'Electronics')
INSERT [dbo].[EBay_Category_Mst] ([Category_ID_pk_bi], [Category_Name_vc]) VALUES (3, N'Sports')
INSERT [dbo].[EBay_Category_Mst] ([Category_ID_pk_bi], [Category_Name_vc]) VALUES (4, N'Music')
INSERT [dbo].[EBay_Category_Mst] ([Category_ID_pk_bi], [Category_Name_vc]) VALUES (5, N'Misc')
SET IDENTITY_INSERT [dbo].[EBay_Category_Mst] OFF
/****** Object:  Table [dbo].[Ebay_Cabs]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ebay_Cabs](
	[Sno_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[Student_id_fk_bi] [bigint] NOT NULL,
	[Capasity_ti] [tinyint] NOT NULL,
	[DepartureDate_sdt] [smalldatetime] NOT NULL,
	[AddedOn_sdt] [smalldatetime] NOT NULL,
	[Destination_vc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ebay_Cabs] PRIMARY KEY CLUSTERED 
(
	[Sno_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Ebay_ConfirmUser_P]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ebay_ConfirmUser_P] 
    @StudentID bigint
AS

insert into EBay_Student (Username_vc, Password_vc, Student_Name_vc, IsAdmin_bool, Hostel_nc, BITS_ID_vc, Room_No_nc,
Phone_No_vc, PhotoURL, Signup_Time_sdt) 
select Username_vc, Password_vc, Student_Name_vc, IsAdmin_bool, 
Hostel_nc, BITS_ID_vc, Room_No_nc, Phone_No_vc, PhotoURL, Signup_Time_sdt from EBay_TempStudent 
where Student_ID_pk_bi = @StudentID

Print 'Tranfser Completed Successfully... Deleting from Ebay_TempStudent table.'

delete from EBay_TempStudent where Student_ID_pk_bi = @StudentID

Print 'Deleted. \n\r Transaction Successful :) '
GO
/****** Object:  Table [dbo].[Ebay_CloudDictionary]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ebay_CloudDictionary](
	[ByStudent_ID_fk_bi] [bigint] NOT NULL,
	[Type_c] [char](10) NULL,
	[CloudValue_vc] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This describes about the type of Cloud.
For now it is either
1) ItemsCloud represented as Item
2) StudentsCloud represented as Student' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ebay_CloudDictionary', @level2type=N'COLUMN',@level2name=N'Type_c'
GO
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (51, N'Item      ', N'Idea netsetter datacard')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (166, N'Item      ', N'headset')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (34, N'Item      ', N'speaker')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (230, N'Student   ', N'kairav')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (7, N'Item      ', N'java')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (194, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (181, N'Item      ', N'speakers')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (66, N'Item      ', N'guitar')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (66, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (66, N'Item      ', N'electronics')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (114, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (114, N'Item      ', N'electronic items')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (118, N'Item      ', N'datacard')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (123, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (123, N'Item      ', N'table fan')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (5, N'Item      ', N'money banking')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (5, N'Item      ', N'java')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (5, N'Student   ', N'nitin pasumarthy')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (5, N'Student   ', N'saket adusumilli')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (5, N'Student   ', N'shiva')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (5, N'Student   ', N'gada')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (195, N'Item      ', N'hard drive')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (203, N'Item      ', N'carry bag')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (203, N'Item      ', N'bag')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (3, N'Student   ', N'nitin')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (98, N'Item      ', N'cas')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (39, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (39, N'Item      ', N'electronics')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (39, N'Item      ', N'miscellaneous')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (236, N'Item      ', N'java')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (236, N'Item      ', N'complete reference')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (236, N'Item      ', N'hard disk')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (298, N'Item      ', N'Speaker')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (298, N'Student   ', N'Electric Cooker')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (298, N'Student   ', N'Electric Kettle')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (298, N'Student   ', N'Emergency light')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (319, N'Item      ', N'travelling bag')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (163, N'Item      ', N'pendrives')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (279, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (10, N'Item      ', N'dumbell')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (10, N'Item      ', N'dumb')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (24, N'Item      ', N'external hdd 1tb')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (10, N'Item      ', N'dumbel')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (53, N'Item      ', N'speakers')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (99, N'Item      ', N'speakers')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (99, N'Item      ', N'table lamp')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (172, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (40, N'Item      ', N'all')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (40, N'Student   ', N'any')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (38, N'Item      ', N'electronics')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (38, N'Item      ', N'books')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (38, N'Item      ', N'music')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (35, N'Item      ', N'Chemical CDCs')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (58, N'Item      ', N'speaker')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (1, N'Item      ', N'hall')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (1, N'Item      ', N'douglas hall')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (1, N'Item      ', N'MUP')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (1, N'Item      ', N'micro processor')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (211, N'Item      ', N'Pendrives')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (211, N'Item      ', N'Pen Drives')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (70, N'Item      ', N'pendrive')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (183, N'Item      ', N'CS CDC')
INSERT [dbo].[Ebay_CloudDictionary] ([ByStudent_ID_fk_bi], [Type_c], [CloudValue_vc]) VALUES (1, N'Student   ', N'Nitin Pasumarthy')
/****** Object:  Table [dbo].[Ebay_PasswordReset]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ebay_PasswordReset](
	[Student_ID_fk_bi] [bigint] NOT NULL,
	[SecurityKey_nc] [nchar](30) NOT NULL,
	[Date_sdt] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EBay_Notices]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBay_Notices](
	[Notices_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[IsModerated_bool] [bit] NOT NULL,
	[Student_ID_fk_bi] [bigint] NOT NULL,
	[Upload_Time_sdt] [smalldatetime] NOT NULL,
	[Expiry_Date_sdt] [smalldatetime] NOT NULL,
	[Notice_t] [text] NOT NULL,
 CONSTRAINT [PK_EBay_Notices] PRIMARY KEY CLUSTERED 
(
	[Notices_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Didnt chnage the Col name to Notice_vc as code is already written for the same. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EBay_Notices', @level2type=N'COLUMN',@level2name=N'Notice_t'
GO
SET IDENTITY_INSERT [dbo].[EBay_Notices] ON
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (3, 1, 5, CAST(0x9ECA0376 AS SmallDateTime), CAST(0x9ECB0000 AS SmallDateTime), N'ps2 stations are out....check them in pilani site')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (6, 1, 139, CAST(0x9EDF0256 AS SmallDateTime), CAST(0x9EE60000 AS SmallDateTime), N'Few people calling me for study light and toaster hostel number has been updated you are free to come at anytime and buy them :)')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (8, 1, 288, CAST(0x9EE001AE AS SmallDateTime), CAST(0x9EE50000 AS SmallDateTime), N'PLCC,CN & ACO buks for sale..pm temperature on DC')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (10, 1, 180, CAST(0x9EE1034C AS SmallDateTime), CAST(0x9EF40000 AS SmallDateTime), N'brand new Yonex tennis racket for sale @500 bucks... contact lier on dc or 9823635932')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (12, 1, 263, CAST(0x9EE10490 AS SmallDateTime), CAST(0x9EE20000 AS SmallDateTime), N'corrosion engineering , nanoscience and numal book for sale. prices negotiable.')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (13, 1, 263, CAST(0x9EE10491 AS SmallDateTime), CAST(0x9EE20000 AS SmallDateTime), N'Cosco max power lawn tennis racket for sale at low prices...all strings perfect.')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (14, 1, 132, CAST(0x9EE104AD AS SmallDateTime), CAST(0x9EE50000 AS SmallDateTime), N'Microprocessors and Interfacing textbook for sale')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (15, 1, 257, CAST(0x9EE104B1 AS SmallDateTime), CAST(0x9EF40000 AS SmallDateTime), N'numerical analysis and operations research books for sale .. call now 9049269064')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (16, 1, 257, CAST(0x9EE104B2 AS SmallDateTime), CAST(0x9EF40000 AS SmallDateTime), N'advd book rabbey and power electronics book for sale call now 9049269064')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (17, 1, 257, CAST(0x9EE104B4 AS SmallDateTime), CAST(0x9EF40000 AS SmallDateTime), N'optimization book for sale call  now 9049269064')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (24, 1, 257, CAST(0x9EE1058F AS SmallDateTime), CAST(0x9EF40000 AS SmallDateTime), N'few eni text books at sale call 9049269064')
INSERT [dbo].[EBay_Notices] ([Notices_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Expiry_Date_sdt], [Notice_t]) VALUES (27, 1, 264, CAST(0x9EE2005B AS SmallDateTime), CAST(0x9EF40000 AS SmallDateTime), N'Havell Table Fan. Perfect Condition. Has a second fan for evenly distributing fan flow. Perfect for Goa Heat. Price Negotiable.
Call 9011183485')
SET IDENTITY_INSERT [dbo].[EBay_Notices] OFF
/****** Object:  Table [dbo].[EBay_Message]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBay_Message](
	[Message_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[fromStudent_ID_fk_bi] [bigint] NOT NULL,
	[toStudent_ID_fk_bi] [bigint] NOT NULL,
	[Message_Read_bool] [bit] NOT NULL,
	[Upload_Time_sdt] [smalldatetime] NOT NULL,
	[Message_t] [text] NOT NULL,
	[Root_Message_ID_pk_bi] [bigint] NULL,
	[RepliedFor_Message_ID_pk_bi] [bigint] NULL,
 CONSTRAINT [PK_EBay_Message] PRIMARY KEY CLUSTERED 
(
	[Message_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores the Root Message ID for replies to itself as well as its children. For example, if child @ level 2 was replied, this col stores the Ultimate root message ID for the tree no matter to which level child the message was replied. Used for conversation Display' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EBay_Message', @level2type=N'COLUMN',@level2name=N'Root_Message_ID_pk_bi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores the Actual Message ID (Can be a some level child of root) for which the user Replied whereas the Root_Message_ID_pk_bi stores the Root message for all the replies. Used for Conversation display.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EBay_Message', @level2type=N'COLUMN',@level2name=N'RepliedFor_Message_ID_pk_bi'
GO
SET IDENTITY_INSERT [dbo].[EBay_Message] ON
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (6, 9, 5, 1, CAST(0x9ECB02FC AS SmallDateTime), N'<b>Item :</b> macroeconomics<br /><b>Subject :</b> <p>can i lend this book for my compre xam ??</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (8, 3, 5, 1, CAST(0x9ECB031B AS SmallDateTime), N'<b>Item :</b> microeconomic theory<br /><b>Subject :</b> hi<p>hi ... how u doing ??
Congrats on ur successfl launch :) </p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (11, 23, 12, 1, CAST(0x9ECB04F1 AS SmallDateTime), N'<b>Item :</b> Office Chair<br /><b>Subject :</b> can i see the chair??<p>can i see the chair??
ping me my cell no is 09975566801

ch2 , 123</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (13, 32, 25, 1, CAST(0x9ECC0049 AS SmallDateTime), N'<b>Item :</b> Creative 2.1<br /><b>Subject :</b> interested in your speakers<p>what is the xact model no. and how old is it ? ne distortions in sound ?</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (14, 33, 25, 1, CAST(0x9ECC004A AS SmallDateTime), N'<b>Item :</b> Creative 2.1<br /><b>Subject :</b> Regarding ur Creative 2.1<p>I would definitely purchase it. Can u let me know till when u can hold the product. It would be comfortable for me if i can buy it next sem. </p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (15, 41, 25, 1, CAST(0x9ECC005A AS SmallDateTime), N'<b>Item :</b> Creative 2.1<br /><b>Subject :</b> hi<p>hey! wud u b willing to sell it for 300-350?</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (16, 53, 25, 1, CAST(0x9ECC0064 AS SmallDateTime), N'<b>Item :</b> Creative 2.1<br /><b>Subject :</b> buy<p>dude interested in buying </p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (17, 53, 12, 1, CAST(0x9ECC0065 AS SmallDateTime), N'<b>Item :</b> Altec Lansing 2.1 Speakers<br /><b>Subject :</b> buy<p>interested in buying but quoted price too high do tell if interested in selling for lesser amt</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (18, 55, 25, 1, CAST(0x9ECC0067 AS SmallDateTime), N'<b>Item :</b> Creative 2.1<br /><b>Subject :</b> <p>how many watts??
i want 2 buy
</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (19, 60, 25, 1, CAST(0x9ECC006A AS SmallDateTime), N'<b>Item :</b> Creative 2.1<br /><b>Subject :</b> <p>hi , me Sephiroth dc nik , i would like to know how many years old are those ?</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (23, 27, 92, 1, CAST(0x9ECC02BB AS SmallDateTime), N'<b>Item :</b> 2.0 USB speakers<br /><b>Subject :</b> <p>i want to buy. when you free contact my cell 8983861022</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (31, 105, 92, 1, CAST(0x9ECC03DD AS SmallDateTime), N'<b>Item :</b> 2.0 USB speakers<br /><b>Subject :</b> <p>which company?</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (32, 93, 12, 1, CAST(0x9ECC042D AS SmallDateTime), N'<b>Item :</b> Office Chair<br /><b>Subject :</b> <p>condition??</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (36, 118, 90, 1, CAST(0x9ECC04FC AS SmallDateTime), N'<b>Item :</b> bsnl 3g datacard<br /><b>Subject :</b> regarding datacard<p>I m interested in purchasing the datacard . Let me know  </p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (43, 20, 102, 1, CAST(0x9ECD040E AS SmallDateTime), N'<b>Item :</b> Marshall 15W guitar amp MG15CD<br /><b>Subject :</b> <p>3502 ?
how specific</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (44, 60, 142, 0, CAST(0x9ECD0436 AS SmallDateTime), N'<b>Item :</b> Creative 2.1 (A300)<br /><b>Subject :</b> speakers<p>how old are they?</p>', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (59, 166, 32, 0, CAST(0x9ED00446 AS SmallDateTime), N'<b>Item :</b> Enter Bluetooth Headset<br /><b>Subject :</b> BT headset<p>Hey, im willing to buy.... is it still up for sale?</p><br /> <b>Phone :</b> 8149189342', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (60, 177, 63, 0, CAST(0x9ED004C4 AS SmallDateTime), N'<b>Item :</b> SX Electric Guitar <br /><b>Subject :</b> Regarding Guitar<p>hey hi......clarify some of my doubts-Which company guitar, how many yrs old and most importantly why you wanna sell it?</p><br /> <b>Phone :</b> 8888818014', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (65, 172, 185, 1, CAST(0x9ED0056F AS SmallDateTime), N'<b>Item :</b> All 2-1 text books<br /><b>Subject :</b> <p>Dude,what is the condition of the 2-1 books u r sellin??n considerin m in electronics,u hav all books i will be needing in my 2-1??</p><br /> <b>Phone :</b> 9637423566', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (66, 172, 185, 1, CAST(0x9ED0056F AS SmallDateTime), N'<b>Item :</b> All 2-1 text books<br /><b>Subject :</b> <p>Dude,what is the condition of the 2-1 books u r sellin??n considerin m in electronics,u hav all books i will be needing in my 2-1??</p><br /> <b>Phone :</b> 9637423566', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (69, 193, 46, 0, CAST(0x9ED1037F AS SmallDateTime), N'<b>Item :</b> football studs<br /><b>Subject :</b> <p>how old and what brand???</p><br /> <b>Phone :</b> 9545970851', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (71, 194, 64, 0, CAST(0x9ED10420 AS SmallDateTime), N'<b>Item :</b> 3-D Red green Glasses<br /><b>Subject :</b> 3 d glasses<p>hey i want to buy it . pls mail to me deepkuckreja@gmail.com
if you have it</p><br /> <b>Phone :</b> 7276771584', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (80, 35, 146, 1, CAST(0x9ED30341 AS SmallDateTime), N'<b>Item :</b> Mattress<br /><b>Subject :</b> <p>will buy your mattress if u hvnt sold it yet</p><br /> <b>Phone :</b> 9823623840', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (106, 210, 90, 1, CAST(0x9ED403CC AS SmallDateTime), N'<b>Item :</b> bsnl 3g datacard<br /><b>Subject :</b> Regarding purchasing<p>Hi, this is Sudhir.....I want to buy the 3g datacard. i want to know why you are selling this product within two months.</p><br /> <b>Phone :</b> 9823606694', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (109, 211, 31, 1, CAST(0x9ED40586 AS SmallDateTime), N'<b>Item :</b> Pen drive<br /><b>Subject :</b> Interested<p>Hi is the price negotiable?</p><br /> <b>Phone :</b> 9049269025', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (110, 51, 219, 0, CAST(0x9ED50090 AS SmallDateTime), N'<b>Item :</b> Idea Netsetter Data Card<br /><b>Subject :</b> Interested<p>I am interested in buying your idea netsetter. Please tell me the model number and other details.</p><br /> <b>Phone :</b> 7587031413', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (114, 224, 31, 1, CAST(0x9ED502DF AS SmallDateTime), N'<b>Item :</b> Pen drive<br /><b>Subject :</b> pen drive<p>your pen drive still up for grabs??
wanna buy it.</p><br /> <b>Phone :</b> 9049269025', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (115, 224, 31, 1, CAST(0x9ED502DF AS SmallDateTime), N'<b>Item :</b> Pen drive<br /><b>Subject :</b> pen drive<p>your pen drive still up for grabs??
wanna buy it.</p><br /> <b>Phone :</b> 9049269025', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (116, 70, 31, 1, CAST(0x9ED50310 AS SmallDateTime), N'<b>Item :</b> Pen drive<br /><b>Subject :</b> <p>is it sold out or der???</p><br /> <b>Phone :</b> 9049269025', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (117, 73, 213, 0, CAST(0x9ED60001 AS SmallDateTime), N'<b>Item :</b> All Mech CDC sem 1/2 Books<br /><b>Subject :</b> <p>Is it 50/- or 50% ??

I can buy... pls reply ASAP</p><br /> <b>Phone :</b> 9730597549', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (128, 56, 219, 0, CAST(0x9EDA021F AS SmallDateTime), N'<b>Item :</b> Idea Netsetter Data Card<br /><b>Subject :</b> <p>i need it for sure i will take it in two days i will call u back in the after or else give give ur dc nick</p><br /> <b>Phone :</b> 7587031413', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (129, 210, 12, 0, CAST(0x9EDA02A7 AS SmallDateTime), N'<b>Item :</b> Office Chair<br /><b>Subject :</b> <p>Hi, This is Sudhir.Please tell me the price at you want to sell it</p><br /> <b>Phone :</b> 9823631623', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (130, 210, 90, 1, CAST(0x9EDA02BE AS SmallDateTime), N'<b>Item :</b> bsnl 3g datacard<br /><b>Subject :</b> <p>how much you need for this datacard</p><br /> <b>Phone :</b> 9823606694', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (132, 252, 251, 0, CAST(0x9EDB0004 AS SmallDateTime), N'<b>Item :</b> Bucket Water Heater<br /><b>Subject :</b> koi nai lega<p>ps2 ke time tuze hi kaam ayega....</p><br /> <b>Phone :</b> 9823623966', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (133, 107, 22, 0, CAST(0x9EDB030A AS SmallDateTime), N'<b>Item :</b> Keyboard-Lover a.ka. Shadow<br /><b>Subject :</b> <p>will u sell for 50 ps ?</p><br /> <b>Phone :</b> 8105568977', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (147, 194, 242, 1, CAST(0x9EDB04EA AS SmallDateTime), N'<b>Item :</b> Theory of Computation<br /><b>Subject :</b> <p>yeah i want it , tell your room num, ph no mail me deepkuckreja@gmail.com(9763739125)</p><br /> <b>Phone :</b> 8600308129', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (153, 160, 261, 0, CAST(0x9EDC0362 AS SmallDateTime), N'<b>Item :</b> Whiteboard<br /><b>Subject :</b> interestes in white board<p>hey... i am interested in the white board.... whats the size?</p><br /> <b>Phone :</b> 9960359033', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (154, 51, 31, 1, CAST(0x9EDD0046 AS SmallDateTime), N'<b>Item :</b> Mech CDC books<br /><b>Subject :</b> Books<p>Hey! Are you selling all the CDC Books for 3-1</p><br /> <b>Phone :</b> 9049269025', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (163, 64, 231, 0, CAST(0x9EDD0550 AS SmallDateTime), N'<b>Item :</b> Electric Kettle<br /><b>Subject :</b> ebay Hello Hi<p>i want 2 purchase the electric kettle
Final the price a bit
as it is an electronic item
Hope u will consider my req. 
thanking u
bye</p><br /> <b>Phone :</b> 9730597635', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (166, 148, 12, 0, CAST(0x9EDE017D AS SmallDateTime), N'<b>Item :</b> Mech CDC sem 1/2 Books<br /><b>Subject :</b> <p>40 rs ??? really ??
hows d condition of the books ??</p><br /> <b>Phone :</b> 9823631623', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (167, 148, 272, 0, CAST(0x9EDE017E AS SmallDateTime), N'<b>Item :</b> steel glass<br /><b>Subject :</b> lol<p></p><br /> <b>Phone :</b> 9764058730', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (168, 1, 5, 1, CAST(0x9EDE02FE AS SmallDateTime), N'<b>Item :</b> macroeconomics<br /><b>Subject :</b> Checking naren<p>Whats the phone number u r getting for this msg ?</p><br /> <b>Phone :</b> 9765763023', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (171, 275, 146, 1, CAST(0x9EDF027F AS SmallDateTime), N'<b>Item :</b> Mattress<br /><b>Subject :</b> <p>wah bete kya photuu lagai hai :P</p><br /> <b>Phone :</b> 9823623840', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (172, 132, 180, 0, CAST(0x9EDF0512 AS SmallDateTime), N'<b>Item :</b> Apron<br /><b>Subject :</b> apron<p>When I can borrow why the hell should I buy from u?</p><br /> <b>Phone :</b> 9823635932', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (173, 250, 285, 0, CAST(0x9EE00074 AS SmallDateTime), N'<b>Item :</b> Emrgncy Light + Free TableLamp<br /><b>Subject :</b> <p>bhaiya i am interested in buying ur emergency light and perhaps ur keyboard mouse set....can i come on 12th or 13th or 14th may??</p><br /> <b>Phone :</b> 9561988961', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (186, 282, 162, 0, CAST(0x9EE000C8 AS SmallDateTime), N'<b>Item :</b> Desktop(with monitor)<br /><b>Subject :</b> <p>Hey dude i wanted ur internal HD.R u willing to sell.If so how much ?</p><br /> <b>Phone :</b> 9561431423', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (187, 236, 173, 0, CAST(0x9EE0056E AS SmallDateTime), N'<b>Item :</b> Head First Java-2nd edition<br /><b>Subject :</b> <p>the original book online costs rs 350 in flipkart :P</p><br /> <b>Phone :</b> 9049268866', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (188, 199, 251, 0, CAST(0x9EE00587 AS SmallDateTime), N'<b>Item :</b> 2 floor stand<br /><b>Subject :</b> <p>is it still for sale 
I want to take it 
what will be the final price
when do i come</p><br /> <b>Phone :</b> 8888083841', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (189, 199, 31, 1, CAST(0x9EE10023 AS SmallDateTime), N'<b>Item :</b> Pen drive<br /><b>Subject :</b> <p>i will buy both pen drive and spike guard if u decrease price.
Reply me to say when should i meet u</p><br /> <b>Phone :</b> 8888083841', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (190, 222, 280, 0, CAST(0x9EE101C5 AS SmallDateTime), N'<b>Item :</b> Table Clock<br /><b>Subject :</b> is this alarm clock????????<p></p><br /> <b>Phone :</b> 9657273053', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (192, 30, 276, 0, CAST(0x9EE10430 AS SmallDateTime), N'<b>Item :</b> Canon EF 35-105mm lens<br /><b>Subject :</b> <p>Hey...How old is that lens?</p><br /> <b>Phone :</b> 8888312788', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (194, 257, 284, 0, CAST(0x9EE2002F AS SmallDateTime), N'<b>Item :</b> Dell XPS 1530<br /><b>Subject :</b> <p>can you sell me only bluetooth headset?</p><br /> <b>Phone :</b> 9049269064', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (195, 313, 280, 0, CAST(0x9EE20030 AS SmallDateTime), N'<b>Item :</b> Broom<br /><b>Subject :</b> <p>i wannn :P</p><br /> <b>Phone :</b> 7709790830', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (196, 282, 213, 0, CAST(0x9EE30278 AS SmallDateTime), N'<b>Item :</b> Mech CDC sem 1/2 Books<br /><b>Subject :</b> <p>u still have those books... if so can u ping me on dc .nick is Giggs.</p><br /> <b>Phone :</b> 9637449172', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (197, 178, 308, 0, CAST(0x9EE30437 AS SmallDateTime), N'<b>Item :</b> Study Lamp<br /><b>Subject :</b> Hii<p>Hey ,
I want to buy it. My no:9049679452
Ch1-326.</p><br /> <b>Phone :</b> 9049679452', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (200, 1, 1, 0, CAST(0x9F07036B AS SmallDateTime), N'Root', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (211, 234, 1, 1, CAST(0x9F040596 AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(200)">View this conversation</a><br />Msg1', 200, 200)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (213, 100, 1, 1, CAST(0x9F06006D AS SmallDateTime), N'<b>Item :</b> cap<br /><b>Subject :</b> Wassup<p>Checking reply</p><br /> <b>Phone :</b> 9049268835', NULL, NULL)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (214, 99, 1, 1, CAST(0x9F06006E AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(213)">View this conversation</a><br />hi nitu!', 213, 213)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (215, 24, 1, 1, CAST(0x9F060092 AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(213)">View this conversation</a><br />R1', 213, 213)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (216, 56, 1, 1, CAST(0x9F060092 AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(214)">View this conversation</a><br />R2', 213, 214)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (217, 11, 1, 1, CAST(0x9F060093 AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(216)">View this conversation</a><br />R4', 213, 216)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (218, 10, 1, 1, CAST(0x9F0602E2 AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(214)">View this conversation</a><br />218', 213, 214)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (219, 9, 1, 1, CAST(0x9F0602E2 AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(216)">View this conversation</a><br />219', 213, 216)
INSERT [dbo].[EBay_Message] ([Message_ID_pk_bi], [fromStudent_ID_fk_bi], [toStudent_ID_fk_bi], [Message_Read_bool], [Upload_Time_sdt], [Message_t], [Root_Message_ID_pk_bi], [RepliedFor_Message_ID_pk_bi]) VALUES (220, 7, 1, 1, CAST(0x9F0602E3 AS SmallDateTime), N'<a href="javascript:void(0)" onclick="ShowConversation(219)">View this conversation</a><br />210', 213, 219)
SET IDENTITY_INSERT [dbo].[EBay_Message] OFF
/****** Object:  Table [dbo].[EBay_LAF]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBay_LAF](
	[LAF_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[IsModerated_bool] [bit] NOT NULL,
	[Student_ID_fk_bi] [bigint] NOT NULL,
	[Upload_Time_sdt] [smalldatetime] NOT NULL,
	[Text_t] [text] NOT NULL,
 CONSTRAINT [PK_EBay_LAF] PRIMARY KEY CLUSTERED 
(
	[LAF_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Didnt chnage the Col name to Text_vc as code is already written for the same. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EBay_LAF', @level2type=N'COLUMN',@level2name=N'Text_t'
GO
SET IDENTITY_INSERT [dbo].[EBay_LAF] ON
INSERT [dbo].[EBay_LAF] ([LAF_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Text_t]) VALUES (2, 1, 3, CAST(0x9EC9042B AS SmallDateTime), N'Lost my DBMS/PLCC notes in CC')
INSERT [dbo].[EBay_LAF] ([LAF_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Text_t]) VALUES (5, 1, 158, CAST(0x9ECE050F AS SmallDateTime), N'i lost my silver color titan watch if any one finds it plz tell me-8888818023')
INSERT [dbo].[EBay_LAF] ([LAF_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Text_t]) VALUES (8, 1, 219, CAST(0x9ED5006A AS SmallDateTime), N'A black LEWIS wallet with around 2500 rupees and a SIM card, ATM card and ID card lost. Contact 07587031413 or abhishekagrawal.bits@gmail.com if found.')
INSERT [dbo].[EBay_LAF] ([LAF_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Text_t]) VALUES (9, 1, 240, CAST(0x9ED704F0 AS SmallDateTime), N'LOST!                  LOST!!                 LOST!!!
A red Nokia 5300 was lost somewhere near Backstage of Audi or near library last week. Actually loaned it to a friend who lost it. If anyone please finds the red coloured slider phone Nokia 5300 ExpressMusic please contact. 9823617128
Also please tell others about this....very important to find it!! Especially Dance Club members during or before Dance Night. Wasgiven to a dance club member.')
INSERT [dbo].[EBay_LAF] ([LAF_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Text_t]) VALUES (17, 1, 194, CAST(0x9EE20516 AS SmallDateTime), N'ID card of Rayala Surya Teja found, pls take it from ah6 325')
INSERT [dbo].[EBay_LAF] ([LAF_ID_pk_bi], [IsModerated_bool], [Student_ID_fk_bi], [Upload_Time_sdt], [Text_t]) VALUES (18, 1, 327, CAST(0x9EE4004D AS SmallDateTime), N'A black coloured woodland wallet containing a driving licence(in name of vikramjit sidhu), an ECHS card and an ATM card, lost outside the library. pls call 9975151247, i need the documents urgently.')
SET IDENTITY_INSERT [dbo].[EBay_LAF] OFF
/****** Object:  Table [dbo].[EBay_Item]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EBay_Item](
	[Item_ID_pk_bi] [bigint] IDENTITY(1,1) NOT NULL,
	[Student_ID_fk_bi] [bigint] NOT NULL,
	[Category_ID_fk_bi] [bigint] NOT NULL,
	[Item_Name_vc] [varchar](30) NOT NULL,
	[Upload_Time_sdt] [smalldatetime] NOT NULL,
	[Price_m] [money] NOT NULL,
	[Author_vc] [varchar](30) NULL,
	[Description_t] [text] NULL,
	[URL_vc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EBay_Item] PRIMARY KEY CLUSTERED 
(
	[Item_ID_pk_bi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EBay_Item] ON
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (6, 3, 1, N'ANSI C', CAST(0x9EC9042B AS SmallDateTime), 100.0000, NULL, N'Author : BalaGuruswamy 

Plzz sum1 buy :(', N'item_6.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (7, 5, 1, N'microeconomic theory a matheti', CAST(0x9ECA0374 AS SmallDateTime), 200.0000, NULL, N'microeconomics cdc book', N'item_7.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (8, 5, 1, N'macroeconomics', CAST(0x9ECB02DD AS SmallDateTime), 100.0000, N'None', N'', N'item_8.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (13, 3, 1, N'head first C#', CAST(0x9ECB0314 AS SmallDateTime), 500.0000, NULL, N'Oreilly publishers
New book -->excellent condition ', N'item_13.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (14, 11, 1, N'Quantum Computation', CAST(0x9ECB0340 AS SmallDateTime), 200.0000, N'None', N'Text Book by nelson and chuang', N'item_14.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (15, 11, 1, N'Neural Networks', CAST(0x9ECB0342 AS SmallDateTime), 250.0000, N'None', N'Text book for Neural Networks Elective by Zurada', N'item_15.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (18, 12, 5, N'Office Chair', CAST(0x9ECB0355 AS SmallDateTime), 1500.0000, N'None', N'Same as the product display pic.', N'item_18.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (29, 19, 1, N'Biology Textbooks', CAST(0x9ECB042D AS SmallDateTime), 255.0000, N'None', N'@50% price', N'item_29.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (30, 19, 1, N'Biology Raven', CAST(0x9ECB042E AS SmallDateTime), 350.0000, N'None', N'@ 50 % mrp', N'item_30.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (31, 19, 1, N'thermodynamics Text', CAST(0x9ECB0430 AS SmallDateTime), 250.0000, N'None', N'@ 50 % price', N'item_31.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (32, 19, 1, N'MOS Textbook', CAST(0x9ECB0431 AS SmallDateTime), 450.0000, N'None', N'the rarest book on campus !! ping fast for next sem', N'item_32.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (33, 19, 1, N'Biomedical Instrumentation ', CAST(0x9ECB0432 AS SmallDateTime), 100.0000, N'None', N'Cromwell, weibell and pfeiffer', N'item_33.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (34, 19, 1, N'Electric Machines (EMEC)', CAST(0x9ECB0438 AS SmallDateTime), 400.0000, N'None', N'nagrath & kothari
brand new', N'item_34.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (35, 19, 1, N'control systems', CAST(0x9ECB0439 AS SmallDateTime), 250.0000, N'None', N'nagrath
brand new copy', N'item_35.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (36, 19, 1, N'ee measurements and instru', CAST(0x9ECB043A AS SmallDateTime), 100.0000, N'None', N'by ak sawhney
50 % discount', N'item_36.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (57, 22, 5, N'Coir Mattress', CAST(0x9ECB04E4 AS SmallDateTime), 500.0000, NULL, N'http://www.kurlon.com/Mattresses/mattresses_superdeluxe.html', N'item_57.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (74, 45, 1, N'Neural Networks book by Zurada', CAST(0x9ECC0076 AS SmallDateTime), 250.0000, N'None', N'', N'item_74.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (77, 69, 1, N'Introduction to Nanoscience', CAST(0x9ECC0080 AS SmallDateTime), 200.0000, NULL, N'good book', N'item_77.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (78, 69, 1, N'Bhagwadgita', CAST(0x9ECC0081 AS SmallDateTime), 250.0000, N'None', N'the book for most wanted elective...u will definitely wanna buy this', N'item_78.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (81, 80, 1, N'Probability by Miller & Freund', CAST(0x9ECC00AB AS SmallDateTime), 110.0000, N'None', N'', N'item_81.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (82, 80, 1, N'How to solve by computer', CAST(0x9ECC00AD AS SmallDateTime), 75.0000, N'None', N'', N'item_82.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (83, 80, 1, N'Concepts in Biology', CAST(0x9ECC00AF AS SmallDateTime), 50.0000, N'None', N'10th edition', N'item_83.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (85, 80, 1, N'Operating System', CAST(0x9ECC00B6 AS SmallDateTime), 150.0000, N'None', N'', N'item_85.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (86, 80, 1, N'Compiler', CAST(0x9ECC00B7 AS SmallDateTime), 120.0000, N'None', N'', N'item_86.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (87, 80, 1, N'Linear Algebra', CAST(0x9ECC00B8 AS SmallDateTime), 50.0000, N'None', N'', N'item_87.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (97, 80, 1, N'Discrete Mathematics', CAST(0x9ECC02EF AS SmallDateTime), 150.0000, N'None', N'', N'item_97.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (98, 80, 1, N'Theory of computation', CAST(0x9ECC02F0 AS SmallDateTime), 75.0000, N'None', N'Harry lewis', N'item_98.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (99, 80, 1, N'Calculus', CAST(0x9ECC02F2 AS SmallDateTime), 150.0000, N'None', N'Ninth Edition', N'item_99.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (100, 80, 1, N'Computer Numerical Control', CAST(0x9ECC02F4 AS SmallDateTime), 150.0000, N'None', N'With CD', N'item_100.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (101, 80, 1, N'University of Physics', CAST(0x9ECC02F6 AS SmallDateTime), 50.0000, N'None', N'Sixth edition', N'item_101.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (102, 80, 1, N'Control System Engineering', CAST(0x9ECC02F8 AS SmallDateTime), 120.0000, N'None', N'', N'item_102.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (103, 80, 1, N'Biology ', CAST(0x9ECC02FA AS SmallDateTime), 100.0000, N'None', N'Seventh edition', N'item_103.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (107, 64, 5, N'3-D Red green Glasses', CAST(0x9ECC0312 AS SmallDateTime), 40.0000, N'None', N'Can watch all the stuff of Dc....for further details contact me....:)', N'item_107.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (115, 102, 1, N'Calculus', CAST(0x9ECC03A0 AS SmallDateTime), 100.0000, N'None', N'take it and go', N'item_115.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (116, 102, 1, N'Microbiology', CAST(0x9ECC03A2 AS SmallDateTime), 200.0000, N'None', N'perfect condition. Price negotiable.', N'item_116.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (128, 104, 1, N'organic chemistry by solomons', CAST(0x9ECC03BB AS SmallDateTime), 150.0000, NULL, N'wiley edition solomons & fryhle', N'item_128.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (129, 106, 1, N'cell and molecular biology', CAST(0x9ECC03EA AS SmallDateTime), 250.0000, NULL, N'Cell Biology CDC TB
authors: Sheelar and Bianchi', N'item_129.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (131, 106, 1, N'Concepts in Biology', CAST(0x9ECC03EE AS SmallDateTime), 200.0000, NULL, N'General Biology TB
Authors:
Enger, Ross, Bailey', N'item_131.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (133, 106, 1, N'Fundamentals of Electrical Eng', CAST(0x9ECC03F6 AS SmallDateTime), 150.0000, N'None', N'Author: Del Toro
PS: Good Reference Book for ES2', N'item_133.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (134, 93, 5, N'Gatsby Hair Gel', CAST(0x9ECC042B AS SmallDateTime), 50.0000, NULL, N'200gms, MRP. 110, same as in pic', N'item_134.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (142, 71, 5, N'Mattress', CAST(0x9ECC04BE AS SmallDateTime), 300.0000, NULL, N'A Thick Cotton Mattress at 30% original price.', N'item_142.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (147, 126, 5, N'Sleepwell mattress', CAST(0x9ECD0014 AS SmallDateTime), 500.0000, NULL, N'Well maintained', N'item_147.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (148, 133, 2, N'Vodafone Datacard', CAST(0x9ECD00EF AS SmallDateTime), 1500.0000, N'None', N'1 sem old hardware. 3G enabled. Price negotiable.', N'item_148.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (153, 12, 5, N'Mattress', CAST(0x9ECD01D4 AS SmallDateTime), 400.0000, NULL, N'Comfortable mattress, good condition.', N'item_153.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (159, 12, 1, N'ENI cdcs complete set', CAST(0x9ECD01DA AS SmallDateTime), 1500.0000, NULL, N'Full set both sems, including numal consys and some reference books.', N'item_159.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (167, 102, 4, N'Marshall 15W guitar amp MG15CD', CAST(0x9ECD03E2 AS SmallDateTime), 3502.0000, N'None', N'4 years old. Perfect condition. Going strong.', N'item_167.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (170, 142, 5, N'Matress', CAST(0x9ECD042C AS SmallDateTime), 150.0000, N'None', N'Thick Cotton Matress in absolutely fine condition', N'item_170.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (171, 142, 5, N'Cloth Drying Stand', CAST(0x9ECD042F AS SmallDateTime), 300.0000, N'None', N'Foldable cloth drying stand totally new', N'item_171.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (172, 32, 5, N'Set of 4 tech MagZ wrth 450', CAST(0x9ECD04B5 AS SmallDateTime), 99.0000, NULL, N'Maxim (march) + Better Photography (Feb) + exHIBIT (March) + Digit (Sept) ', N'item_172.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (174, 32, 2, N'Enter Bluetooth Headset', CAST(0x9ECD04BE AS SmallDateTime), 379.0000, NULL, N'used for 1 week, 1 year replacement warranty and original bill', N'item_174.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (176, 32, 5, N'New bucket + Cotton Mattress ', CAST(0x9ECD04D9 AS SmallDateTime), 99.0000, NULL, N'Aval. after 4th may', N'item_176.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (178, 139, 2, N'Sandwich/bread toaster', CAST(0x9ECD054B AS SmallDateTime), 600.0000, NULL, N'Its in excellent condition.Hurry up you dont get much cheper than this!', N'item_178.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (182, 139, 2, N'study lamp', CAST(0x9ECD0558 AS SmallDateTime), 300.0000, NULL, N'Excellent condition! very attractive piece', N'item_182.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (188, 46, 3, N'football studs', CAST(0x9ECE02F9 AS SmallDateTime), 200.0000, N'None', N'', N'item_188.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (193, 116, 1, N'Optimisation txt book with CD', CAST(0x9ECF0291 AS SmallDateTime), 175.0000, N'None', N'A compulsory course for all 3rd yr (single degree and dualites)', N'item_193.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (214, 162, 2, N'Samsung SyncMaster 2033SW 20"', CAST(0x9ED0032A AS SmallDateTime), 4750.0000, NULL, N'Display: 20? Wide TFT LCD
Aspect Ratio: 16:9
Pixel Format: 1600 x 900
Contrast Ratio: 1000:1 (sta­tic), 15000:1 (dynamic)', N'item_214.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (215, 162, 5, N'Shoe Rack 3 tier', CAST(0x9ED0032D AS SmallDateTime), 200.0000, NULL, N'Plastic Shoe rack(Intact)', N'item_215.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (217, 162, 1, N'Medium sized Plastic trays(3)', CAST(0x9ED00335 AS SmallDateTime), 100.0000, NULL, N'for the lot', N'item_217.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (219, 54, 1, N'Optimisation', CAST(0x9ED00488 AS SmallDateTime), 250.0000, N'None', N'First hand book. Untouched.', N'item_219.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (220, 173, 1, N'Head First Java-2nd edition', CAST(0x9ED0048F AS SmallDateTime), 400.0000, N'None', N'Excellent book for starting Java. Not yet opened- plastic cover still on. Had accidentally ordered 2 copies online :)', N'item_220.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (221, 63, 4, N'SX Electric Guitar ', CAST(0x9ED00493 AS SmallDateTime), 6000.0000, NULL, N'An SX Standard Series sunburst colored electric guitar well suited for beginner and intermediate players. A change of strings available with the guitar. Please call 8888818014 or pm Xiphos for any queries coz I can''t reply here.', N'item_221.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (222, 63, 4, N'Zoom G2 Processor', CAST(0x9ED0049B AS SmallDateTime), 3000.0000, NULL, N'A guitar effects pedal with neat features to create any effect that you desire and enjoy over 80 different patches! Please call 8888818014 or pm Xiphos for any queries.', N'item_222.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (226, 181, 1, N'MOS textbook', CAST(0x9ED0052E AS SmallDateTime), 150.0000, N'None', N'', N'item_226.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (229, 185, 1, N'All 2-1 text books', CAST(0x9ED0055F AS SmallDateTime), 800.0000, N'None', N'', N'item_229.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (230, 70, 1, N'trw', CAST(0x9ED10005 AS SmallDateTime), 100.0000, NULL, NULL, N'item_230.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (232, 182, 2, N'HP 9 cell battery', CAST(0x9ED10119 AS SmallDateTime), 3000.0000, N'None', N'Brand new, 4 hrs battery back up, lifts the base of laptop up for easy flow of air, need not buy a cooling pad for ur laptop', N'item_232.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (235, 54, 1, N'DSA txtbk-Algo Design,Goodrich', CAST(0x9ED10333 AS SmallDateTime), 250.0000, N'None', N'CDC text book. Completely new, used only a couple of times.', N'item_235.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (236, 148, 2, N'SonyEricsson Portable Speakers', CAST(0x9ED1037B AS SmallDateTime), 300.0000, NULL, N'Portable Music Speakers for Sony Ericsson phones. Unused. Available in black colour. [70% OFF]', N'item_236.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (237, 146, 1, N'OPTICS (Ghatak)', CAST(0x9ED103D6 AS SmallDateTime), 250.0000, N'None', N'A physics CDC book.
In very good condition(untouched). Actual cost is Rs.600/-
Call/SMS me', N'item_237.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (243, 178, 1, N'Micro Elect. Ckts(3-1 EEE)', CAST(0x9ED10520 AS SmallDateTime), 250.0000, N'None', N'Sedra & Smith- TB', N'item_243.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (245, 146, 1, N'Neural Networks', CAST(0x9ED2025D AS SmallDateTime), 200.0000, N'None', N'coursebook for the elective Neural Networks.
Call/SMS me for the book', N'item_245.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (246, 146, 5, N'Mattress', CAST(0x9ED20263 AS SmallDateTime), 350.0000, N'None', N'comfortable good condition mattress from KURL-ON', N'item_246.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (249, 162, 5, N'Plastic Moulded Mini Stool', CAST(0x9ED202F6 AS SmallDateTime), 50.0000, NULL, N'White', N'item_249.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (251, 201, 5, N'Wooden Stand', CAST(0x9ED20333 AS SmallDateTime), 3000.0000, NULL, N'A three level wooden stand.', N'item_251.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (252, 203, 4, N'Casio (SA-35) - Keyboard', CAST(0x9ED2038E AS SmallDateTime), 500.0000, NULL, N'in good condition, with adapter', N'item_252.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (253, 20, 4, N'DiMarzio Pickup**', CAST(0x9ED20393 AS SmallDateTime), 3500.0000, NULL, N'**Contact : 09923520688. DiMarzio Paul Gilbert Humbucker Pickup. Negotiable Price. ', N'item_253.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (262, 205, 2, N'BSNl EVDO', CAST(0x9ED2042D AS SmallDateTime), 1500.0000, NULL, N'Model ZTE AC8700 800M (1.2 Yrs Old. )
Current MRP: 4500/-  SALE Price 1500/-', N'item_262.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (263, 205, 2, N'BSNl 3G', CAST(0x9ED20435 AS SmallDateTime), 1500.0000, NULL, N'2. Model Capitel USB 2000 1X EVDO REV A (4 Months Old)
Current MRP 2500/- SALE Price 1500/-', N'item_263.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (280, 203, 1, N'Trw textbook', CAST(0x9ED30041 AS SmallDateTime), 100.0000, NULL, N'in new condition', N'item_280.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (285, 102, 1, N'Consys Text Book', CAST(0x9ED30541 AS SmallDateTime), 50.0000, N'None', N'50%', N'item_285.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (286, 102, 1, N'OOP Text Book', CAST(0x9ED30541 AS SmallDateTime), 50.0000, N'None', N'50%', N'item_286.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (287, 102, 1, N'Neural Networks Text Book', CAST(0x9ED30542 AS SmallDateTime), 50.0000, N'None', N'50%', N'item_287.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (288, 9, 1, N'oh yes i am single', CAST(0x9ED30596 AS SmallDateTime), 70.0000, N'None', N'bought this book 2 days back...
4th attempt from Durjoy Datta...good book to read....', N'item_288.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (289, 211, 1, N'Sumita Arora C++', CAST(0x9ED4005E AS SmallDateTime), 140.0000, NULL, N'An excellent textbook to learn concepts of C++ and OOPS along with basics of SQL and Databases. Text book for Computer Science students in 12th.', N'item_289.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (290, 211, 5, N'Coir Mattress', CAST(0x9ED40060 AS SmallDateTime), 500.0000, NULL, N'An almost new coir mattress bought in the beginning of this semester.Pillow free with it. Price negotiable. ', N'item_290.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (293, 212, 1, N'Database Systems- Ullman', CAST(0x9ED402C7 AS SmallDateTime), 170.0000, N'None', N'DBMS textbook in very good condition', N'item_293.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (294, 212, 5, N'Mattress', CAST(0x9ED402C8 AS SmallDateTime), 100.0000, NULL, N'good condition - pillow free :)', N'item_294.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (298, 213, 1, N'Mech CDC sem 1/2 Books', CAST(0x9ED4031F AS SmallDateTime), 30.0000, NULL, N'30%. (AMOS,TP2,DMV)', N'item_298.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (304, 90, 1, N'data communic. networks text', CAST(0x9ED4035C AS SmallDateTime), 200.0000, NULL, N'CS/IS CDC, and famous elective for EEE/ENI, text book available in may, call me if interested', N'item_304.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (305, 90, 1, N'professional ethics text book', CAST(0x9ED4035F AS SmallDateTime), 150.0000, N'None', N'cool elective, easy scoring.book available from may, call me if you want', N'item_305.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (306, 90, 2, N'calculator', CAST(0x9ED40366 AS SmallDateTime), 300.0000, NULL, N'natural display (ES model). available after compree.call me up to buy this', N'item_306.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (310, 162, 5, N'Banker Lamp', CAST(0x9ED40423 AS SmallDateTime), 900.0000, NULL, N'yellow cfl', N'item_310.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (311, 162, 2, N'Desktop(with monitor)', CAST(0x9ED40429 AS SmallDateTime), 33000.0000, N'None', N'20" Samsung TFT LCD
Intel Core2 Duo Quad(q8200-2.33Ghz), 4Gb RAM, Nvidia 9500gt, 500Gb HD, Iball cabinet,LG cd/dvd writer.(2yrs old)', N'item_311.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (312, 201, 5, N'sleepwell mattress', CAST(0x9ED40447 AS SmallDateTime), 2000.0000, N'None', N'sleepwell coil mattress.. 4 months old', N'item_312.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (328, 174, 3, N'Reebok Studs', CAST(0x9ED40597 AS SmallDateTime), 1700.0000, NULL, N'Reebok SPRINTFIT LITE Black n Silver studs.. Size usa:9 uk: 8  mrp rs 2900/-http://www.soccer-training-info.com/forums/showthread.php?102-Reebok-Sprintfit-Lite-Pro-Review&p=167       ', N'item_328.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (329, 219, 2, N'Idea Netsetter Data Card', CAST(0x9ED50069 AS SmallDateTime), 400.0000, N'None', N'Idea Netsetter data card with SIM Card at rupees 400, contact 07587031413 or abhishekagrawal.bits@gmail.com for purchasing.', N'item_329.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (330, 51, 1, N'J.D.Lee', CAST(0x9ED50093 AS SmallDateTime), 150.0000, N'None', N'Inorganic Chemistry', N'item_330.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (331, 51, 1, N'Solomons and Fryle', CAST(0x9ED50094 AS SmallDateTime), 250.0000, N'None', N'Organic Chemistry', N'item_331.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (334, 223, 5, N'Matress', CAST(0x9ED502DD AS SmallDateTime), 200.0000, NULL, N'Kurl On - Bought for 2400 - 2years old - Good condition. Pillow free', N'item_334.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (335, 223, 1, N'Security anal & Portfolio Mgmn', CAST(0x9ED502DE AS SmallDateTime), 200.0000, N'None', N'Bought before T2 in this sem.Original Price Rs.480', N'item_335.jpg')
GO
print 'Processed 100 total records'
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (336, 223, 4, N'Formal Shoes', CAST(0x9ED502E2 AS SmallDateTime), 100.0000, N'None', N'Ideal for Campus Interviews. Bought in Jan 2011 for Rs.450', N'item_336.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (338, 225, 1, N'Electrical Machinery ', CAST(0x9ED5030D AS SmallDateTime), 140.0000, NULL, N'PS Bimbhra, Prefered book for Emech', N'item_338.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (339, 225, 1, N'fibre optics and optoelec.', CAST(0x9ED50310 AS SmallDateTime), 300.0000, N'None', N'', N'item_339.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (340, 225, 1, N'Analog integrated circuit des.', CAST(0x9ED50314 AS SmallDateTime), 0.0000, N'None', N'FREE ', N'item_340.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (351, 226, 2, N'Laptop - Acer Aspire 5630', CAST(0x9ED503F7 AS SmallDateTime), 18000.0000, NULL, N'Negotiable price.2 and half years old laptop.
Configuration : 
15 inches screen,intel core 2 duo 1.66GHz processor,2GB Ram,Windows Vista Home Premium,Integrated 1.3MP Webcam,160GB Harddisk
(For further details,contact me)', N'item_351.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (352, 226, 1, N'Micro processors text book', CAST(0x9ED50423 AS SmallDateTime), 250.0000, N'None', N'INTEL MICROPROCESSORS book by barry brey', N'item_352.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (353, 226, 1, N'Biology text book', CAST(0x9ED50425 AS SmallDateTime), 100.0000, N'None', N'Concepts in biology by enger and ross', N'item_353.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (354, 226, 1, N'Data Mining text book', CAST(0x9ED50428 AS SmallDateTime), 300.0000, NULL, N'Brand new textbook -Introduction to data mining by tan,steinbach and kumar', N'item_354.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (355, 226, 1, N'Network Security text book', CAST(0x9ED5042A AS SmallDateTime), 300.0000, N'None', N'Brand new text book - "Cryptography and network security" by William Stallings', N'item_355.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (356, 218, 5, N'bucket', CAST(0x9ED50430 AS SmallDateTime), 60.0000, NULL, N'blue+white color', N'item_356.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (357, 211, 5, N'Bucket', CAST(0x9ED5045F AS SmallDateTime), 40.0000, N'None', N'A cello bucket. Bought it this semester. Price negotiable.', N'item_357.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (359, 226, 1, N'Database Systems textbook', CAST(0x9ED504A6 AS SmallDateTime), 450.0000, N'None', N'New DBMS textbook(Ullman etc)', N'item_359.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (360, 230, 1, N'DBMS text book', CAST(0x9ED50527 AS SmallDateTime), 250.0000, NULL, N'Database Management Systems by Ramakrishnan Gehrke Wholesale price :D', N'item_360.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (361, 230, 1, N'Thinking in Java', CAST(0x9ED50530 AS SmallDateTime), 300.0000, NULL, N'Author: Bruce Eckel Pearson 3rd edition. 

Call me if u need this book (kairav msged me, but i don''t have his no.)', N'item_361.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (362, 230, 1, N'Introduction to systems', CAST(0x9ED50531 AS SmallDateTime), 100.0000, N'None', N'Authors: Rajiv Gupta, I.J. Nagrath', N'item_362.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (363, 230, 1, N'CALCULUS', CAST(0x9ED50533 AS SmallDateTime), 250.0000, N'None', N'Authors: Thomas & Finney 9th edition', N'item_363.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (364, 230, 1, N'Atkins ( physical chem)', CAST(0x9ED50534 AS SmallDateTime), 100.0000, N'None', N'4th edition', N'item_364.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (365, 230, 1, N'Thermodynamics', CAST(0x9ED50534 AS SmallDateTime), 200.0000, NULL, N'Fundamentals of Thermodynamics, 6th edition (including the tables book)', N'item_365.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (366, 230, 1, N'Vibrations & waves', CAST(0x9ED50537 AS SmallDateTime), 50.0000, N'None', N'Author: A.P.French', N'item_366.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (368, 231, 1, N'Database Systems', CAST(0x9ED5057F AS SmallDateTime), 400.0000, NULL, N'Authors: Garcia-Ullman-Widom.
MRP 700.', N'item_368.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (369, 231, 1, N'Theory of Computation', CAST(0x9ED50583 AS SmallDateTime), 125.0000, N'None', N'Elements of the Theory of Computation by Lewis & Papadimitriou. MRP 250.', N'item_369.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (370, 231, 1, N'Operations Research', CAST(0x9ED50584 AS SmallDateTime), 200.0000, N'None', N'Author: 
Hamdy A. Taha', N'item_370.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (371, 231, 1, N'Verilog HDL', CAST(0x9ED50585 AS SmallDateTime), 225.0000, N'None', N'Author:
Samir Palnitkar', N'item_371.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (372, 231, 1, N'ACO', CAST(0x9ED50587 AS SmallDateTime), 300.0000, NULL, N'Title: Computer Organization and Design
Authors:
Patterson and Hennessy', N'item_372.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (382, 13, 1, N'LABORATORY EXPERIMENTS AND PSP', CAST(0x9ED6046A AS SmallDateTime), 150.0000, N'None', N'', N'item_382.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (383, 13, 1, N'EXPERIMENTAL METHOD FOR ENGINE', CAST(0x9ED6046A AS SmallDateTime), 150.0000, N'None', N'', N'item_383.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (384, 13, 1, N'ESSENTIALS OF MANAGEMENT(PRINC', CAST(0x9ED6046A AS SmallDateTime), 150.0000, N'None', N'', N'item_384.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (385, 13, 1, N'MICROPROCESSORS AND INTERFACIN', CAST(0x9ED6046A AS SmallDateTime), 100.0000, N'None', N'', N'item_385.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (386, 13, 1, N'EFFECTIVE ENGLISH COMMUNICATIO', CAST(0x9ED6046B AS SmallDateTime), 100.0000, N'None', N'', N'item_386.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (387, 13, 1, N'SIGNAL PROCESSING AND LINEAR S', CAST(0x9ED6046B AS SmallDateTime), 100.0000, N'None', N'', N'item_387.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (388, 13, 1, N'MANUFACTURING ENGINEERING AND ', CAST(0x9ED6046B AS SmallDateTime), 100.0000, N'None', N'', N'item_388.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (389, 13, 1, N'DIGITAL LOGIC AND COMPUTER DES', CAST(0x9ED6046B AS SmallDateTime), 100.0000, N'None', N'', N'item_389.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (390, 13, 1, N'MODERN PHYSICS(JEREMY BERNSTEI', CAST(0x9ED6046C AS SmallDateTime), 150.0000, N'None', N'', N'item_390.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (391, 13, 1, N'mathematical model of physics', CAST(0x9ED6046D AS SmallDateTime), 150.0000, N'None', N'', N'item_391.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (392, 13, 1, N'fundamental of fluid mechanics', CAST(0x9ED6046D AS SmallDateTime), 150.0000, N'None', N'', N'item_392.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (393, 237, 5, N'Matress', CAST(0x9ED702AE AS SmallDateTime), 500.0000, N'None', N'nice soft sponge matress..pillow free :)', N'item_393.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (394, 237, 1, N'Optimization Text Book', CAST(0x9ED702B0 AS SmallDateTime), 150.0000, N'None', N'Sparingly used...almost new one', N'item_394.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (395, 237, 1, N'ES 2 text book', CAST(0x9ED702B1 AS SmallDateTime), 100.0000, N'None', N'', N'item_395.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (396, 237, 1, N'EDIC text book', CAST(0x9ED702B1 AS SmallDateTime), 100.0000, N'None', N'', N'item_396.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (397, 220, 1, N'Chemical CDC textbooks ', CAST(0x9ED7034A AS SmallDateTime), 1750.0000, N'None', N'', N'item_397.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (398, 220, 1, N'MOS textbook-Crandall', CAST(0x9ED7034B AS SmallDateTime), 200.0000, N'None', N'', N'item_398.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (399, 220, 1, N'OPRE edd notes', CAST(0x9ED7034B AS SmallDateTime), 100.0000, N'None', N'', N'item_399.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (403, 106, 5, N'Coir mattress', CAST(0x9ED803FD AS SmallDateTime), 400.0000, N'None', N'Good Condition', N'item_403.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (404, 51, 5, N'IC Engine Car', CAST(0x9ED80400 AS SmallDateTime), 12000.0000, N'None', N'3cc Tomahawk.. 8 months old.', N'item_404.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (410, 242, 1, N'Microprocessor textbuk', CAST(0x9ED80441 AS SmallDateTime), 200.0000, NULL, N'2-2 Microporcessors txbuk', N'item_410.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (411, 242, 1, N'Discrete math for Comp sci', CAST(0x9ED80442 AS SmallDateTime), 70.0000, NULL, N'2-2 CS buk', N'item_411.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (413, 248, 5, N'Bedside rack', CAST(0x9ED90012 AS SmallDateTime), 200.0000, NULL, N'Plastic Rack with 4 levels, each with size = 1 large register', N'item_413.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (416, 31, 5, N'Pen drive', CAST(0x9EDA015F AS SmallDateTime), 220.0000, NULL, N'4gb pen drive ', N'item_416.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (417, 31, 5, N'Calculator', CAST(0x9EDA015F AS SmallDateTime), 350.0000, N'None', N'es911 calculator in perfect condition.', N'item_417.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (418, 31, 1, N'Mech CDC books', CAST(0x9EDA0162 AS SmallDateTime), 200.0000, N'None', N'3-1 cdc books', N'item_418.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (419, 251, 2, N'Electric Kettle / Rice Cooker ', CAST(0x9EDA053C AS SmallDateTime), 600.0000, N'None', N'Panasonic Kettle, makes upto 3 maggi at once', N'item_419.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (420, 251, 5, N'Stainless Steel Water Jug', CAST(0x9EDA053D AS SmallDateTime), 25.0000, N'None', N'Plastic bottles are unhealthy', N'item_420.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (421, 251, 5, N'2 floor stand', CAST(0x9EDA053E AS SmallDateTime), 25.0000, N'None', N'Plz buy. Can go upto Rs.10', N'item_421.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (422, 251, 1, N'Emergency Light(tubelight)', CAST(0x9EDA053F AS SmallDateTime), 100.0000, N'None', N'Rechargeable. ', N'item_422.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (423, 251, 5, N'Stainless Steel glass', CAST(0x9EDA0540 AS SmallDateTime), 5.0000, N'None', N'Drink water in style.', N'item_423.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (424, 251, 5, N'Bucket Water Heater', CAST(0x9EDA0540 AS SmallDateTime), 100.0000, N'None', N'Its cool.', N'item_424.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (426, 252, 5, N'Cloth Stand;rs.300', CAST(0x9EDA059B AS SmallDateTime), 300.0000, NULL, N'Strong stand you can dry/keep your dozens of cloths on.negotiable..', N'item_426.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (427, 31, 1, N'spike guard', CAST(0x9EDB00B8 AS SmallDateTime), 150.0000, N'None', N'10 sockets are there in working condition', N'item_427.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (430, 253, 1, N'Microprocessors textbook', CAST(0x9EDB030C AS SmallDateTime), 250.0000, NULL, N'Get Douglas Hall reference book for free with it. ', N'item_430.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (435, 257, 1, N'operations research hamdy taha', CAST(0x9EDB03AF AS SmallDateTime), 177.0000, N'None', N'Optimization course in 3-1', N'item_435.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (436, 257, 1, N'Transducer & measurement syste', CAST(0x9EDB03B1 AS SmallDateTime), 250.0000, NULL, N'INSTRC 381 EDD notes of TMS required in 3-1 for ENI students
(price negotiable)', N'item_436.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (437, 257, 1, N'Measurement Systems ', CAST(0x9EDB03B6 AS SmallDateTime), 210.0000, N'None', N'Reference book for TMS (EnI CDC) in 3-1', N'item_437.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (438, 257, 1, N'Numerical analysis Devi Prasad', CAST(0x9EDB03BD AS SmallDateTime), 150.0000, N'None', N'Numerical analysis for 3rd year students', N'item_438.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (439, 257, 1, N'Operations research', CAST(0x9EDB03C0 AS SmallDateTime), 200.0000, N'None', N'Operations research course for 3rd year students', N'item_439.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (441, 162, 2, N'Extension Cord', CAST(0x9EDB03E6 AS SmallDateTime), 150.0000, N'None', N'Brand new(with switch)', N'item_441.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (442, 162, 2, N'7 plugs Spike gaurd', CAST(0x9EDB03E8 AS SmallDateTime), 150.0000, N'None', N'', N'item_442.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (443, 162, 2, N'3 in one multi plug ', CAST(0x9EDB03EC AS SmallDateTime), 50.0000, N'None', N'new', N'item_443.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (444, 162, 2, N'3 pin multi plug 6amp', CAST(0x9EDB03ED AS SmallDateTime), 30.0000, N'None', N'', N'item_444.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (445, 162, 2, N'3v adapter AC', CAST(0x9EDB03F0 AS SmallDateTime), 100.0000, N'None', N'', N'item_445.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (448, 261, 5, N'Whiteboard', CAST(0x9EDB04B9 AS SmallDateTime), 500.0000, N'None', N'Two white boards available each @ min 500. Best price will be considered.', N'item_448.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (449, 38, 1, N'2-1 and 2-2 books', CAST(0x9EDB04D6 AS SmallDateTime), 2000.0000, NULL, N'2nd year books
with some of them new ones
the price i have just kept it roughly.
it may not b that much
:P', N'item_449.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (450, 242, 1, N'(ACO) Advanced Computer Org', CAST(0x9EDC005B AS SmallDateTime), 250.0000, N'None', N'3-2 CS CDC buk', N'item_450.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (454, 263, 1, N'Introduction to Nanoscience', CAST(0x9EDC0432 AS SmallDateTime), 250.0000, NULL, NULL, N'item_454.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (455, 263, 3, N'Cosco maxpower', CAST(0x9EDC0433 AS SmallDateTime), 400.0000, NULL, N'Lawn tennis racket with Aluminium frame', N'item_455.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (456, 263, 1, N'Corrosion engineering', CAST(0x9EDC0452 AS SmallDateTime), 200.0000, N'None', N'Author - Mars G Fontana', N'item_456.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (459, 264, 2, N'Viewsonic 19 inch LCD Monitor', CAST(0x9EDC0496 AS SmallDateTime), 5000.0000, NULL, N'Viewsonic Top of the line 19 inch LCD Monitor.
Has a subwoofer and inbuilt speaker.
Has a deck for iPhone and iPods.
Memory Card Reader and USB Hub inbuilt.
Model Image attached.
Model Number - ViewSonic VX1945WM-3
1440x900
700:1 contrast ratio
Response time - 5ms
Brightness - 300 cd/m2', N'item_459.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (460, 264, 5, N'Mattress', CAST(0x9EDC049C AS SmallDateTime), 200.0000, N'None', N'Kurl On Coir Mattress.', N'item_460.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (467, 265, 1, N'operations research- by taha', CAST(0x9EDD0009 AS SmallDateTime), 150.0000, N'None', N'book in great condition', N'item_467.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (468, 265, 1, N'CAS- Oppenheim', CAST(0x9EDD000A AS SmallDateTime), 175.0000, N'None', N'excellent condition', N'item_468.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (469, 265, 1, N'Microprocesors text', CAST(0x9EDD000B AS SmallDateTime), 250.0000, N'None', N'barry and brey', N'item_469.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (470, 265, 1, N'analog electronics text', CAST(0x9EDD000D AS SmallDateTime), 175.0000, N'None', N'book in excellent condition', N'item_470.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (471, 265, 1, N'DECO text book', CAST(0x9EDD000D AS SmallDateTime), 200.0000, N'None', N'Morris Mano', N'item_471.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (473, 265, 5, N'mattress', CAST(0x9EDD0010 AS SmallDateTime), 300.0000, N'None', N'kurl on coir mattress- 3 fold foldable', N'item_473.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (476, 266, 1, N'Transport Phenomenon Book', CAST(0x9EDD0039 AS SmallDateTime), 200.0000, N'None', N'Chemical Engg Elective', N'item_476.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (477, 266, 1, N'GATE Chemical Engineering Book', CAST(0x9EDD003B AS SmallDateTime), 350.0000, N'None', N'Gate 2011 Chemical Enng Book GK publishers +  GATE Papers Booklet Free', N'item_477.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (478, 132, 5, N'Mattress', CAST(0x9EDD006D AS SmallDateTime), 250.0000, NULL, N'Clearance sale Bumper  offer! I got 99.77 in CAT by sleeping on this bed :P', N'item_478.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (479, 180, 3, N'Tennis Racket', CAST(0x9EDD0073 AS SmallDateTime), 500.0000, NULL, N'Brand new Yonex Tennis racket for sale... used only two times :P', N'item_479.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (480, 231, 2, N'Electric Kettle', CAST(0x9EDD008B AS SmallDateTime), 400.0000, N'None', N'Simple easy-to-use electric kettle. Model as in pic.', N'item_480.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (481, 226, 1, N'TOC(CS CDC Text book)', CAST(0x9EDD00A3 AS SmallDateTime), 100.0000, N'None', N'CSE 3-1 cdc text book', N'item_481.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (482, 226, 1, N'COA(IS CDC Text book)', CAST(0x9EDD00A4 AS SmallDateTime), 150.0000, N'None', N'3-1 IS CDC Text book', N'item_482.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (483, 226, 1, N'PLCC(CS CDC Text book)', CAST(0x9EDD00A5 AS SmallDateTime), 190.0000, N'None', N'3-2 cs cdc text book', N'item_483.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (484, 226, 1, N'Compilers(CS CDC Text book', CAST(0x9EDD00A6 AS SmallDateTime), 375.0000, N'None', N'3-2 CS/IS CDC Text book', N'item_484.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (485, 226, 1, N'DSA(CS CDC Text book)', CAST(0x9EDD00A7 AS SmallDateTime), 180.0000, N'None', N'3-1 CS/IS CDC TEXT BOOK', N'item_485.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (486, 226, 1, N'Operating Systems(CS CDC T.B.)', CAST(0x9EDD00A7 AS SmallDateTime), 270.0000, N'None', N'3-2 CS CDC Text Book', N'item_486.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (487, 226, 1, N'OOPS(IS CDC Text book)', CAST(0x9EDD00AA AS SmallDateTime), 120.0000, N'None', N'3-1 IS CDC Text book', N'item_487.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (491, 261, 5, N'Foldable chair', CAST(0x9EDD034A AS SmallDateTime), 300.0000, N'None', N'Fold-able chair. Bought @ 600. In good condition. ', N'item_491.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (492, 261, 5, N'Chair', CAST(0x9EDD034B AS SmallDateTime), 200.0000, N'None', N'Common room like personal chair.', N'item_492.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (493, 255, 5, N'Kurl On Mattress', CAST(0x9EDD037A AS SmallDateTime), 200.0000, N'None', N'In good condition', N'item_493.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (494, 263, 1, N'Numerical analysis', CAST(0x9EDD03AD AS SmallDateTime), 150.0000, NULL, N'By Devi Prasad', N'item_494.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (495, 213, 1, N'Symbolic Logic', CAST(0x9EDD03D0 AS SmallDateTime), 50.0000, NULL, NULL, N'item_495.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (496, 213, 1, N'Let Us C', CAST(0x9EDD03D0 AS SmallDateTime), 100.0000, N'None', N'', N'item_496.jpg')
GO
print 'Processed 200 total records'
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (497, 213, 1, N'OOP Texbook', CAST(0x9EDD03D0 AS SmallDateTime), 150.0000, N'None', N'Brand New', N'item_497.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (498, 213, 1, N'Theory of Computation', CAST(0x9EDD03D1 AS SmallDateTime), 100.0000, N'None', N'Very Good Condition', N'item_498.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (499, 213, 1, N'Discrete Math (DISCO)', CAST(0x9EDD03D3 AS SmallDateTime), 150.0000, N'None', N'', N'item_499.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (503, 220, 4, N'Roland Cube 15x Amplifier', CAST(0x9EDD0479 AS SmallDateTime), 5000.0000, N'None', N'Price Negotiable', N'item_503.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (510, 271, 5, N'Shoe rack', CAST(0x9EDD054A AS SmallDateTime), 50.0000, N'None', N'4 story shoe rack old', N'item_510.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (512, 272, 5, N'Kurlon Matress', CAST(0x9EDD056F AS SmallDateTime), 250.0000, NULL, N'Superb,comfortable Kurlon matress-only 1.5 yrs old..in perfect condition.', N'item_512.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (513, 272, 5, N'2 mattress + 2 pillow', CAST(0x9EDD0574 AS SmallDateTime), 500.0000, NULL, N'2 matresses, in perfectly proper condition and 2 pillows..... Price negotiable', N'item_513.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (514, 272, 1, N'Numerical Analysis', CAST(0x9EDD058B AS SmallDateTime), 140.0000, N'None', N'Fresh Numal book...all pages intact', N'item_514.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (515, 272, 1, N'bio sciences cdcd', CAST(0x9EDD058F AS SmallDateTime), 50.0000, N'None', N'Come and chose ur BIO CDC books@ 50%cost -- fresh, perfect condition
contact me', N'item_515.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (516, 272, 1, N'Bhagvad Gita', CAST(0x9EDD0590 AS SmallDateTime), 60.0000, N'None', N'Come buy ISCKON Bhagvad Gita and get divine guidance', N'item_516.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (517, 272, 5, N'steel glass', CAST(0x9EDD059B AS SmallDateTime), 5.0000, N'None', N'Stainless Steel glass...serves a lot many purposes', N'item_517.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (518, 272, 5, N'2 Matress + pillow', CAST(0x9EDE0002 AS SmallDateTime), 450.0000, NULL, N'2 matress...six months old and one brand new pillow all for 450..negotiable price', N'item_518.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (519, 273, 5, N'Kurlon Coir Mattress', CAST(0x9EDE024D AS SmallDateTime), 200.0000, N'None', N'good condition. will get aaraam ka sleep :D', N'item_519.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (520, 220, 5, N'Mattress', CAST(0x9EDE02C5 AS SmallDateTime), 300.0000, N'None', N'Excellent Condition,Price Negotiable', N'item_520.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (526, 274, 5, N'Coir Mattress', CAST(0x9EDE03EC AS SmallDateTime), 200.0000, N'None', N'Good mattress. 2 years old. Good condition. Negotiable price.', N'item_526.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (530, 136, 1, N'ES1+SPM+MT2 textbooks', CAST(0x9EDE0413 AS SmallDateTime), 400.0000, N'None', N'original cost 1120/-', N'item_530.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (533, 254, 1, N'MT2 holman', CAST(0x9EDE04A4 AS SmallDateTime), 150.0000, N'None', N'mrp 300', N'item_533.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (539, 263, 5, N'APRON', CAST(0x9EDE04C1 AS SmallDateTime), 50.0000, N'None', N'very good conditions. no marks.', N'item_539.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (540, 276, 2, N'Canon EF 35-105mm lens', CAST(0x9EDE04EE AS SmallDateTime), 4999.0000, NULL, N'Aperture wide open range: f/4.5-f/5.6, closes down to f/22-f27. Micro-Motor Auto focus.
A Hoya Multi-Coated UV filter is included(Worth Rs.1000)', N'item_540.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (545, 58, 1, N'Optimisation and Numal', CAST(0x9EDE04F6 AS SmallDateTime), 200.0000, NULL, N'Grab them asap.. shifting my room..', N'item_545.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (546, 277, 1, N'Mech CDC 3-2', CAST(0x9EDE04F7 AS SmallDateTime), 200.0000, N'None', N'Dynamics of Machines and Vibrations (Uicker, Pennock, Shigley)', N'item_546.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (547, 277, 1, N'Mech CDC 3-1', CAST(0x9EDE04F9 AS SmallDateTime), 250.0000, N'None', N'Production Techniques (Manufacturing Engg Technology)', N'item_547.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (548, 277, 1, N'Mech CDC 3-1', CAST(0x9EDE04FC AS SmallDateTime), 300.0000, N'None', N'DME (Mechanical Engineering Design, Shigley)', N'item_548.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (549, 277, 1, N'OPTIMISATION', CAST(0x9EDE04FE AS SmallDateTime), 200.0000, N'None', N'Taha.', N'item_549.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (550, 277, 1, N'OPTIMISATION', CAST(0x9EDE04FE AS SmallDateTime), 200.0000, N'None', N'Taha', N'item_550.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (553, 146, 5, N'Umbrella', CAST(0x9EDF01FD AS SmallDateTime), 50.0000, N'None', N'Buy a almost new umbrella', N'item_553.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (556, 277, 1, N'MOS 2-1', CAST(0x9EDF02D8 AS SmallDateTime), 170.0000, N'None', N'Mechanics of Solids
(Crandal, Dahl, Lardner)', N'item_556.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (560, 280, 1, N'Optimization Text Book', CAST(0x9EDF04BC AS SmallDateTime), 150.0000, NULL, N'Taha
Price Negotiable', N'item_560.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (562, 280, 2, N'Tech Com Keyboard', CAST(0x9EDF04CA AS SmallDateTime), 150.0000, N'None', N'8 months old, in perfect working condition (Price Negotiable)', N'item_562.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (563, 180, 5, N'Apron', CAST(0x9EDF04CE AS SmallDateTime), 50.0000, N'None', N'mt2 apron gogogogo!!', N'item_563.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (570, 282, 1, N'Organic Chemistry Solomons & F', CAST(0x9EDF0556 AS SmallDateTime), 250.0000, N'None', N'', N'item_570.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (571, 283, 1, N'Control Systems Engineering', CAST(0x9EDF0568 AS SmallDateTime), 190.0000, N'None', N'Consys', N'item_571.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (572, 283, 1, N'Theory of Computation', CAST(0x9EDF056D AS SmallDateTime), 120.0000, N'None', N'CS CDC', N'item_572.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (573, 283, 1, N'Mechanics of Solids', CAST(0x9EDF056E AS SmallDateTime), 150.0000, N'None', N'MOS textbook', N'item_573.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (574, 283, 1, N'Operations Research', CAST(0x9EDF0570 AS SmallDateTime), 200.0000, N'None', N'All 3 books of Opre', N'item_574.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (575, 283, 1, N'Digital Design', CAST(0x9EDF0572 AS SmallDateTime), 200.0000, N'None', N'DECO CS CDC', N'item_575.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (576, 283, 1, N'Computer Networks', CAST(0x9EDF0575 AS SmallDateTime), 200.0000, N'None', N'CN CS CDC new book', N'item_576.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (577, 283, 1, N'Computer Organization', CAST(0x9EDF057B AS SmallDateTime), 250.0000, N'None', N'ACO CS CDC sem2 ', N'item_577.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (578, 284, 1, N'SPM', CAST(0x9EE00023 AS SmallDateTime), 250.0000, N'None', N'Brand New...unused', N'item_578.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (579, 284, 1, N'Thermodynamics(1st year)', CAST(0x9EE00025 AS SmallDateTime), 240.0000, N'None', N'', N'item_579.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (580, 284, 1, N'Physics I (H J pain) 6th edn', CAST(0x9EE00027 AS SmallDateTime), 200.0000, N'None', N'', N'item_580.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (581, 284, 1, N'Physics I (A P French)', CAST(0x9EE00028 AS SmallDateTime), 50.0000, N'None', N'', N'item_581.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (582, 284, 1, N'Physics 1(kleppner & kolenkow)', CAST(0x9EE0002A AS SmallDateTime), 150.0000, N'None', N'', N'item_582.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (583, 284, 2, N'Dell XPS 1530', CAST(0x9EE0002D AS SmallDateTime), 29000.0000, N'None', N'high configuration, with Dell bluetooth Headset', N'item_583.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (584, 284, 1, N'Chemistry 2( J D Lee) 5th edn', CAST(0x9EE0002F AS SmallDateTime), 270.0000, N'None', N'', N'item_584.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (585, 284, 1, N'CP-1 (E Balagurusamy)', CAST(0x9EE0002F AS SmallDateTime), 120.0000, N'None', N'', N'item_585.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (586, 284, 1, N'CP-1 (Patt & Patel) 2nd edn', CAST(0x9EE00031 AS SmallDateTime), 180.0000, N'None', N'', N'item_586.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (587, 284, 1, N'chemistry (solomons) 8th edn', CAST(0x9EE00032 AS SmallDateTime), 220.0000, N'None', N'', N'item_587.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (588, 284, 1, N'Maths-1(Thomas & finney)9th ed', CAST(0x9EE00034 AS SmallDateTime), 300.0000, N'None', N'', N'item_588.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (589, 284, 1, N'Maths 2 (kolman & Hill)7th edn', CAST(0x9EE00035 AS SmallDateTime), 100.0000, N'None', N'', N'item_589.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (590, 284, 1, N'Numal(Devi Prasad)', CAST(0x9EE00039 AS SmallDateTime), 150.0000, N'None', N'', N'item_590.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (591, 284, 1, N'General Biology(Enger & Ross)', CAST(0x9EE0003C AS SmallDateTime), 200.0000, N'None', N'11th edition', N'item_591.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (597, 286, 1, N'Let Us C', CAST(0x9EE00064 AS SmallDateTime), 0.0000, NULL, N'Essential for C beginners', N'item_597.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (598, 286, 1, N'Introduction to Computing Syst', CAST(0x9EE00066 AS SmallDateTime), 100.0000, N'None', N'-Patt n Patel - CP1 book', N'item_598.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (600, 286, 1, N'GATE-Mechanical Engg', CAST(0x9EE00067 AS SmallDateTime), 400.0000, N'None', N'Brand New Book', N'item_600.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (601, 286, 5, N'6" Sponge Mattress', CAST(0x9EE0006A AS SmallDateTime), 200.0000, NULL, N'In good condition', N'item_601.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (603, 286, 1, N'Solomons', CAST(0x9EE0006C AS SmallDateTime), 200.0000, NULL, NULL, N'item_603.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (604, 285, 2, N'Belkin Power Strip - ', CAST(0x9EE0006D AS SmallDateTime), 450.0000, N'None', N'Used only 3 months.
Worth 700
Perfect condition. Takes a kettle, a monitor, laptop, speaker set, table lamp at once.', N'item_604.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (605, 287, 5, N'Cotton Mattress', CAST(0x9EE000A3 AS SmallDateTime), 200.0000, NULL, N'Used the mattress for 4 months. Excellent condition. Price Negotiable. And yes, no nocturnal emissions!! original MRP Rs 850.', N'item_605.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (607, 288, 1, N'PLCC (CS CDC) 2 books', CAST(0x9EE001AA AS SmallDateTime), 400.0000, N'None', N'both ravi sethi and dragon book', N'item_607.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (608, 288, 1, N'ACO (CS CDC tbuk)', CAST(0x9EE001AB AS SmallDateTime), 200.0000, N'None', N'', N'item_608.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (609, 288, 1, N'CN (CS CDC ) tbuk', CAST(0x9EE001AC AS SmallDateTime), 200.0000, N'None', N'3-2 CDC tbuk', N'item_609.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (610, 288, 1, N'CALCULUS', CAST(0x9EE001AD AS SmallDateTime), 100.0000, N'None', N'by thomas and finney.', N'item_610.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (611, 280, 5, N'Broom', CAST(0x9EE0021D AS SmallDateTime), 30.0000, N'None', N'', N'item_611.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (613, 239, 1, N'Numerical Analysis', CAST(0x9EE00290 AS SmallDateTime), 350.0000, N'None', N'Both books:
1. An Introduction to Numerical Analysis - Devi Prasad
2. Applied Numerical Analysis - Gerald & Wheatley', N'item_613.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (614, 289, 1, N'Economics(POE text buk)', CAST(0x9EE00299 AS SmallDateTime), 150.0000, NULL, N'POE(Principles of Economics Textbook) by Lipsey and Chrystal- 11th Edition, IS ans ECO ppl have this course', N'item_614.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (615, 289, 1, N'Digital Systems', CAST(0x9EE0029C AS SmallDateTime), 150.0000, N'None', N'Digital Electronics course boo, DEMP course book for IS people- Tocci Widmer', N'item_615.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (616, 289, 1, N'Software Engineering', CAST(0x9EE002A0 AS SmallDateTime), 150.0000, NULL, N'SE Text book , IS 3-2 CDC', N'item_616.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (617, 287, 5, N'HQ Plastic Clothes Hangers', CAST(0x9EE002A6 AS SmallDateTime), 50.0000, N'None', N'6 in number. Very thagda plastic. Bought for Rs. 85 4 months back. Price negotiable.', N'item_617.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (618, 289, 1, N'Inorganic Chemistry', CAST(0x9EE002AF AS SmallDateTime), 200.0000, N'None', N'Chemistry 1,2 book, author: JD Lee, MRP: 525 Rs', N'item_618.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (619, 289, 1, N'Thermodynamics', CAST(0x9EE002B1 AS SmallDateTime), 0.0000, N'None', N'Thermo Text Buk', N'item_619.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (621, 162, 1, N'OPTIMIZATION - Taha', CAST(0x9EE0030B AS SmallDateTime), 250.0000, N'None', N'', N'item_621.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (622, 162, 1, N'operation Research', CAST(0x9EE0030C AS SmallDateTime), 100.0000, N'None', N'all 3 notes', N'item_622.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (624, 162, 1, N'Numal (text book + deviprasad)', CAST(0x9EE0030E AS SmallDateTime), 350.0000, N'None', N'', N'item_624.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (625, 162, 1, N'Resnick Halliday part 2', CAST(0x9EE00311 AS SmallDateTime), 70.0000, N'None', N'', N'item_625.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (626, 102, 2, N'Electric Kettle', CAST(0x9EE0036F AS SmallDateTime), 500.0000, NULL, N'Working kettle.', N'item_626.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (627, 102, 2, N'Emergency Lamp', CAST(0x9EE00370 AS SmallDateTime), 400.0000, N'None', N'Very helpful during exams and other times.', N'item_627.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (628, 91, 5, N'Matress', CAST(0x9EE003B8 AS SmallDateTime), 300.0000, N'None', N'leaving campus..want to sell it...well maintained soft matress :P', N'item_628.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (629, 91, 1, N'numal text books', CAST(0x9EE003BA AS SmallDateTime), 300.0000, N'None', N'devi prasad as well as another green book (refernce)', N'item_629.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (630, 91, 4, N'Logitech speakers', CAST(0x9EE003C3 AS SmallDateTime), 200.0000, N'None', N'sensible speakrs which amplifies decently to enjoy a movie ..@ very reasonable rate ..as leaving campus Hurry :)', N'item_630.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (632, 291, 2, N'Electric Cooker', CAST(0x9EE00402 AS SmallDateTime), 600.0000, N'None', N'An Highly edible  electric cooker for all ut alte ni8 maggies and soups available at feasible cosy..hurrYYy', N'item_632.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (634, 217, 5, N'Keyboard( microsoft)', CAST(0x9EE0047F AS SmallDateTime), 50.0000, NULL, NULL, N'item_634.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (635, 217, 3, N'tennis racket', CAST(0x9EE00480 AS SmallDateTime), 500.0000, N'None', N'', N'item_635.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (638, 20, 1, N'SALE !! - See the Link below', CAST(0x9EE004D6 AS SmallDateTime), 0.0000, NULL, N'https://spreadsheets.google.com/spreadsheet/pub?hl=en&hl=en&key=0AitDb9p1dH_adGtCazl1bmNZU1BpeGlZUHp1bHhxc3c&output=html', N'item_638.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (639, 236, 1, N'I too had a love story', CAST(0x9EE00566 AS SmallDateTime), 45.0000, N'None', N'A decent novel with a sad ending', N'item_639.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (641, 293, 1, N'LAB manual analog electronics', CAST(0x9EE00586 AS SmallDateTime), 125.0000, N'None', N'Official lab manual for 2nd semester for 3rd year', N'item_641.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (642, 293, 1, N'Transd books vol1 n 2', CAST(0x9EE00587 AS SmallDateTime), 160.0000, N'None', N'transducer books for 1st sem for 3rd yr eni ppl', N'item_642.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (643, 293, 1, N'EDIC books', CAST(0x9EE00588 AS SmallDateTime), 150.0000, N'None', N'CDC book for eee/eni ', N'item_643.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (644, 293, 1, N'applied numerical analysis', CAST(0x9EE00588 AS SmallDateTime), 150.0000, N'None', N'NUMERICAL ANALYSIS', N'item_644.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (645, 293, 3, N'BADMINTON RACKET', CAST(0x9EE0058A AS SmallDateTime), 600.0000, N'None', N'YONEX RACKET 600 RUPEES ', N'item_645.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (647, 296, 3, N'Basketball', CAST(0x9EE10015 AS SmallDateTime), 200.0000, NULL, N'Barely used, good grip too :)', N'item_647.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (648, 106, 1, N'NUMAL TB', CAST(0x9EE10029 AS SmallDateTime), 150.0000, N'None', N'Devi Prasad', N'item_648.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (650, 280, 5, N'Table Clock', CAST(0x9EE1019C AS SmallDateTime), 30.0000, N'None', N'Looks a little like this', N'item_650.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (652, 252, 1, N'Symbolic Logic,rs.100', CAST(0x9EE1025B AS SmallDateTime), 100.0000, N'None', N'scoring elective book.spl offer:buy with razavi,total 150', N'item_652.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (653, 252, 1, N'LET US C,kanetkar', CAST(0x9EE10262 AS SmallDateTime), 100.0000, N'None', N'C language explained in lucid manner,very IMP for CP-1,2', N'item_653.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (655, 300, 5, N'kurl-on mattress', CAST(0x9EE1031A AS SmallDateTime), 200.0000, N'None', N'in very good condition', N'item_655.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (657, 25, 1, N'International Business', CAST(0x9EE1039B AS SmallDateTime), 300.0000, N'None', N'Textbook. price negotiable', N'item_657.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (660, 62, 1, N'maths 3', CAST(0x9EE103DE AS SmallDateTime), 100.0000, N'None', N'call me before you come', N'item_660.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (661, 307, 1, N'GATE 2010 ECE', CAST(0x9EE103FE AS SmallDateTime), 200.0000, N'None', N'GATE ECE Bk', N'item_661.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (662, 262, 1, N'Introduction to relativity', CAST(0x9EE10400 AS SmallDateTime), 100.0000, N'None', N'theory of relativity text book', N'item_662.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (663, 262, 1, N'trw text book ', CAST(0x9EE10402 AS SmallDateTime), 100.0000, N'None', N'', N'item_663.jpg')
GO
print 'Processed 300 total records'
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (664, 262, 1, N'opre part 1,2,3', CAST(0x9EE10407 AS SmallDateTime), 120.0000, N'None', N'opre edd notes', N'item_664.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (665, 262, 1, N'spm text book', CAST(0x9EE10407 AS SmallDateTime), 200.0000, N'None', N'', N'item_665.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (666, 262, 1, N'transport phenomena by bird,st', CAST(0x9EE10408 AS SmallDateTime), 200.0000, N'None', N'', N'item_666.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (667, 262, 1, N'tp2 text book,rs.220', CAST(0x9EE1040A AS SmallDateTime), 220.0000, NULL, NULL, N'item_667.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (668, 262, 1, N'control systems ,rs 200', CAST(0x9EE1040B AS SmallDateTime), 200.0000, NULL, NULL, N'item_668.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (669, 264, 2, N'Havell Table Fan', CAST(0x9EE1042D AS SmallDateTime), 900.0000, NULL, N'Havell Table Fan.
Perfect Condition. Has a second fan for evenly distributing fan flow. Perfect for Goa Heat.
Price Negotiable.', N'item_669.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (670, 308, 2, N'Study Lamp', CAST(0x9EE10440 AS SmallDateTime), 200.0000, N'None', N'Excellent condition... Has two levels of intensity...', N'item_670.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (672, 132, 1, N'Microprocessors and Interfacin', CAST(0x9EE1044A AS SmallDateTime), 100.0000, N'None', N'Microprocessors and Interfacing text book', N'item_672.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (674, 107, 5, N'coir king mattress', CAST(0x9EE10471 AS SmallDateTime), 1500.0000, N'None', N'good condition', N'item_674.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (675, 310, 2, N'Intex UPS - 600VA', CAST(0x9EE1054E AS SmallDateTime), 1500.0000, N'None', N'Intex UPS , 9 months old, properly working.', N'item_675.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (677, 315, 2, N'Morphy Richards Kettle', CAST(0x9EE20085 AS SmallDateTime), 1200.0000, N'None', N'Morphy Richards one of the best brands in market
Relatively unused bought 2 yrs back,Cooked only about 3 times
prices negotiable', N'item_677.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (679, 234, 5, N'Cotton Mattress+Pillow ', CAST(0x9EE20213 AS SmallDateTime), 250.0000, NULL, N'Cozy Mattress in perfectly good condition. you can take it after 14th or 15th. Price Negotiable...', N'item_679.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (680, 234, 1, N'POM Textbook', CAST(0x9EE20225 AS SmallDateTime), 250.0000, NULL, N'Perfect condition, almost new!!! Hurry up...
Also Environmental Studies textbuk as a complement :)', N'item_680.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (682, 113, 1, N'sapm textbuk(2-2 course)', CAST(0x9EE20260 AS SmallDateTime), 199.0000, N'None', N'brand new one.', N'item_682.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (683, 318, 1, N'Mup Book (2-2 cs,eee,eni)', CAST(0x9EE2028A AS SmallDateTime), 200.0000, N'None', N'200 each . there are 2 sets', N'item_683.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (684, 318, 1, N'Oops book', CAST(0x9EE2028B AS SmallDateTime), 125.0000, N'None', N'oops prescribed text book ', N'item_684.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (685, 318, 1, N'Balaguruswamy programming in C', CAST(0x9EE202E1 AS SmallDateTime), 80.0000, NULL, N'cp1 text', N'item_685.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (686, 318, 1, N'Droomey', CAST(0x9EE202E2 AS SmallDateTime), 80.0000, NULL, N'important cp1 text book', N'item_686.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (687, 36, 1, N'numal text book + ref', CAST(0x9EE20365 AS SmallDateTime), 300.0000, N'None', N'numal tb + ref book  common course for all', N'item_687.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (688, 36, 1, N'optimisation tb', CAST(0x9EE20367 AS SmallDateTime), 180.0000, N'None', N'common book for all ', N'item_688.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (689, 36, 1, N'opre 3 textbooks', CAST(0x9EE20367 AS SmallDateTime), 150.0000, N'None', N'', N'item_689.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (690, 320, 1, N'Maths3,ConSys,DECO,DISCO, TOC', CAST(0x9EE203DD AS SmallDateTime), 300.0000, N'None', N'Maths3, ConSys, DECO, DISCO and TOC books for sale, call on +91 9881472930 asap', N'item_690.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (691, 248, 5, N'Clothes stand', CAST(0x9EE203E8 AS SmallDateTime), 500.0000, NULL, N'Aluminium clothes stand - 6 ft standard one, not the kind sold in borkars', N'item_691.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (692, 106, 1, N'Microelectronic Ciruits', CAST(0x9EE20423 AS SmallDateTime), 350.0000, N'None', N'Sedra and Smith
EEE and Eni 3-1 CDC Textbook', N'item_692.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (693, 106, 2, N'Uninterrupted Power Supply(UPS', CAST(0x9EE20426 AS SmallDateTime), 1400.0000, N'None', N'Excellent condition. Atleast 15 mins backup.', N'item_693.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (695, 254, 1, N'CAS nagrath', CAST(0x9EE20499 AS SmallDateTime), 130.0000, N'None', N'mrp 260', N'item_695.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (696, 254, 1, N'ES 2 nagrath kothari', CAST(0x9EE2049A AS SmallDateTime), 100.0000, N'None', N'mrp 210', N'item_696.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (697, 254, 1, N'CP 1 patt patel', CAST(0x9EE2049B AS SmallDateTime), 150.0000, N'None', N'', N'item_697.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (698, 322, 1, N'numal 7th ed', CAST(0x9EE204CE AS SmallDateTime), 150.0000, NULL, N'numerical analysis  gerald', N'item_698.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (699, 322, 1, N'holygeeta', CAST(0x9EE204CF AS SmallDateTime), 175.0000, NULL, N'shankaras thoughts or bhagavadgita tbbok', N'item_699.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (700, 322, 1, N'ES-1', CAST(0x9EE204D1 AS SmallDateTime), 150.0000, NULL, N'leonard s.bobrow', N'item_700.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (701, 322, 1, N'inorganic chemistry', CAST(0x9EE204D4 AS SmallDateTime), 125.0000, N'None', N'jd.lee', N'item_701.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (702, 322, 1, N'opre-part2', CAST(0x9EE204D8 AS SmallDateTime), 75.0000, N'None', N'operations research', N'item_702.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (703, 322, 1, N'opre-part3', CAST(0x9EE204D8 AS SmallDateTime), 50.0000, N'None', N'operations research', N'item_703.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (705, 236, 1, N'Opre textbook', CAST(0x9EE20584 AS SmallDateTime), 150.0000, N'None', N'All the three parts available.New one', N'item_705.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (706, 236, 1, N'Bhagavad  Gita', CAST(0x9EE20585 AS SmallDateTime), 100.0000, N'None', N'the book which chanhed my life', N'item_706.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (707, 68, 1, N'Consys Textbook', CAST(0x9EE2058C AS SmallDateTime), 190.0000, N'None', N'', N'item_707.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (708, 323, 1, N'opre books', CAST(0x9EE3001C AS SmallDateTime), 0.0000, N'None', N'part1 and 2
notes', N'item_708.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (709, 323, 1, N'differential geometry', CAST(0x9EE3001E AS SmallDateTime), 150.0000, N'None', N'maths cdc', N'item_709.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (710, 324, 1, N'maths cdcs (era,topology,m&i)', CAST(0x9EE30106 AS SmallDateTime), 300.0000, NULL, N'era ,topology and m&i textbooks', N'item_710.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (711, 25, 1, N'Operational research textbook', CAST(0x9EE302C0 AS SmallDateTime), 50.0000, N'None', N'Contact no. 8055535050', N'item_711.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (712, 25, 1, N'Razavi Microelectronics ', CAST(0x9EE302C1 AS SmallDateTime), 150.0000, N'None', N'Textbook in Microelectronics and ADVD. Contact No. 8055535050', N'item_712.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (713, 25, 1, N'Rabaey ADVD textbook', CAST(0x9EE302C2 AS SmallDateTime), 150.0000, N'None', N'Textbook in Analog & Digital VLSI design. Contact No. 8055535050', N'item_713.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (714, 25, 1, N'EIIT Textbook', CAST(0x9EE302C3 AS SmallDateTime), 100.0000, N'None', N'EIIT ENI 3-2 CDC textbook. Contact No. 8055535050', N'item_714.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (715, 25, 1, N'Power Electronics Textbook', CAST(0x9EE302C5 AS SmallDateTime), 150.0000, N'None', N'Power Electronics ENI 3-2 CDC textbook. Contact No. 8055535050', N'item_715.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (716, 25, 1, N'ES 2 Textbook', CAST(0x9EE302CE AS SmallDateTime), 150.0000, N'None', N'Contact no. 8055535050', N'item_716.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (717, 329, 2, N'Table Lamp', CAST(0x9EE400CA AS SmallDateTime), 50.0000, N'None', N'Proper Working condition. If u study under it then sureshot 10P.', N'item_717.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (725, 1, 3, N'cap', CAST(0x9F000475 AS SmallDateTime), 900.0000, N'None', N'cricket cap', N'item_725.jpg')
INSERT [dbo].[EBay_Item] ([Item_ID_pk_bi], [Student_ID_fk_bi], [Category_ID_fk_bi], [Item_Name_vc], [Upload_Time_sdt], [Price_m], [Author_vc], [Description_t], [URL_vc]) VALUES (726, 1, 3, N'hat', CAST(0x9F00047A AS SmallDateTime), 700.0000, N'None', N'', N'item_726.jpg')
SET IDENTITY_INSERT [dbo].[EBay_Item] OFF
/****** Object:  StoredProcedure [dbo].[Ebay_isAvailable]    Script Date: 08/02/2011 16:29:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns true if number passed is available
CREATE PROCEDURE [dbo].[Ebay_isAvailable]
    @Limit tinyint,	-- No. of SMS per day
    @Phone NCHAR(10),	-- Phone
    @Req tinyint,
    @Result BIT OUT
AS
    DECLARE @Count tinyint
    SET @Count = (SELECT SMS_Sent_ti from Ebay_SMS_Log_Mst where Date_d = CONVERT( DATE, GetDate(), 112) AND Phone_c = @Phone)
    
    IF ISNULL(@Count, 00) = 0
    BEGIN
	-- insert into DB a new entry
	INSERT INTO Ebay_SMS_Log_Mst (Phone_c, SMS_Sent_ti) VALUES (@Phone, @Req)
	SET @Result = 1
    END
    ELSE IF @Count < (@Limit - @Req)
    BEGIN
	-- Number is available
	UPDATE Ebay_SMS_Log_Mst SET SMS_Sent_ti = (@Count + @Req) WHERE Phone_c = @Phone AND Date_d = CONVERT( DATE, GetDate(), 112);
	SET @Result = 1
    END
    ELSE
	SET @Result = 0
GO
/****** Object:  View [dbo].[Ebay_Search_v]    Script Date: 08/02/2011 16:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Ebay_Search_v]
AS
SELECT     i.Item_ID_pk_bi, s.Student_ID_pk_bi, i.Item_Name_vc, i.URL_vc, s.Student_Name_vc, c.Category_Name_vc, s.Hostel_nc, s.Username_vc, i.Upload_Time_sdt, 
                      i.Description_t
FROM         dbo.EBay_Item AS i INNER JOIN
                      dbo.EBay_Category_Mst AS c ON i.Category_ID_fk_bi = c.Category_ID_pk_bi INNER JOIN
                      dbo.EBay_Student AS s ON i.Student_ID_fk_bi = s.Student_ID_pk_bi
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 95
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 96
               Left = 256
               Bottom = 215
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ebay_Search_v'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Ebay_Search_v'
GO
/****** Object:  StoredProcedure [dbo].[Ebay_InsertReply_P]    Script Date: 08/02/2011 16:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ebay_InsertReply_P]
    @fStudent bigint,
    @tStudent bigint,
    @Message varchar(300),
    @input_parentID bigint
AS
    DECLARE @parentID bigint;

    SET @parentID = (select Root_Message_ID_pk_bi
    from EBay_Message 
    where Message_ID_pk_bi = @input_parentID);

    IF ISNULL(@parentID,0) = 0
	-- Use @input_parentID for parent ID of this new message
	insert into EBay_Message (fromStudent_ID_fk_bi, toStudent_ID_fk_bi, Message_t, Root_Message_ID_pk_bi, RepliedFor_Message_ID_pk_bi)
	values (@fStudent, @tStudent, @Message, @input_parentID, @input_parentID);
    ELSE
	-- @parentID for parent ID of this new message
	insert into EBay_Message (fromStudent_ID_fk_bi, toStudent_ID_fk_bi, Message_t, Root_Message_ID_pk_bi, RepliedFor_Message_ID_pk_bi)
	values (@fStudent, @tStudent, @Message, @parentID, @input_parentID);
GO
/****** Object:  StoredProcedure [dbo].[Ebay_InsertNewItem]    Script Date: 08/02/2011 16:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ebay_InsertNewItem]
@Name varchar(30),
@StudentFKID bigint,
@CategoryFKID bigint,
@Price money,
@Author varchar(30),
@Description text,
@URL varchar(50)

AS 

INSERT 
INTO [EBay_Item] ([Item_Name_vc], [Student_ID_fk_bi], [Category_ID_fk_bi], [Price_m], [Author_vc], [Description_t], [URL_vc]) 
VALUES (@Name, @StudentFKID, @CategoryFKID, @Price, @Author, @Description, @URL);


Return (1);
GO
/****** Object:  StoredProcedure [dbo].[Ebay_Conversation_P]    Script Date: 08/02/2011 16:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ebay_Conversation_P]
    @RepliedID bigint
AS

DECLARE @RootID bigint = (select distinct Root_Message_ID_pk_bi 
from EBay_Message where RepliedFor_Message_ID_pk_bi = @RepliedID);

select Message_ID_pk_bi as 'ID', fromStudent_ID_fk_bi as 'FSID', CONVERT(CHAR(11),Upload_Time_sdt) as 'DT', 
	Message_t as 'MSG', RepliedFor_Message_ID_pk_bi as 'RID', Student_Name_vc as 'FSN'
from EBay_Message , EBay_Student
where fromStudent_ID_fk_bi = Student_ID_pk_bi and (Root_Message_ID_pk_bi = @RootID or Message_ID_pk_bi = @RootID)
order by RepliedFor_Message_ID_pk_bi, Message_ID_pk_bi asc
GO
/****** Object:  Default [DF_Ebay_Ticker_DateTime_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_Ticker] ADD  CONSTRAINT [DF_Ebay_Ticker_DateTime_sdt]  DEFAULT (getdate()) FOR [DateTime_sdt]
GO
/****** Object:  Default [DF_Ebay_Ticker_isVisible_b]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_Ticker] ADD  CONSTRAINT [DF_Ebay_Ticker_isVisible_b]  DEFAULT ((1)) FOR [isVisible_b]
GO
/****** Object:  Default [DF_EBay_TempStudent_IsAdmin_bool]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_TempStudent] ADD  CONSTRAINT [DF_EBay_TempStudent_IsAdmin_bool]  DEFAULT ((0)) FOR [IsAdmin_bool]
GO
/****** Object:  Default [DF_EBay_TempStudent_PhotoURL]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_TempStudent] ADD  CONSTRAINT [DF_EBay_TempStudent_PhotoURL]  DEFAULT ('default.jpg') FOR [PhotoURL]
GO
/****** Object:  Default [DF_EBay_TempStudent_Signup_Time_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_TempStudent] ADD  CONSTRAINT [DF_EBay_TempStudent_Signup_Time_sdt]  DEFAULT (getdate()) FOR [Signup_Time_sdt]
GO
/****** Object:  Default [DF_EBay_Student_IsAdmin_bool]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Student] ADD  CONSTRAINT [DF_EBay_Student_IsAdmin_bool]  DEFAULT ((0)) FOR [IsAdmin_bool]
GO
/****** Object:  Default [DF_EBay_Student_PhotoURL]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Student] ADD  CONSTRAINT [DF_EBay_Student_PhotoURL]  DEFAULT ('default.jpg') FOR [PhotoURL]
GO
/****** Object:  Default [DF_EBay_Student_Signup_Time_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Student] ADD  CONSTRAINT [DF_EBay_Student_Signup_Time_sdt]  DEFAULT (getdate()) FOR [Signup_Time_sdt]
GO
/****** Object:  Default [DF_Table_1_Date_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_SMS_Log_Mst] ADD  CONSTRAINT [DF_Table_1_Date_sdt]  DEFAULT (getdate()) FOR [Date_d]
GO
/****** Object:  Default [DF_Ebay_SMS_Log_Mst_SMS_Sent_ti]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_SMS_Log_Mst] ADD  CONSTRAINT [DF_Ebay_SMS_Log_Mst_SMS_Sent_ti]  DEFAULT ((0)) FOR [SMS_Sent_ti]
GO
/****** Object:  Default [DF_Ebay_Feedback_Read_bool]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_Feedback] ADD  CONSTRAINT [DF_Ebay_Feedback_Read_bool]  DEFAULT ((0)) FOR [Read_bool]
GO
/****** Object:  Default [DF_Ebay_Feedback_SentAt_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_Feedback] ADD  CONSTRAINT [DF_Ebay_Feedback_SentAt_sdt]  DEFAULT (getdate()) FOR [SentAt_sdt]
GO
/****** Object:  Default [DF_Ebay_ErrorList_Time_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_ErrorList] ADD  CONSTRAINT [DF_Ebay_ErrorList_Time_sdt]  DEFAULT (getdate()) FOR [Time_sdt]
GO
/****** Object:  Default [DF_Ebay_Cabs_Capasity]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_Cabs] ADD  CONSTRAINT [DF_Ebay_Cabs_Capasity]  DEFAULT ((1)) FOR [Capasity_ti]
GO
/****** Object:  Default [DF_Ebay_Cabs_AddedOn_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_Cabs] ADD  CONSTRAINT [DF_Ebay_Cabs_AddedOn_sdt]  DEFAULT (getdate()) FOR [AddedOn_sdt]
GO
/****** Object:  Default [DF_Ebay_PasswordReset_Date_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_PasswordReset] ADD  CONSTRAINT [DF_Ebay_PasswordReset_Date_sdt]  DEFAULT (getdate()) FOR [Date_sdt]
GO
/****** Object:  Default [DF_EBay_Notices_IsModerated_bool]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Notices] ADD  CONSTRAINT [DF_EBay_Notices_IsModerated_bool]  DEFAULT ((0)) FOR [IsModerated_bool]
GO
/****** Object:  Default [DF_EBay_Notices_Upload_Time_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Notices] ADD  CONSTRAINT [DF_EBay_Notices_Upload_Time_sdt]  DEFAULT (getdate()) FOR [Upload_Time_sdt]
GO
/****** Object:  Default [DF_EBay_Notices_Expiry_Date_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Notices] ADD  CONSTRAINT [DF_EBay_Notices_Expiry_Date_sdt]  DEFAULT (dateadd(month,(1),getdate())) FOR [Expiry_Date_sdt]
GO
/****** Object:  Default [DF_EBay_Message_Message_Read_bool]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Message] ADD  CONSTRAINT [DF_EBay_Message_Message_Read_bool]  DEFAULT ((0)) FOR [Message_Read_bool]
GO
/****** Object:  Default [DF_EBay_Message_Upload_Time_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Message] ADD  CONSTRAINT [DF_EBay_Message_Upload_Time_sdt]  DEFAULT (getdate()) FOR [Upload_Time_sdt]
GO
/****** Object:  Default [DF_EBay_LAF_IsModerated_bool]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_LAF] ADD  CONSTRAINT [DF_EBay_LAF_IsModerated_bool]  DEFAULT ((0)) FOR [IsModerated_bool]
GO
/****** Object:  Default [DF_EBay_LAF_Upload_Time_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_LAF] ADD  CONSTRAINT [DF_EBay_LAF_Upload_Time_sdt]  DEFAULT (getdate()) FOR [Upload_Time_sdt]
GO
/****** Object:  Default [DF_EBay_LAF_Text_t]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_LAF] ADD  CONSTRAINT [DF_EBay_LAF_Text_t]  DEFAULT ('Empty') FOR [Text_t]
GO
/****** Object:  Default [DF_EBay_Item_Upload_Time_sdt]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Item] ADD  CONSTRAINT [DF_EBay_Item_Upload_Time_sdt]  DEFAULT (getdate()) FOR [Upload_Time_sdt]
GO
/****** Object:  Default [DF_EBay_Item_Author_vc]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Item] ADD  CONSTRAINT [DF_EBay_Item_Author_vc]  DEFAULT ('None') FOR [Author_vc]
GO
/****** Object:  Default [DF_EBay_Item_URL_vc]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Item] ADD  CONSTRAINT [DF_EBay_Item_URL_vc]  DEFAULT ('default.jpg') FOR [URL_vc]
GO
/****** Object:  ForeignKey [FK_Ebay_Cabs_EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_Cabs]  WITH CHECK ADD  CONSTRAINT [FK_Ebay_Cabs_EBay_Student] FOREIGN KEY([Student_id_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[Ebay_Cabs] CHECK CONSTRAINT [FK_Ebay_Cabs_EBay_Student]
GO
/****** Object:  ForeignKey [FK_Ebay_CloudDictionary_EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_CloudDictionary]  WITH CHECK ADD  CONSTRAINT [FK_Ebay_CloudDictionary_EBay_Student] FOREIGN KEY([ByStudent_ID_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[Ebay_CloudDictionary] CHECK CONSTRAINT [FK_Ebay_CloudDictionary_EBay_Student]
GO
/****** Object:  ForeignKey [FK_Ebay_PasswordReset_EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[Ebay_PasswordReset]  WITH CHECK ADD  CONSTRAINT [FK_Ebay_PasswordReset_EBay_Student] FOREIGN KEY([Student_ID_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[Ebay_PasswordReset] CHECK CONSTRAINT [FK_Ebay_PasswordReset_EBay_Student]
GO
/****** Object:  ForeignKey [FK_EBay_Notices_EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Notices]  WITH CHECK ADD  CONSTRAINT [FK_EBay_Notices_EBay_Student] FOREIGN KEY([Student_ID_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[EBay_Notices] CHECK CONSTRAINT [FK_EBay_Notices_EBay_Student]
GO
/****** Object:  ForeignKey [FK_EBay_Message_EBay_Message]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Message]  WITH CHECK ADD  CONSTRAINT [FK_EBay_Message_EBay_Message] FOREIGN KEY([Root_Message_ID_pk_bi])
REFERENCES [dbo].[EBay_Message] ([Message_ID_pk_bi])
GO
ALTER TABLE [dbo].[EBay_Message] CHECK CONSTRAINT [FK_EBay_Message_EBay_Message]
GO
/****** Object:  ForeignKey [FK_EBay_Message_EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Message]  WITH CHECK ADD  CONSTRAINT [FK_EBay_Message_EBay_Student] FOREIGN KEY([fromStudent_ID_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[EBay_Message] CHECK CONSTRAINT [FK_EBay_Message_EBay_Student]
GO
/****** Object:  ForeignKey [FK_EBay_Message_EBay_Student1]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Message]  WITH CHECK ADD  CONSTRAINT [FK_EBay_Message_EBay_Student1] FOREIGN KEY([toStudent_ID_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[EBay_Message] CHECK CONSTRAINT [FK_EBay_Message_EBay_Student1]
GO
/****** Object:  ForeignKey [FK_EBay_LAF_EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_LAF]  WITH CHECK ADD  CONSTRAINT [FK_EBay_LAF_EBay_Student] FOREIGN KEY([Student_ID_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[EBay_LAF] CHECK CONSTRAINT [FK_EBay_LAF_EBay_Student]
GO
/****** Object:  ForeignKey [FK_EBay_Item_EBay_Category_Mst]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Item]  WITH CHECK ADD  CONSTRAINT [FK_EBay_Item_EBay_Category_Mst] FOREIGN KEY([Category_ID_fk_bi])
REFERENCES [dbo].[EBay_Category_Mst] ([Category_ID_pk_bi])
GO
ALTER TABLE [dbo].[EBay_Item] CHECK CONSTRAINT [FK_EBay_Item_EBay_Category_Mst]
GO
/****** Object:  ForeignKey [FK_EBay_Item_EBay_Student]    Script Date: 08/02/2011 16:29:49 ******/
ALTER TABLE [dbo].[EBay_Item]  WITH CHECK ADD  CONSTRAINT [FK_EBay_Item_EBay_Student] FOREIGN KEY([Student_ID_fk_bi])
REFERENCES [dbo].[EBay_Student] ([Student_ID_pk_bi])
GO
ALTER TABLE [dbo].[EBay_Item] CHECK CONSTRAINT [FK_EBay_Item_EBay_Student]
GO
