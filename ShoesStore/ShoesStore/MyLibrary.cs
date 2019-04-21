﻿using System.IO;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using Utilities;


namespace ShoesStore
{
    public partial class MyLibrary : Page
    {
        private static readonly string MoneyPrefix = "";
        private static readonly string proPath = "/images/products";
        private static readonly string proCatPath = "/images/categories";
        private static readonly string proDetUrl = "/san-pham/";
        private static readonly string slidePath = "/images/slides";
        private static readonly string cusPath = "/images/usrs/cus";
        private static readonly string usrPath = "/images/usrs";
        private static readonly string _noImg = "/images/no_img.png";

        public static SortDirection SortDirection
        {
            get
            {
                if (GetCurrentPageViewState()["SortDirection"] == null)
                    GetCurrentPageViewState()["SortDirection"] = SortDirection.Ascending;
                return (SortDirection)GetCurrentPageViewState()["SortDirection"];
            }
            set => GetCurrentPageViewState()["SortDirection"] = value;
        }

        public static string CusImgPath(object iCus)
        {
            var cus = (Cus)iCus;
            if (string.IsNullOrEmpty(cus.Usr.Avatar))
                return Path.Combine(usrPath, "default.jpg");
            return Path.Combine(cusPath, cus.CusId.ToString(), cus.Usr.Avatar);
        }

        public static StateBag GetCurrentPageViewState()
        {
            var page = HttpContext.Current.Handler as Page;
            var viewStateProp = page?.GetType().GetProperty("ViewState",
                BindingFlags.FlattenHierarchy |
                BindingFlags.Instance |
                BindingFlags.NonPublic);
            return (StateBag)viewStateProp?.GetValue(page);
        }

        public static string GetSortDirection()
        {
            string direction;
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

        public static string ProCatImgPath(object iProCat)
        {
            var proCat = (ProCat)iProCat;

            string[] path =
            {
                proCatPath,
                proCat.Img
            };
            return ReturnUrl(path);
        }

        public static string ProColorPath(object iProDet)
        {
            var proDet = (ProDet)iProDet;

            return Path.Combine(proPath, proDet.Pro.Shp.ShpName, proDet.Pro.ProName, "color", proDet.ProColor.ColorImg);
        }

        public static string ProDetUrl(object ipro)
        {
            var pro = (Pro)ipro;
            return Path.Combine(proDetUrl, TextHelper.UrlFriendly(pro.ProCat.CatName),
                TextHelper.UrlFriendly(pro.ProName), TextHelper.UrlFriendly(pro.Shp.ShpName));
        }

        public static string ProImgPath(object ipro)
        {
            var pro = (Pro)ipro;
            //if (string.IsNullOrEmpty(pro.Img))

            //return Path.Combine(proPath, "default.png");
            try
            {
                string[] path =
                {
                    proPath,
                    pro.Shp.ShpName,
                    pro.ProName,
                    pro.Img
                };
                return ReturnUrl(path);
            }
            catch
            {
                return _noImg;
            }
        }

        public static string ProSizePath(object iProDet)
        {
            var proDet = (ProDet)iProDet;

            return Path.Combine(proPath, proDet.Pro.Shp.ShpName, proDet.Pro.ProName, "size", proDet.ProSize.SizeImg);
        }

        public static string ProSlidePath(object iProSlide)
        {
            var proSlide = (ProSlide)iProSlide;
            return Path.Combine(proPath, proSlide.Pro.Shp.ShpName, proSlide.Pro.ProName, "Slides", proSlide.Img);
        }

        private static string ReturnUrl(string[] iPath)
        {
            var path = string.Join(@"\", iPath);
            if (File.Exists(Path.Combine(
                HttpContext.Current.Server.MapPath("~")
                    .Substring(0, HttpContext.Current.Server.MapPath("~").Length - 1), path.Substring(1))))
                return path;
            return _noImg;
        }

        public static string SlidePath(object img)
        {
            return Path.Combine(slidePath, img.ToString()).Replace(@"\", @"/");
        }




        public static CartDet_BUS CartDet_BUS => new CartDet_BUS();
        public static ProDet_BUS ProDet_BUS => new ProDet_BUS();
        public static ProCat_BUS ProCat_BUS => new ProCat_BUS();
        public static ProSlide_BUS ProSlide_BUS => new ProSlide_BUS();
        public static ProBrand_BUS ProBrand_BUS => new ProBrand_BUS();

        public static Usr_BUS Usr_BUS => new Usr_BUS();

        public static Cus_BUS Cus_BUS => new Cus_BUS();

        public static WebInfo_BUS WebInfo_BUS => new WebInfo_BUS();

        public static WebSlide_BUS WebSlide_BUS => new WebSlide_BUS();

        public static Pro_BUS Pro_BUS => new Pro_BUS();

        public static RcptBuyDet_BUS RcptBuyDet_BUS => new RcptBuyDet_BUS();
        public static Cart_BUS Cart_BUS => new Cart_BUS();
        public static Shp_BUS Shp_Bus => new Shp_BUS();
        public static Rcpt_BUS Rcpt_BUS => new Rcpt_BUS();
        public static RcptBuy_BUS RcptBuy_BUS => new RcptBuy_BUS();
       
    }
}