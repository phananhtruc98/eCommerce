using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Manage_Services : System.Web.UI.Page
    {
        Sub_BUS sub_BUS = new Sub_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridViewData();
            }
        }

        private void BindGridViewData()
        {
            GridView1.DataSource = sub_BUS.GetAll();
            GridView1.DataBind();
        }
    }
}