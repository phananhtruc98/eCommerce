using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Manage_User : System.Web.UI.Page
    {
        Mer_BUS mer_BUS = new Mer_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridViewData();
            }
        }

        private void BindGridViewData()
        {
           
            gvMerchant.DataSource = mer_BUS.Get_Mer_Info().ToList();
            gvMerchant.DataBind();
        }
        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }
    }
}