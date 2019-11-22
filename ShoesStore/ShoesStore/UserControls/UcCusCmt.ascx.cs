using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.UserControls
{
    public enum ObjCmt

    {
        CusCmt,
        MerCmt
    }

    public partial class UcCusCmt : UserControl
    {
        public Cus Cus { get; set; }

        public Shp Shp { get; set; }

        public ObjCmt ObjCmt { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var returnUrl = Request.Url.Scheme + "://" + Request.Url.Authority +
                                Request.ApplicationPath.TrimEnd('/');
                if (Request.UrlReferrer != null) returnUrl = Request.UrlReferrer.ToString();
                if (Shp == null && Cus == null)


                {
                    MyLibrary.Show("Xin lỗi web đang bảo trì, vui lòng quay lại sau", returnUrl);
                }
                else
                {
                    rptCusCmt.DataSource = ObjCmt == ObjCmt.MerCmt
                        ? MyLibrary.RcptBuy_BUS.GetAll().Where(m =>
                            m.CusId == Cus.CusId && m.MerMessage != null && m.MerPoint != null &&
                            (!string.IsNullOrEmpty(m.MerMessage) || m.MerPoint != null))
                        : MyLibrary.RcptBuy_BUS.GetAll().Where(m =>
                            m.ShpId == Shp.ShpId && m.CusMessage != null && m.CusPoint != null &&
                            (!string.IsNullOrEmpty(m.CusMessage) || m.CusPoint != null));
                    rptCusCmt.DataBind();
                    if (ObjCmt == ObjCmt.CusCmt)
                        averagePoint.Text = MyLibrary.DrawStar(MyLibrary.Shp_Bus.AverageStar(Shp));
                    else
                        averagePoint.Text = MyLibrary.DrawStar(MyLibrary.Cus_BUS.AverageStar(Cus));
                }
            }
        }

        protected void rptCusCmt_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var hdfRcptBuyId = (HiddenField) e.Item.FindControl("hdfRcptBuyId");
                var rcptBuy = MyLibrary.RcptBuy_BUS.GetAll()
                    .FirstOrDefault(m => m.RcptBuyId == int.Parse(hdfRcptBuyId.Value));

                var MessageFrom = (Label) e.Item.FindControl("MessageFrom");
                var PointFrom = (Label) e.Item.FindControl("PointFrom");

                MessageFrom.Text = ObjCmt == ObjCmt.CusCmt ? rcptBuy?.CusMessage : rcptBuy?.MerMessage;

                PointFrom.Text = ObjCmt == ObjCmt.CusCmt ? rcptBuy.CusPoint == null ? "" :
                    MyLibrary.DrawStar(rcptBuy.CusPoint.Value)
                    : rcptBuy.MerPoint == null ? "" : MyLibrary.DrawStar(rcptBuy.MerPoint.Value);
            }
        }
    }
}