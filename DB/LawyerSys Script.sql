USE [master]
GO
/****** Object:  Database [LawyerSys]    Script Date: 3/12/2020 10:42:20 م ******/
CREATE DATABASE [LawyerSys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LawyerSys', FILENAME = N'E:\UC Barkely Cource\LawyerSys\DB\LawyerSys.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LawyerSys_log', FILENAME = N'E:\UC Barkely Cource\LawyerSys\DB\LawyerSys_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LawyerSys] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LawyerSys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LawyerSys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LawyerSys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LawyerSys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LawyerSys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LawyerSys] SET ARITHABORT OFF 
GO
ALTER DATABASE [LawyerSys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LawyerSys] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LawyerSys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LawyerSys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LawyerSys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LawyerSys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LawyerSys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LawyerSys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LawyerSys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LawyerSys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LawyerSys] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LawyerSys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LawyerSys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LawyerSys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LawyerSys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LawyerSys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LawyerSys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LawyerSys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LawyerSys] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LawyerSys] SET  MULTI_USER 
GO
ALTER DATABASE [LawyerSys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LawyerSys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LawyerSys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LawyerSys] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LawyerSys]
GO
/****** Object:  Table [dbo].[AdminstrativeTasks]    Script Date: 3/12/2020 10:42:20 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminstrativeTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Task_Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Task_Date] [date] NOT NULL,
	[Task_Reminder_Date] [datetime] NOT NULL,
	[Notes] [nvarchar](50) NOT NULL,
	[employee_Id] [int] NULL,
 CONSTRAINT [PK_AdminstrativeTasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[App_Pages]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Page_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_App_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[App_Sitting]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Sitting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[App_PageID] [int] NOT NULL,
	[IsVaild] [bit] NULL,
 CONSTRAINT [PK_App_Sitting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Billing_Pay]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing_Pay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[Date_Of_Opreation] [date] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[Custmor_Id] [int] NOT NULL,
 CONSTRAINT [PK_Billing_Pay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Billing_Receipt]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing_Receipt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[Date_Of_Opreation] [date] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[Employee_Id] [int] NOT NULL,
 CONSTRAINT [PK_Billing_Receipt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cases]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases](
	[Id] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Invitions_Statment] [nvarchar](50) NOT NULL,
	[Invition_Type] [nvarchar](50) NOT NULL,
	[Invition_Date] [date] NOT NULL,
	[Total_Amount] [int] NOT NULL,
	[Notes] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cases_1] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cases_Contenders]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases_Contenders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [int] NOT NULL,
	[Contender_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cases_Contenders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cases_Courts]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases_Courts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Court_Id] [int] NOT NULL,
	[Case_Code] [int] NOT NULL,
 CONSTRAINT [PK_Cases_Courts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cases_Employees]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases_Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Code] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cases_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cases_Files]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases_Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [int] NOT NULL,
	[File_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cases_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cases_Sitings]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cases_Sitings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Code] [int] NOT NULL,
	[Siting_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cases_Sitings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Con_Lawyers_Custmors]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Con_Lawyers_Custmors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Con_Custmor_Id] [int] NOT NULL,
	[Con_Lawyer_Id] [int] NOT NULL,
 CONSTRAINT [PK_Con_Lawyers_Custmors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consltitions_Custmors]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consltitions_Custmors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [int] NOT NULL,
	[Consl_Id] [int] NOT NULL,
 CONSTRAINT [PK_Consltitions_Custmors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consulations]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Consultion_State] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Descraption] [nvarchar](50) NOT NULL,
	[Feedback] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](50) NOT NULL,
	[Date_time] [datetime] NOT NULL,
 CONSTRAINT [PK_Consulations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consulations_Employee]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulations_Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Consl_ID] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
 CONSTRAINT [PK_Consulations_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contenders]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](50) NOT NULL,
	[SSN] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Type] [bit] NULL,
 CONSTRAINT [PK_Contenders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contenders_Custmors]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenders_Custmors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Con_Lawyer_ID] [int] NULL,
	[Con_Id] [int] NULL,
 CONSTRAINT [PK_Contenders_Custmors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contenders_Lawyers]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenders_Lawyers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Contender_Id] [int] NOT NULL,
 CONSTRAINT [PK_Contenders_Lawyers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courts]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](50) NOT NULL,
	[Gov_Id] [int] NOT NULL,
 CONSTRAINT [PK_Courts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Custmors_Cases]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Custmors_Cases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Case_Id] [int] NOT NULL,
	[Custmors_Id] [int] NOT NULL,
 CONSTRAINT [PK_Custmors_Cases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Users_Id] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Salary] [int] NOT NULL,
	[Users_Id] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[type] [bit] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Governaments]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Governaments](
	[Id] [int] NOT NULL,
	[Gov_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Governaments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Judicial_Documents]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judicial_Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Doc_Type] [nvarchar](50) NOT NULL,
	[Doc_Num] [int] NOT NULL,
	[Doc_Details] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](50) NOT NULL,
	[Num_Of_Agent] [int] NOT NULL,
	[Customers_Id] [int] NOT NULL,
 CONSTRAINT [PK_Judicial_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sitings]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sitings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Siting_Time] [datetime] NOT NULL,
	[Siting_Date] [date] NOT NULL,
	[Siting_Notification] [datetime] NOT NULL,
	[Judge_Name] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sitings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2020 10:42:21 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Full_Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Job] [nvarchar](50) NOT NULL,
	[Phon_Number] [int] NOT NULL,
	[Date_Of_Birth] [date] NOT NULL,
	[SSN] [int] NOT NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AdminstrativeTasks]  WITH CHECK ADD  CONSTRAINT [FK_AdminstrativeTasks_AdminstrativeTasks] FOREIGN KEY([employee_Id])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[AdminstrativeTasks] CHECK CONSTRAINT [FK_AdminstrativeTasks_AdminstrativeTasks]
GO
ALTER TABLE [dbo].[App_Sitting]  WITH CHECK ADD  CONSTRAINT [FK_App_Sitting_App_Pages] FOREIGN KEY([App_PageID])
REFERENCES [dbo].[App_Pages] ([Id])
GO
ALTER TABLE [dbo].[App_Sitting] CHECK CONSTRAINT [FK_App_Sitting_App_Pages]
GO
ALTER TABLE [dbo].[App_Sitting]  WITH CHECK ADD  CONSTRAINT [FK_App_Sitting_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[App_Sitting] CHECK CONSTRAINT [FK_App_Sitting_Users]
GO
ALTER TABLE [dbo].[Billing_Pay]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Pay_Customers] FOREIGN KEY([Custmor_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Billing_Pay] CHECK CONSTRAINT [FK_Billing_Pay_Customers]
GO
ALTER TABLE [dbo].[Billing_Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Receipt_Customers] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Billing_Receipt] CHECK CONSTRAINT [FK_Billing_Receipt_Customers]
GO
ALTER TABLE [dbo].[Cases_Contenders]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Contenders_Cases] FOREIGN KEY([Case_Id])
REFERENCES [dbo].[Cases] ([Code])
GO
ALTER TABLE [dbo].[Cases_Contenders] CHECK CONSTRAINT [FK_Cases_Contenders_Cases]
GO
ALTER TABLE [dbo].[Cases_Contenders]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Contenders_Contenders] FOREIGN KEY([Contender_Id])
REFERENCES [dbo].[Contenders] ([Id])
GO
ALTER TABLE [dbo].[Cases_Contenders] CHECK CONSTRAINT [FK_Cases_Contenders_Contenders]
GO
ALTER TABLE [dbo].[Cases_Courts]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Courts_Cases] FOREIGN KEY([Case_Code])
REFERENCES [dbo].[Cases] ([Code])
GO
ALTER TABLE [dbo].[Cases_Courts] CHECK CONSTRAINT [FK_Cases_Courts_Cases]
GO
ALTER TABLE [dbo].[Cases_Courts]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Courts_Courts] FOREIGN KEY([Court_Id])
REFERENCES [dbo].[Courts] ([Id])
GO
ALTER TABLE [dbo].[Cases_Courts] CHECK CONSTRAINT [FK_Cases_Courts_Courts]
GO
ALTER TABLE [dbo].[Cases_Employees]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Employees_Employees] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Cases_Employees] CHECK CONSTRAINT [FK_Cases_Employees_Employees]
GO
ALTER TABLE [dbo].[Cases_Files]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Files_Cases] FOREIGN KEY([Case_Id])
REFERENCES [dbo].[Cases] ([Code])
GO
ALTER TABLE [dbo].[Cases_Files] CHECK CONSTRAINT [FK_Cases_Files_Cases]
GO
ALTER TABLE [dbo].[Cases_Files]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Files_Files] FOREIGN KEY([File_Id])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[Cases_Files] CHECK CONSTRAINT [FK_Cases_Files_Files]
GO
ALTER TABLE [dbo].[Cases_Sitings]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Sitings_Cases] FOREIGN KEY([Case_Code])
REFERENCES [dbo].[Cases] ([Code])
GO
ALTER TABLE [dbo].[Cases_Sitings] CHECK CONSTRAINT [FK_Cases_Sitings_Cases]
GO
ALTER TABLE [dbo].[Cases_Sitings]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Sitings_Sitings] FOREIGN KEY([Siting_Id])
REFERENCES [dbo].[Sitings] ([Id])
GO
ALTER TABLE [dbo].[Cases_Sitings] CHECK CONSTRAINT [FK_Cases_Sitings_Sitings]
GO
ALTER TABLE [dbo].[Con_Lawyers_Custmors]  WITH CHECK ADD  CONSTRAINT [FK_Con_Lawyers_Custmors_Contenders_Lawyers] FOREIGN KEY([Con_Lawyer_Id])
REFERENCES [dbo].[Contenders_Lawyers] ([Id])
GO
ALTER TABLE [dbo].[Con_Lawyers_Custmors] CHECK CONSTRAINT [FK_Con_Lawyers_Custmors_Contenders_Lawyers]
GO
ALTER TABLE [dbo].[Consltitions_Custmors]  WITH CHECK ADD  CONSTRAINT [FK_Consltitions_Custmors_Consulations] FOREIGN KEY([Consl_Id])
REFERENCES [dbo].[Consulations] ([Id])
GO
ALTER TABLE [dbo].[Consltitions_Custmors] CHECK CONSTRAINT [FK_Consltitions_Custmors_Consulations]
GO
ALTER TABLE [dbo].[Consltitions_Custmors]  WITH CHECK ADD  CONSTRAINT [FK_Consltitions_Custmors_Customers] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Consltitions_Custmors] CHECK CONSTRAINT [FK_Consltitions_Custmors_Customers]
GO
ALTER TABLE [dbo].[Consulations_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Consulations_Employee_Employees] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Consulations_Employee] CHECK CONSTRAINT [FK_Consulations_Employee_Employees]
GO
ALTER TABLE [dbo].[Contenders_Custmors]  WITH CHECK ADD  CONSTRAINT [FK_Contenders_Custmors_Contenders] FOREIGN KEY([Con_Id])
REFERENCES [dbo].[Contenders] ([Id])
GO
ALTER TABLE [dbo].[Contenders_Custmors] CHECK CONSTRAINT [FK_Contenders_Custmors_Contenders]
GO
ALTER TABLE [dbo].[Contenders_Custmors]  WITH CHECK ADD  CONSTRAINT [FK_Contenders_Custmors_Contenders_Lawyers] FOREIGN KEY([Con_Lawyer_ID])
REFERENCES [dbo].[Contenders_Lawyers] ([Id])
GO
ALTER TABLE [dbo].[Contenders_Custmors] CHECK CONSTRAINT [FK_Contenders_Custmors_Contenders_Lawyers]
GO
ALTER TABLE [dbo].[Contenders_Lawyers]  WITH CHECK ADD  CONSTRAINT [FK_Contenders_Lawyers_Contenders] FOREIGN KEY([Contender_Id])
REFERENCES [dbo].[Contenders] ([Id])
GO
ALTER TABLE [dbo].[Contenders_Lawyers] CHECK CONSTRAINT [FK_Contenders_Lawyers_Contenders]
GO
ALTER TABLE [dbo].[Courts]  WITH CHECK ADD  CONSTRAINT [FK_Courts_Governaments] FOREIGN KEY([Gov_Id])
REFERENCES [dbo].[Governaments] ([Id])
GO
ALTER TABLE [dbo].[Courts] CHECK CONSTRAINT [FK_Courts_Governaments]
GO
ALTER TABLE [dbo].[Custmors_Cases]  WITH CHECK ADD  CONSTRAINT [FK_Custmors_Cases_Cases] FOREIGN KEY([Case_Id])
REFERENCES [dbo].[Cases] ([Code])
GO
ALTER TABLE [dbo].[Custmors_Cases] CHECK CONSTRAINT [FK_Custmors_Cases_Cases]
GO
ALTER TABLE [dbo].[Custmors_Cases]  WITH CHECK ADD  CONSTRAINT [FK_Custmors_Cases_Customers] FOREIGN KEY([Custmors_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Custmors_Cases] CHECK CONSTRAINT [FK_Custmors_Cases_Customers]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Customers] FOREIGN KEY([Users_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Customers]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Users] FOREIGN KEY([Users_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Users]
GO
ALTER TABLE [dbo].[Judicial_Documents]  WITH CHECK ADD  CONSTRAINT [FK_Judicial_Documents_Customers] FOREIGN KEY([Customers_Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Judicial_Documents] CHECK CONSTRAINT [FK_Judicial_Documents_Customers]
GO
USE [master]
GO
ALTER DATABASE [LawyerSys] SET  READ_WRITE 
GO
