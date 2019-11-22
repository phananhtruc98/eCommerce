using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                lvShp.Visible = false;
                lvShp2.Visible = true;
                LoadLvShp2();
            }
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

        public void LoadLvShp2()
        {
            var rs = MyLibrary.Shp_Bus.GetAll().ToList();
            lvShp2.DataSource = rs;
            lvShp2.DataBind();
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