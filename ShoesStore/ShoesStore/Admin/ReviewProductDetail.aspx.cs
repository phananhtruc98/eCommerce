using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class ReviewProductDetail : System.Web.UI.Page
    {
        int ProId = 0;
        int ShpId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            ProId = int.Parse(Request.QueryString["ProId"]);
            ShpId = int.Parse(Request.QueryString["ShpId"]);
            if (!IsPostBack)
            {
                LoadProduct();
            }
        }

        public void LoadProduct()
        {
            var rs = MyLibrary.Pro_BUS.GetAll().FirstOrDefault(x => x.ProId == ProId && x.ShpId == ShpId);
            lbProName.Text = rs.ProName;
            lbShpName.Text = rs.Shp.ShpName;
            lbCatName.Text = rs.ProCat.CatName;
            lbBrandName.Text = rs.ProBrand.BrandName;
            lbDescShort.Text = rs.DescShort;
            lbDesc.Text = Server.HtmlDecode(rs.Desc);
            imgPrimary.Attributes["src"] = MyLibrary.ProImgPath(rs);
            lbPrice.Text = rs.Price;
            LoadLvImgSlides();
            LoadlvSizeColorQty();
        }

        public void LoadLvImgSlides()
        {
            var rs = MyLibrary.ProSlide_BUS.GetAll().Where(x => x.ProId == ProId && x.ShpId == ShpId);
            lvImgSlide.DataSource = rs.ToList();
            lvImgSlide.DataBind();
        }

        public void LoadlvSizeColorQty()
        {
            var rs = MyLibrary.ProDet_BUS.GetAll().Where(x => x.ProId == ProId && x.ShpId == ShpId);
            lvSizeColorQty.DataSource = rs.ToList();
            lvSizeColorQty.DataBind();
        }
    }
}