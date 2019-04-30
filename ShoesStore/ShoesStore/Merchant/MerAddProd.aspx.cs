﻿using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace ShoesStore.Merchant
{
    public partial class MerAddProd : Page
    {
        public class SizeColor
        {
            public ProSize Size { get; set; }
            public ProColor Color { get; set; }
        }
        public static List<SizeColor> sizeColors = new List<SizeColor>();
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
            if (IsPostBack && fulImgChinh.PostedFile != null)
            {
                if (fulImgChinh.PostedFile.FileName.Length > 0)
                {
                    LoadImgPrimary();
                }
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
            //inputProName.te
            //int proQuantity = int.Parse(((TextBox)pnlThem.FindControl("intputProQuantity")).Text);
            //string proName = ((TextBox)pnlThem.FindControl("inputProName")).Text;
            //string desc = ((TextBox)pnlThem.FindControl("editor1")).Text;
            //string descShort = ((TextBox)pnlThem.FindControl("inputDescShort")).Text;
            //string price = ((TextBox)pnlThem.FindControl("inputPrice")).Text;
            string Img = "";
            if (fulImgChinh.HasFile)
            {
                Img = fulImgChinh.FileName;
            }
            var pro1 = new Pro
            {
                //ShpId = ShpId,
                //CatId = catId,
                //BrandId = brandId,
                //ProQuantity = proQuantity,
                //ProName = proName,
                //Desc = desc,
                //DescShort = descShort,
                //Price = price,
                //DateAdd = DateTime.Now,
                DateEdit = null,
                IsOutOfStock = true,
                Active = false,
                PriceAfter = null,
                Img = Img
            };
            pro.Insert(pro1);


        }


        List<ProSize> lstProSize = new List<ProSize>();
        List<ProColor> lstProColor = new List<ProColor>();

        protected void lbtnSize_Click(object sender, EventArgs e)
        {
            foreach (ListItem li1 in ckbSize.Items)
            {
                if (li1.Selected == true)
                {
                    ProSize rs = (from a in MyLibrary.ProSize_BUS.GetAll()
                                  where a.SizeName == li1.Text
                                  select a).Single();
                    if (lstProSize.Select(x => x.SizeId).Contains(rs.SizeId))
                    {
                        return;
                    }
                    else
                    {
                        lstProSize.Add(rs);
                        LoadDdlSizeSelected();
                    }
                }
            }
        }
        protected void lbtnColor_Click(object sender, EventArgs e)
        {
            lstProColor.Clear();
            foreach (ListItem li1 in ckbColor.Items)
            {
                if (li1.Selected == true)
                {
                    ProColor rs = (from a in MyLibrary.ProColor_BUS.GetAll()
                                   where a.ColorName == li1.Text
                                   select a).Single();
                    if (lstProColor.Select(x => x.ColorId).Contains(rs.ColorId))
                    {
                        return;
                    }
                    else
                    {
                        lstProColor.Add(rs);
                        LoadDdlColorSelected();
                    }
                }
            }

        }
        public void LoadDdlColorSelected()
        {
            ddlColorSelected.DataSource = lstProColor;
            ddlColorSelected.DataTextField = "ColorName";
            ddlColorSelected.DataValueField = "ColorId";
            ddlColorSelected.DataBind();
        }
        public void LoadDdlSizeSelected()
        {
            ddlSizeSelected.DataSource = lstProSize;
            ddlSizeSelected.DataTextField = "SizeName";
            ddlSizeSelected.DataValueField = "SizeId";
            ddlSizeSelected.DataBind();
        }

        public List<List<string>> vs = new List<List<string>>();
        public void LoadlvColoSize()
        {
            lvColoSize.DataSource = sizeColors;
            lvColoSize.DataBind();
        }
        protected void lvColoSize_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ////    HiddenField hddSize = (HiddenField)e.Item.FindControl("SizeId");
            ////Label lbSize = (Label)e.Item.FindControl("lbSizeName");
            //DropDownList lvddlColor = (DropDownList)e.Item.FindControl("ddlProColor");
            //LoadDdlColor(lvddlColor);
        }

        public void LoadImgPrimary()
        {
            if (fulImgChinh.HasFile)
            {
                string pathImgChinh =Path.GetFileName(fulImgChinh.PostedFile.FileName);
                imgPrimary.Attributes["src"] = pathImgChinh.Replace(@"\\",@"\");
            }
            else return;
        }

        public void SaveImgPrimary()
        {
            var mer = MerchantSession.LoginMer;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            if (fulImgChinh.HasFile)
            {
                string pathImgChinh = Server.MapPath(fulImgChinh.FileName);
                Pro pro = new Pro()
                {
                    ProName = inputProName.Text,
                    ShpId = mer.Shp.FirstOrDefault(shp => shp.MerId == mer.MerId).ShpId
                };
                MyLibrary.SaveProImgPath(pro, pathImgChinh);
            }
        }



        protected void lvColoSize_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Sel")
            {
                Label txtKl = (Label)e.Item.FindControl("lblKl");
                TextBox txtSl = (TextBox)e.Item.FindControl("txtQty");
                Label txtCl = (Label)e.Item.FindControl("lbColorName");
                txtKl.Text = txtCl.Text + "(" + txtSl.Text + ")";
            }

        }

        protected void lbtnChon_Click(object sender, EventArgs e)
        {
            SizeColor sizeColor = new SizeColor();
            ProSize size = MyLibrary.ProSize_BUS.GetById(Int32.Parse(ddlSizeSelected.SelectedValue));
            ProColor color = MyLibrary.ProColor_BUS.GetById(Int32.Parse(ddlColorSelected.SelectedValue));
            sizeColor.Color = color;
            sizeColor.Size = size;
            if (sizeColors.Any(x => x.Size.SizeId == sizeColor.Size.SizeId && x.Color.ColorId == sizeColor.Color.ColorId))
            {
                return;
            }
            else sizeColors.Add(sizeColor);
            LoadlvColoSize();
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