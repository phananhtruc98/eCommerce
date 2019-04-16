using ShoesStore.BusinessLogicLayer;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using System.Reflection;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using Utilities;
using Convert = System.Convert;

namespace ShoesStore
{
    public partial class MyLibrary : System.Web.UI.Page
    {
        private static string moneyPrefix = "";
        private static string proPath = "/images/products";
        private static string proDetUrl = "/san-pham/";
        private static string slidePath = "/images/slides";
        private static string cusPath = "/images/usrs/cus";
        private static string usrPath = "/images/usrs";
        public static System.Web.UI.StateBag GetCurrentPageViewState()
        {
            Page page = HttpContext.Current.Handler as Page;
            var viewStateProp = page?.GetType().GetProperty("ViewState",
                BindingFlags.FlattenHierarchy |
                BindingFlags.Instance |
                BindingFlags.NonPublic);
            return (System.Web.UI.StateBag)viewStateProp?.GetValue(page);
        }
        public static SortDirection SortDirection
        {
            get
            {
                if (GetCurrentPageViewState()["SortDirection"] == null)
                {
                    GetCurrentPageViewState()["SortDirection"] = SortDirection.Ascending;
                }
                return (SortDirection)GetCurrentPageViewState()["SortDirection"];
            }
            set
            {
                GetCurrentPageViewState()["SortDirection"] = value;

            }

        }
        public static string GetSortDirection()
        {
            string direction = "";
            if (SortDirection == SortDirection.Ascending)
            {
                SortDirection = SortDirection.Descending;
                direction = " DESC";
            }
            else
            {
                SortDirection = SortDirection.Ascending;
                direction = " ASC";
            }

            return direction;
        }

        public static string ToFormatMoney(object money)
        {
            return moneyPrefix + string.Format("{0:n0}", Convert.ToInt32(money));
        }

        public static string ProImgPath(object ipro)
        {
            Pro pro = (Pro)ipro;
            if (string.IsNullOrEmpty(pro.Img))
                return Path.Combine(proPath, "default.png");
            return Path.Combine(proPath, pro.Shp.ShpName, pro.ProName, pro.Img);
        }
        public static string CusImgPath(object cus)
        {
            Cus _cus = (Cus)cus;
            if (string.IsNullOrEmpty(_cus.Usr.Avatar))
                return Path.Combine(usrPath, "default.jpg");
            return Path.Combine(cusPath, _cus.CusId.ToString(), _cus.Usr.Avatar);
        }
        public static string ProSlidePath(object iProSlide)
        {
            ProSlide proSlide = (ProSlide)iProSlide;
            return Path.Combine(proPath, proSlide.Pro.Shp.ShpName, proSlide.Pro.ProName, "Slides", proSlide.Img);
        }

        public static string ProColorPath(object iProDet)
        {
            ProDet proDet = (ProDet)iProDet;

            return Path.Combine(proPath, proDet.Pro.Shp.ShpName, proDet.Pro.ProName, "color", proDet.ProColor.ColorImg);
        }
        public static string ProSizePath(object iProDet)
        {
            ProDet proDet = (ProDet)iProDet;

            return Path.Combine(proPath, proDet.Pro.Shp.ShpName, proDet.Pro.ProName, "size", proDet.ProSize.SizeImg);
        }
        public static string SlidePath(object img)
        {
            return Path.Combine(slidePath, img.ToString()).Replace(@"\", @"/");
        }
        public static string ProDetUrl(object ipro)
        {
            Pro pro = (Pro)ipro;
            return Path.Combine(proDetUrl, TextHelper.UrlFriendly(pro.ProCat.CatName), TextHelper.UrlFriendly(pro.ProName), TextHelper.UrlFriendly(pro.Shp.ShpName));
        }
    }
}