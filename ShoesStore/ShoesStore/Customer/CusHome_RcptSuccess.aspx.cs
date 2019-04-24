using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class CusHome_RcptSuccess : Page
    {
        private readonly Pro_BUS pro = new Pro_BUS();
        private readonly Rcpt_BUS rcpt = new Rcpt_BUS();
        private readonly RcptBuy_BUS rcptBuy = new RcptBuy_BUS();
        private readonly RcptBuyDet_BUS rcptBuyDet = new RcptBuyDet_BUS();
        private readonly Shp_BUS shp = new Shp_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        private string dateadd = "";
        private int rcptTemp;

        /// <summary>
        ///     TAB ĐÃ HỦY
        /// </summary>
// Load Bảng hóa đơn trong
        private int staTemp;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var usr = (Usr) WebSession.LoginUsr;
                var usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
                BindlvDaGiao(usr1.UsrId);
                BindlvChoThanhToan(usr1.UsrId);
                BindlvChoLayHang(usr1.UsrId);
                BindlvDangGiao(usr1.UsrId);
                BindlvDaHuy(usr1.UsrId);
            }
        }

        /// <summary>
        ///     TAB ĐÃ GIAO
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
            else
            {
                lbEmpty2.Visible = true;
            }
        }

// Load hình của từng hóa đơn
        protected void lvRcptBuy_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var hdfRcptBuyId = (HiddenField) e.Item.FindControl("hdfRcptBuyId");
                var RcptBuyId = int.Parse(hdfRcptBuyId.Value);
                var lvRcptBuyDet = (ListView) e.Item.FindControl("lvRcptBuyDet");
                lvRcptBuyDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg()
                    .Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvRcptBuyDet.DataBind();
            }
        }

// btn CHI TIẾT
        protected void lvRcptBuy_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                var RcptBuyId = int.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                    where r.RcptId == RcptBuyId
                    select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                var lbtnChiTiet = (LinkButton) e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp + "&Sta=7");
            }
        }

        /// <summary>
        ///     TAB CHỜ THANH TOÁN
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
            else
            {
                lbEmpty.Visible = true;
            }
        }

// Load hình của từng hóa đơn
        protected void lvChoThanhToan_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var hdfRcptBuyId = (HiddenField) e.Item.FindControl("hdfRcptBuyId");
                var RcptBuyId = int.Parse(hdfRcptBuyId.Value);
                var lvChoThanhToanDet = (ListView) e.Item.FindControl("lvChoThanhToanDet");
                lvChoThanhToanDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg()
                    .Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvChoThanhToanDet.DataBind();
            }
        }

// btn CHI TIẾT
        protected void lvChoThanhToan_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                var RcptBuyId = int.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                    where r.RcptId == RcptBuyId
                    select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                var lbtnChiTiet = (LinkButton) e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp + "&Sta=1");
            }
        }

        /// <summary>
        ///     TAB CHỜ LẤY HÀNG
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
                var hdfRcptBuyId = (HiddenField) e.Item.FindControl("hdfRcptBuyId");
                var RcptBuyId = int.Parse(hdfRcptBuyId.Value);
                var lvChoLayHangDet = (ListView) e.Item.FindControl("lvChoLayHangDet");
                lvChoLayHangDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg()
                    .Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvChoLayHangDet.DataBind();
            }
        }

// btn CHI TIẾT
        protected void lvChoLayHang_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                var RcptBuyId = int.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                    where r.RcptId == RcptBuyId
                    select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                var lbtnChiTiet = (LinkButton) e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp + "&Sta=3");
            }
        }

        /// <summary>
        ///     TAB CHỜ LẤY HÀNG
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
                var hdfRcptBuyId = (HiddenField) e.Item.FindControl("hdfRcptBuyId");
                var RcptBuyId = int.Parse(hdfRcptBuyId.Value);
                var lvDangGiaoDet = (ListView) e.Item.FindControl("lvDangGiaoDet");
                lvDangGiaoDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg()
                    .Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvDangGiaoDet.DataBind();
            }
        }

// btn CHI TIẾT
        protected void lvDangGiao_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                var RcptBuyId = int.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                    where r.RcptId == RcptBuyId
                    select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                var lbtnChiTiet = (LinkButton) e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp + "&Sta=1");
            }
        }

        private void BindlvDaHuy(int CusId)
        {
            var rs = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Rcpt(CusId);
            var rs1 = from r in rs
                join s in MyLibrary.RcptBuyStaDet_BUS.GetAll() on r.RcptBuyId equals s.RcptBuyId
                where s.StepId == 9 || s.StepId == 10
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
                var hdfRcptBuyId = (HiddenField) e.Item.FindControl("hdfRcptBuyId");
                var RcptBuyId = int.Parse(hdfRcptBuyId.Value);
                var lvDaHuyDet = (ListView) e.Item.FindControl("lvDaHuyDet");
                lvDaHuyDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg()
                    .Where(m => m.RcptBuyId + "" == hdfRcptBuyId.Value);
                lvDaHuyDet.DataBind();
            }
        }

// btn CHI TIẾT
        protected void lvDaHuy_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                var RcptBuyId = int.Parse(e.CommandArgument.ToString());
                var d = (from r in rcpt.GetAll()
                    where r.RcptId == RcptBuyId
                    select r.DateAdd).Single();
                dateadd = d.ToString();
                rcptTemp = RcptBuyId;
                var lbtnChiTiet = (LinkButton) e.Item.FindControl("lbtnChiTiet");
                Server.Transfer("~/Customer/CusHome_Rcpt_Det.aspx?RcptBuyId=" + rcptTemp + "&Sta=" + staTemp);
            }
        }
    }
}