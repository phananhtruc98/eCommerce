﻿using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

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

        // Load Bảng Thương hiệu
        private void BindDataGridViewBrand()
        {
            gvBrand.DataSource = proBrand_BUS.GetAll();
            gvBrand.DataBind();
        }

        // Load Bảng Loại sản phẩm
        private void BindDataGridViewCat()
        {
            gvProCat.DataSource = proCat_BUS.GetAll();
            gvProCat.DataBind();
        }

        // Load Bảng Màu
        private void BindDataGridViewColor()
        {
            gvProColor.DataSource = proColor_BUS.GetAll();
            gvProColor.DataBind();
        }

        // Load Bảng Kích cỡ
        private void BindDataGridViewSize()
        {
            gvProSize.DataSource = proSize_BUS.GetAll();
            gvProSize.DataBind();
        }


        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        protected void gvBrand_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBrand.PageIndex = e.NewPageIndex;
            BindDataGridViewBrand();
        }

        // Thêm xóa sửa ProBrand
        protected void gvBrand_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                gvBrand.EditIndex = rowIndex;
                BindDataGridViewBrand();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var result = (from c in proBrand_BUS.GetAll()
                    where c.BrandId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                proBrand_BUS.Delete(result);
                BindDataGridViewBrand();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvBrand.EditIndex = -1;
                BindDataGridViewBrand();
            }
            else if (e.CommandName == "UpdateRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var BrandId = Convert.ToInt32(e.CommandArgument);
                var BrandName = ((TextBox) gvBrand.Rows[rowIndex].FindControl("EditSubContent")).Text;
                var result = (from c in proBrand_BUS.GetAll()
                    where c.BrandId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                if (result != null)
                {
                    result.BrandName = BrandName;
                    proBrand_BUS.Update(result);
                }

                gvBrand.EditIndex = -1;
                BindDataGridViewBrand();
            }
            else if (e.CommandName == "InsertRow")
            {
                var BrandName = ((TextBox) gvBrand.FooterRow.FindControl("InsertBrandName")).Text;
                if (BrandName == "") return;
                var newBrand = new ProBrand {BrandName = BrandName};
                proBrand_BUS.Insert(newBrand);
                BindDataGridViewBrand();
            }
        }

        protected void gvProCat_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProCat.PageIndex = e.NewPageIndex;
            BindDataGridViewCat();
        }

        // Thêm xóa sửa ProCat
        protected void gvProCat_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                gvProCat.EditIndex = rowIndex;
                BindDataGridViewCat();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var result = (from c in proCat_BUS.GetAll()
                    where c.CatId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                proCat_BUS.Delete(result);
                BindDataGridViewCat();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvProCat.EditIndex = -1;
                BindDataGridViewCat();
            }
            else if (e.CommandName == "UpdateRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var CatId = Convert.ToInt32(e.CommandArgument);
                var CatName = ((TextBox) gvProCat.Rows[rowIndex].FindControl("EditSubContent")).Text;
                var result = (from c in proCat_BUS.GetAll()
                    where c.CatId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                if (result != null)
                {
                    result.CatName = CatName;
                    proCat_BUS.Update(result);
                }

                gvProCat.EditIndex = -1;
                BindDataGridViewCat();
            }
            else if (e.CommandName == "InsertRow")
            {
                var catName = ((TextBox) gvProCat.FooterRow.FindControl("InsertCatName")).Text;
                if (catName == "") return;
                var newProCat = new ProCat {CatName = catName, Active = true};
                proCat_BUS.Insert(newProCat);
                BindDataGridViewCat();
            }
        }

        protected void gvProColor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProColor.PageIndex = e.NewPageIndex;
            BindDataGridViewColor();
        }

        // Thêm xóa sửa ProColor
        protected void gvProColor_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                gvProColor.EditIndex = rowIndex;
                BindDataGridViewColor();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var result = (from c in proColor_BUS.GetAll()
                    where c.ColorId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                proColor_BUS.Delete(result);
                BindDataGridViewColor();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvProColor.EditIndex = -1;
                BindDataGridViewColor();
            }
            else if (e.CommandName == "UpdateRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var colorId = Convert.ToInt32(e.CommandArgument);
                var colorName = ((TextBox) gvProColor.Rows[rowIndex].FindControl("EditColorName")).Text;
                var hexCode = ((TextBox) gvProColor.Rows[rowIndex].FindControl("EditHexCode")).Text;
                var result = (from c in proColor_BUS.GetAll()
                    where c.ColorId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                if (result != null)
                {
                    result.HexCode = hexCode;
                    result.ColorName = colorName;
                    proColor_BUS.Update(result);
                }

                gvProColor.EditIndex = -1;
                BindDataGridViewColor();
            }
            else if (e.CommandName == "InsertRow")
            {
                var ColorName = ((TextBox) gvProColor.FooterRow.FindControl("InsertColorName")).Text;
                var hexCode = ((TextBox) gvProColor.FooterRow.FindControl("InsertHexCode")).Text;
                if (ColorName == "" || hexCode == "") return;
                var newColor = new ProColor {ColorName = ColorName, HexCode = hexCode};
                proColor_BUS.Insert(newColor);
                BindDataGridViewColor();
            }
        }

        protected void gvProSize_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProSize.PageIndex = e.NewPageIndex;
            BindDataGridViewSize();
        }

        // Phân trang


        // Thêm xóa sửa ProSize
        protected void gvProSize_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                gvProSize.EditIndex = rowIndex;
                BindDataGridViewSize();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var result = (from c in proSize_BUS.GetAll()
                    where c.SizeId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                proSize_BUS.Delete(result);
                BindDataGridViewSize();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvProSize.EditIndex = -1;
                BindDataGridViewSize();
            }
            else if (e.CommandName == "UpdateRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var sizeId = Convert.ToInt32(e.CommandArgument);
                var sizeName = ((TextBox) gvProSize.Rows[rowIndex].FindControl("EditSizeName")).Text;
                var result = (from c in proSize_BUS.GetAll()
                    where c.SizeId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                if (result != null)
                {
                    result.SizeName = sizeName;
                    proSize_BUS.Update(result);
                }

                gvProSize.EditIndex = -1;
                BindDataGridViewSize();
            }
            else if (e.CommandName == "InsertRow")
            {
                var sizeName = ((TextBox) gvProSize.FooterRow.FindControl("InsertSizeName")).Text;
                if (sizeName == "") return;
                var newSub = new ProSize {SizeName = sizeName};
                proSize_BUS.Insert(newSub);
                BindDataGridViewSize();
            }
        }

        // Load Bảng Pro
        public void LoadLvPro()
        {
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                where p.Active == true
                select p).ToList();
            if (rs.Count != 0)
            {
                lvPro.DataSource = rs;
                lvPro.DataBind();
            }
            else
            {
                lbEmpty.Visible = true;
            }
        }

        protected void lvPro_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var ProId = int.Parse(e.CommandArgument.ToString());
            var ShpIdhdf = (HiddenField) e.Item.FindControl("hdfShpId");
            var ShpId = int.Parse(ShpIdhdf.Value);
            if (e.CommandName == "Submit")
            {
                var updatePro = MyLibrary.Pro_BUS.GetAll().FirstOrDefault(x => x.ProId == ProId && x.ShpId == ShpId);
                updatePro.Active = true;
                MyLibrary.Pro_BUS.Update(updatePro);
                LoadLvPro();
            }
            else if (e.CommandName == "Sel")
            {
                Response.Redirect("/Admin/ReviewProductDetail.aspx?ProId=" + ProId + "&ShpId=" + ShpId);
            }
        }

        protected void lvPro_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadLvPro();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataGridViewColor();
                BindDataGridViewBrand();
                BindDataGridViewSize();
                BindDataGridViewCat();
                LoadLvPro();
            }
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in MyLibrary.Pro_BUS.GetAll().ToList()
                where a.ProName.ToString().ContainsEx(search_key)
                      || a.Shp.ShpName.ContainsEx(search_key)
                      || a.ProCat.CatName.ContainsEx(search_key)
                      || a.ProBrand.BrandName.ContainsEx(search_key)
                      || a.Price.ContainsEx(search_key)
                select a).ToList();
            lvPro.DataSource = rs;
            lvPro.DataBind();
        }
    }
}