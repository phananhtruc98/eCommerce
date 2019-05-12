using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.MyExtensions;
namespace ShoesStore.Admin
{
    public partial class Overview_Profit_W : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDdlMonth(); LoadDdlYear();

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
            ddlMonth.Items.Insert(0, new ListItem("--Chọn tháng--", String.Empty));
            ddlMonth.DataBind();
            ddlMonth.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlMonth.SelectedIndex = 0;
        }

        public void LoadDdlYear()
        {
            var rs = MyLibrary.Shp_Bus.GetAll().Select(x => x.DateStart.Year).Distinct().ToList();
            ddlYear.DataSource = rs;
            ddlYear.DataBind();
        }

        public void Calculate()
        {
            result.Visible = true;
            string month = ddlMonth.SelectedValue;
            string year = ddlYear.SelectedValue;
            lbYearSelected.Text = year;
            if (month==String.Empty)
            {
                lbMonthSelected.Text = "";
                dontneed.Visible = false;
                lblRcptSubCount.Text = QtyRcptSub(Int32.Parse(year)).ToString();
                lblSumPrice.Text = SumPrice(Int32.Parse(year));
            }
            else
            {
                lbMonthSelected.Text = month;
                dontneed.Visible = true;
                lblRcptSubCount.Text = QtyRcptSub(Int32.Parse(month), Int32.Parse(year)).ToString();
                lblSumPrice.Text = SumPrice(Int32.Parse(month), Int32.Parse(year));
            }
        }

        public int QtyRcptSub(int month, int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Where(x => (x.Rcpt.DateAdd.Month == month) && (x.Rcpt.DateAdd.Year == year)).ToList();
            return rs.Count;
        }
        public int QtyRcptSub(int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.Rcpt.DateAdd.Year == year).ToList();
            return rs.Count;
        }

        public string SumPrice(int month, int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Where(x => (x.Rcpt.DateAdd.Month == month) && (x.Rcpt.DateAdd.Year == year)).ToList();
            double sum = 0;
            foreach(RcptSub item in rs)
            {
                double sumRcpt = 0;
                List<RcptSubDet> subDets = MyLibrary.RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == item.RcptSubId).ToList();
                foreach (RcptSubDet itemdet in subDets)
                {
                    sumRcpt = sumRcpt + (double.Parse(itemdet.Quantity.ToString()) * double.Parse(itemdet.Sub.Price));
                }
                sum = sum + sumRcpt;
            }
            return sum.ToFormatMoney();
        }

        public string SumPrice(int year)
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.Rcpt.DateAdd.Year == year).ToList();
            double sum = 0;
            foreach (RcptSub item in rs)
            {
                double sumRcpt = 0;
                List<RcptSubDet> subDets = MyLibrary.RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == item.RcptSubId).ToList();
                foreach (RcptSubDet itemdet in subDets)
                {
                    sumRcpt = sumRcpt + (double.Parse(itemdet.Quantity.ToString()) * double.Parse(itemdet.Sub.Price));
                }
                sum = sum + sumRcpt;
            }
            return sum.ToFormatMoney();
        }
    }
}