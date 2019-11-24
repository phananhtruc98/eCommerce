using System;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.MyExtensions;
using Utilities;
namespace ShoesStore.Admin
{
    public partial class Overview_Profit_W : Page
    {
        public void Calculate()
        {
            result.Visible = true;
            var month = ddlMonth.SelectedValue;
            var year = ddlYear.SelectedValue;
            lbYearSelected.Text = year;
            if (month == string.Empty)
            {
                lbMonthSelected.Text = "";
                dontneed.Visible = false;
                lblRcptSubCount.Text = QtyRcptSub(int.Parse(year)).ToString();
                lblSumPrice.Text = SumPrice(int.Parse(year));
            }
            else
            {
                lbMonthSelected.Text = month;
                dontneed.Visible = true;
                lblRcptSubCount.Text = QtyRcptSub(int.Parse(month), int.Parse(year)).ToString();
                lblSumPrice.Text = SumPrice(int.Parse(month), int.Parse(year));
            }
        }

        protected void lbtn_Click(object sender, EventArgs e)
        {
            Calculate();
        }

        public void LoadDdlMonth()
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Select(x => x.Rcpt.DateAdd.Month.ToString()).Distinct().ToList();
            ddlMonth.DataSource = rs;
            ddlMonth.Items.Insert(0, new ListItem("--Chọn tháng--", string.Empty));
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDdlMonth();
                LoadDdlYear();
            }
        }

        public int QtyRcptSub(int month, int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll()
                .Where(x => x.Rcpt.DateAdd.Month == month && x.Rcpt.DateAdd.Year == year).ToList();
            return rs.Count;
        }

        public int QtyRcptSub(int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.Rcpt.DateAdd.Year == year).ToList();
            return rs.Count;
        }

        public string SumPrice(int month, int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll()
                .Where(x => x.Rcpt.DateAdd.Month == month && x.Rcpt.DateAdd.Year == year).ToList();
            double sum = 0;
            foreach (var item in rs)
            {
                double sumRcpt = 0;
                var subDets = MyLibrary.RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == item.RcptSubId).ToList();
                foreach (var itemdet in subDets)
                    sumRcpt = sumRcpt + double.Parse(itemdet.Quantity.ToString()) * double.Parse(itemdet.Sub.Price);
                sum = sum + sumRcpt;
            }

            return sum.ToFormatMoney();
        }

        public string SumPrice(int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.Rcpt.DateAdd.Year == year).ToList();
            double sum = 0;
            foreach (var item in rs)
            {
                double sumRcpt = 0;
                var subDets = MyLibrary.RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == item.RcptSubId).ToList();
                foreach (var itemdet in subDets)
                    sumRcpt = sumRcpt + double.Parse(itemdet.Quantity.ToString()) * double.Parse(itemdet.Sub.Price);
                sum = sum + sumRcpt;
            }

            return sum.ToFormatMoney();
        }
        public void lbtnExportExcel(object sender, EventArgs e)
        {
            FileHelper helper = new FileHelper();
            DataTable table = new DataTable();
            table.Columns.Add("Tổng hoá đơn");
            table.Columns.Add("Tổng doanh thu");
            table.Rows.Add(lblRcptSubCount.Text, lblSumPrice.Text);
            table.AcceptChanges();
            helper.ExportExcel(table, "Thống kê lợi nhuận của Webmaster");
        }
    }
}