using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace ShoesStore
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                {
                    return Convert.ToInt32(ViewState["PageNumber"]);
                }
                else
                {
                    return 0;
                }
            }
            set { ViewState["PageNumber"] = value; }
        }
        protected void rptProCat_Init(object sender, EventArgs e)
        {

            //rptProCat.DataSource = MyLibrary._proCat.GetAll();
            //rptProCat.DataBind();
        }

        protected void featuredProducts_Init(object sender, EventArgs e)
        {
            featuredProducts.DataSource = MyLibrary.ProCat_BUS.GetAll();
            featuredProducts.DataBind();
        }

        protected void rptSlides_Init(object sender, EventArgs e)
        {
            rptSlides.DataSource = MyLibrary.WebSlide_BUS.GetAll();
            rptSlides.DataBind();
        }

        protected void rptFeatureProducts_Init(object sender, EventArgs e)
        {
            rptFeatureProducts.DataSource = MyLibrary.Pro_BUS.GetAll();
            rptFeatureProducts.DataBind();
        }

        protected void rptPopularCategories_Init(object sender, EventArgs e)
        {
            rptPopularCategories.DataSource = MyLibrary.ProCat_BUS.GetAll();
            rptPopularCategories.DataBind();

        }

        protected void rptBestSellers_Init(object sender, EventArgs e)
        {
            BindRepeater();
            //rptBestSellers.DataSource = MyLibrary._pro.GetAll();// se sua thanh getBestSeller
            //rptBestSellers.DataBind();
        }

        protected void brandLogos_Init(object sender, EventArgs e)
        {
            rptBrandLogos.DataSource = MyLibrary.ProBrand_BUS.GetAll();
            rptBrandLogos.DataBind();
        }
        private void BindRepeater()
        {
            //Do your database connection stuff and get your data
            // se sua thanh getBestSeller

            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = MyLibrary.Pro_BUS.GetAll();
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = 4;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPagingBestSellers.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPagingBestSellers.DataSource = pages;
                rptPagingBestSellers.DataBind();
            }
            else
            {
                rptPagingBestSellers.Visible = false;
            }

            //Finally, set the datasource of the repeater
            rptBestSellers.DataSource = pgitems;
            rptBestSellers.DataBind();
        }
        protected void rptPagingBestSellers_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            BindRepeater();
        }
    }
}