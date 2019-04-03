using ShoesStore.BusinessLogicLayer;
using System;
using System.Web.UI;

namespace ShoesStore.Admin
{
    public partial class Manage_Customer : Page
    {
        private readonly Cus_BUS cus_BUS = new Cus_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindDataGridView();
            }
        }

        private void BindDataGridView()
        {
            gvCustomer.DataSource = cus_BUS.Get_Cus_Info();
            gvCustomer.DataBind();
        }
    }
}