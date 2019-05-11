using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Admin
{
    public partial class Manage_User : Page
    {
        private readonly Mer_BUS mer_BUS = new Mer_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGridViewData();
        }

        // Load bảng mer
        private void BindGridViewData()
        {
            lvMer.DataSource = mer_BUS.GetAll();
            lvMer.DataBind();
        }

        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvMerchant_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        // Tìm kiếm
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in mer_BUS.Get_Mer_Info().ToList()
                      where a.UsrId.ToString().ContainsEx(search_key)
                            || a.UsrName.ContainsEx(search_key)
                            || a.Login.ContainsEx(search_key)
                            || a.Password.ContainsEx(search_key)
                            || a.Phone.ContainsEx(search_key)
                            || a.DateAdd != null && a.DateAdd.ToString().ContainsEx(search_key)
                            || a.DateAdd != null && a.DateEdit.ToString().ContainsEx(search_key)
                            || a.Address.ContainsEx(search_key)
                      select a).ToList();
            gvMerchant.DataSource = rs;
            gvMerchant.DataBind();
        }

        //Phân trang
        protected void gvMerchant_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMerchant.PageIndex = e.NewPageIndex;
            BindGridViewData();
        }

        protected void lvMer_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {

            }
            else if (e.CommandName == "Detail")
            {
                int UsrId = Int32.Parse(e.CommandArgument.ToString());
                Server.Transfer("/Admin/Usr_Det.aspx?UsrId=" + UsrId);
            }
        }
    }
}