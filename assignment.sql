
USE [PRJ_ass]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[AttendentID] [int] NOT NULL,
	[SchEmpID] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Alpha] [float] NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[AttendentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [nvarchar](150) NOT NULL,
	[type] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [nvarchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [varchar](150) NOT NULL,
	[dob] [date] NOT NULL,
	[RoleID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[salary] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] NOT NULL,
	[FeatureName] [nvarchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [nvarchar](150) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanCampain]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanCampain](
	[PlanCampnID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Estimate] [int] NOT NULL,
 CONSTRAINT [PK_PlanCampain] PRIMARY KEY CLUSTERED 
(
	[PlanCampnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[FeatureID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchedualCampaign]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchedualCampaign](
	[ScID] [int] NOT NULL,
	[PlanCampnID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Shift] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SchedualCampaign] PRIMARY KEY CLUSTERED 
(
	[ScID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchedualEmployee]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchedualEmployee](
	[SchEmpID] [int] NOT NULL,
	[ScID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_SchedualEmployee] PRIMARY KEY CLUSTERED 
(
	[SchEmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/16/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserName] [nvarchar](150) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (1, 1, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (2, 2, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (3, 3, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (4, 4, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (5, 5, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (6, 6, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (7, 7, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (8, 8, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (9, 9, CAST(7.50 AS Decimal(18, 2)), 0.75)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (10, 10, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (11, 11, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (12, 12, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (13, 13, CAST(4.50 AS Decimal(18, 2)), 1.25)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (14, 14, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (15, 15, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (16, 16, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (17, 17, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (18, 18, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (19, 19, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (20, 20, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (21, 21, CAST(8.50 AS Decimal(18, 2)), 1.25)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (22, 22, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (23, 23, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (24, 24, CAST(7.00 AS Decimal(18, 2)), 0.5)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (25, 25, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (26, 26, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (27, 27, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (28, 28, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (29, 29, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (30, 30, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (31, 31, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (32, 32, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (33, 33, CAST(9.00 AS Decimal(18, 2)), 1.5)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (34, 34, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (35, 35, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (36, 36, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (37, 37, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (38, 38, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (39, 39, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (40, 40, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (41, 41, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (42, 42, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (43, 43, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (44, 44, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (45, 45, CAST(6.00 AS Decimal(18, 2)), 0.25)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (46, 46, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (47, 47, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (48, 48, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (49, 49, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (50, 50, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (51, 51, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (52, 52, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (53, 53, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (54, 54, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (55, 55, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (56, 56, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (57, 57, CAST(8.00 AS Decimal(18, 2)), 1.75)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (58, 58, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (59, 59, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (60, 60, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (61, 61, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (62, 62, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (63, 63, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (64, 64, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (65, 65, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (66, 66, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (67, 67, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (68, 68, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (69, 69, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (70, 70, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (71, 71, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (72, 72, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (73, 73, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (74, 74, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (75, 75, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (76, 76, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (77, 77, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (78, 78, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (79, 79, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (80, 80, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (81, 81, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (82, 82, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (83, 83, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (84, 84, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (85, 85, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (86, 86, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (87, 87, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (88, 88, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (89, 89, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (90, 90, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (91, 91, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (92, 92, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (93, 93, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (94, 94, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (95, 95, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (96, 96, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (97, 97, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (98, 98, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (99, 99, CAST(3.50 AS Decimal(18, 2)), 0.75)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (100, 100, CAST(4.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (101, 101, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (102, 102, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (103, 103, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (104, 104, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (105, 105, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (106, 106, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (107, 107, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (108, 108, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (109, 109, CAST(4.50 AS Decimal(18, 2)), 1.25)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (110, 110, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (111, 111, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (112, 112, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (113, 113, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (114, 114, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (115, 115, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (116, 116, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (117, 117, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (118, 118, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (119, 119, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (120, 120, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (121, 121, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (122, 122, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (123, 123, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (124, 124, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (125, 125, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (126, 126, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (127, 127, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (128, 128, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (129, 129, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (130, 130, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (131, 131, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (132, 132, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (133, 133, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (134, 134, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (135, 135, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (136, 136, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (137, 137, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (138, 138, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (139, 139, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (140, 140, CAST(2.00 AS Decimal(18, 2)), 0.25)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (141, 141, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (142, 142, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (143, 143, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (144, 144, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (145, 145, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (146, 146, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (147, 147, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (148, 148, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (149, 149, CAST(6.00 AS Decimal(18, 2)), 1.75)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (150, 150, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (151, 151, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (152, 152, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (153, 153, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (154, 154, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (155, 155, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (156, 156, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (157, 157, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (158, 158, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (159, 159, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (160, 160, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (161, 161, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (162, 162, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (163, 163, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (164, 164, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (165, 165, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (166, 166, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (167, 167, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (168, 168, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (169, 169, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (170, 170, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (171, 171, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (172, 172, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (173, 173, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (174, 174, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (175, 175, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (176, 176, CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (177, 177, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (178, 178, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (179, 179, CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Attendence] ([AttendentID], [SchEmpID], [Quantity], [Alpha]) VALUES (180, 180, CAST(8.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (1, N'Production Workshop1', N'WS')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (2, N'Production Workshop2', N'WS')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (3, N'Production Planning', N'HO')
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (1, N'Tran Van A', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 3, 1, CAST(1260000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (2, N'Nguyen Thi B', 0, N'Hue', CAST(N'1991-02-02' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (3, N'Le Van C', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (4, N'Pham Thi D', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (5, N'Do Van E', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 3, 1, CAST(1260000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (6, N'Bui Thi F', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (7, N'Hoang Van G', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (8, N'Vu Thi H', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (9, N'Nguyen Van I', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (10, N'Tran Thi J', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 1, 1, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (11, N'Pham Van K', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (12, N'Le Thi L', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 3, 1, CAST(1140000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (13, N'Nguyen Van M', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 3, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (14, N'Tran Van N', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 3, 2, CAST(1380000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (15, N'Nguyen Thi O', 0, N'Hue', CAST(N'1991-02-02' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (16, N'Le Van P', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (17, N'Pham Thi Q', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (18, N'Do Van R', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (19, N'Bui Thi S', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (20, N'Hoang Van T', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 1, 2, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (21, N'Vu Thi U', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (22, N'Nguyen Van V', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (23, N'Tran Thi W', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (24, N'Pham Van X', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (25, N'Le Thi Y', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (26, N'Nguyen Van Z', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 3, 2, CAST(1020000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (27, N'Tran Van AA', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 3, 2, CAST(960000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (28, N'Nguyen Thi BB', 0, N'Hue', CAST(N'1991-02-02' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (29, N'Le Van CC', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (30, N'Pham Thi DD', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 1, 2, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (31, N'Do Van EE', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (32, N'Bui Thi FF', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 3, 2, CAST(1440000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (33, N'Hoang Van GG', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (34, N'Vu Thi HH', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (35, N'Nguyen Van II', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 3, 2, CAST(1080000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (36, N'Tran Thi JJ', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 3, 2, CAST(1320000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (37, N'Pham Van KK', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (38, N'Le Thi LL', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (39, N'Nguyen Van MM', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 3, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (40, N'Tran Van NN', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 2, 3, CAST(5000000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (1, N'Create Employee', N'/employee/create')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (2, N'List All Employee', N'/employee/list')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (3, N'Search Employee', N'/employee/search')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (4, N'Work plan', N'/work/plan')
GO
SET IDENTITY_INSERT [dbo].[Plan] ON 

INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (1, N'San Xuat Gio', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-05' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (2, N'San Xuat Thung va Met', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-05' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (3, N'Create new Plan for Son', CAST(N'2024-10-17' AS Date), CAST(N'2024-10-19' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Plan] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanCampain] ON 

INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (1, 1, 1, 240, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (2, 2, 2, 240, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (3, 2, 3, 480, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (4, 3, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (5, 3, 3, 200, 2)
SET IDENTITY_INSERT [dbo].[PlanCampain] OFF
GO
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (1, N'Giỏ')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (2, N'Thúng')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (3, N'Mẹt')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [Description]) VALUES (1, N'Production Manager', N'production process management')
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description]) VALUES (2, N'Production Planning Director', N'implement production plan')
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description]) VALUES (3, N'Worker', N'action')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (2, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (2, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (3, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (3, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (4, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (4, 2)
GO
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (1, 1, CAST(N'2024-10-01' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (2, 2, CAST(N'2024-10-01' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (3, 3, CAST(N'2024-10-01' AS Date), 1, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (4, 1, CAST(N'2024-10-01' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (5, 2, CAST(N'2024-10-01' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (6, 3, CAST(N'2024-10-01' AS Date), 2, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (7, 1, CAST(N'2024-10-01' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (8, 2, CAST(N'2024-10-01' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (9, 3, CAST(N'2024-10-01' AS Date), 3, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (10, 1, CAST(N'2024-10-02' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (11, 2, CAST(N'2024-10-02' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (12, 3, CAST(N'2024-10-02' AS Date), 1, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (13, 1, CAST(N'2024-10-02' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (14, 2, CAST(N'2024-10-02' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (15, 3, CAST(N'2024-10-02' AS Date), 2, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (16, 1, CAST(N'2024-10-02' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (17, 2, CAST(N'2024-10-02' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (18, 3, CAST(N'2024-10-02' AS Date), 3, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (19, 1, CAST(N'2024-10-03' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (20, 2, CAST(N'2024-10-03' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (21, 3, CAST(N'2024-10-03' AS Date), 1, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (22, 1, CAST(N'2024-10-03' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (23, 2, CAST(N'2024-10-03' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (24, 3, CAST(N'2024-10-03' AS Date), 2, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (25, 1, CAST(N'2024-10-03' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (26, 2, CAST(N'2024-10-03' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (27, 3, CAST(N'2024-10-03' AS Date), 3, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (28, 1, CAST(N'2024-10-04' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (29, 2, CAST(N'2024-10-04' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (30, 3, CAST(N'2024-10-04' AS Date), 1, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (31, 1, CAST(N'2024-10-04' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (32, 2, CAST(N'2024-10-04' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (33, 3, CAST(N'2024-10-04' AS Date), 2, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (34, 1, CAST(N'2024-10-04' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (35, 2, CAST(N'2024-10-04' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (36, 3, CAST(N'2024-10-04' AS Date), 3, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (37, 1, CAST(N'2024-10-05' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (38, 2, CAST(N'2024-10-05' AS Date), 1, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (39, 3, CAST(N'2024-10-05' AS Date), 1, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (40, 1, CAST(N'2024-10-05' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (41, 2, CAST(N'2024-10-05' AS Date), 2, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (42, 3, CAST(N'2024-10-05' AS Date), 2, 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (43, 1, CAST(N'2024-10-05' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (44, 2, CAST(N'2024-10-05' AS Date), 3, 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (45, 3, CAST(N'2024-10-05' AS Date), 3, 32)
GO
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (1, 1, 1, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (2, 1, 2, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (3, 1, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (4, 1, 4, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (5, 2, 14, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (6, 2, 15, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (7, 2, 16, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (8, 2, 17, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (9, 3, 27, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (10, 3, 28, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (11, 3, 29, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (12, 3, 31, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (13, 4, 5, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (14, 4, 6, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (15, 4, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (16, 4, 8, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (17, 5, 18, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (18, 5, 19, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (19, 5, 21, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (20, 5, 22, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (21, 6, 32, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (22, 6, 33, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (23, 6, 34, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (24, 6, 35, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (25, 7, 9, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (26, 7, 11, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (27, 7, 12, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (28, 7, 13, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (29, 8, 23, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (30, 8, 24, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (31, 8, 25, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (32, 8, 26, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (33, 9, 36, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (34, 9, 37, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (35, 9, 38, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (36, 9, 39, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (37, 10, 1, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (38, 10, 2, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (39, 10, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (40, 10, 4, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (41, 11, 14, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (42, 11, 15, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (43, 11, 16, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (44, 11, 17, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (45, 12, 27, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (46, 12, 28, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (47, 12, 29, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (48, 12, 31, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (49, 13, 5, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (50, 13, 6, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (51, 13, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (52, 13, 8, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (53, 14, 18, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (54, 14, 19, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (55, 14, 21, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (56, 14, 22, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (57, 15, 32, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (58, 15, 33, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (59, 15, 34, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (60, 15, 35, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (61, 16, 9, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (62, 16, 11, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (63, 16, 12, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (64, 16, 13, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (65, 17, 23, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (66, 17, 24, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (67, 17, 25, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (68, 17, 26, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (69, 18, 36, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (70, 18, 37, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (71, 18, 38, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (72, 18, 39, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (73, 19, 1, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (74, 19, 2, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (75, 19, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (76, 19, 4, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (77, 20, 14, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (78, 20, 15, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (79, 20, 16, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (80, 20, 17, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (81, 21, 27, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (82, 21, 28, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (83, 21, 29, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (84, 21, 31, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (85, 22, 5, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (86, 22, 6, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (87, 22, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (88, 22, 8, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (89, 23, 18, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (90, 23, 19, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (91, 23, 21, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (92, 23, 22, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (93, 24, 32, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (94, 24, 33, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (95, 24, 34, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (96, 24, 35, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (97, 25, 9, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (98, 25, 11, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (99, 25, 12, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (100, 25, 13, CAST(4 AS Decimal(18, 0)))
GO
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (101, 26, 23, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (102, 26, 24, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (103, 26, 25, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (104, 26, 26, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (105, 27, 36, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (106, 27, 37, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (107, 27, 38, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (108, 27, 39, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (109, 28, 1, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (110, 28, 2, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (111, 28, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (112, 28, 4, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (113, 29, 14, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (114, 29, 15, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (115, 29, 16, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (116, 29, 17, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (117, 30, 27, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (118, 30, 28, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (119, 30, 29, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (120, 30, 31, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (121, 31, 5, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (122, 31, 6, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (123, 31, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (124, 31, 8, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (125, 32, 18, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (126, 32, 19, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (127, 32, 21, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (128, 32, 22, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (129, 33, 32, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (130, 33, 33, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (131, 33, 34, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (132, 33, 35, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (133, 34, 9, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (134, 34, 11, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (135, 34, 12, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (136, 34, 13, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (137, 35, 23, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (138, 35, 24, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (139, 35, 25, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (140, 35, 26, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (141, 36, 36, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (142, 36, 37, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (143, 36, 38, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (144, 36, 39, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (145, 37, 1, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (146, 37, 2, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (147, 37, 3, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (148, 37, 4, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (149, 38, 14, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (150, 38, 15, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (151, 38, 16, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (152, 38, 17, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (153, 39, 27, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (154, 39, 28, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (155, 39, 29, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (156, 39, 31, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (157, 40, 5, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (158, 40, 6, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (159, 40, 7, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (160, 40, 8, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (161, 41, 18, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (162, 41, 19, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (163, 41, 21, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (164, 41, 22, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (165, 42, 32, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (166, 42, 33, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (167, 42, 34, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (168, 42, 35, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (169, 43, 9, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (170, 43, 11, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (171, 43, 12, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (172, 43, 13, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (173, 44, 23, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (174, 44, 24, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (175, 44, 25, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (176, 44, 26, CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (177, 45, 36, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (178, 45, 37, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (179, 45, 38, CAST(8 AS Decimal(18, 0)))
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (180, 45, 39, CAST(8 AS Decimal(18, 0)))
GO
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin1', N'123')
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin2', N'123')
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin3', N'123')
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin4', N'123')
GO
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin1', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin2', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin3', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin4', 2)
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_SchedualEmployee] FOREIGN KEY([SchEmpID])
REFERENCES [dbo].[SchedualEmployee] ([SchEmpID])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_SchedualEmployee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Department1] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Department1]
GO
ALTER TABLE [dbo].[PlanCampain]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampain_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[PlanCampain] CHECK CONSTRAINT [FK_PlanCampain_Plan]
GO
ALTER TABLE [dbo].[PlanCampain]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampain_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PlanCampain] CHECK CONSTRAINT [FK_PlanCampain_Product]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Feature] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Feature] ([FeatureID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[SchedualCampaign]  WITH CHECK ADD  CONSTRAINT [FK_SchedualCampaign_PlanCampain] FOREIGN KEY([PlanCampnID])
REFERENCES [dbo].[PlanCampain] ([PlanCampnID])
GO
ALTER TABLE [dbo].[SchedualCampaign] CHECK CONSTRAINT [FK_SchedualCampaign_PlanCampain]
GO
ALTER TABLE [dbo].[SchedualEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SchedualEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SchedualEmployee] CHECK CONSTRAINT [FK_SchedualEmployee_Employee]
GO
ALTER TABLE [dbo].[SchedualEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SchedualEmployee_SchedualCampaign] FOREIGN KEY([ScID])
REFERENCES [dbo].[SchedualCampaign] ([ScID])
GO
ALTER TABLE [dbo].[SchedualEmployee] CHECK CONSTRAINT [FK_SchedualEmployee_SchedualCampaign]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
