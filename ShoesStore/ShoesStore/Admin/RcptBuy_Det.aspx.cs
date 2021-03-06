﻿using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class RcptBuy_Det : Page
    {
        public static int ProId1;
        public static int ShpId1;
        private int CusIdTemp;
        private string dateadd = "";
        private int RcptBuyId;
        private string statusName = "";

        protected void a1_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/ReviewProductDetail.aspx?ProId=" + ProId1 + "&ShpId=" + ShpId1);
        }

        public void BindDataLvRcptBuyDet(int RcptId, int CusId)
        {
            rptRcptShp.DataSource = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Shop(RcptId, CusId);
            rptRcptShp.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RcptBuyId = int.Parse(Request.QueryString["RcptBuyId"]);
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
                CusIdTemp = z.CusId;
                BindDataLvRcptBuyDet(RcptBuyId, z.CusId);
            }
        }

        protected void rptRcptShp_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var hdfShpId = (HiddenField) e.Item.FindControl("hdfShpId");
                var ShpId = int.Parse(hdfShpId.Value);
                var rptRcptShpDet = (Repeater) e.Item.FindControl("rptRcptShpDet");
                rptRcptShpDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(RcptBuyId, CusIdTemp)
                    .Where(m => m.ShpId + "" == hdfShpId.Value);
                rptRcptShpDet.DataBind();
                ShpId1 = ShpId;
            }
        }


        protected void rptRcptShpDet_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var ProId = int.Parse((e.Item.FindControl("hdfProId") as HiddenField).Value);

            ProId1 = ProId;
        }
    }
}