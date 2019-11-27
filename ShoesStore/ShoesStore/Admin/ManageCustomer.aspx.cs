using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Admin
{
    public partial class Manage_Customer : Page
    {
        private readonly Cus_BUS cus_BUS = new Cus_BUS();

// Load bảng cus
        private void BindDataGridView()
        {
            lvCus.DataSource = MyLibrary.Cus_BUS.GetAll();
            lvCus.DataBind();
        }

// btn Tìm kiếm
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }
        protected void lvCus_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Detail")
            {
                var UsrId = int.Parse(e.CommandArgument.ToString());
                Response.Redirect("/Admin/Usr_Det.aspx?UsrId=" + UsrId);
            }
        }

        protected void lvCus_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindDataGridView();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindDataGridView();
        }

// Tìm kiếm
        public void TimKiem(string search_key)
        {
            var rs = (from a in MyLibrary.Cus_BUS.GetAll().ToList()
                where a.CusId.ToString().ContainsEx(search_key)
                      || a.Usr.UsrName.ContainsEx(search_key)
                      || a.Usr.DateAdd != null && a.Usr.DateAdd.ToString().ContainsEx(search_key)
                select a).ToList();
            lvCus.DataSource = rs;
            lvCus.DataBind();
        }
    }
}