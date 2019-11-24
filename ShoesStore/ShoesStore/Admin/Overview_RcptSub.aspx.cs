using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace ShoesStore.Admin
{
    public partial class Overview_RcptSub : Page
    {
        protected void ddlShpName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlShpName.SelectedValue == "All")
            {
                LoadLv();
                return;
            }

            var val = int.Parse(ddlShpName.SelectedValue);
            LoadLv(val);
            name.Visible = true;
            date.Visible = false;
        }

        protected void lbtn_Click(object sender, EventArgs e)
        {
            if (ddlShpName.SelectedValue == "All") MyLibrary.Show("Chưa chọn cửa hàng");
            if (ddlYear.SelectedValue == "0") MyLibrary.Show("Chưa chọn năm");
            var ShpId = int.Parse(ddlShpName.SelectedValue);
            var month = ddlMonth.SelectedValue;
            var year = ddlYear.SelectedValue;
            LoadLvDate(ShpId);
            name.Visible = false;
            date.Visible = true;
        }

        public void LoadDdlMonth()
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Select(x => x.Rcpt.DateAdd.Month.ToString()).Distinct().ToList();
            ddlMonth.DataSource = rs;
            ddlMonth.DataBind();
            var item = ddlMonth.Items.FindByValue("All");
            if (item == null) ddlMonth.Items.Insert(0, new ListItem("--Chọn tháng--", "0"));
            ;
            ddlMonth.SelectedIndex = 0;
        }

        public void LoadDdlYear()
        {
            var rs = MyLibrary.Shp_Bus.GetAll().Select(x => x.DateStart.Year).Distinct().ToList();
            ddlYear.DataSource = rs;
            ddlYear.DataBind();
            var item = ddlYear.Items.FindByValue("All");
            if (item == null) ddlYear.Items.Insert(0, new ListItem("--Chọn năm--", "0"));
            ddlYear.SelectedIndex = 0;
        }

        public void LoadLv()
        {
            var result = MyLibrary.Shp_Bus.GetAll().ToList();
            lvMerProfit.DataSource = result;
            lvMerProfit.DataBind();
            name.Visible = true;
            date.Visible = false;
        }

        public void LoadLv(int ShpId)
        {
            var result = MyLibrary.Shp_Bus.GetAll().Where(x => x.ShpId == ShpId).ToList();
            lvMerProfit.DataSource = result;
            lvMerProfit.DataBind();
        }

        public void LoadLvDate(int ShpId)
        {
            var result = MyLibrary.Shp_Bus.GetAll().Where(x => x.ShpId == ShpId).ToList();
            lvDate.DataSource = result;
            lvDate.DataBind();
        }

        public void LoadShpName()
        {
            var rs = MyLibrary.Shp_Bus.GetAll();
            ddlShpName.DataSource = rs.ToList();
            ddlShpName.DataTextField = "ShpName";
            ddlShpName.DataValueField = "ShpId";
            ddlShpName.DataBind();
            var item = ddlShpName.Items.FindByValue("All");
            if (item == null) ddlShpName.Items.Insert(0, new ListItem("--Tất cả--", "All"));
            ddlShpName.SelectedIndex = 0;
        }

        protected void lvMerProfit_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDdlMonth();
                LoadDdlYear();
                LoadShpName();
                LoadLv();
            }
        }

        public void lbtnExportExcel(object sender, EventArgs e)
        {
            FileHelper helper = new FileHelper();
            var rs = MyLibrary.Shp_Bus.GetAll().ToList();
            DataTable table = new DataTable();
            table.Columns.Add("Mã cửa hàng", typeof(string));
            table.Columns.Add("Tên cửa hàng", typeof(string));
            table.Columns.Add("Tổng thu", typeof(int));
            table.Columns.Add("Tổng chi", typeof(int));
            foreach (var item in rs)
            {
                table.Rows.Add(item.ShpId, item.ShpName, MyLibrary.SumIn(item), MyLibrary.SumOut(item));
            }
            table.AcceptChanges();
            //helper.ExportExcel(table, "Thống kê thu chi của Merchant");
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Thống kê thu chi của Merchant");
            for (int i = 1; i < table.Columns.Count + 1; i++)
            {
                workSheet.Cells[1, i].Style.Font.Bold = true;
                workSheet.Column(i).AutoFit();
            }
            // Create chart
            ExcelChart chart = workSheet.Drawings.AddChart("chart", eChartType.ColumnClustered); //To add chart to added sheet of type column clustered chart  
            chart.XAxis.Title.Text = "Tên cửa hàng"; //give label to x-axis of chart  
            chart.XAxis.Title.Font.Size = 10;
            chart.YAxis.Title.Text = "đồng"; //give label to Y-axis of chart  
            chart.YAxis.Title.Font.Size = 10;
            chart.SetSize(1200, 300);
            chart.SetPosition(1, 0, 6, 0);
            chart.YAxis.MinValue = 39;
            var row = 1;
            var tongThu = chart.Series.Add(("C" + (row + 1) + ":" + "C" + (table.Rows.Count + 1)), ("B" + (row + 1) + ":" + "B" + (table.Rows.Count + 1)));
            tongThu.Header = "Tổng thu";
            var tongChi = chart.Series.Add(("D" + (row + 1) + ":" + "D" + (table.Rows.Count + 1)), ("B" + (row + 1) + ":" + "B" + (table.Rows.Count + 1)));
            tongChi.Header = "Tổng chi";

            workSheet.Cells[1, 1].LoadFromDataTable(table, true);
            //


            HttpResponse response = HttpContext.Current.Response;
            using (var memoryStream = new MemoryStream())
            {
                response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                response.AddHeader("content-disposition", "attachment;  filename=Thống kê thu chi của Merchant.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(response.OutputStream);
                response.Flush();
                response.End();
                excel.Dispose(); //will dispose the package  
            }
        }
    }
}   