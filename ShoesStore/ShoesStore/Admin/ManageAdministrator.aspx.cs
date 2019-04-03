using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Manage_Administrator : System.Web.UI.Page
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