using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Customer
{
    public partial class CusHome_Rcpt_Det : System.Web.UI.Page
    {
        private int RcptBuyId = 0;
        private string dateadd = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RcptBuyId = Int32.Parse(Request.QueryString["RcptBuyId"]);
                var d = (from r in MyLibrary.Rcpt_BUS.GetAll()
                         where r.RcptId == RcptBuyId
                         select r.DateAdd).Single();
                dateadd = d.ToString();
                lbRcptBuyId.Text = "Đơn hàng #" + RcptBuyId;
                lvRcptBuyDate.Text = "Ngày đặt hàng: " + dateadd;
                lbRcptBuyId.Visible = true;
                lvRcptBuyDate.Visible = true;
                rowRcptBuyDet.Visible = true;
                BindDataLvRcptBuyDet(RcptBuyId);

            }
        }

        public void BindDataLvRcptBuyDet(int RcptId)
        {

            rptRcptShp.DataSource = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Shop(RcptId);
            rptRcptShp.DataBind();
        }

        protected void rptRcptShp_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                int ShpId = Int32.Parse(hdfShpId.Value);
                Repeater rptRcptShpDet = (Repeater)e.Item.FindControl("rptRcptShpDet");
                rptRcptShpDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(RcptBuyId).Where(m => m.ShpId + "" == hdfShpId.Value);
                rptRcptShpDet.DataBind();
            }
        }
    }
}