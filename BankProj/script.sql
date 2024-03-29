USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 04-06-2019 10:29:28 ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bank.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bank_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Bank]
GO
/****** Object:  StoredProcedure [dbo].[addCustomer]    Script Date: 04-06-2019 10:29:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addCustomer]
@custName varchar(30),
@gender varchar(3),
@dob varchar(20),
@address varchar(60),
@state varchar(20),
@city varchar(20),
@pincode varchar(10),
@phoneNo varchar(10),
@email varchar(30),
@createdDate varchar(20),
@editedDate varchar(20),
@userId varchar(20)
as
insert into Customer values(@custName, @gender, @dob, @address, @state, @city, @pincode, @phoneNo, @email, @createdDate, @editedDate, @userId)

GO
/****** Object:  StoredProcedure [dbo].[addDetails]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addDetails]
@customerId int,
@accounttype varchar(10),
@DateOfOpen varchar(15),
@status varchar(10),
@dateOfEdited varchar(15),
@ClosingDate varchar(15),
@amount int
as
insert into Account values(@customerId,@accounttype,@DateOfOpen,@status,@dateOfEdited,@ClosingDate,@amount)
GO
/****** Object:  StoredProcedure [dbo].[addLogin]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addLogin]
@userId varchar(20),
@password varchar(20),
@role varchar(10)
as
insert into Login values(@userId, @password, @role)
GO
/****** Object:  StoredProcedure [dbo].[balanceEnq]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[balanceEnq]
@acc bigint
as
select amount from Account where accountNo=@acc;
GO
/****** Object:  StoredProcedure [dbo].[changePass]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[changePass]
@uid varchar(20)
as
select [password] from Login where userId=@uid;
GO
/****** Object:  StoredProcedure [dbo].[checkAcc]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkAcc]
@acc bigint
as 
select customerId from Account where accountNo=@acc;
GO
/****** Object:  StoredProcedure [dbo].[checkAmo]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkAmo]
@acc bigint
as
select amount from Account where accountNo=@acc;
GO
/****** Object:  StoredProcedure [dbo].[checkCre]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkCre]
@uid varchar(20)
as
select [password],role from Login where userId=@uid;  

GO
/****** Object:  StoredProcedure [dbo].[checkCust]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkCust]
@customerID int
as 
select userId from Customer where customerId=@customerID;
GO
/****** Object:  StoredProcedure [dbo].[datecheck]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[datecheck] 
@acc bigint,
@start date,
@end date
as 
select * from [Transaction] where transactiondate between @start and @end;
GO
/****** Object:  StoredProcedure [dbo].[deleteCustomer]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteCustomer]
@custId int
as
delete from Customer where customerId = @custId

GO
/****** Object:  StoredProcedure [dbo].[deleteDetails]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteDetails]
@accountNo int
as
delete from Account where accountNo=@accountNo


GO
/****** Object:  StoredProcedure [dbo].[deposit]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deposit]
@acc bigint,
@amt int
as
update Account set amount=amount+@amt where accountNo=@acc
GO
/****** Object:  StoredProcedure [dbo].[editedDetails]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editedDetails]
@accountNo int,
@customerId int,
@accounttype varchar(10),
@DateOfOpen varchar(15),
@status varchar(10),
@dateOfEdited varchar(15),
@ClosingDate varchar(15),
@amount int
as
update Account set customerId=@customerId,accounttype=@accounttype,DateOfOpen=@DateOfOpen,[status]=@status,dateOfEdited=@dateOfEdited,Closingdate=@ClosingDate,amount=@amount 
where accountNo=@accountNo

GO
/****** Object:  StoredProcedure [dbo].[getAllCustomers]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllCustomers]
as
select * from Customer
GO
/****** Object:  StoredProcedure [dbo].[getSpecificCustomer]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getSpecificCustomer]
@custId int
as
select * from Customer where customerId = @custId
GO
/****** Object:  StoredProcedure [dbo].[insTrans]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insTrans]
@acc1 bigint,
@acc2 bigint,
@amt int,
@type varchar(20),
@comment varchar(30),
@Date varchar(20)
as 
insert into [Transaction] values(@acc1,@acc2,@Date,@amt,@type,@comment);
GO
/****** Object:  StoredProcedure [dbo].[ministategen]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ministategen]
@acc bigint
as
select top 10 * from [Transaction] where fromAccountNo=@acc order by transactionDate desc;
GO
/****** Object:  StoredProcedure [dbo].[prints]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prints]
@id varchar(20)
as
select accountNo,accountType,[status] from Account where customerId in(select customerId from Customer where userId=@id)

GO
/****** Object:  StoredProcedure [dbo].[transferAdd]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[transferAdd]
@amt int,
@acc varchar(20)
as
update Account set amount=@amt+amount where accountNo=@acc;

GO
/****** Object:  StoredProcedure [dbo].[transferSub]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[transferSub]
@amt int,
@acc varchar(20)
as
update Account set amount=amount-@amt where accountNo=@acc;
GO
/****** Object:  StoredProcedure [dbo].[updateCustomer]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateCustomer]
@custId int,
@custName varchar(30),
@gender varchar(3),
@dob varchar(20),
@address varchar(60),
@state varchar(20),
@city varchar(20),
@pincode varchar(10),
@phoneNo varchar(10),
@email varchar(30),
@editedDate varchar(20),
@userId varchar(20)
as
update Customer set customerName = @custName, gender = @gender, dob = @dob, address = @address, state = @state,
city = @city, pincode = @pincode, phoneNo = @phoneNo, email = @email, editedDate = @editedDate, userId = @userId
where customerId = @custId
GO
/****** Object:  StoredProcedure [dbo].[updatePass]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updatePass]
@uid varchar(20),
@pass varchar(20)
as
update Login set password=@pass where userId=@uid;
GO
/****** Object:  StoredProcedure [dbo].[updateUserID]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateUserID]
@newuserId varchar(20),
@olduserId varchar(20)
as
update Login set userId = @newuserId where userId = @olduserId
GO
/****** Object:  StoredProcedure [dbo].[withdraw]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[withdraw]
@acc bigint,
@amt int
as
update Account set amount=amount-@amt where accountNo=@acc
GO
/****** Object:  Table [dbo].[Account]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[accountNo] [bigint] IDENTITY(1504000000,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[accountType] [varchar](10) NOT NULL,
	[DateOfOpen] [varchar](15) NOT NULL,
	[status] [varchar](10) NOT NULL,
	[dateOfEdited] [varchar](15) NULL,
	[ClosingDate] [varchar](15) NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [int] IDENTITY(1000,1) NOT NULL,
	[customerName] [varchar](30) NOT NULL,
	[gender] [varchar](3) NOT NULL,
	[dob] [varchar](20) NOT NULL,
	[address] [varchar](60) NOT NULL,
	[state] [varchar](20) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[pincode] [varchar](10) NOT NULL,
	[phoneNo] [varchar](10) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[createdDate] [varchar](20) NOT NULL,
	[editedDate] [varchar](20) NOT NULL,
	[userId] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[userId] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 04-06-2019 10:29:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaction](
	[transactionId] [bigint] IDENTITY(6524000000,1) NOT NULL,
	[fromAccountNo] [bigint] NOT NULL,
	[toAccountNo] [bigint] NOT NULL,
	[transactionDate] [varchar](50) NOT NULL,
	[amount] [int] NOT NULL,
	[transactionType] [varchar](15) NOT NULL,
	[comments] [varchar](50) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer] FOREIGN KEY([userId])
REFERENCES [dbo].[Login] ([userId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account] FOREIGN KEY([fromAccountNo])
REFERENCES [dbo].[Account] ([accountNo])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account1] FOREIGN KEY([toAccountNo])
REFERENCES [dbo].[Account] ([accountNo])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Account1]
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
