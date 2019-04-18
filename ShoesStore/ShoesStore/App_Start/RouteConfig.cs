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
            routes.MapPageRoute("CusHome", "nguoi-dung", "~/Customer/CusHome.aspx");
        }
    }
}
