using System;
using System.Web.UI;

namespace ShoesStore
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void rptProCat_Init(object sender, EventArgs e)
        {

            rptProCat.DataSource = Master._proCat.GetAll();
            rptProCat.DataBind();
        }

        protected void featuredProducts_Init(object sender, EventArgs e)
        {
            featuredProducts.DataSource = Master._proCat.GetAll();
            featuredProducts.DataBind();
        }
    }
}