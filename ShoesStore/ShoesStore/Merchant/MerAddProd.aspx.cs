using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
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
            if (!IsPostBack)
            {
                LoadDdlProCat();
                LoadDdlProBrand();
                LoadckbProColor();
                LoadCkbProSize();
            }

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


        public void LoadckbProColor()
        {
            ckbColor.DataSource = MyLibrary.ProColor_BUS.GetAll();
            ckbColor.DataTextField = "ColorName";
            ckbColor.DataValueField = "ColorId";
            ckbColor.DataBind();
        }

        public void LoadCkbProSize()
        {
            ckbSize.DataSource = MyLibrary.ProSize_BUS.GetAll();
            ckbSize.DataTextField = "SizeName";
            ckbSize.DataValueField = "SizeId";
            ckbSize.DataBind();
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

        public void LoadlvColoSize()
        {
            
            lvColoSize.DataSource = lstSize;
            lvColoSize.DataBind();
        }
        List<int> lstSize = new List<int>();
        List<string> lstColor = new List<string>();

        protected void lbtnChon_Click(object sender, EventArgs e)
        {
            int items = 0;
            foreach (ListItem li1 in ckbSize.Items)
            {
                if (li1.Selected == true)
                {
                    lstSize.Add(Int32.Parse(items.ToString()));
                    items++;
                    LoadlvColoSize();
                }
            }
        }
        public void LoadDdlColor()
        {
            
        }

        protected void lvColoSize_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
        //    HiddenField hddSize = (HiddenField)e.Item.FindControl("SizeId");
            Label lbSize = (Label)e.Item.FindControl("lbSizeName");
            DropDownList lvddlColor = (DropDownList)e.Item.FindControl("ddlProColor");
            lvddlColor.DataSource = lstColor;
            lvddlColor.DataBind();
        }

        protected void lbtnColor_Click(object sender, EventArgs e)
        {
            int items = 0;
            foreach (ListItem li1 in ckbColor.Items)
            {
                if (li1.Selected == true)
                {
                    lstColor.Add(items.ToString());
                    items++;
                }
            }
        }
        //protected void ckbSize_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    for (int i = 0; i < ckbSize.Items.Count; i++)
        //    {
        //        if (ckbSize.Items[i].Selected)
        //        {
        //            lstSize.Add(Int32.Parse(ckbSize.Items[i].Text)); LoadlvColoSize();
        //        }
        //    }
        //}

        //protected void lbtnInsertColor_Click(object sender, EventArgs e)
        //{
        //    string ColorName = ((TextBox)pnlThem.FindControl("txtInsertColor")).Text;
        //    //string ColorImg = fileNewColor.FileName;
        //    ProColor newColor = new ProColor
        //    {
        //        ColorName = ColorName
        //    };
        //    MyLibrary.ProColor_BUS.Insert(newColor);
        //    ((TextBox)pnlThem.FindControl("txtInsertColor")).Text = "";
        //}
    }
}