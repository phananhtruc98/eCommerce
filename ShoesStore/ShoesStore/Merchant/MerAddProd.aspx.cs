using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;

using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class MerAddProd : Page
    {
        private readonly Pro_BUS pro = new Pro_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDdlProCat();
            LoadDdlProBrand();
            LoadDdlProColor();
            LoadDdlProSize();
        }

        public void LoadDdlProCat()
        {
            DropDownListCat.DataSource = MyLibrary.ProCat_BUS.GetAll();
            DropDownListCat.DataTextField = "CatName";
            DropDownListCat.DataValueField = "CatId";
            DropDownListCat.DataBind();
        }

        public void LoadDdlProBrand()
        {
            DropDownListBrand.DataSource = MyLibrary.ProBrand_BUS.GetAll();
            DropDownListBrand.DataTextField = "BrandName";
            DropDownListBrand.DataValueField = "BrandId";
            DropDownListBrand.DataBind();
        }


        public void LoadDdlProColor()
        {
            ddlColor.DataSource = MyLibrary.ProColor_BUS.GetAll();
            ddlColor.DataTextField = "ColorName";
            ddlColor.DataValueField = "ColorId";
            ddlColor.DataBind();
        }

        public void LoadDdlProSize()
        {
            ddlSize.DataSource = MyLibrary.ProSize_BUS.GetAll();
            ddlSize.DataTextField = "SizeName";
            ddlSize.DataValueField = "SizeId";
            ddlSize.DataBind();
        }
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            int ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == usr1.UsrId).Select(x => x.ShpId).FirstOrDefault();
            int catId = Int32.Parse(DropDownListCat.SelectedValue.ToString());
            int brandId = int.Parse(DropDownListBrand.SelectedValue.ToString());
            int proQuantity = int.Parse(((TextBox)pnlThem.FindControl("intputProQuantity")).Text);
            string proName = ((TextBox)pnlThem.FindControl("inputProName")).Text;
            string desc = ((TextBox)pnlThem.FindControl("editor1")).Text;
            string descShort = ((TextBox)pnlThem.FindControl("inputDescShort")).Text;
            string price = ((TextBox)pnlThem.FindControl("inputPrice")).Text;
            string Img = "";
            if (fulImgChinh.HasFile)
            {
                Img = fulImgChinh.FileName;
            }
            var pro1 = new Pro
            {
                ShpId = ShpId,
                CatId = catId,
                BrandId = brandId,
                ProQuantity = proQuantity,
                ProName = proName,
                Desc = desc,
                DescShort = descShort,
                Price = price,
                DateAdd = DateTime.Now,
                DateEdit = null,
                IsOutOfStock = true,
                Active = false,
                PriceAfter = null,
                Img = Img
            };
            pro.Insert(pro1);


        }

        protected void lbtnInsertColor_Click(object sender, EventArgs e)
        {
            string ColorName = ((TextBox)pnlThem.FindControl("txtInsertColor")).Text;
            //string ColorImg = fileNewColor.FileName;
            ProColor newColor = new ProColor
            {
                ColorName = ColorName
            };
            MyLibrary.ProColor_BUS.Insert(newColor);
            LoadDdlProColor();
            ((TextBox)pnlThem.FindControl("txtInsertColor")).Text = "";
        }
    }
}