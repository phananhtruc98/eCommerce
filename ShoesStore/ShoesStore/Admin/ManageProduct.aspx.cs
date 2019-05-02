using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using Utilities;
using ShoesStore;
namespace ShoesStore.Admin
{
    public partial class ManageProduct : Page
    {
        private readonly Pro_BUS pro_BUS = new Pro_BUS();
        private readonly ProBrand_BUS proBrand_BUS = new ProBrand_BUS();
        private readonly ProCat_BUS proCat_BUS = new ProCat_BUS();
        private readonly ProColor_BUS proColor_BUS = new ProColor_BUS();
        private readonly ProSize_BUS proSize_BUS = new ProSize_BUS();
        private readonly Shp_BUS shp_BUS = new Shp_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataGridViewColor();
            BindDataGridViewBrand();
            BindDataGridViewSize();
            BindDataGridViewCat();
            BindDataGridViewPro();
        }

// Load Bảng Màu
        private void BindDataGridViewColor()
        {
            gvProColor.DataSource = proColor_BUS.GetAll();
            gvProColor.DataBind();
        }

// Load Bảng Thương hiệu
        private void BindDataGridViewBrand()
        {
            gvBrand.DataSource = proBrand_BUS.GetAll();
            gvBrand.DataBind();
        }

// Load Bảng Kích cỡ
        private void BindDataGridViewSize()
        {
            gvProSize.DataSource = proSize_BUS.GetAll();
            gvProSize.DataBind();
        }

// Load Bảng Loại sản phẩm
        private void BindDataGridViewCat()
        {
            gvProCat.DataSource = proCat_BUS.GetAll();
            gvProCat.DataBind();
        }

// Load Bảng Pro
        private void BindDataGridViewPro()
        {
            var result = (from p in pro_BUS.GetAll()
                join c in proCat_BUS.GetAll() on p.CatId equals c.CatId
                join b in proBrand_BUS.GetAll() on p.BrandId equals b.BrandId
                join s in shp_BUS.GetAll() on p.ShpId equals s.ShpId
                where p.Active == true
                select p).ToList();
            if (result.Count != 0)
            {
                gvPro.DataSource = result;
                gvPro.DataBind();
            }
            else lbEmpty.Visible = true;
            
        }

// Phân trang
        protected void gvPro_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPro.PageIndex = e.NewPageIndex;
            BindDataGridViewPro();
        }
    }
}