using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web;
using ShoesStore.MyExtensions;
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
        List<ProSize> lstProSize = new List<ProSize>();
        List<ProColor> lstProColor = new List<ProColor>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                phdPage.MerExpired();
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

        protected void lvColoSize_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Sel")
            {
                Label txtKl = (Label)e.Item.FindControl("lblKl");
                TextBox txtSl = (TextBox)e.Item.FindControl("txtQty");
                Label txtCl = (Label)e.Item.FindControl("lbColorName");
                txtKl.Text = txtCl.Text + "(" + txtSl.Text + ")";
            }
            else if(e.CommandName == "Del")
            {
                sizeColors.RemoveAt(Int32.Parse(e.CommandArgument.ToString()));
                LoadlvColoSize();
            }
        }

        public void LoadlvColoSize()
        {
            lvColoSize.DataSource = sizeColors;
            lvColoSize.DataBind();
        }

        public void LoadImgPrimary()
        {
            if (fulImgChinh.HasFile)
            {
                string pathImgChinh = Path.GetFileName(fulImgChinh.PostedFile.FileName);
                imgPrimary.Attributes["src"] = pathImgChinh.Replace(@"\\", @"\");
            }
            else return;
        }

        public void SaveImgPrimary(Pro pro)
        {
            var mer = MerchantSession.LoginMer;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            int shpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == mer.MerId).Select(x => x.ShpId).FirstOrDefault();
            if (fulImgChinh.HasFile)
            {
                string pathImgChinh = Server.MapPath(fulImgChinh.FileName);
                MyLibrary.SaveProImgPath(pro, pathImgChinh);
            }
        }

        public void SaveImgSlide(Pro pro)
        {
            int proId = MyLibrary.Pro_BUS.GetAll().Where(x => x.ProName == inputProName.Text).Select(x=>x.ProId).FirstOrDefault();
            var mer = MerchantSession.LoginMer;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            int shpId = MyLibrary.Shp_Bus.GetAll().Where(x=>x.MerId==mer.MerId).Select(x=>x.ShpId).FirstOrDefault();
            if (fulImgPhu.HasFiles)
            {
                int i = 1;
                foreach (HttpPostedFile postedFile in fulImgPhu.PostedFiles)
                {
                    string filename = Path.GetFileName(postedFile.FileName);
                    string pathImgSlide = Server.MapPath(postedFile.FileName);
                    ProSlide proSlide = new ProSlide()
                    {
                        SlideId = i,
                        ProId = proId,
                        ShpId = shpId,
                        Img = filename
                    };
                    MyLibrary.ProSlide_BUS.Insert(proSlide);
                    //MyLibrary.SaveProImgSlidePath(pro, Path.GetFileName(postedFile.FileName));
                    i++;
                }
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

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            int ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == usr1.UsrId).Select(x => x.ShpId).FirstOrDefault();
            int catId = Int32.Parse(DropDownListCat.SelectedValue.ToString());
            int brandId = int.Parse(DropDownListBrand.SelectedValue.ToString());
            string proName = inputProName.Text;
            string desc = editor1.Text;
            string descShort = inputDescShort.Text;
            string price = inputPrice.Text;
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
                ProName = proName,
                Desc = desc,
                DescShort = descShort,
                Price = price,
                DateAdd = DateTime.Now,
                DateEdit = null,
                
                Active = false,
                PriceAfter = null,
                Img = Img
            };
            MyLibrary.Pro_BUS.Insert(pro1);
            //SaveImgSlide(pro1);
            foreach (SizeColor item in sizeColors)
            {
                ProDet proDet = new ProDet
                {
                    ShpId = ShpId,
                    ProId = MyLibrary.Pro_BUS.GetMaxId(),
                    SizeId = item.Size.SizeId,
                    ColorId = item.Color.ColorId
                };
                MyLibrary.ProDet_BUS.Insert(proDet);
            }
            //SaveImgSlide();
            SaveImgPrimary(pro1);
        }
    }
}