USE [master]
GO
/****** Object:  Database [SyberryTest]    Script Date: 16.09.2020 20:01:01 ******/
CREATE DATABASE [SyberryTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SyberryTest', FILENAME = N'C:\Users\avitv\SyberryTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SyberryTest_log', FILENAME = N'C:\Users\avitv\SyberryTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SyberryTest] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SyberryTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SyberryTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SyberryTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SyberryTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SyberryTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SyberryTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [SyberryTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SyberryTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SyberryTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SyberryTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SyberryTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SyberryTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SyberryTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SyberryTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SyberryTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SyberryTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SyberryTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SyberryTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SyberryTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SyberryTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SyberryTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SyberryTest] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SyberryTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SyberryTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SyberryTest] SET  MULTI_USER 
GO
ALTER DATABASE [SyberryTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SyberryTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SyberryTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SyberryTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SyberryTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SyberryTest] SET QUERY_STORE = OFF
GO
USE [SyberryTest]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [SyberryTest]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 16.09.2020 20:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_reports]    Script Date: 16.09.2020 20:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_reports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[hours] [real] NOT NULL,
	[date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_time_reports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([id], [name]) VALUES (1, N'John')
INSERT [dbo].[employees] ([id], [name]) VALUES (2, N'Dina')
INSERT [dbo].[employees] ([id], [name]) VALUES (3, N'Aleks')
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[time_reports] ON 

INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (29, 1, 5.5, CAST(N'2020-09-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (30, 1, 4.5, CAST(N'2020-09-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (31, 1, 5, CAST(N'2020-09-09T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (32, 1, 5.5, CAST(N'2020-09-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (33, 1, 4, CAST(N'2020-09-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (34, 1, 6.5, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (35, 1, 3.5, CAST(N'2020-09-13T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (36, 1, 7.5, CAST(N'2020-09-14T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (37, 1, 3.5, CAST(N'2020-09-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (38, 1, 4.5, CAST(N'2020-09-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (39, 1, 5, CAST(N'2020-09-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (40, 1, 4, CAST(N'2020-09-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (41, 1, 4.5, CAST(N'2020-09-19T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (42, 1, 6.5, CAST(N'2020-09-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (44, 2, 4.3, CAST(N'2020-09-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (45, 2, 4, CAST(N'2020-09-09T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (46, 2, 5.75, CAST(N'2020-09-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (47, 2, 3, CAST(N'2020-09-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (48, 2, 5.8, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (49, 2, 4.25, CAST(N'2020-09-13T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (51, 2, 6.5, CAST(N'2020-09-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (52, 2, 5.5, CAST(N'2020-09-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (53, 2, 5.25, CAST(N'2020-09-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (54, 2, 4.5, CAST(N'2020-09-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (55, 2, 4.5, CAST(N'2020-09-19T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (56, 2, 6.5, CAST(N'2020-09-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (57, 3, 2.5, CAST(N'2020-09-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (58, 3, 3.25, CAST(N'2020-09-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (59, 3, 4.3, CAST(N'2020-09-09T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (60, 3, 4.5, CAST(N'2020-09-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (61, 3, 6.5, CAST(N'2020-09-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (62, 3, 5, CAST(N'2020-09-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (63, 3, 4.5, CAST(N'2020-09-14T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (64, 3, 7.5, CAST(N'2020-09-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (65, 3, 6.5, CAST(N'2020-09-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (66, 3, 3, CAST(N'2020-09-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (67, 3, 4.75, CAST(N'2020-09-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (68, 3, 8.5, CAST(N'2020-09-19T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[time_reports] ([id], [employee_id], [hours], [date]) VALUES (69, 3, 6.5, CAST(N'2020-09-20T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[time_reports] OFF
GO
/****** Object:  Index [IX_time_reports_employee_id]    Script Date: 16.09.2020 20:01:02 ******/
CREATE NONCLUSTERED INDEX [IX_time_reports_employee_id] ON [dbo].[time_reports]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[time_reports]  WITH CHECK ADD  CONSTRAINT [FK_time_reports_employees_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[time_reports] CHECK CONSTRAINT [FK_time_reports_employees_employee_id]
GO
/****** Object:  StoredProcedure [dbo].[SyberryTest_GetAllUsersWithTimeReports]    Script Date: 16.09.2020 20:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SyberryTest_GetAllUsersWithTimeReports]
AS
select employees.id, time_reports.date, employees.name, time_reports.hours from employees join time_reports on employees.id=time_reports.employee_id
GO
USE [master]
GO
ALTER DATABASE [SyberryTest] SET  READ_WRITE 
GO
