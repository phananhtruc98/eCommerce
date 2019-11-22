using System;
using ShoesStore.MyExtensions;

namespace ShoesStore.UserControls
{
    public partial class UcProCarousel : UcPro
    {
        protected void featuredProducts_Init(object sender, EventArgs e)
        {
        }


        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                rptPro.DataSource = MyLibrary.Pro_BUS.GetAllActive().Shuffle(new Random());
                rptPro.DataBind();
            }
        }
    }
}