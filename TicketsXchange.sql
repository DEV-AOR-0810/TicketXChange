USE [master]
GO
/****** Object:  Database [TicketsXchange]    Script Date: 8/9/2019 8:10:25 PM ******/
CREATE DATABASE [TicketsXchange]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketsXchange', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TicketsXchange.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketsXchange_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TicketsXchange_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TicketsXchange] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketsXchange].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketsXchange] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketsXchange] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketsXchange] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketsXchange] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketsXchange] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketsXchange] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketsXchange] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketsXchange] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketsXchange] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketsXchange] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketsXchange] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketsXchange] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketsXchange] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketsXchange] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketsXchange] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketsXchange] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketsXchange] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketsXchange] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketsXchange] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketsXchange] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketsXchange] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketsXchange] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketsXchange] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TicketsXchange] SET  MULTI_USER 
GO
ALTER DATABASE [TicketsXchange] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketsXchange] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketsXchange] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketsXchange] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketsXchange] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketsXchange] SET QUERY_STORE = OFF
GO
USE [TicketsXchange]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](128) NOT NULL,
	[Photo] [nchar](128) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](64) NOT NULL,
	[Name] [nchar](128) NOT NULL,
	[Subject] [nchar](128) NOT NULL,
	[Detail] [text] NOT NULL,
	[CreatedAt] [date] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[BalanceId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[UserId] [int] NOT NULL,
	[FirstName] [nchar](128) NOT NULL,
	[LastName] [nchar](128) NOT NULL,
	[Gender] [tinyint] NULL,
	[DOB] [nchar](10) NULL,
	[MobileNumber] [nchar](16) NULL,
	[PhoneNumber] [nchar](16) NULL,
	[AddressLine1] [nchar](128) NULL,
	[AddressLine2] [nchar](128) NULL,
	[AddressLine3] [nchar](128) NULL,
	[PostCode] [nchar](16) NULL,
	[City] [nchar](32) NULL,
	[State] [nchar](32) NULL,
	[Country] [nchar](32) NULL,
	[Photo] [nchar](128) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscribeEmail]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscribeEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](64) NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_SubscribeEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscribeLog]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscribeLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailId] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_SubscribeLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nchar](128) NOT NULL,
	[Details] [text] NOT NULL,
	[Price] [float] NOT NULL,
	[Date] [nchar](64) NULL,
	[Location] [nchar](128) NULL,
	[PaymentMethod] [int] NULL,
	[Featured] [tinyint] NULL,
	[Active] [tinyint] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketBalance]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketBalance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[Balance] [int] NOT NULL,
	[UserId] [int] NULL,
	[Type] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_TicketBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/9/2019 8:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](128) NOT NULL,
	[Password] [nchar](128) NOT NULL,
	[Verified] [tinyint] NULL,
	[ActivationCode] [nchar](128) NULL,
	[Active] [int] NULL,
	[Role] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Role]  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Ticket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Ticket]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_TicketBalance] FOREIGN KEY([BalanceId])
REFERENCES [dbo].[TicketBalance] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_TicketBalance]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_User]
GO
ALTER TABLE [dbo].[SubscribeLog]  WITH CHECK ADD  CONSTRAINT [FK_SubscribeLog_SubscribeEmail] FOREIGN KEY([EmailId])
REFERENCES [dbo].[SubscribeEmail] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubscribeLog] CHECK CONSTRAINT [FK_SubscribeLog_SubscribeEmail]
GO
ALTER TABLE [dbo].[SubscribeLog]  WITH CHECK ADD  CONSTRAINT [FK_SubscribeLog_Ticket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubscribeLog] CHECK CONSTRAINT [FK_SubscribeLog_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Category]
GO
ALTER TABLE [dbo].[TicketBalance]  WITH CHECK ADD  CONSTRAINT [FK_TicketBalance_Ticket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketBalance] CHECK CONSTRAINT [FK_TicketBalance_Ticket]
GO
ALTER TABLE [dbo].[TicketBalance]  WITH CHECK ADD  CONSTRAINT [FK_TicketBalance_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketBalance] CHECK CONSTRAINT [FK_TicketBalance_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Credit Card, 1: Cash, 2: Free' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Payment', @level2type=N'COLUMN',@level2name=N'PaymentMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Male, 0: Female' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profile', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Credit Card, 1: Cash. 2: Free' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'COLUMN',@level2name=N'PaymentMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Featured, 0: None' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'COLUMN',@level2name=N'Featured'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Active, 0: None' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Sell, 0: buy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TicketBalance', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Verified, 0: Unverified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Verified'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Active, 0: Inactive' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Admin, 1: User' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Role'
GO
USE [master]
GO
ALTER DATABASE [TicketsXchange] SET  READ_WRITE 
GO
