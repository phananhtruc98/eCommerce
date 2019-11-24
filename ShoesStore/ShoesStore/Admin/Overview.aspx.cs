using OfficeOpenXml;
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
namespace ShoesStore.Admin
{
    public partial class Overview : Page
    {
        protected void lbtn_Click(object sender, EventArgs e)
        {
            if (ddlMonth.Text == "" && ddlYear.Text == "")
            {
                MyLibrary.Show("Chưa chọn tháng, năm");
                return;
            }

            if (ddlMonth.Text == "" && ddlYear.Text != "")
            {
                lvShp.Visible = true;
                lvShp2.Visible = false;
                LoadShp();
            }
            else if (ddlMonth.Text != "" && ddlYear.Text != "")
            {
                LoadLvShp2(int.Parse(ddlMonth.SelectedValue), int.Parse(ddlYear.SelectedValue));
            }
        }

        public void lbtnExportExcel(object sender, EventArgs e)
        {
            FileHelper helper = new FileHelper();
            var rs = MyLibrary.Shp_Bus.GetAll().ToList();
            DataTable table = new DataTable();
            table.Columns.Add("Mã CH");
            table.Columns.Add("Tên CH");
            table.Columns.Add("Ngày bắt đầu");
            table.Columns.Add("Hóa đơn thành công");
            table.Columns.Add("Tình trạng");
            foreach (var item in rs)
            {
                table.Rows.Add(item.ShpId,item.ShpName,item.DateStart, MyLibrary.Shp_Bus.CountRcptBuySuccess(item, int.Parse(ddlYear.SelectedValue)), MyLibrary.AlertShp(item, int.Parse(ddlYear.SelectedValue)).Contains("Nguy hiểm")?"Nguy hiểm":"Bình thường");
            }
            table.AcceptChanges();
            helper.ExportExcel(table, "Thống kê Hoá đơn bán sản phẩm");
        }
        public void LoadDdlMonth()
        {
            var rs = MyLibrary.RcptBuy_BUS.GetAll().Select(x => x.Rcpt.DateAdd.Month.ToString().PadLeft(2, '0'))
                .Distinct().ToList();
            ddlMonth.DataSource = rs;
            ddlMonth.DataBind();
            ddlMonth.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            ddlMonth.SelectedIndex = 0;
        }

        public void LoadDdlYear()
        {
            var rs = MyLibrary.Shp_Bus.GetAll().Select(x => x.DateStart.Year).Distinct().ToList();
            ddlYear.DataSource = rs;
            ddlYear.DataBind();
        }

        public void LoadLvShp2(int month, int year)
        {
            var rs = MyLibrary.Shp_Bus.GetAll().ToList().Where(x => x.RcptBuy.Any(m => m.Rcpt.DateAdd.Month == month && m.Rcpt.DateAdd.Year == year));
            lvShp.DataSource = rs;
            lvShp.DataBind();
        }

        public void LoadShp()
        {
            lvShp2.Visible = false;
            var rs = MyLibrary.Shp_Bus.GetAll().ToList();
            lvShp.DataSource = rs;
            lvShp.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDdlMonth();
                LoadDdlYear();
                LoadShp();
            }
        }
    }
}