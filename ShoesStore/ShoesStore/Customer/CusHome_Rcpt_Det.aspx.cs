using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Customer
{
    public partial class CusHome_Rcpt_Det : Page
    {
        private string dateadd = "";
        private int RcptBuyId;
        private string statusName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RcptBuyId = int.Parse(Request.QueryString["RcptBuyId"]);
                var status = int.Parse(Request.QueryString["Sta"]);
                switch (status)
                {
                    case 1:
                        statusName = "Chờ thanh toán";
                        break;
                    case 3:
                        statusName = "Chờ lấy hàng";
                        break;
                    case 6:
                        statusName = "Chờ giao hàng";
                        break;
                    case 7:
                        statusName = "Đã giao";
                        break;
                    case 9:
                        statusName = "Đã hủy";
                        break;
                    case 10:
                        statusName = "Đã hủy";
                        break;
                }

                var d = (from r in MyLibrary.Rcpt_BUS.GetAll()
                    where r.RcptId == RcptBuyId
                    select r.DateAdd).Single();
                dateadd = d.ToString();
                lbRcptBuyId.Text = "Đơn hàng #" + RcptBuyId;
                lbRcptBuyDate.Text = "Ngày đặt hàng: " + dateadd;
                lbRcptBuySta.Text = "Tình trạng đơn hàng: " + statusName;
                lbRcptBuyId.Visible = true;
                lbRcptBuyDate.Visible = true;
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
                var hdfShpId = (HiddenField) e.Item.FindControl("hdfShpId");
                var ShpId = int.Parse(hdfShpId.Value);
                var rptRcptShpDet = (Repeater) e.Item.FindControl("rptRcptShpDet");
                rptRcptShpDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(RcptBuyId)
                    .Where(m => m.ShpId + "" == hdfShpId.Value);
                rptRcptShpDet.DataBind();
            }
        }

        protected void rptRcptShpDet_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                if (int.Parse(Request.QueryString["Sta"]) == 7)
                {
                    var lbtnDanhGia = (LinkButton) e.Item.FindControl("lbtnDanhGia");
                    lbtnDanhGia.Visible = true;
                    //var CatName = 
                    //string CatName = e.Item.
                }
        }
    }
}