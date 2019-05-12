using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Overview_RcptSub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDdlMonth(); LoadDdlYear();
                LoadShpName();
                LoadLv();
            }
        }

        public void LoadDdlMonth()
        {
            var rs = MyLibrary.RcptSub_BUS.GetAll().Select(x => x.Rcpt.DateAdd.Month.ToString()).Distinct().ToList();
            ddlMonth.DataSource = rs;
            ddlMonth.DataBind();
            ListItem item = ddlMonth.Items.FindByValue("All");
            if (item == null)
            {
                ddlMonth.Items.Insert(0, new ListItem("--Chọn tháng--", "0"));
            }
            ;
            ddlMonth.SelectedIndex = 0;
        }

        public void LoadDdlYear()
        {
            var rs = MyLibrary.Shp_Bus.GetAll().Select(x => x.DateStart.Year).Distinct().ToList();
            ddlYear.DataSource = rs;
            ddlYear.DataBind();
            ListItem item = ddlYear.Items.FindByValue("All");
            if (item == null)
            {
                ddlYear.Items.Insert(0, new ListItem("--Chọn năm--", "0"));
            }
            ddlYear.SelectedIndex = 0;
        }
        public void LoadShpName()
        {
            var rs = MyLibrary.Shp_Bus.GetAll();
            ddlShpName.DataSource = rs.ToList();
            ddlShpName.DataTextField = "ShpName";
            ddlShpName.DataValueField = "ShpId";
            ddlShpName.DataBind();
            ListItem item = ddlShpName.Items.FindByValue("All");
            if (item == null)
            {
                ddlShpName.Items.Insert(0, new ListItem("--Tất cả--", "All"));
            }
            ddlShpName.SelectedIndex = 0;
        }

        protected void lbtn_Click(object sender, EventArgs e)
        {
            if (ddlShpName.SelectedValue == "All") MyLibrary.Show("Chưa chọn cửa hàng");
            if (ddlYear.SelectedValue == "0") MyLibrary.Show("Chưa chọn năm");
            int ShpId = Int32.Parse(ddlShpName.SelectedValue);
            string month = ddlMonth.SelectedValue;
            string year = ddlYear.SelectedValue;
            LoadLvDate(ShpId);
            name.Visible = false;
            date.Visible = true;
        }

        public void LoadLv()
        {
            var result = MyLibrary.Shp_Bus.GetAll().ToList();
            lvMerProfit.DataSource = result;
            lvMerProfit.DataBind();
            name.Visible = true; date.Visible = false;
        }
        public void LoadLv(int ShpId)
        {
            var result = MyLibrary.Shp_Bus.GetAll().Where(x => x.ShpId == ShpId).ToList();
            lvMerProfit.DataSource = result;
            lvMerProfit.DataBind();
        }
        public void LoadLvDate(int ShpId)
        {
            var result = MyLibrary.Shp_Bus.GetAll().Where(x=>x.ShpId== ShpId).ToList();
            lvDate.DataSource = result;
            lvDate.DataBind();
        }
        protected void lvMerProfit_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

        }

        protected void ddlShpName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlShpName.SelectedValue == "All") { LoadLv(); return; }
            int val = Int32.Parse(ddlShpName.SelectedValue);
            LoadLv(val);
            name.Visible = true;date.Visible = false;
        }
    }
}