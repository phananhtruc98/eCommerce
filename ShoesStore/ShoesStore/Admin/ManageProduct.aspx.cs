using ShoesStore.BusinessLogicLayer;
using System;
using System.Web.UI;

namespace ShoesStore.Admin
{
    public partial class ManageProduct : Page
    {
        private readonly ProColor_BUS proColor_BUS = new ProColor_BUS();
        private readonly ProBrand_BUS proBrand_BUS = new ProBrand_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataGridView();
            BindDataGridViewBrand();
        }

        private void BindDataGridView()
        {
            gvProColor.DataSource = proColor_BUS.GetAll();
            gvProColor.DataBind();
        }
        private void BindDataGridViewBrand()
        {
            gvBrand.DataSource = proBrand_BUS.GetAll();
            gvBrand.DataBind();
        }
    }
}