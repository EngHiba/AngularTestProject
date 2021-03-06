USE [master]
GO
/****** Object:  Database [Student]    Script Date: 10/8/2018 4:40:04 PM ******/
CREATE DATABASE [Student]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STudent', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER_14\MSSQL\DATA\STudent.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STudent_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER_14\MSSQL\DATA\STudent_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
USE [Student]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10/8/2018 4:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/8/2018 4:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL,
	[alpha_2_code] [nvarchar](2) NULL CONSTRAINT [DF__country__alpha_2__29572725]  DEFAULT (NULL),
	[alpha_3_code] [nvarchar](3) NULL CONSTRAINT [DF__country__alpha_3__2A4B4B5E]  DEFAULT (NULL),
	[Title] [varchar](52) NULL CONSTRAINT [DF__country__en_shor__2B3F6F97]  DEFAULT (NULL),
	[nationality] [nvarchar](39) NULL CONSTRAINT [DF__country__nationa__2C3393D0]  DEFAULT (NULL),
 CONSTRAINT [PK__country__3214EC07A154E0D5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/8/2018 4:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 10/8/2018 4:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/8/2018 4:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityNo] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddelName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[NationalityId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/8/2018 4:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[Address] [nvarchar](256) NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IsCanceled] [bit] NOT NULL CONSTRAINT [DF_Student_ISCanceled]  DEFAULT ((0)),
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudyYear]    Script Date: 10/8/2018 4:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudyYear](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_StudyYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[City] ([Id], [CountryId], [Title]) VALUES (1, 760, N'Damascus')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (4, N'AF', N'AFG', NULL, N'Afghan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (8, N'AL', N'ALB', NULL, N'Albanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (10, N'AQ', N'ATA', NULL, N'Antarctic')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (12, N'DZ', N'DZA', NULL, N'Algerian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (16, N'AS', N'ASM', NULL, N'American Samoan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (20, N'AD', N'AND', NULL, N'Andorran')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (24, N'AO', N'AGO', NULL, N'Angolan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (28, N'AG', N'ATG', NULL, N'Antiguan or Barbudan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (31, N'AZ', N'AZE', NULL, N'Azerbaijani, Azeri')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (32, N'AR', N'ARG', NULL, N'Argentine')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (36, N'AU', N'AUS', NULL, N'Australian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (40, N'AT', N'AUT', NULL, N'Austrian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (44, N'BS', N'BHS', NULL, N'Bahamian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (48, N'BH', N'BHR', NULL, N'Bahraini')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (50, N'BD', N'BGD', NULL, N'Bangladeshi')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (51, N'AM', N'ARM', NULL, N'Armenian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (52, N'BB', N'BRB', NULL, N'Barbadian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (56, N'BE', N'BEL', NULL, N'Belgian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (60, N'BM', N'BMU', NULL, N'Bermudian, Bermudan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (64, N'BT', N'BTN', NULL, N'Bhutanese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (68, N'BO', N'BOL', NULL, N'Bolivian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (70, N'BA', N'BIH', NULL, N'Bosnian or Herzegovinian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (72, N'BW', N'BWA', NULL, N'Motswana, Botswanan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (74, N'BV', N'BVT', NULL, N'Bouvet Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (76, N'BR', N'BRA', NULL, N'Brazilian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (84, N'BZ', N'BLZ', NULL, N'Belizean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (86, N'IO', N'IOT', NULL, N'BIOT')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (90, N'SB', N'SLB', NULL, N'Solomon Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (92, N'VG', N'VGB', NULL, N'British Virgin Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (96, N'BN', N'BRN', NULL, N'Bruneian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (100, N'BG', N'BGR', NULL, N'Bulgarian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (104, N'MM', N'MMR', NULL, N'Burmese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (108, N'BI', N'BDI', NULL, N'Burundian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (112, N'BY', N'BLR', NULL, N'Belarusian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (116, N'KH', N'KHM', NULL, N'Cambodian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (120, N'CM', N'CMR', NULL, N'Cameroonian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (124, N'CA', N'CAN', NULL, N'Canadian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (132, N'CV', N'CPV', NULL, N'Cabo Verdean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (136, N'KY', N'CYM', NULL, N'Caymanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (140, N'CF', N'CAF', NULL, N'Central African')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (144, N'LK', N'LKA', NULL, N'Sri Lankan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (148, N'TD', N'TCD', NULL, N'Chadian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (152, N'CL', N'CHL', NULL, N'Chilean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (156, N'CN', N'CHN', NULL, N'Chinese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (158, N'TW', N'TWN', NULL, N'Chinese, Taiwanese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (162, N'CX', N'CXR', NULL, N'Christmas Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (166, N'CC', N'CCK', NULL, N'Cocos Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (170, N'CO', N'COL', NULL, N'Colombian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (174, N'KM', N'COM', NULL, N'Comoran, Comorian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (175, N'YT', N'MYT', NULL, N'Mahoran')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (178, N'CG', N'COG', NULL, N'Congolese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (180, N'CD', N'COD', NULL, N'Congolese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (184, N'CK', N'COK', NULL, N'Cook Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (188, N'CR', N'CRI', NULL, N'Costa Rican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (191, N'HR', N'HRV', NULL, N'Croatian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (192, N'CU', N'CUB', NULL, N'Cuban')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (196, N'CY', N'CYP', NULL, N'Cypriot')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (203, N'CZ', N'CZE', NULL, N'Czech')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (204, N'BJ', N'BEN', NULL, N'Beninese, Beninois')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (208, N'DK', N'DNK', NULL, N'Danish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (212, N'DM', N'DMA', NULL, N'Dominican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (214, N'DO', N'DOM', NULL, N'Dominican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (218, N'EC', N'ECU', NULL, N'Ecuadorian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (222, N'SV', N'SLV', NULL, N'Salvadoran')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (226, N'GQ', N'GNQ', NULL, N'Equatorial Guinean, Equatoguinean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (231, N'ET', N'ETH', NULL, N'Ethiopian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (232, N'ER', N'ERI', NULL, N'Eritrean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (233, N'EE', N'EST', NULL, N'Estonian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (234, N'FO', N'FRO', NULL, N'Faroese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (238, N'FK', N'FLK', NULL, N'Falkland Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (239, N'GS', N'SGS', NULL, N'South Georgia or South Sandwich Islands')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (242, N'FJ', N'FJI', NULL, N'Fijian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (246, N'FI', N'FIN', NULL, N'Finnish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (248, N'AX', N'ALA', NULL, N'?land Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (250, N'FR', N'FRA', NULL, N'French')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (254, N'GF', N'GUF', NULL, N'French Guianese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (258, N'PF', N'PYF', NULL, N'French Polynesian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (260, N'TF', N'ATF', NULL, N'French Southern Territories')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (262, N'DJ', N'DJI', NULL, N'Djiboutian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (266, N'GA', N'GAB', NULL, N'Gabonese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (268, N'GE', N'GEO', NULL, N'Georgian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (270, N'GM', N'GMB', NULL, N'Gambian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (275, N'PS', N'PSE', NULL, N'Palestinian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (276, N'DE', N'DEU', NULL, N'German')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (288, N'GH', N'GHA', NULL, N'Ghanaian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (292, N'GI', N'GIB', NULL, N'Gibraltar')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (296, N'KI', N'KIR', NULL, N'I-Kiribati')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (300, N'GR', N'GRC', NULL, N'Greek, Hellenic')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (304, N'GL', N'GRL', NULL, N'Greenlandic')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (308, N'GD', N'GRD', NULL, N'Grenadian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (312, N'GP', N'GLP', NULL, N'Guadeloupe')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (316, N'GU', N'GUM', NULL, N'Guamanian, Guambat')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (320, N'GT', N'GTM', NULL, N'Guatemalan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (324, N'GN', N'GIN', NULL, N'Guinean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (328, N'GY', N'GUY', NULL, N'Guyanese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (332, N'HT', N'HTI', NULL, N'Haitian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (334, N'HM', N'HMD', NULL, N'Heard Island or McDonald Islands')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (336, N'VA', N'VAT', NULL, N'Vatican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (340, N'HN', N'HND', NULL, N'Honduran')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (344, N'HK', N'HKG', NULL, N'Hong Kong, Hong Kongese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (348, N'HU', N'HUN', NULL, N'Hungarian, Magyar')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (352, N'IS', N'ISL', NULL, N'Icelandic')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (356, N'IN', N'IND', NULL, N'Indian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (360, N'ID', N'IDN', NULL, N'Indonesian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (364, N'IR', N'IRN', NULL, N'Iranian, Persian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (368, N'IQ', N'IRQ', NULL, N'Iraqi')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (372, N'IE', N'IRL', NULL, N'Irish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (376, N'IL', N'ISR', NULL, N'Israeli')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (380, N'IT', N'ITA', NULL, N'Italian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (384, N'CI', N'CIV', NULL, N'Ivorian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (388, N'JM', N'JAM', NULL, N'Jamaican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (392, N'JP', N'JPN', NULL, N'Japanese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (398, N'KZ', N'KAZ', NULL, N'Kazakhstani, Kazakh')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (400, N'JO', N'JOR', NULL, N'Jordanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (404, N'KE', N'KEN', NULL, N'Kenyan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (408, N'KP', N'PRK', NULL, N'North Korean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (410, N'KR', N'KOR', NULL, N'South Korean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (414, N'KW', N'KWT', NULL, N'Kuwaiti')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (417, N'KG', N'KGZ', NULL, N'Kyrgyzstani, Kyrgyz, Kirgiz, Kirghiz')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (418, N'LA', N'LAO', NULL, N'Lao, Laotian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (422, N'LB', N'LBN', NULL, N'Lebanese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (426, N'LS', N'LSO', NULL, N'Basotho')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (428, N'LV', N'LVA', NULL, N'Latvian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (430, N'LR', N'LBR', NULL, N'Liberian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (434, N'LY', N'LBY', NULL, N'Libyan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (438, N'LI', N'LIE', NULL, N'Liechtenstein')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (440, N'LT', N'LTU', NULL, N'Lithuanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (442, N'LU', N'LUX', NULL, N'Luxembourg, Luxembourgish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (446, N'MO', N'MAC', NULL, N'Macanese, Chinese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (450, N'MG', N'MDG', NULL, N'Malagasy')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (454, N'MW', N'MWI', NULL, N'Malawian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (458, N'MY', N'MYS', NULL, N'Malaysian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (462, N'MV', N'MDV', NULL, N'Maldivian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (466, N'ML', N'MLI', NULL, N'Malian, Malinese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (470, N'MT', N'MLT', NULL, N'Maltese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (474, N'MQ', N'MTQ', NULL, N'Martiniquais, Martinican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (478, N'MR', N'MRT', NULL, N'Mauritanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (480, N'MU', N'MUS', NULL, N'Mauritian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (484, N'MX', N'MEX', NULL, N'Mexican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (492, N'MC', N'MCO', NULL, N'Monégasque, Monacan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (496, N'MN', N'MNG', NULL, N'Mongolian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (498, N'MD', N'MDA', NULL, N'Moldovan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (499, N'ME', N'MNE', NULL, N'Montenegrin')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (500, N'MS', N'MSR', NULL, N'Montserratian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (504, N'MA', N'MAR', NULL, N'Moroccan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (508, N'MZ', N'MOZ', NULL, N'Mozambican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (512, N'OM', N'OMN', NULL, N'Omani')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (516, N'NA', N'NAM', NULL, N'Namibian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (520, N'NR', N'NRU', NULL, N'Nauruan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (524, N'NP', N'NPL', NULL, N'Nepali, Nepalese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (528, N'NL', N'NLD', NULL, N'Dutch, Netherlandic')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (531, N'CW', N'CUW', NULL, N'Curaçaoan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (533, N'AW', N'ABW', NULL, N'Aruban')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (534, N'SX', N'SXM', NULL, N'Sint Maarten')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (535, N'BQ', N'BES', NULL, N'Bonaire')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (540, N'NC', N'NCL', NULL, N'New Caledonian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (548, N'VU', N'VUT', NULL, N'Ni-Vanuatu, Vanuatuan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (554, N'NZ', N'NZL', NULL, N'New Zealand, NZ')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (558, N'NI', N'NIC', NULL, N'Nicaraguan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (562, N'NE', N'NER', NULL, N'Nigerien')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (566, N'NG', N'NGA', NULL, N'Nigerian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (570, N'NU', N'NIU', NULL, N'Niuean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (574, N'NF', N'NFK', NULL, N'Norfolk Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (578, N'NO', N'NOR', NULL, N'Norwegian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (580, N'MP', N'MNP', NULL, N'Northern Marianan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (581, N'UM', N'UMI', NULL, N'American')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (583, N'FM', N'FSM', NULL, N'Micronesian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (584, N'MH', N'MHL', NULL, N'Marshallese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (585, N'PW', N'PLW', NULL, N'Palauan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (586, N'PK', N'PAK', NULL, N'Pakistani')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (591, N'PA', N'PAN', NULL, N'Panamanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (598, N'PG', N'PNG', NULL, N'Papua New Guinean, Papuan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (600, N'PY', N'PRY', NULL, N'Paraguayan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (604, N'PE', N'PER', NULL, N'Peruvian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (608, N'PH', N'PHL', NULL, N'Philippine, Filipino')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (612, N'PN', N'PCN', NULL, N'Pitcairn Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (616, N'PL', N'POL', NULL, N'Polish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (620, N'PT', N'PRT', NULL, N'Portuguese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (624, N'GW', N'GNB', NULL, N'Bissau-Guinean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (626, N'TL', N'TLS', NULL, N'Timorese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (630, N'PR', N'PRI', NULL, N'Puerto Rican')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (634, N'QA', N'QAT', NULL, N'Qatari')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (638, N'RE', N'REU', NULL, N'Réunionese, Réunionnais')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (642, N'RO', N'ROU', NULL, N'Romanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (643, N'RU', N'RUS', NULL, N'Russian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (646, N'RW', N'RWA', NULL, N'Rwandan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (652, N'BL', N'BLM', NULL, N'Barthélemois')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (654, N'SH', N'SHN', NULL, N'Saint Helenian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (659, N'KN', N'KNA', NULL, N'Kittitian or Nevisian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (660, N'AI', N'AIA', NULL, N'Anguillan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (662, N'LC', N'LCA', NULL, N'Saint Lucian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (663, N'MF', N'MAF', NULL, N'Saint-Martinoise')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (666, N'PM', N'SPM', NULL, N'Saint-Pierrais or Miquelonnais')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (670, N'VC', N'VCT', NULL, N'Saint Vincentian, Vincentian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (674, N'SM', N'SMR', NULL, N'Sammarinese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (678, N'ST', N'STP', NULL, N'S?o Toméan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (682, N'SA', N'SAU', NULL, N'Saudi, Saudi Arabian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (686, N'SN', N'SEN', NULL, N'Senegalese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (688, N'RS', N'SRB', NULL, N'Serbian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (690, N'SC', N'SYC', NULL, N'Seychellois')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (694, N'SL', N'SLE', NULL, N'Sierra Leonean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (702, N'SG', N'SGP', NULL, N'Singaporean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (703, N'SK', N'SVK', NULL, N'Slovak')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (704, N'VN', N'VNM', NULL, N'Vietnamese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (705, N'SI', N'SVN', NULL, N'Slovenian, Slovene')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (706, N'SO', N'SOM', NULL, N'Somali, Somalian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (710, N'ZA', N'ZAF', NULL, N'South African')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (716, N'ZW', N'ZWE', NULL, N'Zimbabwean')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (724, N'ES', N'ESP', NULL, N'Spanish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (728, N'SS', N'SSD', NULL, N'South Sudanese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (729, N'SD', N'SDN', NULL, N'Sudanese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (732, N'EH', N'ESH', NULL, N'Sahrawi, Sahrawian, Sahraouian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (740, N'SR', N'SUR', NULL, N'Surinamese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (744, N'SJ', N'SJM', NULL, N'Svalbard')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (748, N'SZ', N'SWZ', NULL, N'Swazi')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (752, N'SE', N'SWE', NULL, N'Swedish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (756, N'CH', N'CHE', NULL, N'Swiss')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (760, N'SY', N'SYR', NULL, N'Syrian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (762, N'TJ', N'TJK', NULL, N'Tajikistani')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (764, N'TH', N'THA', NULL, N'Thai')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (768, N'TG', N'TGO', NULL, N'Togolese')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (772, N'TK', N'TKL', NULL, N'Tokelauan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (776, N'TO', N'TON', NULL, N'Tongan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (780, N'TT', N'TTO', NULL, N'Trinidadian or Tobagonian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (784, N'AE', N'ARE', NULL, N'Emirati, Emirian, Emiri')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (788, N'TN', N'TUN', NULL, N'Tunisian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (792, N'TR', N'TUR', NULL, N'Turkish')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (795, N'TM', N'TKM', NULL, N'Turkmen')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (796, N'TC', N'TCA', NULL, N'Turks and Caicos Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (798, N'TV', N'TUV', NULL, N'Tuvaluan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (800, N'UG', N'UGA', NULL, N'Ugandan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (804, N'UA', N'UKR', NULL, N'Ukrainian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (807, N'MK', N'MKD', NULL, N'Macedonian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (818, N'EG', N'EGY', NULL, N'Egyptian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (826, N'GB', N'GBR', NULL, N'British, UK')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (831, N'GG', N'GGY', NULL, N'Channel Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (832, N'JE', N'JEY', NULL, N'Channel Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (833, N'IM', N'IMN', NULL, N'Manx')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (834, N'TZ', N'TZA', NULL, N'Tanzanian')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (840, N'US', N'USA', NULL, N'American')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (850, N'VI', N'VIR', NULL, N'U.S. Virgin Island')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (854, N'BF', N'BFA', NULL, N'Burkinabé')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (858, N'UY', N'URY', NULL, N'Uruguayan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (860, N'UZ', N'UZB', NULL, N'Uzbekistani, Uzbek')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (862, N'VE', N'VEN', NULL, N'Venezuelan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (876, N'WF', N'WLF', NULL, N'Wallis and Futuna, Wallisian or Futunan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (882, N'WS', N'WSM', NULL, N'Samoan')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (887, N'YE', N'YEM', NULL, N'Yemeni')
GO
INSERT [dbo].[Country] ([Id], [alpha_2_code], [alpha_3_code], [Title], [nationality]) VALUES (894, N'ZM', N'ZMB', NULL, N'Zambian')
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

GO
INSERT [dbo].[Department] ([Id], [Title]) VALUES (1, N'IT')
GO
INSERT [dbo].[Department] ([Id], [Title]) VALUES (2, N'Math')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (1, N'Afghan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (2, N'Albanian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (3, N'Algerian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (4, N'American')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (5, N'Andorran')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (6, N'Angolan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (7, N'Antiguans')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (8, N'Argentinean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (9, N'Armenian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (10, N'Australian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (11, N'Austrian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (12, N'Azerbaijani')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (13, N'Bahamian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (14, N'Bahraini')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (15, N'Bangladeshi')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (16, N'Barbadian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (17, N'Barbudans')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (18, N'Batswana')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (19, N'Belarusian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (20, N'Belgian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (21, N'Belizean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (22, N'Beninese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (23, N'Bhutanese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (24, N'Bolivian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (25, N'Bosnian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (26, N'Brazilian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (27, N'British')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (28, N'Bruneian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (29, N'Bulgarian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (30, N'Burkinabe')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (31, N'Burmese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (32, N'Burundian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (33, N'Cambodian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (34, N'Cameroonian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (35, N'Canadian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (36, N'Cape Verdean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (37, N'Central African')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (38, N'Chadian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (39, N'Chilean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (40, N'Chinese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (41, N'Colombian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (42, N'Comoran')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (43, N'Congolese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (44, N'Congolese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (45, N'Costa Rican')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (46, N'Croatian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (47, N'Cuban')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (48, N'Cypriot')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (49, N'Czech')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (50, N'Danish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (51, N'Djibouti')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (52, N'Dominican')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (53, N'Dominican')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (54, N'Dutch')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (55, N'Dutchman')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (56, N'Dutchwoman')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (57, N'East Timorese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (58, N'Ecuadorean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (59, N'Egyptian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (60, N'Emirian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (61, N'Equatorial Guinean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (62, N'Eritrean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (63, N'Estonian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (64, N'Ethiopian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (65, N'Fijian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (66, N'Filipino')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (67, N'Finnish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (68, N'French')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (69, N'Gabonese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (70, N'Gambian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (71, N'Georgian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (72, N'German')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (73, N'Ghanaian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (74, N'Greek')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (75, N'Grenadian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (76, N'Guatemalan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (77, N'Guinea-Bissauan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (78, N'Guinean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (79, N'Guyanese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (80, N'Haitian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (81, N'Herzegovinian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (82, N'Honduran')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (83, N'Hungarian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (84, N'I-Kiribati')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (85, N'Icelander')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (86, N'Indian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (87, N'Indonesian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (88, N'Iranian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (89, N'Iraqi')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (90, N'Irish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (91, N'Irish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (92, N'Israeli')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (93, N'Italian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (94, N'Ivorian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (95, N'Jamaican')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (96, N'Japanese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (97, N'Jordanian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (98, N'Kazakhstani')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (99, N'Kenyan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (100, N'Kittian and Nevisian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (101, N'Kuwaiti')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (102, N'Kyrgyz')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (103, N'Laotian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (104, N'Latvian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (105, N'Lebanese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (106, N'Liberian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (107, N'Libyan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (108, N'Liechtensteiner')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (109, N'Lithuanian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (110, N'Luxembourger')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (111, N'Macedonian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (112, N'Malagasy')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (113, N'Malawian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (114, N'Malaysian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (115, N'Maldivan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (116, N'Malian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (117, N'Maltese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (118, N'Marshallese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (119, N'Mauritanian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (120, N'Mauritian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (121, N'Mexican')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (122, N'Micronesian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (123, N'Moldovan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (124, N'Monacan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (125, N'Mongolian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (126, N'Moroccan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (127, N'Mosotho')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (128, N'Motswana')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (129, N'Mozambican')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (130, N'Namibian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (131, N'Nauruan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (132, N'Nepalese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (133, N'Netherlander')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (134, N'New Zealander')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (135, N'Ni-Vanuatu')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (136, N'Nicaraguan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (137, N'Nigerian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (138, N'Nigerien')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (139, N'North Korean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (140, N'Northern Irish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (141, N'Norwegian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (142, N'Omani')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (143, N'Pakistani')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (144, N'Palauan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (145, N'Panamanian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (146, N'Papua New Guinean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (147, N'Paraguayan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (148, N'Peruvian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (149, N'Polish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (150, N'Portuguese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (151, N'Qatari')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (152, N'Romanian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (153, N'Russian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (154, N'Rwandan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (155, N'Saint Lucian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (156, N'Salvadoran')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (157, N'Samoan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (158, N'San Marinese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (159, N'Sao Tomean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (160, N'Saudi')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (161, N'Scottish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (162, N'Senegalese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (163, N'Serbian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (164, N'Seychellois')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (165, N'Sierra Leonean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (166, N'Singaporean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (167, N'Slovakian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (168, N'Slovenian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (169, N'Solomon Islander')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (170, N'Somali')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (171, N'South African')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (172, N'South Korean')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (173, N'Spanish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (174, N'Sri Lankan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (175, N'Sudanese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (176, N'Surinamer')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (177, N'Swazi')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (178, N'Swedish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (179, N'Swiss')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (180, N'Syrian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (181, N'Taiwanese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (182, N'Tajik')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (183, N'Tanzanian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (184, N'Thai')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (185, N'Togolese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (186, N'Tongan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (187, N'Trinidadian or Tobagonian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (188, N'Tunisian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (189, N'Turkish')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (190, N'Tuvaluan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (191, N'Ugandan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (192, N'Ukrainian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (193, N'Uruguayan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (194, N'Uzbekistani')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (195, N'Venezuelan')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (196, N'Vietnamese')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (197, N'Welsh')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (198, N'Welsh')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (199, N'Yemenite')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (200, N'Zambian')
GO
INSERT [dbo].[Nationality] ([Id], [Title]) VALUES (201, N'Zimbabwean')
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (2, N'0111', N'Hiba', N'Dimashky', N'-', CAST(N'1993-02-23' AS Date), 180, 1)
GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (4, N'0111', N'TestFirstName', N'TestLastName', N'-', CAST(N'2000-01-01' AS Date), 180, 1)
GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (34, N'00', N'Hiba', N'Dimashky', N'-', CAST(N'2018-10-08' AS Date), 17, 0)
GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (35, N'0000', N'FTest2', N'LTest2', N'MTest2', CAST(N'0093-09-11' AS Date), 180, 0)
GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (36, N'00', N'Test2 FirstName', N'Test2 LastName', N'Test2 MiddleName', CAST(N'2000-10-02' AS Date), 180, 1)
GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (37, N';k;', N'uu', N'll', N',lkl', CAST(N'2018-10-08' AS Date), 18, 0)
GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (39, N'0000', N'FTest2', N'Dimashky', N'h', CAST(N'2018-10-08' AS Date), 3, 0)
GO
INSERT [dbo].[Person] ([Id], [IdentityNo], [FirstName], [LastName], [MiddelName], [BirthDate], [NationalityId], [GenderId]) VALUES (40, N'1546', N'Test', N'TEst1', N'TEst1', CAST(N'1983-01-01' AS Date), 18, 1)
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

GO
INSERT [dbo].[Student] ([Id], [PersonId], [YearId], [CityId], [Address], [Mobile], [Phone], [Email], [IsCanceled]) VALUES (4, 4, 1002, 1, N'Damascus', N'098', N'012', N'Test@test.com', 0)
GO
INSERT [dbo].[Student] ([Id], [PersonId], [YearId], [CityId], [Address], [Mobile], [Phone], [Email], [IsCanceled]) VALUES (15, 36, 1002, 1, N'Damascus', N'099', N'0666', N'Test2@test.com', 0)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudyYear] ON 

GO
INSERT [dbo].[StudyYear] ([Id], [DepartmentId], [Title]) VALUES (1, 1, N'1st')
GO
INSERT [dbo].[StudyYear] ([Id], [DepartmentId], [Title]) VALUES (2, 1, N'2end')
GO
INSERT [dbo].[StudyYear] ([Id], [DepartmentId], [Title]) VALUES (3, 1, N'3rd')
GO
INSERT [dbo].[StudyYear] ([Id], [DepartmentId], [Title]) VALUES (4, 1, N'4th')
GO
INSERT [dbo].[StudyYear] ([Id], [DepartmentId], [Title]) VALUES (5, 1, N'5th')
GO
INSERT [dbo].[StudyYear] ([Id], [DepartmentId], [Title]) VALUES (1002, 2, N'1st')
GO
SET IDENTITY_INSERT [dbo].[StudyYear] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Nationality]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_City]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_StudyYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[StudyYear] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_StudyYear]
GO
ALTER TABLE [dbo].[StudyYear]  WITH CHECK ADD  CONSTRAINT [FK_StudyYear_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[StudyYear] CHECK CONSTRAINT [FK_StudyYear_Department]
GO
USE [master]
GO
ALTER DATABASE [Student] SET  READ_WRITE 
GO
