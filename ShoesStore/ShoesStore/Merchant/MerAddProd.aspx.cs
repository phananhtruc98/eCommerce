using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;

using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class MerAddProd : Page
    {
        private readonly Pro_BUS pro = new Pro_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListCat.DataSource = MyLibrary.ProCat_BUS.GetAll();
            DropDownListCat.DataTextField = "CatName";
            DropDownListCat.DataValueField = "CatId";
            DropDownListCat.DataBind();
            //
            DropDownListBrand.DataSource = MyLibrary.ProBrand_BUS.GetAll();
            DropDownListBrand.DataTextField = "BrandName";
            DropDownListBrand.DataValueField = "BrandId";
            DropDownListBrand.DataBind();
        }
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            int catId = int.Parse(DropDownListCat.SelectedItem.Text) ;
            int brandId = int.Parse(DropDownListBrand.SelectedItem.Text);
            int proQuantity = int.Parse(((TextBox)pnlThem.FindControl("intputProQuantity")).Text);
            string proName = ((TextBox)pnlThem.FindControl("inputProName")).Text;
            //img
            string desc = ((TextBox)pnlThem.FindControl("inputDesc")).Text;
            string descShort = ((TextBox)pnlThem.FindControl("inputDescShort")).Text;
            string price = ((TextBox)pnlThem.FindControl("inputPrice")).Text;
            //
            var pro1 = new Pro
            {
                CatId = catId,
                BrandId = brandId,
                ProQuantity = proQuantity,
                ProName = proName,
                Desc = desc,
                DescShort = descShort,
                Price= price

                //DateAdd = DateTime.Now,
                //DateEdit = null,
                //UsrAdd = int.Parse(usrAdd),
                //UsrEdit = null
            };
            pro.Insert(pro1);


        }




    }
}