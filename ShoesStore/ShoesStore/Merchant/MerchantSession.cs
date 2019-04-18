using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.Merchant
{
    public class MerchantSession
    {
        private static readonly MerchantSession _instance = null;
        public static object LoginMerchant
        {
            get => HttpContext.Current.Session["LoginMerchant"];
            set => HttpContext.Current.Session["LoginMerchant"] = value;
        }

        public static MerchantSession Instance => _instance ?? new MerchantSession();
    }
}