USE [ECOMM_C2C_SUB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Info]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Admin_Info]
AS
BEGIN
SELECT [UsrId]
      ,[UsrName]
      ,[Login]
      ,[Password]
      ,[Active]
      ,[Email]
      ,[Address]
      ,[Phone]
      ,[DateAdd]
      ,[DateEdit]
	  ,[RoleName]
	FROM
    Usr u
INNER JOIN MstrDet m ON u.UsrId = m.MstrId
INNER JOIN MstrRole r ON m.RoleId = r.RoleId 
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cart_Delete]
(
@CartID int
)
AS
BEGIN
DELETE FROM [dbo].[Cart] 
WHERE CartID = @CartID
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**** PROCEDURE CART ****/

CREATE PROCEDURE [dbo].[sp_Cart_Insert]
(
@CusID int,
@IpAddress varchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[Cart](CusID,IpAddress)
VALUES(@CusID,@IpAddress)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cart_Select]
(
@CartID int
)
AS
BEGIN
SELECT * FROM [dbo].[Cart] 
WHERE CartID = @CartID
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Cart_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cart_Update]
(
@CartID int,
@CusID int,
@IpAddress varchar(255)
)
AS 
BEGIN 
UPDATE [dbo].[Cart]
SET
CusID=@CusID,
IpAddress=@IpAddress
WHERE CartID = @CartID 
END 







GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CartDet_Delete]
(
@CartId int,
@ShpId int,
@ProId int
)as
BEGIN 
DELETE FROM [dbo].[CartDet] 
WHERE CartID = @CartID AND ShpId=@ShpId AND ProId=@ProId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/**** PROCEDURE CARTDET ****/

CREATE PROCEDURE [dbo].[sp_CartDet_Insert]
(
@CartId int,
@ShpId int,
@ProId int,
@Qty int
)
AS
BEGIN
INSERT INTO [dbo].[CartDet](CartId,ShpId,ProId,Qty)
VALUES(@CartId,@ShpId,@ProId,@Qty)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CartDet_Select]
(
@CartId int,
@ShpId int,
@ProId int
) as
BEGIN
SELECT * FROM [dbo].[CartDet] 
WHERE CartID = @CartID AND ShpId=@ShpId AND ProId=@ProId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_CartDet_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CartDet_Update]
(
@CartId int,
@ShpId int,
@ProId int,
@Qty int
)
AS 
BEGIN 
UPDATE [dbo].[CartDet]
SET
CartId=@CartId,
ShpId=@ShpId,
ProId=@ProId,
Qty=@Qty
WHERE CartID = @CartID AND ShpId=@ShpId AND ProId=@ProId
END 







GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Cus_Delete]
(
@CusId int
)
as
BEGIN
DELETE FROM [dbo].[Cus]
WHERE CusID=@CusId 
END






GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Info]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Cus_Info]
AS
BEGIN
SELECT [UsrId]
      ,[UsrName]
      ,[Login]
      ,[Password]
      ,[Active]
      ,[Email]
      ,[Address]
      ,[Phone]
      ,[DateAdd]
      ,[DateEdit]
	FROM
    Usr u
INNER JOIN Cus c ON u.UsrId = c.CusId
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/**** PROCEDURE CUS ****/

CREATE PROCEDURE [dbo].[sp_Cus_Insert]
(
@CusId int
)
AS
BEGIN
INSERT INTO [dbo].[Cus](CusID)
VALUES(@CusId)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cus_Select]
(
@CusID int
)
as
BEGIN
SELECT * FROM [dbo].[Cus] 
WHERE CusID=@CusId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Cus_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Cus_Update]
(
@CusId int
)
AS 
BEGIN 
UPDATE [dbo].[Cus]
SET
CusID=@CusId
WHERE CusID=@CusId 
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mer_Delete]
(
@MerId int
)
as
BEGIN
DELETE FROM [dbo].[Mer]
WHERE MerId=@MerId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Info]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Mer_Info]
AS
BEGIN
	SELECT [UsrId]
      ,[UsrName]
      ,[Login]
      ,[Password]
      ,[Active]
      ,[Email]
      ,[Address]
      ,[Phone]
      ,[DateAdd]
      ,[DateEdit]
	FROM
    Usr u
INNER JOIN Mer m ON u.UsrId = m.MerId
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE MER ****/

CREATE PROCEDURE [dbo].[sp_Mer_Insert]
(
@MerId int
)
AS
BEGIN
INSERT INTO [dbo].[Mer](MerId)
VALUES(@MerId)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mer_Select]
(
@MerId int
)
as
BEGIN
SELECT * FROM [dbo].[Mer] 
WHERE MerId=@MerId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Mer_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mer_Update]
(
@MerId int
)
AS 
BEGIN 
UPDATE [dbo].[Mer]
SET
MerId=@MerId
WHERE MerId=@MerId 
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Mstr_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mstr_Delete]
(
@MstrId int,
@RoleId int
)
AS
BEGIN
DELETE FROM [dbo].[Mstr] 
WHERE MstrId=@MstrId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Mstr_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mstr_Select]
(
@MstrId int,
@RoleId int
)
AS
BEGIN
SELECT * FROM [dbo].[Mstr] 
WHERE MstrId=@MstrId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_MstrRole_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MstrRole_Delete]
(
@RoleId int,
@RoleName nvarchar(255)
)
AS
BEGIN
DELETE FROM [dbo].[MstrRole] 
WHERE RoleId=@RoleId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_MstrRole_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE MSTRROLE ****/

CREATE PROCEDURE [dbo].[sp_MstrRole_Insert]
(
@RoleId int,
@RoleName nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[MstrRole](RoleId,RoleName)
VALUES(@RoleId,@RoleName)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_MstrRole_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MstrRole_Select]
(
@RoleId int,
@RoleName nvarchar(255)
)
AS
BEGIN
SELECT * FROM [dbo].[MstrRole] 
WHERE RoleId=@RoleId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProBrand_Delete]
(
@BrandId int
)
AS
BEGIN
DELETE FROM [dbo].[ProBrand] 
WHERE BrandId=@BrandId
END






GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProBrand_Insert]
(
@BrandId int,
@BrandName nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[ProBrand](BrandId,BrandName)
VALUES(@BrandId,@BrandName)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProBrand_Select]
(
@BrandId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProBrand] 
WHERE BrandId=@BrandId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProBrand_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProBrand_Update]
(
@BrandId int,
@BrandName nvarchar(255)
)
AS 
BEGIN 
UPDATE [dbo].[ProBrand]
SET
BrandName=@BrandName
WHERE BrandId=@BrandId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProCat_Delete]
(
@CatId int
)
AS
BEGIN
DELETE FROM [dbo].[ProCat]
WHERE CatId=@CatId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PROCAT****/

CREATE PROCEDURE [dbo].[sp_ProCat_Insert]
(
@CatId int,
@CatName nvarchar(255),
@Active bit,
@DateAdd datetime,
@DateEdit datetime
)
AS
BEGIN
INSERT INTO [dbo].[ProCat](CatId,CatName,Active,DateAdd,DateEdit)
VALUES(@CatId,@CatName,@Active,@DateAdd,@DateEdit)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProCat_Select]
(
@CatId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProCat]
WHERE CatId=@CatId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProCat_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProCat_Update]
(
@CatId int,
@CatName nvarchar(255),
@Active bit,
@DateAdd datetime,
@DateEdit datetime
)
AS 
BEGIN 
UPDATE [dbo].[ProCat]
SET
CatName=@CatName,
Active=@Active,
DateAdd=@DateAdd,
DateEdit=@DateEdit
WHERE CatId=@CatId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProColor_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProColor_Delete]
(
@ColorId int
)
AS
BEGIN
DELETE FROM [dbo].[ProColor]
WHERE ColorId=@ColorId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProColor_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PROCOLOR****/

CREATE PROCEDURE [dbo].[sp_ProColor_Insert]
(
@ColorId int,
@ColorName nvarchar(255),
@ColorImg nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[ProColor](ColorId,ColorName,ColorImg)
VALUES(@ColorId,@ColorName,@ColorImg)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProColor_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProColor_Select]
(
@ColorId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProColor]
WHERE ColorId=@ColorId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProDet_Delete]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS
BEGIN
DELETE FROM [dbo].[ProDet]
WHERE ShpId=@ShpId AND ProId=@ProId AND ColorId=@ColorId AND SizeID=@ColorId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PRODET****/

CREATE PROCEDURE [dbo].[sp_ProDet_Insert]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS
BEGIN
INSERT INTO [dbo].[ProDet](ShpId,ProId,ColorId,SizeId)
VALUES(@ShpId,@ProId,@ColorId,@SizeId)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProDet_Select]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProDet]
WHERE ShpId=@ShpId AND ProId=@ProId AND ColorId=@ColorId AND SizeID=@ColorId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProDet_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProDet_Update]
(
@ShpId int,
@ProId int,
@ColorId int,
@SizeId int
)
AS 
BEGIN 
UPDATE [dbo].[ProDet]
SET
ShpId=@ShpId,
ProId=@ProId,
ColorId=@ColorId,
SizeID=@ColorId
WHERE ShpId=@ShpId AND ProId=@ProId AND ColorId=@ColorId AND SizeID=@ColorId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProSize_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProSize_Delete]
(
@SizeId int
)
AS
BEGIN
DELETE FROM [dbo].[ProSize]
WHERE SizeId=@SizeId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProSize_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE PROSIZE****/

CREATE PROCEDURE [dbo].[sp_ProSize_Insert]
(
@SizeId int,
@SizeName nvarchar(255),
@SizeImg nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[ProSize](SizeId,SizeName,SizeImg)
VALUES(@SizeId,@SizeName,@SizeImg)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_ProSize_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ProSize_Select]
(
@SizeId int
)
AS
BEGIN
SELECT * FROM [dbo].[ProSize]
WHERE SizeId=@SizeId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Rcpt_Delete]
(
@RcptId int
)
AS
BEGIN
DELETE FROM [dbo].[Rcpt]
WHERE RcptId=@RcptId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPT****/

CREATE PROCEDURE [dbo].[sp_Rcpt_Insert]
(
@RcptId int,
@UsrAdd int,
@UsrEdit int,
@DateAdd datetime,
@DateEdit datetime
)
AS
BEGIN
INSERT INTO [dbo].[Rcpt](UsrAdd,UsrEdit,DateAdd,DateEdit)
VALUES(@UsrAdd,@UsrEdit,@DateAdd,@DateEdit)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Rcpt_Select]
(
@RcptId int
)
AS
BEGIN
SELECT * FROM [dbo].[Rcpt]
WHERE RcptId=@RcptId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Rcpt_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Rcpt_Update]
(
@RcptId int,
@UsrAdd int,
@UsrEdit int,
@DateAdd datetime,
@DateEdit datetime
)
AS 
BEGIN 
UPDATE [dbo].[Rcpt]
SET
UsrAdd=@UsrAdd,
UsrEdit=@UsrEdit,
DateAdd=@DateAdd,
DateEdit=@DateEdit
WHERE RcptId=@RcptId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuy_Delete]
(
@RcptBuyId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuy]
WHERE RcptBuyId=@RcptBuyId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUY****/

CREATE PROCEDURE [dbo].[sp_RcptBuy_Insert]
(
@RcptBuyId int,
@CusId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuy](RcptBuyId,CusId)
VALUES(@RcptBuyId,@CusId)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuy_Select]
(
@RcptBuyId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuy]
WHERE RcptBuyId=@RcptBuyId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuy_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuy_Update]
(
@RcptBuyId int,
@CusId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuy]
SET
RcptBuyId=@RcptBuyId,
CusId=@CusId
WHERE RcptBuyId=@RcptBuyId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Delete]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuyDet]
WHERE RcptBuyId=@RcptBuyId AND ShpId=@ShpId AND ProId=@ProId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUYDET****/

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Insert]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuyDet](RcptBuyId,ShpId,ProId)
VALUES(@RcptBuyId,@ShpId,@ProId)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Select]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuyDet]
WHERE RcptBuyId=@RcptBuyId AND ShpId=@ShpId AND ProId=@ProId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyDet_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyDet_Update]
(
@RcptBuyId int,
@ShpId int,
@ProId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuyDet]
SET
RcptBuyId=@RcptBuyId,
ShpId=@ShpId,
ProId=@ProId
WHERE RcptBuyId=@RcptBuyId AND ShpId=@ShpId AND ProId=@ProId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Delete]
(
@StaId int,
@RcptBuyId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuySta]
WHERE StaId=@StaId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUYSTA****/

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Insert]
(
@StaId int,
@RcptBuyId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuySta](StaId,RcptBuyId)
VALUES(@StaId,@RcptBuyId)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Select]
(
@StaId int,
@RcptBuyId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuySta]
WHERE StaId=@StaId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuySta_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuySta_Update]
(
@StaId int,
@RcptBuyId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuySta]
SET
RcptBuyId=@RcptBuyId
WHERE StaId=@StaId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaDet_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaDet_Delete]
(
@StaId int,
@StepId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuyStaDet]
WHERE StaId=@StaId AND StepId=@StepId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaDet_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaDet_Select]
(
@StaId int,
@StepId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuyStaDet]
WHERE StaId=@StaId AND StepId=@StepId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Delete]
(
@StepId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptBuyStaStep]
WHERE StepId=@StepId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTBUYSTASTEP****/

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Insert]
(
@StepId int,
@StepCont nvarchar(255),
@StepOrder int
)
AS
BEGIN
INSERT INTO [dbo].[RcptBuyStaStep](StepId,StepCont,StepOrder)
VALUES(@StepId,@StepCont,@StepOrder)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Select]
(
@StepId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptBuyStaStep]
WHERE StepId=@StepId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptBuyStaStep_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptBuyStaStep_Update]
(
@StepId int,
@StepCont nvarchar(255),
@StepOrder int
)
AS 
BEGIN 
UPDATE [dbo].[RcptBuyStaStep]
SET
StepId=@StepId,
StepCont=@StepCont,
StepOrder=@StepOrder
WHERE StepId=@StepId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptSub_Delete]
(
@RcptSubId int
)
AS
BEGIN
DELETE FROM [dbo].[RcptSub]
WHERE RcptSubId=@RcptSubId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE RCPTSUB****/

CREATE PROCEDURE [dbo].[sp_RcptSub_Insert]
(
@RcptSubId int
)
AS
BEGIN
INSERT INTO [dbo].[RcptSub](RcptSubId)
VALUES(@RcptSubId)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptSub_Select]
(
@RcptSubId int
)
AS
BEGIN
SELECT * FROM [dbo].[RcptSub]
WHERE RcptSubId=@RcptSubId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_RcptSub_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RcptSub_Update]
(
@RcptSubId int
)
AS 
BEGIN 
UPDATE [dbo].[RcptSub]
SET
RcptSubId=@RcptSubId
WHERE RcptSubId=@RcptSubId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Shp_Delete]
(
@ShpId int
)
AS
BEGIN
DELETE FROM [dbo].[Shp]
WHERE ShpId=@ShpId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE SHP****/

CREATE PROCEDURE [dbo].[sp_Shp_Insert]
(
@ShpId int,
@MerId int,
@ShpName nvarchar(255),
@DateStart datetime,
@Active bit
)
AS
BEGIN
INSERT INTO [dbo].[Shp](ShpId,MerId,ShpName,DateStart,Active)
VALUES(@ShpId,@MerId,@ShpName,@DateStart,@Active)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Shp_Select]
(
@ShpId int
)
AS
BEGIN
SELECT * FROM [dbo].[Shp]
WHERE ShpId=@ShpId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Shp_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Shp_Update]
(
@ShpId int,
@MerId int,
@ShpName nvarchar(255),
@DateStart datetime,
@Active bit
)
AS 
BEGIN 
UPDATE [dbo].[Shp]
SET
MerId=@MerId,
ShpName=@ShpName,
DateStart=@DateStart,
Active=@Active
WHERE ShpId=@ShpId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sub_Delete]
(
@SubId int
)
AS
BEGIN
DELETE FROM [dbo].[Sub]
WHERE SubId=@SubId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE SUB****/

CREATE PROCEDURE [dbo].[sp_Sub_Insert]
(
@SubId int,
@SubContent nvarchar(255),
@DurDay int,
@Price nvarchar(225)
)
AS
BEGIN
INSERT INTO [dbo].[Sub](SubId,SubContent,DurDay,Price)
VALUES(@SubId,@SubContent,@DurDay,@Price)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sub_Select]
(
@SubId int
)
AS
BEGIN
SELECT * FROM [dbo].[Sub]
WHERE SubId=@SubId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Sub_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Sub_Update]
(
@SubId int,
@SubContent nvarchar(255),
@DurDay int,
@Price nvarchar(225)
)
AS 
BEGIN 
UPDATE [dbo].[Sub]
SET
SubContent=@SubContent,
DurDay=@DurDay,
Price=@Price
WHERE SubId=@SubId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SubDet_Delete]
(
@SubId int,
@MerId int
)
AS
BEGIN
DELETE FROM [dbo].[SubDet]
WHERE SubId=@SubId AND MerId=@MerId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**** PROCEDURE SUBDET****/

CREATE PROCEDURE [dbo].[sp_SubDet_Insert]
(
@SubId int,
@MerId int,
@DateStart datetime,
@DateEnd datetime
)
AS
BEGIN
INSERT INTO [dbo].[SubDet](SubId,MerId,DateStart,DateEnd)
VALUES(@SubId,@MerId,@DateStart,@DateEnd)
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SubDet_Select]
(
@SubId int,
@MerId int
)
AS
BEGIN
SELECT * FROM [dbo].[SubDet]
WHERE SubId=@SubId AND MerId=@MerId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SubDet_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SubDet_Update]
(
@SubId int,
@MerId int,
@DateStart datetime,
@DateEnd datetime
)
AS 
BEGIN 
UPDATE [dbo].[SubDet]
SET
SubId=@SubId,
MerId=@MerId,
DateStart=@DateStart,
DateEnd=@DateEnd
WHERE SubId=@SubId AND MerId=@MerId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Usr_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usr_Delete]
(
@UsrId int
)
AS
BEGIN
DELETE FROM [dbo].[Usr]
WHERE UsrId=@UsrId
END







GO
/****** Object:  StoredProcedure [dbo].[sp_Usr_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Usr_Select]
(
@UsrId int
)
AS
BEGIN
SELECT * FROM [dbo].[Usr]
WHERE UsrId=@UsrId
END







GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Delete] 
    @WebId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[WebInfo]
	WHERE  [WebId] = @WebId

	COMMIT







GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Insert] 
    @WebId int,
    @Name nvarchar(255) = NULL,
    @Address nvarchar(255) = NULL,
    @Email varchar(255) = NULL,
    @Phone varchar(255) = NULL,
    @WorkTime nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[WebInfo] ([WebId], [Name], [Address], [Email], [Phone], [WorkTime])
	SELECT @WebId, @Name, @Address, @Email, @Phone, @WorkTime
	
	-- Begin Return Select <- do not remove
	SELECT [WebId], [Name], [Address], [Email], [Phone], [WorkTime]
	FROM   [dbo].[WebInfo]
	WHERE  [WebId] = @WebId
	-- End Return Select <- do not remove
               
	COMMIT







GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Select] 
    @WebId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [WebId], [Name], [Address], [Email], [Phone], [WorkTime] 
	FROM   [dbo].[WebInfo] 
	WHERE  ([WebId] = @WebId OR @WebId IS NULL) 

	COMMIT







GO
/****** Object:  StoredProcedure [dbo].[WebInfo_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebInfo_Update] 
    @WebId int,
    @Name nvarchar(255) = NULL,
    @Address nvarchar(255) = NULL,
    @Email varchar(255) = NULL,
    @Phone varchar(255) = NULL,
    @WorkTime nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[WebInfo]
	SET    [Name] = @Name, [Address] = @Address, [Email] = @Email, [Phone] = @Phone, [WorkTime] = @WorkTime
	WHERE  [WebId] = @WebId
	
	-- Begin Return Select <- do not remove
	SELECT [WebId], [Name], [Address], [Email], [Phone], [WorkTime]
	FROM   [dbo].[WebInfo]
	WHERE  [WebId] = @WebId	
	-- End Return Select <- do not remove

	COMMIT







GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Delete]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Delete] 
    @id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[WebSlide]
	WHERE  [id] = @id

	COMMIT







GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Insert]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Insert] 
    @id int,
    @WebId int = NULL,
    @Img nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[WebSlide] ([id], [WebId], [Img])
	SELECT @id, @WebId, @Img
	
	-- Begin Return Select <- do not remove
	SELECT [id], [WebId], [Img]
	FROM   [dbo].[WebSlide]
	WHERE  [id] = @id
	-- End Return Select <- do not remove
               
	COMMIT







GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Select]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Select] 
    @id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [id], [WebId], [Img] 
	FROM   [dbo].[WebSlide] 
	WHERE  ([id] = @id OR @id IS NULL) 

	COMMIT







GO
/****** Object:  StoredProcedure [dbo].[WebSlide_Update]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[WebSlide_Update] 
    @id int,
    @WebId int = NULL,
    @Img nvarchar(255) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[WebSlide]
	SET    [WebId] = @WebId, [Img] = @Img
	WHERE  [id] = @id
	
	-- Begin Return Select <- do not remove
	SELECT [id], [WebId], [Img]
	FROM   [dbo].[WebSlide]
	WHERE  [id] = @id	
	-- End Return Select <- do not remove

	COMMIT







GO
/****** Object:  Table [dbo].[Adv]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adv](
	[AdvId] [int] IDENTITY(1,1) NOT NULL,
	[AdvName] [nvarchar](50) NULL,
	[Desc] [nvarchar](255) NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Position] [varchar](255) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Adv] PRIMARY KEY CLUSTERED 
(
	[AdvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CusId] [int] NULL,
	[IpAddress] [varchar](255) NULL,
 CONSTRAINT [PK_UsersCustomersCarts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartDet]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDet](
	[CartId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_CartDet] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chat]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[ChatId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[CusId] [int] NOT NULL,
	[Message] [nvarchar](255) NULL,
	[DateAdd] [datetime] NOT NULL,
	[UsrAdd] [int] NULL,
	[IsShpChat] [bit] NOT NULL,
 CONSTRAINT [PK_Chat_1] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC,
	[ShpId] ASC,
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChatBox]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatBox](
	[ShpId] [int] NOT NULL,
	[CusId] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChatBox_1] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ConfigId] [int] NOT NULL,
	[ConfigName] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[Desc] [nvarchar](255) NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NULL,
	[Discount] [int] NULL,
	[Type] [varchar](10) NULL,
	[FreeShip] [bit] NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[Indefinite] [bit] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Coupon_1] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CouponDet]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponDet](
	[CouponId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cus]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cus](
	[CusId] [int] NOT NULL,
 CONSTRAINT [PK_UsersCustomers] PRIMARY KEY CLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mer]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mer](
	[MerId] [int] NOT NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mstr]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mstr](
	[MstrId] [int] NOT NULL,
 CONSTRAINT [PK_Mstr] PRIMARY KEY CLUSTERED 
(
	[MstrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MstrDet]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstrDet](
	[MstrId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[AddDate] [datetime] NULL,
	[AddBy] [int] NULL,
 CONSTRAINT [PK_MstrDet] PRIMARY KEY CLUSTERED 
(
	[MstrId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MstrRole]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstrRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
 CONSTRAINT [PK_MstrRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pro]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pro](
	[ShpId] [int] NOT NULL,
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ProName] [nvarchar](255) NOT NULL,
	[Img] [varchar](255) NULL,
	[Desc] [nvarchar](max) NULL,
	[DescShort] [nvarchar](max) NULL,
	[Price] [varchar](255) NOT NULL,
	[PriceAfter] [varchar](255) NULL,
	[Active] [bit] NULL,
	[IsOutOfStock] [bit] NULL,
	[DateAdd] [datetime] NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_ProductQuantity] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProBrand]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProBrand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](255) NULL,
	[Img] [varchar](255) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProCat]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProCat](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
	[DateAdd] [datetime2](7) NOT NULL,
	[DateEdit] [datetime] NULL,
	[Img] [varchar](255) NULL,
 CONSTRAINT [PK_ProductsCategories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProColor]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProColor](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](255) NULL,
	[ColorImg] [nvarchar](255) NULL,
	[HexCode] [char](6) NULL,
 CONSTRAINT [PK_ProColor] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProDet]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProDet](
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Qty] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_ProDet] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProSize]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProSize](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](255) NULL,
	[SizeImg] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProSize] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProSlide]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProSlide](
	[SlideId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[Img] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProSlide] PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProSlideImg]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProSlideImg](
	[SlideId] [int] IDENTITY(1,1) NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[Img] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProSlideImg] PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC,
	[ShpId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rcpt]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rcpt](
	[RcptId] [int] IDENTITY(1,1) NOT NULL,
	[UsrAdd] [int] NOT NULL,
	[UsrEdit] [int] NULL,
	[DateAdd] [datetime] NOT NULL,
	[DateEdit] [datetime] NULL,
	[IsCompleted] [bit] NULL,
 CONSTRAINT [Pk_HoaDon_Id] PRIMARY KEY CLUSTERED 
(
	[RcptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuy]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuy](
	[RcptBuyId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[CusId] [int] NOT NULL,
	[CusMessage] [nvarchar](255) NULL,
 CONSTRAINT [PK_RcptBuy_1] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyDet]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RcptBuyDet](
	[RcptBuyId] [int] NOT NULL,
	[ShpId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Cmt] [nvarchar](255) NULL,
	[Point] [int] NULL,
	[MerCmt] [nvarchar](255) NULL,
	[MerPoint] [int] NULL,
	[Quantity] [int] NULL,
	[PriceWhenBuy] [varchar](255) NULL,
 CONSTRAINT [PK_ReceiptsBuysDetails] PRIMARY KEY CLUSTERED 
(
	[RcptBuyId] ASC,
	[ShpId] ASC,
	[ProId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RcptBuySta]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuySta](
	[StaId] [int] IDENTITY(1,1) NOT NULL,
	[RcptBuyId] [int] NOT NULL,
 CONSTRAINT [PK_RcptBuySta] PRIMARY KEY CLUSTERED 
(
	[StaId] ASC,
	[RcptBuyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyStaDet]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyStaDet](
	[StaId] [int] NOT NULL,
	[RcptBuyId] [int] NOT NULL,
	[StepId] [int] NOT NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_RcptBuyStaDet] PRIMARY KEY CLUSTERED 
(
	[StaId] ASC,
	[RcptBuyId] ASC,
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptBuyStaStep]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptBuyStaStep](
	[StepId] [int] NOT NULL,
	[StepCont] [nvarchar](255) NULL,
	[StepOrder] [int] NULL,
 CONSTRAINT [PK_ReceiptsBuysStatesSteps] PRIMARY KEY CLUSTERED 
(
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptSub]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptSub](
	[RcptSubId] [int] NOT NULL,
	[MerId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ReceiptsSubscriptions] PRIMARY KEY CLUSTERED 
(
	[RcptSubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RcptSubDet]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RcptSubDet](
	[RcptSubId] [int] NOT NULL,
	[SubId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_RcptSubDet] PRIMARY KEY CLUSTERED 
(
	[RcptSubId] ASC,
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shp]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shp](
	[ShpId] [int] IDENTITY(1,1) NOT NULL,
	[MerId] [int] NOT NULL,
	[ShpName] [nvarchar](255) NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_UsersMerchantsShops] PRIMARY KEY CLUSTERED 
(
	[ShpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sub]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub](
	[SubId] [int] IDENTITY(1,1) NOT NULL,
	[SubContent] [nvarchar](255) NULL,
	[DurDay] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usr]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usr](
	[UsrId] [int] IDENTITY(1,1) NOT NULL,
	[UsrName] [nvarchar](255) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Login] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
	[Email] [varchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[DateAdd] [datetime] NOT NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsrAct]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsrAct](
	[ActId] [int] IDENTITY(1,1) NOT NULL,
	[UsrId] [int] NULL,
	[ActCode] [varchar](255) NULL,
	[IsAct] [bit] NULL,
 CONSTRAINT [PK_UsrAct] PRIMARY KEY CLUSTERED 
(
	[ActId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WebInfo]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WebInfo](
	[WebId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[WorkTime] [nvarchar](255) NULL,
 CONSTRAINT [PK_WebInfo] PRIMARY KEY CLUSTERED 
(
	[WebId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WebSlide]    Script Date: 5/8/2019 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSlide](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WebId] [int] NULL,
	[Img] [nvarchar](255) NULL,
	[Order] [int] NULL,
	[DateAdd] [datetime] NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_WebSlide] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [CusId], [IpAddress]) VALUES (1, 3, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[Cus] ([CusId]) VALUES (3)
INSERT [dbo].[Mer] ([MerId]) VALUES (1)
INSERT [dbo].[Mstr] ([MstrId]) VALUES (2)
INSERT [dbo].[MstrDet] ([MstrId], [RoleId], [AddDate], [AddBy]) VALUES (2, 1, CAST(0x0000AA4600D52BD0 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MstrRole] ON 

INSERT [dbo].[MstrRole] ([RoleId], [RoleName]) VALUES (1, N'Giám đốc')
SET IDENTITY_INSERT [dbo].[MstrRole] OFF
SET IDENTITY_INSERT [dbo].[Pro] ON 

INSERT [dbo].[Pro] ([ShpId], [ProId], [CatId], [BrandId], [ProName], [Img], [Desc], [DescShort], [Price], [PriceAfter], [Active], [IsOutOfStock], [DateAdd], [DateEdit]) VALUES (1, 7, 1, 1, N'ULTRABOOST 19 SHOES', N'ULTRABOOST 19 SHOES.PNG', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH
Đôi giày chạy này kết hợp sự thoải mái và hiệu năng cao cho cảm giác chạy tuyệt vời hơn bao giờ hết. Thân giày Primeknit có tính co giãn cao, thoáng khí, ôm khuôn chân khi bạn đang chạy. Đế giữa boost™ tăng cường và đế ngoài STRETCHWEB linh hoạt giúp bước chân linh hoạt và tràn đầy năng lượng.', N'MỘT ĐÔI GIÀY CHẠY NHẸ, HIỆN ĐẠI CHO MỌI NƠI VÀ MỌI KHOẢNG CÁCH', N'180', NULL, 1, 1, CAST(0x0000AA460112385C AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Pro] OFF
SET IDENTITY_INSERT [dbo].[ProBrand] ON 

INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (1, N'ADIAS', NULL)
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (2, N'NIKE', NULL)
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (3, N'REEBOK', NULL)
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (4, N'VANS', NULL)
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (5, N'CONVERSE', NULL)
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (6, N'NEW BALANCE', NULL)
INSERT [dbo].[ProBrand] ([BrandId], [BrandName], [Img]) VALUES (7, N'PUMA', NULL)
SET IDENTITY_INSERT [dbo].[ProBrand] OFF
SET IDENTITY_INSERT [dbo].[ProCat] ON 

INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (1, N'NAM', 1, CAST(0x07E003E4156DA13F0B AS DateTime2), NULL, NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (2, N'NỮ', 1, CAST(0x07504125186DA13F0B AS DateTime2), NULL, NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (3, N'THỂ THAO', 1, CAST(0x07F05EA5256DA13F0B AS DateTime2), NULL, NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (4, N'THỜI TRANG', 1, CAST(0x07B033942B70A13F0B AS DateTime2), NULL, NULL)
INSERT [dbo].[ProCat] ([CatId], [CatName], [Active], [DateAdd], [DateEdit], [Img]) VALUES (5, N'DU LỊCH', 1, CAST(0x070000000000000000 AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProCat] OFF
SET IDENTITY_INSERT [dbo].[ProColor] ON 

INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (1, N'Đỏ', NULL, N'FF0000')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (2, N'Đen', NULL, N'000000')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (3, N'Trắng', NULL, N'FFFFFF')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (4, N'Xanh lá', NULL, N'008000')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (5, N'Xanh dương', NULL, N'0000FF')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (6, N'Vàng', NULL, N'FFFF00')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (7, N'Bạc', NULL, N'C0C0C0')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (8, N'Xám', NULL, N'808080')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (9, N'Tím', NULL, N'A020F0')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (10, N'Hồng', NULL, N'FF1493')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (11, N'Cam', NULL, N'FFA500')
INSERT [dbo].[ProColor] ([ColorId], [ColorName], [ColorImg], [HexCode]) VALUES (12, N'Nâu', NULL, N'8B4513')
SET IDENTITY_INSERT [dbo].[ProColor] OFF
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 1, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 4, 7, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 6, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 2, 10, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 3, 1, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 5, 1, 3, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 5, 4, 5, NULL)
INSERT [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId], [Qty], [Active]) VALUES (1, 7, 5, 5, 4, NULL)
SET IDENTITY_INSERT [dbo].[ProSize] ON 

INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (1, N'35', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (2, N'36', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (3, N'37', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (4, N'38', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (5, N'39', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (6, N'40', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (7, N'41', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (8, N'42', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (9, N'43', NULL)
INSERT [dbo].[ProSize] ([SizeId], [SizeName], [SizeImg]) VALUES (10, N'44', NULL)
SET IDENTITY_INSERT [dbo].[ProSize] OFF
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (1, 1, 7, N'ULTRABOOST 19 SHOES 4.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (2, 1, 7, N'ULTRABOOST 19 SHOES 3.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (3, 1, 7, N'ULTRABOOST 19 SHOES 2.jpg')
INSERT [dbo].[ProSlide] ([SlideId], [ShpId], [ProId], [Img]) VALUES (4, 1, 7, N'ULTRABOOST 19 SHOES 1.jpg')
SET IDENTITY_INSERT [dbo].[Rcpt] ON 

INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (1, 2, NULL, CAST(0x0000AA46010A96BD AS DateTime), NULL, NULL)
INSERT [dbo].[Rcpt] ([RcptId], [UsrAdd], [UsrEdit], [DateAdd], [DateEdit], [IsCompleted]) VALUES (2, 1, NULL, CAST(0x0000AA46014C08F6 AS DateTime), CAST(0x0000AA46017CC3DE AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Rcpt] OFF
INSERT [dbo].[RcptBuy] ([RcptBuyId], [ShpId], [CusId], [CusMessage]) VALUES (2, 1, 3, NULL)
INSERT [dbo].[RcptBuyDet] ([RcptBuyId], [ShpId], [ProId], [ColorId], [SizeId], [Cmt], [Point], [MerCmt], [MerPoint], [Quantity], [PriceWhenBuy]) VALUES (2, 1, 7, 2, 4, NULL, NULL, NULL, NULL, 1, N'180')
SET IDENTITY_INSERT [dbo].[RcptBuySta] ON 

INSERT [dbo].[RcptBuySta] ([StaId], [RcptBuyId]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[RcptBuySta] OFF
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 1, CAST(0x0000AA46015C4FBF AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 2, CAST(0x0000AA46017C562D AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 5, CAST(0x0000AA46017CA202 AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 6, CAST(0x0000AA46017CA604 AS DateTime))
INSERT [dbo].[RcptBuyStaDet] ([StaId], [RcptBuyId], [StepId], [AddDate]) VALUES (1, 2, 7, CAST(0x0000AA46017CC3DE AS DateTime))
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (1, N'Đang xác nhận', 1)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (2, N'Đã xác nhận', 2)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (3, N'Chờ đi nhận', 3)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (4, N'Đang đi nhận', 4)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (5, N'Đã nhận hàng', 5)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (6, N'Đang chuyển', 6)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (7, N'Thành công', 7)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (8, N'Thất bại', 8)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (9, N'Khách hủy', 9)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (10, N'Hệ thống hủy', 10)
INSERT [dbo].[RcptBuyStaStep] ([StepId], [StepCont], [StepOrder]) VALUES (11, N'Hết hàng', 11)
INSERT [dbo].[RcptSub] ([RcptSubId], [MerId], [Status]) VALUES (1, 1, 1)
INSERT [dbo].[RcptSubDet] ([RcptSubId], [SubId], [Quantity]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Shp] ON 

INSERT [dbo].[Shp] ([ShpId], [MerId], [ShpName], [DateStart], [Active]) VALUES (1, 1, N'KICKS', CAST(0x0000AA46011024D1 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Shp] OFF
SET IDENTITY_INSERT [dbo].[Sub] ON 

INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (1, N'Tuần', 7, N'20')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (2, N'Tháng', 30, N'75')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (3, N'Năm', 360, N'800')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (4, N'Combo 3 tháng', 90, N'200')
INSERT [dbo].[Sub] ([SubId], [SubContent], [DurDay], [Price]) VALUES (5, N'Combo 3 năm', 1080, N'2800')
SET IDENTITY_INSERT [dbo].[Sub] OFF
SET IDENTITY_INSERT [dbo].[Usr] ON 

INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (1, N'Nguyễn Doãn Hiện', N'face8.jpg', N'doanhien', N'fwwrnlUyVrc=', 1, N'doanhien@gmail.com', N'273 An Dương Vương P7 Q6', N'0704569020', CAST(0x0000AA16010C05B1 AS DateTime), CAST(0x0000AA4600DD7AE0 AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (2, N'Phan Anh Trúc', N'1.jpg', N'truc', N'fwwrnlUyVrc=', 1, N'anhtruc@gmail.com', N'21 Lưu Xuân Tín P15 Q5', N'0967513425', CAST(0x0000AA16010C05B1 AS DateTime), CAST(0x0000AA16010C05B1 AS DateTime))
INSERT [dbo].[Usr] ([UsrId], [UsrName], [Avatar], [Login], [Password], [Active], [Email], [Address], [Phone], [DateAdd], [DateEdit]) VALUES (3, N'Lê Hiển', N'avatar-4.jpg', N'toanhien', N'fwwrnlUyVrc=', 1, N'toanhien@gmail.com', N'26 Nguyễn Trãi P1 Q5', N'0967513424', CAST(0x0000AA16010C05B1 AS DateTime), CAST(0x0000AA4600DCF4A0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Usr] OFF
INSERT [dbo].[WebInfo] ([WebId], [Name], [Address], [Email], [Phone], [WorkTime]) VALUES (1, N'The Shoes', N'273 An Dương Vương', NULL, NULL, N'Hai-Sáu 10:00pm - 7:00pm')
SET IDENTITY_INSERT [dbo].[WebSlide] ON 

INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (1, 1, N'5.jpg', NULL, NULL, NULL)
INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (2, 1, N'4.jpg', NULL, NULL, NULL)
INSERT [dbo].[WebSlide] ([id], [WebId], [Img], [Order], [DateAdd], [DateEdit]) VALUES (3, 1, N'6.jpg', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[WebSlide] OFF
/****** Object:  Index [IX_UsersCustomersCarts]    Script Date: 5/8/2019 9:43:22 AM ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [IX_UsersCustomersCarts] UNIQUE NONCLUSTERED 
(
	[CusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RcptStaStep]    Script Date: 5/8/2019 9:43:22 AM ******/
ALTER TABLE [dbo].[RcptBuyStaStep] ADD  CONSTRAINT [IX_RcptStaStep] UNIQUE NONCLUSTERED 
(
	[StepOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersMerchantsShops]    Script Date: 5/8/2019 9:43:22 AM ******/
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [IX_UsersMerchantsShops] UNIQUE NONCLUSTERED 
(
	[MerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usr_Login]    Script Date: 5/8/2019 9:43:22 AM ******/
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [IX_Usr_Login] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UsrAct]    Script Date: 5/8/2019 9:43:22 AM ******/
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [IX_UsrAct] UNIQUE NONCLUSTERED 
(
	[ActCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsrAct_1]    Script Date: 5/8/2019 9:43:22 AM ******/
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [IX_UsrAct_1] UNIQUE NONCLUSTERED 
(
	[UsrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartDet] ADD  CONSTRAINT [DF_CartDet_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [dbo].[Chat] ADD  CONSTRAINT [DF_Chat_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[Chat] ADD  CONSTRAINT [DF_Chat_IsShpChat]  DEFAULT ((0)) FOR [IsShpChat]
GO
ALTER TABLE [dbo].[ChatBox] ADD  CONSTRAINT [DF_ChatBox_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[MstrDet] ADD  CONSTRAINT [DF_MstrDet_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_CatId]  DEFAULT ((1)) FOR [CatId]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_PriceAfter]  DEFAULT ((0)) FOR [PriceAfter]
GO
ALTER TABLE [dbo].[Pro] ADD  CONSTRAINT [DF_Pro_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[ProCat] ADD  CONSTRAINT [DF_ProCat_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ProCat] ADD  CONSTRAINT [DF_ProCat_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[Rcpt] ADD  CONSTRAINT [DF_Rcpt_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[RcptBuyStaDet] ADD  CONSTRAINT [DF_RcptBuyStaDet_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [DF_Shp_DateStart]  DEFAULT (getdate()) FOR [DateStart]
GO
ALTER TABLE [dbo].[Shp] ADD  CONSTRAINT [DF_Shp_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Sub] ADD  CONSTRAINT [DF_Sub_DurDay]  DEFAULT ((1)) FOR [DurDay]
GO
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [DF_Usr_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Usr] ADD  CONSTRAINT [DF_Usr_DateAdd]  DEFAULT (getdate()) FOR [DateAdd]
GO
ALTER TABLE [dbo].[UsrAct] ADD  CONSTRAINT [DF_UsrAct_IsAct]  DEFAULT ((0)) FOR [IsAct]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers] FOREIGN KEY([CusId])
REFERENCES [dbo].[Cus] ([CusId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_UsersCustomersCarts_UsersCustomers]
GO
ALTER TABLE [dbo].[CartDet]  WITH CHECK ADD  CONSTRAINT [FK_CartDet_ProDet] FOREIGN KEY([ShpId], [ProId], [ColorId], [SizeId])
REFERENCES [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId])
GO
ALTER TABLE [dbo].[CartDet] CHECK CONSTRAINT [FK_CartDet_ProDet]
GO
ALTER TABLE [dbo].[CartDet]  WITH CHECK ADD  CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDet] CHECK CONSTRAINT [FK_UsersCustomersCartsDetails_UsersCustomersCarts]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_ChatBox] FOREIGN KEY([ShpId], [CusId])
REFERENCES [dbo].[ChatBox] ([ShpId], [CusId])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_ChatBox]
GO
ALTER TABLE [dbo].[ChatBox]  WITH CHECK ADD  CONSTRAINT [FK_ChatBox_Cus] FOREIGN KEY([CusId])
REFERENCES [dbo].[Cus] ([CusId])
GO
ALTER TABLE [dbo].[ChatBox] CHECK CONSTRAINT [FK_ChatBox_Cus]
GO
ALTER TABLE [dbo].[ChatBox]  WITH CHECK ADD  CONSTRAINT [FK_ChatBox_Shp] FOREIGN KEY([ShpId])
REFERENCES [dbo].[Shp] ([ShpId])
GO
ALTER TABLE [dbo].[ChatBox] CHECK CONSTRAINT [FK_ChatBox_Shp]
GO
ALTER TABLE [dbo].[CouponDet]  WITH CHECK ADD  CONSTRAINT [FK_CouponDet_Coupon] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[CouponDet] CHECK CONSTRAINT [FK_CouponDet_Coupon]
GO
ALTER TABLE [dbo].[CouponDet]  WITH CHECK ADD  CONSTRAINT [FK_CouponDet_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[CouponDet] CHECK CONSTRAINT [FK_CouponDet_Pro]
GO
ALTER TABLE [dbo].[Cus]  WITH CHECK ADD  CONSTRAINT [FK_Cus_Usr] FOREIGN KEY([CusId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cus] CHECK CONSTRAINT [FK_Cus_Usr]
GO
ALTER TABLE [dbo].[Mer]  WITH CHECK ADD  CONSTRAINT [FK_Mer_Usr] FOREIGN KEY([MerId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mer] CHECK CONSTRAINT [FK_Mer_Usr]
GO
ALTER TABLE [dbo].[Mstr]  WITH CHECK ADD  CONSTRAINT [FK_Mstr_Usr] FOREIGN KEY([MstrId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mstr] CHECK CONSTRAINT [FK_Mstr_Usr]
GO
ALTER TABLE [dbo].[MstrDet]  WITH CHECK ADD  CONSTRAINT [FK_MstrDet_Mstr] FOREIGN KEY([MstrId])
REFERENCES [dbo].[Mstr] ([MstrId])
GO
ALTER TABLE [dbo].[MstrDet] CHECK CONSTRAINT [FK_MstrDet_Mstr]
GO
ALTER TABLE [dbo].[MstrDet]  WITH CHECK ADD  CONSTRAINT [FK_MstrDet_Mstr1] FOREIGN KEY([AddBy])
REFERENCES [dbo].[Mstr] ([MstrId])
GO
ALTER TABLE [dbo].[MstrDet] CHECK CONSTRAINT [FK_MstrDet_Mstr1]
GO
ALTER TABLE [dbo].[MstrDet]  WITH CHECK ADD  CONSTRAINT [FK_MstrDet_MstrRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[MstrRole] ([RoleId])
GO
ALTER TABLE [dbo].[MstrDet] CHECK CONSTRAINT [FK_MstrDet_MstrRole]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_Pro_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[ProBrand] ([BrandId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_Pro_Brand]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_Pro_ProCat] FOREIGN KEY([CatId])
REFERENCES [dbo].[ProCat] ([CatId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_Pro_ProCat]
GO
ALTER TABLE [dbo].[Pro]  WITH CHECK ADD  CONSTRAINT [FK_UsersMerchantsShopsProducts_UsersMerchantsShops] FOREIGN KEY([ShpId])
REFERENCES [dbo].[Shp] ([ShpId])
GO
ALTER TABLE [dbo].[Pro] CHECK CONSTRAINT [FK_UsersMerchantsShopsProducts_UsersMerchantsShops]
GO
ALTER TABLE [dbo].[ProDet]  WITH CHECK ADD  CONSTRAINT [FK_ProDet_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[ProDet] CHECK CONSTRAINT [FK_ProDet_Pro]
GO
ALTER TABLE [dbo].[ProDet]  WITH CHECK ADD  CONSTRAINT [FK_ProDet_ProColor] FOREIGN KEY([ColorId])
REFERENCES [dbo].[ProColor] ([ColorId])
GO
ALTER TABLE [dbo].[ProDet] CHECK CONSTRAINT [FK_ProDet_ProColor]
GO
ALTER TABLE [dbo].[ProDet]  WITH CHECK ADD  CONSTRAINT [FK_ProDet_ProSize] FOREIGN KEY([SizeId])
REFERENCES [dbo].[ProSize] ([SizeId])
GO
ALTER TABLE [dbo].[ProDet] CHECK CONSTRAINT [FK_ProDet_ProSize]
GO
ALTER TABLE [dbo].[ProSlide]  WITH CHECK ADD  CONSTRAINT [FK_ProSlide_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[ProSlide] CHECK CONSTRAINT [FK_ProSlide_Pro]
GO
ALTER TABLE [dbo].[ProSlideImg]  WITH CHECK ADD  CONSTRAINT [FK_ProSlideImg_Pro] FOREIGN KEY([ShpId], [ProId])
REFERENCES [dbo].[Pro] ([ShpId], [ProId])
GO
ALTER TABLE [dbo].[ProSlideImg] CHECK CONSTRAINT [FK_ProSlideImg_Pro]
GO
ALTER TABLE [dbo].[Rcpt]  WITH CHECK ADD  CONSTRAINT [FK_Rcpt_Usr] FOREIGN KEY([UsrAdd])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rcpt] CHECK CONSTRAINT [FK_Rcpt_Usr]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuy_Cus] FOREIGN KEY([CusId])
REFERENCES [dbo].[Cus] ([CusId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_RcptBuy_Cus]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuy_Rcpt] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[Rcpt] ([RcptId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_RcptBuy_Rcpt]
GO
ALTER TABLE [dbo].[RcptBuy]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuy_Shp] FOREIGN KEY([ShpId])
REFERENCES [dbo].[Shp] ([ShpId])
GO
ALTER TABLE [dbo].[RcptBuy] CHECK CONSTRAINT [FK_RcptBuy_Shp]
GO
ALTER TABLE [dbo].[RcptBuyDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuyDet_ProDet] FOREIGN KEY([ShpId], [ProId], [ColorId], [SizeId])
REFERENCES [dbo].[ProDet] ([ShpId], [ProId], [ColorId], [SizeId])
GO
ALTER TABLE [dbo].[RcptBuyDet] CHECK CONSTRAINT [FK_RcptBuyDet_ProDet]
GO
ALTER TABLE [dbo].[RcptBuyDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuyDet_RcptBuy] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[RcptBuy] ([RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuyDet] CHECK CONSTRAINT [FK_RcptBuyDet_RcptBuy]
GO
ALTER TABLE [dbo].[RcptBuySta]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuySta_RcptBuy] FOREIGN KEY([RcptBuyId])
REFERENCES [dbo].[RcptBuy] ([RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuySta] CHECK CONSTRAINT [FK_RcptBuySta_RcptBuy]
GO
ALTER TABLE [dbo].[RcptBuyStaDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptBuyStaDet_RcptBuySta] FOREIGN KEY([StaId], [RcptBuyId])
REFERENCES [dbo].[RcptBuySta] ([StaId], [RcptBuyId])
GO
ALTER TABLE [dbo].[RcptBuyStaDet] CHECK CONSTRAINT [FK_RcptBuyStaDet_RcptBuySta]
GO
ALTER TABLE [dbo].[RcptBuyStaDet]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStatesSteps] FOREIGN KEY([StepId])
REFERENCES [dbo].[RcptBuyStaStep] ([StepId])
GO
ALTER TABLE [dbo].[RcptBuyStaDet] CHECK CONSTRAINT [FK_ReceiptsBuysStatesDetails_ReceiptsBuysStatesSteps]
GO
ALTER TABLE [dbo].[RcptSub]  WITH CHECK ADD  CONSTRAINT [FK_RcptSub_Mer] FOREIGN KEY([MerId])
REFERENCES [dbo].[Mer] ([MerId])
GO
ALTER TABLE [dbo].[RcptSub] CHECK CONSTRAINT [FK_RcptSub_Mer]
GO
ALTER TABLE [dbo].[RcptSub]  WITH CHECK ADD  CONSTRAINT [FK_RcptSub_Rcpt] FOREIGN KEY([RcptSubId])
REFERENCES [dbo].[Rcpt] ([RcptId])
GO
ALTER TABLE [dbo].[RcptSub] CHECK CONSTRAINT [FK_RcptSub_Rcpt]
GO
ALTER TABLE [dbo].[RcptSubDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptSubDet_RcptSub] FOREIGN KEY([RcptSubId])
REFERENCES [dbo].[RcptSub] ([RcptSubId])
GO
ALTER TABLE [dbo].[RcptSubDet] CHECK CONSTRAINT [FK_RcptSubDet_RcptSub]
GO
ALTER TABLE [dbo].[RcptSubDet]  WITH CHECK ADD  CONSTRAINT [FK_RcptSubDet_Sub] FOREIGN KEY([SubId])
REFERENCES [dbo].[Sub] ([SubId])
GO
ALTER TABLE [dbo].[RcptSubDet] CHECK CONSTRAINT [FK_RcptSubDet_Sub]
GO
ALTER TABLE [dbo].[Shp]  WITH CHECK ADD  CONSTRAINT [FK_Shp_Mer] FOREIGN KEY([MerId])
REFERENCES [dbo].[Mer] ([MerId])
GO
ALTER TABLE [dbo].[Shp] CHECK CONSTRAINT [FK_Shp_Mer]
GO
ALTER TABLE [dbo].[UsrAct]  WITH CHECK ADD  CONSTRAINT [FK_UsrAct_Usr] FOREIGN KEY([UsrId])
REFERENCES [dbo].[Usr] ([UsrId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsrAct] CHECK CONSTRAINT [FK_UsrAct_Usr]
GO
ALTER TABLE [dbo].[WebSlide]  WITH CHECK ADD  CONSTRAINT [FK_WebSlide_WebInfo] FOREIGN KEY([WebId])
REFERENCES [dbo].[WebInfo] ([WebId])
GO
ALTER TABLE [dbo].[WebSlide] CHECK CONSTRAINT [FK_WebSlide_WebInfo]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [CK_Usr] CHECK  (([Email] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [CK_Usr]
GO
ALTER TABLE [dbo].[Usr]  WITH CHECK ADD  CONSTRAINT [CK_Usr_1] CHECK  ((NOT [Phone] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Usr] CHECK CONSTRAINT [CK_Usr_1]
GO
ALTER TABLE [dbo].[WebInfo]  WITH CHECK ADD  CONSTRAINT [CK_WebInfo] CHECK  (([WebId]=(1)))
GO
ALTER TABLE [dbo].[WebInfo] CHECK CONSTRAINT [CK_WebInfo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rcpt', @level2type=N'COLUMN',@level2name=N'RcptId'
GO
