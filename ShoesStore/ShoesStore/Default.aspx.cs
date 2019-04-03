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

            rptProCat.DataSource =Master._proCat.GetAll();
            rptProCat.DataBind();
        }
    }
}