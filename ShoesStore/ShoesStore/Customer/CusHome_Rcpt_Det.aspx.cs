using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class CusHome_Rcpt_Det : Page
    {
        private string dateadd = "";
        private int RcptBuyId;
        private string statusName = "";
        RcptBuy rcptBuy = new RcptBuy();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RcptBuyId = int.Parse(Request.QueryString["RcptBuyId"]);
                rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => m.RcptBuyId == int.Parse(Request.QueryString["RcptBuyId"]));
                if (string.IsNullOrEmpty(rcptBuy.CusMessage))
                {

                }
                else

                {
                    DivWriteComment.Controls.Clear();
                    Label txtComment = new Label() { Text = MyLibrary.DrawStar(rcptBuy.CusPoint.Value) + "</br>" + "Nhận xét của tôi: " + rcptBuy.CusMessage };
                    DivWriteComment.Controls.Add(txtComment);
                }
                var status = int.Parse(Request.QueryString["Sta"]);
                switch (status)
                {
                    case 1:
                        statusName = "Đang xác nhận";
                        break;
                    case 2:
                        statusName = "Đã xác nhận";
                        break;
                    case 3:
                        statusName = "Chờ đi nhận";
                        break;
                    case 4:
                        statusName = "Đang đi nhận";
                        break;
                    case 5:
                        statusName = "Đã nhận hàng";
                        break;
                    case 6:
                        statusName = "Đang chuyển";
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
                var s = (from rb in MyLibrary.RcptBuy_BUS.GetAll()
                         where rb.RcptBuyId == RcptBuyId
                         select rb.Shp).FirstOrDefault();
                lbShpName.Text = s.ShpName;
                lbAddress.Text = s.Address;
                lbPhone.Text = s.Phone;

                var z = (from rb in MyLibrary.RcptBuy_BUS.GetAll()
                         where rb.RcptBuyId == RcptBuyId
                         select rb.Cus).FirstOrDefault();
                lbCusName.Text = z.Usr.UsrName;
                lbAddressCus.Text = z.Usr.Address;
                lbPhoneCus.Text = z.Usr.Phone;
                lbEmail.Text = z.Usr.Email;
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
                var hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                var ShpId = int.Parse(hdfShpId.Value);
                var rptRcptShpDet = (Repeater)e.Item.FindControl("rptRcptShpDet");
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
                    var lbtnDanhGia = (LinkButton)e.Item.FindControl("lbtnDanhGia");
                    lbtnDanhGia.Visible = true;
                    //var CatName = 
                    //string CatName = e.Item.
                }
        }
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => m.RcptBuyId == int.Parse(Request.QueryString["RcptBuyId"]));
            rcptBuy.CusMessage = review_text.Text;
            rcptBuy.CusPoint = int.Parse(review_stars.SelectedValue.Split(' ')[0]);
            MyLibrary.RcptBuy_BUS.Update(rcptBuy);
            MyLibrary.Show("Đã thêm nhận xét", Request.RawUrl);
        }
    }
}