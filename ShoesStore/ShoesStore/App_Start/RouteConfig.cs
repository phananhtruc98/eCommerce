using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;
namespace ShoesStore
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings
            {
                AutoRedirectMode = RedirectMode.Permanent
            };
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("Home", "", "~/Default.aspx");
            routes.MapPageRoute("Product", "san-pham", "~/Customer/Pro.aspx");
            routes.MapPageRoute("ProDet", "san-pham/{CatName}/{ProName}/{ShpName}", "~/Customer/ProDet.aspx");
            routes.MapPageRoute("Cart", "gio-hang", "~/Customer/Cart.aspx");
            routes.MapPageRoute("CartCheckout", "gio-hang/thanh-toan", "~/Customer/Checkout.aspx");

            routes.MapPageRoute("Admin", "quan-tri", "~/Admin/Default.aspx");
            routes.MapPageRoute("ManagerAdministrator", "quan-tri/web-master", "~/Admin/ManageAdministrator.aspx");
            routes.MapPageRoute("ManagerCustomer", "quan-tri/customer", "~/Admin/ManageCustomer.aspx");
            routes.MapPageRoute("ManagerMerchant", "quan-tri/merchant", "~/Admin/ManageMerchant.aspx");
            routes.MapPageRoute("ManagerProduct", "quan-tri/san-pham", "~/Admin/ManageProduct.aspx");
            routes.MapPageRoute("ManagerReceipt-Customer", "quan-tri/hoa-don-san-pham", "~/Admin/ManageReceipt_Cus.aspx");
            routes.MapPageRoute("ManagerReceipt-Merchant", "quan-tri/hoa-don-goi-thuong-nien", "~/Admin/ManageReceipt_Mer.aspx");
            routes.MapPageRoute("ManagerService", "quan-tri/goi-thuong-nien", "~/Admin/ManageService.aspx");
            routes.MapPageRoute("LoginMstr", "quan-tri/dang-nhap", "~/Admin/Login_Mstr.aspx");
            routes.MapPageRoute("AccountMstr", "quan-tri/thong-tin-ca-nhan", "~/Admin/Account_Mstr.aspx");
            routes.MapPageRoute("Overview_Profit_W", "quan-tri/thong-ke-loi-nhuan-W", "~/Admin/Overview_Profit_W.aspx");
            routes.MapPageRoute("Overview_RcptSuccess", "quan-tri/thong-ke-don-hang-mua-sp-thanh-cong", "~/Admin/Overview.aspx");
            routes.MapPageRoute("Create_RcptSub", "quan-tri/mua-goi-thuong-nien", "~/Admin/CreateNewRcptSub.aspx");
            
            //
            routes.MapPageRoute("Mer_About", "thong-tin", "~/Merchant/About.aspx");
            routes.MapPageRoute("Mer_CheckOut", "nguoi-ban/dang-ky-sub/thanh-toan", "~/Merchant/CheckOut.aspx");
            routes.MapPageRoute("Mer_Contact", "lien-he", "~/Merchant/Contact.aspx");
            routes.MapPageRoute("Mer_MerHome", "nguoi-ban", "~/Merchant/MerHome.aspx");
            routes.MapPageRoute("Mer_MerProfile", "nguoi-ban/thong-tin", "~/Merchant/MerProfile.aspx");
            //routes.MapPageRoute("Mer_Shop", "nguoi-ban/cua-hang", "~/Merchant/MerShop.aspx");
            routes.MapPageRoute("Mer_AddPro", "cua-hang/quan-ly-san-pham/them-san-pham", "~/Merchant/MerAddProd.aspx");
            routes.MapPageRoute("Mer_Manage_Pro", "cua-hang/quan-ly-san-pham", "~/Merchant/MerAddProd.aspx");
            routes.MapPageRoute("Mer_Manage_RcptBuy", "cua-hang/quan-ly-hoa-don", "~/Merchant/ManageRcpt.aspx");
            routes.MapPageRoute("Mer_SignIn", "nguoi-ban/dang-nhap", "~/Merchant/SignIn.aspx");
            routes.MapPageRoute("Mer_Sub", "nguoi-ban/quan-ly-sub/dang-ky", "~/Merchant/SubGet.aspx");
            routes.MapPageRoute("Mer_MerSub", "nguoi-ban/quan-ly-sub/thong-tin", "~/Merchant/SubGet.aspx");
            routes.MapPageRoute("Mer_MerProfile_ChangePassword", "nguoi-ban/doi-mat-khau", "~/Merchant/MerProfile_ChangePassword.aspx");
            routes.MapPageRoute("Mer_Promotion", "cua-hang/quan-ly-san-pham/khuyen-mai", "~/Merchant/MerPromotion.aspx");
            routes.MapPageRoute("Mer_DisableProduct", "cua-hang/quan-ly-san-pham/an-san-pham", "~/Merchant/DisableProduct.aspx");
            routes.MapPageRoute("Mer_UpdateQuantityPro", "cua-hang/quan-ly-san-pham/cap-nhat-so-luong-san-pham", "~/Merchant/UpdateQuantityPro.aspx");
            routes.MapPageRoute("Mer_ManageRcptSub", "nguoi-ban/quan-ly-sub/hoa-don-mua-goi-thuong-nien", "~/Merchant/ManageRcptSub.aspx");
            //routes.MapPageRoute("Mer_MerAddShop", "cua-hang/thong-tin", "~/Merchant/MerAddShop.aspx");
            //
            routes.MapPageRoute("Shp_Home", "{ShpName}", "~/Merchant/MerShop.aspx");
            //
            routes.MapPageRoute("CusHome", "nguoi-dung", "~/Customer/CusHome.aspx");
            routes.MapPageRoute("Cushome_Profile", "nguoi-dung/tai-khoan", "~/Customer/CusHome.aspx");
            routes.MapPageRoute("Cushome_ChangePassword", "nguoi-dung/tai-khoan/mat-khau", "~/Customer/CusHome_ChangePassword.aspx");
            routes.MapPageRoute("Cushome_Comment", "nguoi-dung/tai-khoan/nhan-xet", "~/Customer/CusHome_Cmt.aspx");
            routes.MapPageRoute("Cushome_Rcpt_Success", "nguoi-dung/theo-doi-don-hang", "~/Customer/CusHome_RcptSuccess.aspx");
            routes.MapPageRoute("Cushome_Rcpt_Det", "nguoi-dung/hoa-don/chi-tiet", "~/Customer/CusHome_Rcpt_Det.aspx");
        }
    }
}
