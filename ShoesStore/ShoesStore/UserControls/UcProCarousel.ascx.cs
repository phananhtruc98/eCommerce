using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.UserControls
{
    public partial class UcProCarousel : UcPro
    {
        protected void featuredProducts_Init(object sender, EventArgs e)
        {
            featuredProducts.DataSource = MyLibrary.ProCat_BUS.GetAll();
            featuredProducts.DataBind();
        }
     
    }
}