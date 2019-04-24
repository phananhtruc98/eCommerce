using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI.WebControls;

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
                BindlvDaGiao(usr1.UsrId);
                BindlvChoThanhToan(usr1.UsrId);
                BindlvChoLayHang(usr1.UsrId);
                BindlvDangGiao(usr1.UsrId);
                BindlvDaHuy(usr1.UsrId);
            }
        }

        /// <summary>  
        ///  TAB ĐÃ GIAO
        /// </summary>  
        // Load Bảng hóa đơn trong
        private void BindlvDaGiao(int CusId)
        {
            var rs = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Rcpt(CusId);
            var rs1 = from r in rs
                      join s in MyLibrary.RcptBuyStaDet_BUS.GetAll() on r.RcptBuyId equals s.RcptBuyId
                      where s.StepId == 7
                      select r;
            if (rs1.Count() != 0)
            {
                lvRcptBuy.DataSource = rs1;
                lvRcptBuy.DataBind();
            }
            else lbEmpty2.Visible = true;

        }
        // Load hình của từng hóa đơn
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
        // btn CHI TIẾT
        protected void lvRcptBuy_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                int RcptBuyId = Int32.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                         where r.RcptId == RcptBuyId
                         select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                LinkButton lbtnChiTiet = (LinkButton)e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp.ToString() + "&Sta=7");
            }

        }


        /// <summary>  
        ///  TAB CHỜ THANH TOÁN
        /// </summary>  
        // Load Bảng hóa đơn trong
        private void BindlvChoThanhToan(int CusId)
        {
            var rs = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Rcpt(CusId);
            var rs1 = from r in rs
                      join s in MyLibrary.RcptBuyStaDet_BUS.GetAll() on r.RcptBuyId equals s.RcptBuyId
                      where s.StepId == 1
                      select r;
            if (rs1.Count() != 0)
            {
                lvChoThanhToan.DataSource = rs1;
                lvChoThanhToan.DataBind();
            }
            else lbEmpty.Visible = true;
        }
        // Load hình của từng hóa đơn
        protected void lvChoThanhToan_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                HiddenField hdfRcptBuyId = (HiddenField)e.Item.FindControl("hdfRcptBuyId");
                int RcptBuyId = Int32.Parse(hdfRcptBuyId.Value);
                ListView lvChoThanhToanDet = (ListView)e.Item.FindControl("lvChoThanhToanDet");
                lvChoThanhToanDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg().Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvChoThanhToanDet.DataBind();

            }
        }
        // btn CHI TIẾT
        protected void lvChoThanhToan_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                int RcptBuyId = Int32.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                         where r.RcptId == RcptBuyId
                         select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                LinkButton lbtnChiTiet = (LinkButton)e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp.ToString() + "&Sta=1");
            }
        }


        /// <summary>  
        ///  TAB CHỜ LẤY HÀNG
        /// </summary>  
        // Load Bảng hóa đơn trong
        private void BindlvChoLayHang(int CusId)
        {
            var rs = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Rcpt(CusId);
            var rs1 = from r in rs
                      join s in MyLibrary.RcptBuyStaDet_BUS.GetAll() on r.RcptBuyId equals s.RcptBuyId
                      where s.StepId == 3
                      select r;
            if (rs1.Count() != 0)
            {
                lvChoLayHang.DataSource = rs1;
                lvChoLayHang.DataBind();
            }
            else
            {
                lbEmpty3.Visible = true;
            }

        }
        // Load hình của từng hóa đơn
        protected void lvChoLayHang_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                HiddenField hdfRcptBuyId = (HiddenField)e.Item.FindControl("hdfRcptBuyId");
                int RcptBuyId = Int32.Parse(hdfRcptBuyId.Value);
                ListView lvChoLayHangDet = (ListView)e.Item.FindControl("lvChoLayHangDet");
                lvChoLayHangDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg().Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvChoLayHangDet.DataBind();

            }
        }
        // btn CHI TIẾT
        protected void lvChoLayHang_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                int RcptBuyId = Int32.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                         where r.RcptId == RcptBuyId
                         select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                LinkButton lbtnChiTiet = (LinkButton)e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp.ToString() + "&Sta=3");
            }
        }


        /// <summary>  
        ///  TAB CHỜ LẤY HÀNG
        /// </summary>  
        // Load Bảng hóa đơn trong
        private void BindlvDangGiao(int CusId)
        {
            var rs = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Rcpt(CusId);
            var rs1 = from r in rs
                      join s in MyLibrary.RcptBuyStaDet_BUS.GetAll() on r.RcptBuyId equals s.RcptBuyId
                      where s.StepId == 6
                      select r;
            if (rs1.Count() != 0)
            {
                lvDangGiao.DataSource = rs1;
                lvDangGiao.DataBind();
            }
            else
            {
                lbEmpty4.Visible = true;
            }

        }
        // Load hình của từng hóa đơn
        protected void lvDangGiao_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                HiddenField hdfRcptBuyId = (HiddenField)e.Item.FindControl("hdfRcptBuyId");
                int RcptBuyId = Int32.Parse(hdfRcptBuyId.Value);
                ListView lvDangGiaoDet = (ListView)e.Item.FindControl("lvDangGiaoDet");
                lvDangGiaoDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg().Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvDangGiaoDet.DataBind();

            }
        }
        // btn CHI TIẾT
        protected void lvDangGiao_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                int RcptBuyId = Int32.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                         where r.RcptId == RcptBuyId
                         select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                LinkButton lbtnChiTiet = (LinkButton)e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp.ToString() + "&Sta=1");
            }
        }


        /// <summary>  
        ///  TAB ĐÃ HỦY
        /// </summary>  
        // Load Bảng hóa đơn trong
        int staTemp = 0;
        private void BindlvDaHuy(int CusId)
        {
            var rs = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Rcpt(CusId);
            var rs1 = from r in rs
                      join s in MyLibrary.RcptBuyStaDet_BUS.GetAll() on r.RcptBuyId equals s.RcptBuyId
                      where s.StepId == 9 || s.StepId==10
                      select r;
            staTemp = (from r in rs
                      join s in MyLibrary.RcptBuyStaDet_BUS.GetAll() on r.RcptBuyId equals s.RcptBuyId
                      where s.StepId == 9 || s.StepId == 10
                      select s.StepId).FirstOrDefault();
            if (rs1.Count() != 0)
            {
                lvDaHuy.DataSource = rs1;
                lvDaHuy.DataBind();
            }
            else
            {
                lbEmpty5.Visible = true;
            }

        }
        // Load hình của từng hóa đơn
        protected void lvDaHuy_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                HiddenField hdfRcptBuyId = (HiddenField)e.Item.FindControl("hdfRcptBuyId");
                int RcptBuyId = Int32.Parse(hdfRcptBuyId.Value);
                ListView lvDaHuyDet = (ListView)e.Item.FindControl("lvDaHuyDet");
                lvDaHuyDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg().Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvDaHuyDet.DataBind();

            }
        }
        // btn CHI TIẾT
        protected void lvDaHuy_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                int RcptBuyId = Int32.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                         where r.RcptId == RcptBuyId
                         select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                LinkButton lbtnChiTiet = (LinkButton)e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp.ToString() + "&Sta=" + staTemp.ToString());
            }
        }
    }
}