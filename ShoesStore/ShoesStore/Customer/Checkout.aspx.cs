using System;
using System.Linq;
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
                checkoutContent.DataBind();
                //
                if (MyLibrary.CartDet_BUS.ListCartPreview() == null ||
                    MyLibrary.CartDet_BUS.ListCartPreview().Count == 0)
                    checkoutContent.InnerText = "Không có sản phẩm trong giỏ hàng!";
                if (WebSession.LoginCus == null)
                {
                    MyLibrary.Show("Bạn chưa đăng nhập");
                    Response.Redirect("/");
                }

                rptCartDetCheckout.DataSource = MyLibrary.CartDet_BUS.ListCartPreview();
                rptCartDetCheckout.DataBind();
            }
        }

        protected void btnOrder_OnClick(object sender, EventArgs e)
        {
            if (checkout_terms.Checked)
            {
                var groupByShop = MyLibrary.CartDet_BUS.GetAll().Where(n => n.Cart.CusId == WebSession.LoginCus.CusId)
                    .GroupBy(m => new {m.Cart.CusId, m.ShpId});
                foreach (var group in groupByShop)
                {
                    var rcpt = new Rcpt
                    {
                        UsrAdd = group.FirstOrDefault().ProDet.Pro.Shp.MerId,
                        DateAdd = DateTime.Now,
                        IsCompleted = false
                    };
                    MyLibrary.Rcpt_BUS.Insert(rcpt);
                    var rcptId = MyLibrary.Rcpt_BUS.getMaxRcptId();
                    var rcptBuy = new RcptBuy
                    {
                        RcptBuyId = rcptId,
                        ShpId = group.Key.ShpId,
                        CusId = WebSession.LoginCus.CusId
                    };
                    MyLibrary.RcptBuy_BUS.Insert(rcptBuy);
                    //Thêm bảng RcptBuySta (trạng thái cho 1 đơn hàng của 1 shop)
                    var rcptBuySta = new RcptBuySta
                    {
                        //StaId tự động tăng
                        RcptBuyId = rcptBuy.RcptBuyId
                    };
                    MyLibrary.RcptBuySta_BUS.Insert(rcptBuySta);
                    rcptBuySta = MyLibrary.RcptBuySta_BUS.GetLast();
                    //Thêm bảng RcptBuyStaDet (gán tình trạng cho bảng RcptBuySta)
                    //RcptBuyStaDet rcptBuyStaDet = new RcptBuyStaDet()
                    //{
                    //    StaId = rcptBuySta.StaId,
                    //    RcptBuyId = rcptBuy.RcptBuyId,
                    //    StepId = 1
                    //};
                    MyLibrary.RcptBuyStaDet_BUS.Insert(rcptBuySta, 1);
                    foreach (var groupItem in group)
                    {
                        var rcptBuyDet = new RcptBuyDet
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

            Response.Redirect("/");
        }
    }
}