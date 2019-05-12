using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Merchant
{
    public partial class Merchant_Rcpt_Det : Page
    {
        private string dateadd = "";
        private int RcptBuyId;
        private string statusName = "";
        private int CusIdTemp = 0;
        RcptBuy rcptBuy = new RcptBuy();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RcptBuyId = int.Parse(Request.QueryString["RcptBuyId"]);
                rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => m.RcptBuyId == int.Parse(Request.QueryString["RcptBuyId"]));
                if (string.IsNullOrEmpty(rcptBuy.MerMessage))
                {

                }
                else

                {
                    DivWriteComment.Controls.Clear();
                    Label txtComment = new Label() { Text = MyLibrary.DrawStar(rcptBuy.MerPoint.Value) + "</br>" + "Nhận xét của tôi: " + rcptBuy.MerMessage };
                    DivWriteComment.Controls.Add(txtComment);
                }
                var status = int.Parse(Request.QueryString["Sta"]);
                switch (status)
                {
                    case 1:
                        statusName = "<span class='text-warning'>Đang xác nhận</span>";
                        break;
                    case 2:
                        statusName = "<span class='text-primary'>Đã xác nhận</span>";
                        break;
                    case 3:
                        statusName = "<span class='text-info'>Chờ đi nhận</span>";
                        break;
                    case 4:
                        statusName = "<span class='text-info'>Đang đi nhận</span<";
                        break;
                    case 5:
                        statusName = "<span class='text-info'>Đã nhận hàng</span>";
                        break;
                    case 6:
                        statusName = "<span class='text-info'>Đang chuyển</span>";
                        break;
                    case 7:
                        statusName = "<span class='text-success'>Đã giao</span>";
                        break;
                    case 9:
                        statusName = "<span class='text-danger'>Đã hủy</span>";
                        break;
                    case 10:
                        statusName = "<span class='text-danger'>Đã hủy</span>";
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
                CusIdTemp = z.CusId;
                BindDataLvRcptBuyDet(RcptBuyId, z.CusId);
            }
        }

        public void BindDataLvRcptBuyDet(int RcptId, int CusId)
        {
            rptRcptShp.DataSource = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Shop(RcptId, CusId);
            rptRcptShp.DataBind();
        }


        protected void rptRcptShpDet_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void rptRcptShp_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                var ShpId = int.Parse(hdfShpId.Value);
                var rptRcptShpDet = (Repeater)e.Item.FindControl("rptRcptShpDet");
                rptRcptShpDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(RcptBuyId, CusIdTemp)
                    .Where(m => m.ShpId + "" == hdfShpId.Value);
                rptRcptShpDet.DataBind();
            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => m.RcptBuyId == int.Parse(Request.QueryString["RcptBuyId"]));
            rcptBuy.MerMessage = review_text.Text;
            rcptBuy.MerPoint = int.Parse(review_stars.SelectedValue.Split(' ')[0]);
            MyLibrary.RcptBuy_BUS.Update(rcptBuy);
            MyLibrary.Show("Đã thêm nhận xét", Request.RawUrl);
        }
    }
}