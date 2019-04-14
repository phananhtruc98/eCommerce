using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using System.Reflection;
using System.Web;

namespace ShoesStore
{
    public class MyLibrary:System.Web.UI.Page
    {  
        private static string moneyPrefix="";
        private static string proImgPath = "/images/products";
        public static System.Web.UI.StateBag GetCurrentPageViewState()
        {
            Page page = HttpContext.Current.Handler as Page;
            var viewStateProp = page?.GetType().GetProperty("ViewState",
                BindingFlags.FlattenHierarchy |
                BindingFlags.Instance |
                BindingFlags.NonPublic);
            return (System.Web.UI.StateBag) viewStateProp?.GetValue(page);
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
            return moneyPrefix+string.Format("{0:n0}", Convert.ToInt32(money));
        }

        public static string ProImgPath(object shpId, object img)
        {
            return Path.Combine(proImgPath, shpId.ToString() ,img.ToString());
        }
    }
}