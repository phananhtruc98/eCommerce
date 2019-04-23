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
            //var rs = from r in rcptBuy.GetAll()
            //         join d in rcptBuyDet.GetAll() on r.RcptBuyId equals d.RcptBuyId
            //         join p in pro.GetAll() on d.ProId equals p.ProId
            //         join s in rcpt.GetAll() on r.RcptBuyId equals s.RcptId
            //         where r.CusId == CusId
            //         select new
            //         {
            //             RcptBuyId = r.RcptBuyId,
            //             DateAddRcpt = s.DateAdd,
            //             SumPrice = d.Quantity * Int32.Parse(p.Price),
            //             Img = p.Img
            //         };
            //var rs1 = from a in rs.ToList()
            //          group a by new { a.RcptBuyId, a.DateAddRcpt, a.SumPrice, a.Img } into t
            //          select new
            //          {
            //              RcptBuyId = t.Key.RcptBuyId,
            //              DateAddRcpt = t.Key.DateAddRcpt,
            //              SumPrice = t.Key.SumPrice,
            //              Img = t.Key.Img,
            //          };

            //var rs2 = (from a in rs1.ToList()
            //          group a by new { a.RcptBuyId, a.DateAddRcpt } into p
            //          select new
            //          {
            //              RcptBuyId1 = p.Key.RcptBuyId,
            //              Sum = p.Sum(x => x.SumPrice),
            //              DateAddRcpt = p.Key.DateAddRcpt,
            //              ImgPro = p.Select(x => x.Img).ToList()
            //          }).OrderByDescending(x=>x.DateAddRcpt).ToList();
            //if (rs2.Count() == 0)
            //{
            //    lbEmpty.Visible = true;
            //}
            //else
            //{
            //    lvRcptBuy.DataSource = rs2;
            //    lvRcptBuy.DataBind();
            //}
            //var rs = from r in rcptBuy.GetAll()
            //         join d in rcptBuyDet.GetAll() on r.RcptBuyId equals d.RcptBuyId
            //         join p in pro.GetAll() on d.ProId equals p.ProId
            //         join s in rcpt.GetAll() on r.RcptBuyId equals s.RcptId
            //         where r.CusId == CusId
            //         select new
            //         {
            //             RcptBuyId = r.RcptBuyId,
            //             DateAddRcpt = s.DateAdd,
            //             SumPrice = d.Quantity * Int32.Parse(p.Price),
            //             Pro = p
            //         };
            //var rs1 = from a in rs.ToList()
            //          group a by new { a.RcptBuyId, a.DateAddRcpt, a.SumPrice, a.Pro } into t
            //          select new
            //          {
            //              RcptBuyId = t.Key.RcptBuyId,
            //              DateAddRcpt = t.Key.DateAddRcpt,
            //              SumPrice = t.Key.SumPrice,
            //              Pro = t.Key.Pro
            //          };

            //var rs2 = (from a in rs1.ToList()
            //           group a by new { a.RcptBuyId, a.DateAddRcpt, a.Pro } into p
            //           select new
            //           {
            //               RcptBuyId1 = p.Key.RcptBuyId,
            //               Sum = p.Sum(x => x.SumPrice),
            //               DateAddRcpt = p.Key.DateAddRcpt,
            //               Pro = p.Key.Pro
            //           }).ToList();
            //if (rs2.Count() == 0)
            //{
            //    lbEmpty.Visible = true;
            //}
            //else
            //{
            //    lvRcptBuy.DataSource = rs2;
            //    lvRcptBuy.DataBind();
            //}

            lvRcptBuy.DataSource = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Rcpt(CusId);
            lvRcptBuy.DataBind();
        }

        protected void lvRcptBuy_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            lvRcptBuy.Visible = false;
            lbDonHang.Visible = false;
            Label1.Visible = true;
            int RcptBuyId = Int32.Parse(e.CommandArgument.ToString());
            var d = (from r in rcpt.GetAll()
                     where r.RcptId == RcptBuyId
                     select r.DateAdd).Single();
            dateadd = d.ToString();
            lbRcptBuyId.Text = "Đơn hàng #" +RcptBuyId;
            lvRcptBuyDate.Text = "Ngày đặt hàng: "+dateadd;
            lbRcptBuyId.Visible = true;
            lvRcptBuyDate.Visible = true;
            rowRcptBuyDet.Visible = true;
            rcptTemp = RcptBuyId;
            BindDataLvRcptBuyDet(rcptTemp);
        }

        public void BindDataLvRcptBuyDet(int RcptId)
        {
            
            rptRcptShp.DataSource = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Shop(RcptId);
            rptRcptShp.DataBind();
        }

        protected void lvRcptBuyDet_DataBound(object sender, EventArgs e)
        {
            //((Label)lvRcptBuyDet.FindControl("lbRcptId")).Text = "Đơn hàng #" + rcptTemp.ToString();
            //((Label)lvRcptBuyDet.FindControl("lbDateAdd")).Text = "Ngày đặt hàng: " + dateadd;
        }

        protected void rptRcptShp_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                int ShpId = Int32.Parse(hdfShpId.Value);
                Repeater rptRcptShpDet = (Repeater)e.Item.FindControl("rptRcptShpDet");

                rptRcptShpDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(rcptTemp).Where(m => m.ShpId + "" == hdfShpId.Value);
                rptRcptShpDet.DataBind();
            }
        }

        protected void lvRcptBuy_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                HiddenField hdfRcptBuyId = (HiddenField)e.Item.FindControl("hdfRcptBuyId");
                int RcptBuyId = Int32.Parse(hdfRcptBuyId.Value);
                ListView lvRcptBuyDet = (ListView)e.Item.FindControl("lvRcptBuyDet");

                lvRcptBuyDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg().Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvRcptBuyDet.DataBind();
            }
        }
    }
}