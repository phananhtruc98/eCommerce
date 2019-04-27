using System;

using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class MerAddProd : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListCat.DataSource = MyLibrary.Pro_BUS.GetAll();
            DropDownListCat.DataTextField = "CatId";
            DropDownListCat.DataValueField = "CatId";
            DropDownListCat.DataBind();
            //
            DropDownListBrand.DataSource = MyLibrary.Pro_BUS.GetAll();
            DropDownListBrand.DataTextField = "BrandId";
            DropDownListBrand.DataValueField = "BrandId";
            DropDownListBrand.DataBind();
        }
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            //var CatId = DropDownListCat.SelectedItem.Value() ;
            //var CatId = DropDownListBrand.SelectedItem.Value() ;
            int ProQuantity = int.Parse(((TextBox)pnlThem.FindControl("intputProQuantity")).Text);
            string ProName = ((TextBox)pnlThem.FindControl("inputProName")).Text;
            //img
            string Desc = ((TextBox)pnlThem.FindControl("inputDesc")).Text;
            string DescShort = ((TextBox)pnlThem.FindControl("inputDescShort")).Text;


        }




    }
}