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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindDataGridView();
        }

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

// Tìm kiếm
        public void TimKiem(string search_key)
        {
            var rs = (from a in cus_BUS.Get_Cus_Info().ToList()
                where a.UsrId.ToString().ContainsEx(search_key)
                      || a.UsrName.ContainsEx(search_key)
                      || a.Login.ContainsEx(search_key)
                      || a.Password.ContainsEx(search_key)
                      || a.Phone.ContainsEx(search_key)
                      || a.DateAdd != null && a.DateAdd.ToString().ContainsEx(search_key)
                      || a.DateAdd != null && a.DateEdit.ToString().ContainsEx(search_key)
                      || a.Address.ContainsEx(search_key)
                select a).ToList();
            lvCus.DataSource = rs;
            lvCus.DataBind();
        }

        //protected void gvCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    lvCus.PageIndex = e.NewPageIndex;
        //    BindDataGridView();
        //}

        protected void lvCus_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName== "Detail")
            {
                int UsrId = Int32.Parse(e.CommandArgument.ToString());
                Server.Transfer("/Admin/Usr_Det.aspx?UsrId=" + UsrId);
            }
        }

        protected void lvCus_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindDataGridView();
        }
    }
}