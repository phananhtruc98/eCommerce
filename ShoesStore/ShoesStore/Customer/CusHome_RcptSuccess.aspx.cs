using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.MyExtensions;
namespace ShoesStore.Customer
{
    public partial class CusHome_RcptSuccess : System.Web.UI.Page
    {
        private readonly Rcpt_BUS rcpt = new Rcpt_BUS();
        private readonly RcptBuy_BUS rcptBuy = new RcptBuy_BUS();
        private readonly RcptBuyDet_BUS rcptBuyDet = new RcptBuyDet_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        private readonly Pro_BUS pro = new Pro_BUS();
        private readonly Shp_BUS shp = new Shp_BUS();
        int rcptTemp = 0;
        string dateadd = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usr usr = (Usr)WebSession.LoginUsr;
                Usr usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
                BindGridViewgvRcptBuy(usr1.UsrId);
            }
        }

        private void BindGridViewgvRcptBuy(int CusId)
        {
            var rs = from r in rcptBuy.GetAll()
                     join d in rcptBuyDet.GetAll() on r.RcptBuyId equals d.RcptBuyId
                     join p in pro.GetAll() on d.ProId equals p.ProId
                     join s in rcpt.GetAll() on r.RcptBuyId equals s.RcptId
                     where r.CusId == CusId
                     select new
                     {
                         RcptBuyId = r.RcptBuyId,
                         DateAddRcpt = s.DateAdd,
                         SumPrice = d.Quantity * Int32.Parse(p.Price),
                         Img = p.Img
                     };
            var rs1 = from a in rs.ToList()
                      group a by new { a.RcptBuyId, a.DateAddRcpt } into p
                      select new
                      {
                          RcptBuyId1 = p.Key.RcptBuyId,
                          Sum = p.Sum(x => x.SumPrice),
                          DateAddRcpt = p.Key.DateAddRcpt,
                          ImgPro = p.Select(x => x.Img).ToList()
                      };


            lvRcptBuy.DataSource = rs1;
            lvRcptBuy.DataBind();
        }

        protected void lvRcptBuy_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            lvRcptBuy.Visible = false;
            lbDonHang.Visible = false;
            //lbDonHangChiTiet.Visible = true;
            //lvRcptBuyDet.Visible = true;
            int RcptBuyId = Int32.Parse(e.CommandArgument.ToString());
            rcptTemp = RcptBuyId;
            var d = (from r in rcpt.GetAll()
                    where r.RcptId == RcptBuyId
                    select r.DateAdd).Single();
            dateadd = d.ToString();
            BindDataLvRcptBuyDet(RcptBuyId);
        }

        public void BindDataLvRcptBuyDet(int RcptId)
        {
            var rs = from r in rcptBuy.GetAll()
                     join d in rcptBuyDet.GetAll() on r.RcptBuyId equals d.RcptBuyId
                     join p in pro.GetAll() on d.ProId equals p.ProId
                     join s in rcpt.GetAll() on r.RcptBuyId equals s.RcptId
                     join h in shp.GetAll() on p.ShpId equals h.ShpId
                     where r.RcptBuyId == RcptId
                     select new
                     {
                         RcptBuyId = r.RcptBuyId,
                         DateAddRcpt = s.DateAdd,
                         ShpName = h.ShpName,
                         ProName = p.ProName,
                         Quantity = d.Quantity,
                         SubPrice = d.Quantity * Int32.Parse(p.Price),
                         Img = p.Img
                     };
            rptRcptShp.DataSource = rs;
            rptRcptShp.DataBind();
        }

        protected void lvRcptBuyDet_DataBound(object sender, EventArgs e)
        {
            //((Label)lvRcptBuyDet.FindControl("lbRcptId")).Text = "Đơn hàng #" + rcptTemp.ToString();
            //((Label)lvRcptBuyDet.FindControl("lbDateAdd")).Text = "Ngày đặt hàng: " + dateadd;
        }

        
    }
}