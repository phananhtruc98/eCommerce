using ShoesStore.BusinessLogicLayer;
using System;
using System.Web.UI;
using System.Linq;

namespace ShoesStore.Admin
{
    public partial class ManageProduct : Page
    {
        private readonly ProColor_BUS proColor_BUS = new ProColor_BUS();
        private readonly ProBrand_BUS proBrand_BUS = new ProBrand_BUS();
        private readonly ProSize_BUS proSize_BUS = new ProSize_BUS();
        private readonly ProCat_BUS proCat_BUS = new ProCat_BUS();
        private readonly Pro_BUS pro_BUS = new Pro_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataGridViewColor();
            BindDataGridViewBrand();
            BindDataGridViewSize();
            BindDataGridViewCat();
        }

        private void BindDataGridViewColor()
        {
            gvProColor.DataSource = proColor_BUS.GetAll();
            gvProColor.DataBind();
        }
        private void BindDataGridViewBrand()
        {
            gvBrand.DataSource = proBrand_BUS.GetAll();
            gvBrand.DataBind();
        }

        private void BindDataGridViewSize()
        {
            gvProSize.DataSource = proSize_BUS.GetAll();
            gvProSize.DataBind();
        }
        private void BindDataGridViewCat()
        {
            gvProCat.DataSource = proCat_BUS.GetAll();
            gvProCat.DataBind();
        }

        private void BindDataGridViewPro()
        {
            //var  result = from p in pro_BUS.GetAll()
            //              join c in proCat_BUS.GetAll() on p.CatId equals c.CatId
            //              join b in proBrand_BUS.GetAll() on p.BrandId equals b.BrandId
            //              select new
            //              {
                              
            //              }
            ////gvPro.DataSource = result;
            //gvPro.DataBind();
        }
    }
}