using ShoesStore.BusinessLogicLayer;
using System;
using System.Linq;
using System.Web.UI;

namespace ShoesStore.Admin
{
    public partial class Manage_Administrator : Page
    {
        private readonly Mstr_BUS mstr_BUS  = new Mstr_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataGridView();
            }
        }

        private void BindDataGridView()
        {
            gvAdmin.DataSource = mstr_BUS.Get_Admin_Info().ToList();
            gvAdmin.DataBind();
        }
    }
}