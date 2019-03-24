using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore
{
    public partial class SiteMaster : MasterPage
    {
        IProCat_BUS proCat;
        IProBrand proBrand;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
            }
        }

     
        protected void rptProCat_Init(object sender, EventArgs e)
        {
            proCat = new ProCat_BUS();
            rptProCat.DataSource = proCat.GetAll().ToList();
            rptProCat.DataBind();
        }

        protected void rptProBrand_Init(object sender, EventArgs e)
        {
            proBrand = new ProBrand_BUS();
            rptProBrand.DataSource = proBrand.GetAll().ToList();
            rptProBrand.DataBind();
        }
    }
}