using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

    public partial class UcCusCmt : System.Web.UI.UserControl
    {
        private Cus _cus;
        private Shp _shp;
        private ObjCmt _objCmt;
        public Cus Cus
        {
            get { return _cus; }
            set { _cus = value; }
        }
        public Shp Shp
        {
            get { return _shp; }
            set { _shp = value; }
        }
        public ObjCmt ObjCmt
        {
            get { return _objCmt; }
            set { _objCmt = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string returnUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/');
                if (Request.UrlReferrer != null) returnUrl = Request.UrlReferrer.ToString();
                if (_shp == null && _cus == null)


                    MyLibrary.Show("Xin lỗi web đang bảo trì, vui lòng quay lại sau", returnUrl);
                else
                {
                    rptCusCmt.DataSource = (_objCmt == ObjCmt.MerCmt)
                        ? MyLibrary.RcptBuy_BUS.GetAll().Where(m => m.CusId == _cus.CusId && ((m.MerMessage != null && m.MerPoint != null) && (!string.IsNullOrEmpty(m.MerMessage) || m.MerPoint != null)))
                        : MyLibrary.RcptBuy_BUS.GetAll().Where(m => m.ShpId == _shp.ShpId && ((m.CusMessage != null && m.CusPoint != null) && (!string.IsNullOrEmpty(m.CusMessage) || m.CusPoint != null)));
                    rptCusCmt.DataBind();
                    if (_objCmt == ObjCmt.CusCmt)
                        averagePoint.Text = MyLibrary.DrawStar(MyLibrary.Shp_Bus.AverageStar(_shp));
                    else
                        averagePoint.Text = MyLibrary.DrawStar(MyLibrary.Cus_BUS.AverageStar(_cus));
                }
            }
        }

        protected void rptCusCmt_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hdfRcptBuyId = (HiddenField)e.Item.FindControl("hdfRcptBuyId");
                RcptBuy rcptBuy = MyLibrary.RcptBuy_BUS.GetAll()
                    .FirstOrDefault(m => m.RcptBuyId == int.Parse(hdfRcptBuyId.Value));

                Label MessageFrom = (Label)e.Item.FindControl("MessageFrom");
                Label PointFrom = (Label)e.Item.FindControl("PointFrom");

                MessageFrom.Text = (_objCmt == ObjCmt.CusCmt) ? rcptBuy?.CusMessage : rcptBuy?.MerMessage;

                PointFrom.Text = (_objCmt == ObjCmt.CusCmt) ? (rcptBuy.CusPoint == null ? "" : MyLibrary.DrawStar(rcptBuy.CusPoint.Value))
                    : (rcptBuy.MerPoint == null ? "" : MyLibrary.DrawStar(rcptBuy.MerPoint.Value));
            }
        }
    }
}