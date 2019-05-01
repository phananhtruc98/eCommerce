using ShoesStore.Merchant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions
    {
        public static void MerExpired(this PlaceHolder phd)
        {
            if(MerchantSession.LoginMer.GetSubEndDate()==DateTime.Now)
            {
                
                
                Label lb = new Label()
                {
                    Text = "Bạn đã hết hạn, xin mời gia hạn thêm sub "
                };

                phd.Controls.Add(lb);
            }
        }
    }
}