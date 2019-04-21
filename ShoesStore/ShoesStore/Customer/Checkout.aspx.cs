using System;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class ThanhToan : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptCartDetCheckout.DataSource = MyLibrary.CartDet_BUS.ListCartPreview();
                rptCartDetCheckout.DataBind();

            }
        }

        protected void btnOrder_OnClick(object sender, EventArgs e)
        {
            if (checkout_terms.Checked)
            {
                var groupByShop = MyLibrary.CartDet_BUS.GetAll().Where(n => n.Cart.CusId == WebSession.LoginCus.CusId).GroupBy(m => new { m.Cart.CusId, m.ShpId });

                foreach (var group in groupByShop)
                {
                    Rcpt rcpt = new Rcpt()
                    {
                        UsrAdd = group.FirstOrDefault().ProDet.Pro.Shp.MerId,
                        DateAdd = DateTime.Now,
                        IsCompleted = false,
                    };
                    MyLibrary.Rcpt_BUS.Insert(rcpt);
                    int rcptId = MyLibrary.Rcpt_BUS.getMaxRcptId();

                    RcptBuy rcptBuy = new RcptBuy()
                    {
                        RcptBuyId = rcptId,
                        ShpId = group.Key.ShpId,
                        CusId = WebSession.LoginCus.CusId
                    };
                    MyLibrary.RcptBuy_BUS.Insert(rcptBuy);
                    foreach (var groupItem in group)
                    {
                        RcptBuyDet rcptBuyDet = new RcptBuyDet()
                        {
                            RcptBuyId = rcptBuy.RcptBuyId,
                            ShpId = group.Key.ShpId,
                            ProId = groupItem.ProId,
                            ColorId = groupItem.ColorId,
                            SizeId = groupItem.SizeId,
                            Quantity = groupItem.Qty

                        };
                        MyLibrary.RcptBuyDet_BUS.Insert(rcptBuyDet);

                        MyLibrary.CartDet_BUS.Delete(groupItem);
                    }

                }
            }
        }
    }
}