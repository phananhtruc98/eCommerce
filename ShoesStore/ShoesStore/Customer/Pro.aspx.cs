using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Customer
{
    public partial class DS_SanPham : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void smp1_ItemCreated(object sender, System.Web.UI.WebControls.SiteMapNodeItemEventArgs e)
        {
            if (e.Item.ItemType == SiteMapNodeItemType.Root ||
                (e.Item.ItemType == SiteMapNodeItemType.PathSeparator && e.Item.ItemIndex == 1))
            {
                e.Item.Visible = false;
            }
        }
        protected void rptPro_Init(object sender, EventArgs e)
        {
            rptPro.DataSource = Master._pro.GetAll();// se sua thanh getBestSeller
            rptPro.DataBind();
        }
        protected void rptProCat_Init(object sender, EventArgs e)
        {
            rptProCat.DataSource = Master._proCat.GetAll();// se sua thanh getBestSeller
            rptProCat.DataBind();
        }
        protected void rptBrand_Init(object sender, EventArgs e)
        {
            rptBrand.DataSource = Master._proBrand.GetAll();// se sua thanh getBestSeller
            rptBrand.DataBind();
        }
    }
}