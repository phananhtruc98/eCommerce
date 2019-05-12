using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class RcptSub_Det : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int RcptSubId = int.Parse(Request.QueryString["RcptSubId"]);
                LoadLv(RcptSubId);
            }
               
        }

        public void LoadLv(int RcptSubId)
        {
            var rs = MyLibrary.RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == RcptSubId).ToList();
            lvRcptSubDet.DataSource = rs;
            lvRcptSubDet.DataBind();
            var usr = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.RcptSubId == RcptSubId).Select(x => x.Mer.Usr).FirstOrDefault();
            lbAddressMer.Text = usr.Address;
            lbMerName.Text = usr.UsrName;
            lbPhoneMer.Text = usr.Phone;
            lbEmail.Text = usr.Email;
            var shp = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.RcptSubId == RcptSubId).Select(x => x.Mer.Shp).FirstOrDefault();
            lbShpName.Text = shp.Select(x => x.ShpName).FirstOrDefault();
            lbAddress.Text = shp.FirstOrDefault().Address;
            lbPhone.Text = shp.FirstOrDefault().Phone;
            lbRcptSubDate.Visible = true;
            rowRcptSubDet.Visible = true;
            lbTotalPrice.Text = MyLibrary.SumRcptSubPrice(MyLibrary.RcptSub_BUS.GetAll().Where(x => x.RcptSubId == RcptSubId).FirstOrDefault()).ToString();
            var d = (from r in MyLibrary.Rcpt_BUS.GetAll()
                     where r.RcptId == RcptSubId
                     select r.DateAdd).Single();
           
            lbRcptSubId.Text = "Đơn hàng #" + RcptSubId;
            lbRcptSubDate.Text = "Ngày đặt hàng: " + d.ToShortDateString();
        }


        protected void lvRcptSubDet_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

        }
    }
}