USE [master]
GO
/****** Object:  Database [RestaurantManagement]    Script Date: 04-Jun-21 11:47:07 ******/
CREATE DATABASE [RestaurantManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RestaurantManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RestaurantManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [RestaurantManagement] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestaurantManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestaurantManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RestaurantManagement', N'ON'
GO
ALTER DATABASE [RestaurantManagement] SET QUERY_STORE = OFF
GO
USE [RestaurantManagement]
GO
/****** Object:  Table [dbo].[Addons]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addons](
	[AddonID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[AddonName] [varchar](50) NULL,
	[AddonPrice] [int] NULL,
	[AddonTime] [time](0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantID] [int] NOT NULL,
	[ItemName] [varchar](50) NULL,
	[ItemPrice] [int] NULL,
	[ItemTime] [time](0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[AddonID] [int] NOT NULL,
	[TotalAmount] [int] NULL,
	[TotalTime] [time](0) NULL,
	[Created_AT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[RestaurantID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantName] [varchar](255) NULL,
	[PhoneNumber] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Logo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Userid] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[UserType] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userRestaurantMapping]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userRestaurantMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RestaurantID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Created_AT]
GO
/****** Object:  StoredProcedure [dbo].[AddAddonItem]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddAddonItem]
	@UserID INT,
	@RestaurantID INT,
	@ItemID INT,
	@AddonName varchar(255),
	@AddonPrice INT,
	@AddonTime time(0)
AS
BEGIN
	BEGIN
			IF EXISTS(SELECT * FROM userRestaurantMapping WHERE Userid = @UserID AND RestaurantID = @RestaurantID)
			BEGIN
				IF EXISTS(SELECT * FROM Addons WHERE ItemID = @ItemID AND AddonName = @AddonName)
				BEGIN
					SELECT 0 AS result
				END
				ELSE
					BEGIN
						INSERT INTO Addons (ItemID, AddonName, AddonPrice, AddonTime)
						VALUES (@ItemID, @AddonName, @AddonPrice, @AddonTime)
						SELECT 1 AS result
					END
			END
			ELSE
			BEGIN
				SELECT 0 AS result
			END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddMenuItem]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMenuItem]
	@UserID int,
	@RestaurantID int,
	@ItemName varchar(255),
	@ItemPrice INT,
	@ItemTime time(0)
AS
BEGIN
	BEGIN
		IF EXISTS(SELECT * FROM userRestaurantMapping WHERE Userid = @UserID AND RestaurantID = @RestaurantID)
			BEGIN
				IF EXISTS(SELECT * FROM Menu WHERE RestaurantID = @RestaurantID AND ItemName = @ItemName)
				BEGIN
					SELECT 0 AS result
				END
				ELSE
					BEGIN
						INSERT INTO Menu (RestaurantID, ItemName, ItemPrice, ItemTime)
						VALUES (@RestaurantID, @ItemName, @ItemPrice, @ItemTime)
						SELECT 1 AS result
					END
			END
		ELSE
			BEGIN
				SELECT 0 AS result
			END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddRestaurant]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRestaurant]
	@UserID int,
	@restaurantname varchar(255),
	@phonenumber varchar(255),
	@address varchar(255),
	@logo varchar(255)
AS
BEGIN
	DECLARE @RestaurantID int;

	BEGIN
		IF EXISTS(SELECT * FROM UserInfo WHERE Userid = @UserID AND UserType = 1)
		BEGIN
			IF EXISTS(SELECT * FROM Restaurants WHERE RestaurantName = @restaurantname)
			BEGIN
				SELECT 0 AS result
			END
			ELSE
				BEGIN
					INSERT INTO Restaurants (RestaurantName, PhoneNumber, [Address], Logo)
					VALUES (@restaurantname, @phonenumber, @address, @logo)
					SET @RestaurantID = @@IDENTITY
					
					INSERT INTO userRestaurantMapping (UserID, RestaurantID) VALUES (@UserID, @RestaurantID)
					
					SELECT 1 AS result
				END
		END
		ELSE
			BEGIN
				SELECT 0 AS result
			END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrder]
	@UserID INT,
	@ItemID INT,
	@AddonID INT = 0

AS
BEGIN
	DECLARE @ItemPrice INT;
	DECLARE @ItemTime TIME(0);
	DECLARE @AddonPrice INT;
	DECLARE @AddonTime TIME(0);
	DECLARE @TotalAmount INT;
	DECLARE @TotalTime TIME(0);

	SET @AddonPrice = 0;
	SET @AddonTime = '00:00:00';

	BEGIN
		SELECT @ItemPrice = ItemPrice, @ItemTime = ItemTime FROM Menu WHERE ItemID = @ItemID;
	END

	BEGIN
		IF (@AddonID != 0 OR @AddonID != '' OR @AddonID IS NOT NULL)
		BEGIN		
			SELECT @AddonPrice = AddonPrice, @AddonTime = AddonTime FROM Addons WHERE AddonID = @AddonID;
		END
	END

	BEGIN
		SET @TotalAmount = @ItemPrice + @AddonPrice
		SET @TotalTime = CONVERT(varchar(8), CAST(@ItemTime as datetime) + CAST(@AddonTime as datetime), 108);
	END

	BEGIN		
		INSERT INTO Orders (UserID, ItemID, AddonID, TotalAmount, TotalTime)
		VALUES (@UserID, @ItemID, @AddonID, @TotalAmount, @TotalTime)
		EXEC GetOrderDetail @@Identity
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CreateReOrder]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateReOrder]
	@UserID INT,
	@OrderID INT
AS
BEGIN
	DECLARE @ItemID int;
	DECLARE @AddonID int;

	BEGIN
		IF NOT EXISTS(SELECT * FROM Orders WHERE UserID = @UserID AND OrderID = @OrderID)
			BEGIN
				SELECT 0 AS result
			END
	
		ELSE
			BEGIN
				SELECT @ItemID = ItemID, @AddonID = AddonID FROM Orders WHERE UserID = @UserID AND OrderID = @OrderID;
				EXEC CreateOrder @UserID, @ItemID, @AddonID;
			END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllRestaurantsInfo]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRestaurantsInfo]
AS
BEGIN
SELECT * FROM Restaurants
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsers] 
AS
BEGIN
	SELECT * FROM UserInfo
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderDetail]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrderDetail] @OrderID INT
	
AS
BEGIN
	DECLARE @UserID INT;
	DECLARE @Username varchar(50);
	DECLARE @RestaurantName varchar(50);
	DECLARE @ItemID INT;
	DECLARE @ItemName varchar(50);
	DECLARE @ItemPrice varchar(50);
	DECLARE @ItemTime varchar(50);
	DECLARE @AddonID INT;
	DECLARE @AddonName varchar(50);
	DECLARE @AddonPrice varchar(50);
	DECLARE @AddonTime varchar(50);
	DECLARE @TotalAmount INT;
	DECLARE @TotalTime time(0);
	
	BEGIN
		SELECT @UserID = UserID, @ItemID = ItemID, @AddonID = AddonID, @TotalAmount = TotalAmount, @TotalTime = TotalTime
		FROM Orders WHERE OrderID = @OrderID
	END

	BEGIN
		SELECT @Username = Username
		FROM UserInfo WHERE Userid = @UserID
	END

	BEGIN
		SELECT @RestaurantName = RestaurantName, @ItemName = ItemName, @ItemPrice = ItemPrice, @ItemTime = ItemTime
		FROM Menu 
		INNER JOIN Restaurants
		on Menu.RestaurantID = Restaurants.RestaurantID
		WHERE ItemID = @ItemID
	END

	BEGIN
		IF @AddonID != 0
			BEGIN
				SELECT @AddonName = AddonName,@AddonPrice = AddonPrice, @AddonTime = AddonTime
				FROM Addons WHERE AddonID = @AddonID
			END
	END

	BEGIN
		SELECT	@Username AS Customer, 
				@RestaurantName AS Restaurant, 
				@ItemName AS Item, 
				@ItemPrice AS ItemPrice, 
				@ItemTime AS ItemTime, 
				@AddonName AS Addon, 
				@AddonPrice AS AddonPrice, 
				@AddonTime AS AddonTime, 
				@TotalAmount AS TotalAmount, 
				@TotalTime AS TotalTime
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetRestaurantMenu]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure 
	[dbo].[GetRestaurantMenu] 
	@restaurantid int
AS
BEGIN
	SELECT * FROM Menu
	INNER JOIN Restaurants
	ON Menu.RestaurantID = Restaurants.RestaurantID
	WHERE Menu.RestaurantID = @Restaurantid
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserOrders]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserOrders]
	@UserID int
AS
BEGIN
	SELECT * FROM Orders WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUser] 
	@Uname varchar(50), 
	@Pass varchar(50)
AS
BEGIN
	BEGIN
		IF exists(SELECT * FROM UserInfo WHERE Username = @Uname AND Password = @Pass)
			BEGIN
				SELECT * FROM UserInfo WHERE Username = @Uname AND Password = @Pass
			END
		ELSE
			BEGIN
				SELECT 0 as Userid
			END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SignUpUser]    Script Date: 04-Jun-21 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SignUpUser] 
	@Username varchar(50), 
	@Password varchar(50),
	@UserType bit
AS
BEGIN
	BEGIN
		IF exists(SELECT * FROM UserInfo WHERE Username = @Username)
			BEGIN
				SELECT 0 as result
			END
		ELSE
			BEGIN
				INSERT INTO UserInfo (Username, [Password], UserType)
				VALUES (@Username, @Password, @UserType)
				SELECT @@IDENTITY as UserID
			END
	END
END
GO
USE [master]
GO
ALTER DATABASE [RestaurantManagement] SET  READ_WRITE 
GO
