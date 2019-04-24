using System;
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