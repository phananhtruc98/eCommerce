using System;
using System.Web.UI;

namespace ShoesStore
{
    public partial class Default : Page
    {
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                return 0;
            }
            set => ViewState["PageNumber"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void rptProCat_Init(object sender, EventArgs e)
        {
//rptProCat.DataSource = MyLibrary._proCat.GetAll();
//rptProCat.DataBind();
        }

        protected void rptSlides_Init(object sender, EventArgs e)
        {
            rptSlides.DataSource = MyLibrary.WebSlide_BUS.GetAll();
            rptSlides.DataBind();
        }

        protected void rptPopularCategories_Init(object sender, EventArgs e)
        {
            rptPopularCategories.DataSource = MyLibrary.ProCat_BUS.GetAll();
            rptPopularCategories.DataBind();
        }

        protected void brandLogos_Init(object sender, EventArgs e)
        {
            rptBrandLogos.DataSource = MyLibrary.ProBrand_BUS.GetAll();
            rptBrandLogos.DataBind();
        }
    }
}