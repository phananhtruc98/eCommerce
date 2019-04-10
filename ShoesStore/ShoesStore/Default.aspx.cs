using System;
using System.Runtime.InteropServices;
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

            //rptProCat.DataSource = Master._proCat.GetAll();
            //rptProCat.DataBind();
        }

        protected void featuredProducts_Init(object sender, EventArgs e)
        {
            featuredProducts.DataSource = Master._proCat.GetAll();
            featuredProducts.DataBind();
        }

        protected void rptSlides_Init(object sender, EventArgs e)
        {
            rptSlides.DataSource = Master._webSlide.GetAll();
            rptSlides.DataBind();
        }

        protected void rptFeatureProducts_Init(object sender, EventArgs e)
        {
            rptFeatureProducts.DataSource = Master._pro.GetAll();
            rptFeatureProducts.DataBind();
        }

        protected void rptPopularCategories_Init(object sender, EventArgs e)
        {
            rptPopularCategories.DataSource = Master._proCat.GetAll();
            rptPopularCategories.DataBind();

        }

        protected void rptBestSellers_Init(object sender, EventArgs e)
        {
            rptBestSellers.DataSource = Master._pro.GetAll();// se sua thanh getBestSeller
            rptBestSellers.DataBind();
        }

        protected void brandLogos_Init(object sender, EventArgs e)
        {
            rptBrandLogos.DataSource = Master._proBrand.GetAll();
            rptBrandLogos.DataBind();
        }
    }
}