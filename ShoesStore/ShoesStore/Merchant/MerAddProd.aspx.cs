using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Merchant
{
    public partial class MerAddProd : Page
    {
        public static List<SizeColor> sizeColors = new List<SizeColor>();
        private readonly List<ProColor> lstProColor = new List<ProColor>();
        private readonly List<ProSize> lstProSize = new List<ProSize>();

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            lbError.Text = "";
            if (!fulImgChinh.HasFile || !fulImgPhu.HasFile || ddlColorSelected.SelectedItem == null ||
                ddlSizeSelected.SelectedItem == null || sizeColors.Count == 0)
            {
                if (!fulImgChinh.HasFile) lbError.Text = "Chưa chọn ảnh chính<br />";
                if (!fulImgPhu.HasFile) lbError.Text = lbError.Text + "Chưa có ảnh phụ<br />";
                if (ddlColorSelected.SelectedItem == null) lbError.Text = lbError.Text + "Chưa chọn màu<br />";
                if (ddlSizeSelected.SelectedItem == null) lbError.Text = lbError.Text + "Chưa chọn kích cỡ<br />";
                if (sizeColors.Count == 0) lbError.Text = lbError.Text + "Chưa thêm màu và kích cỡ<br />";
                if (lbError.Text != "") editor1.Text = "";
                return;
            }

            var mer = (Mer) MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            var ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == usr1.UsrId).Select(x => x.ShpId)
                .FirstOrDefault();

            var catId = int.Parse(DropDownListCat.SelectedValue);
            var brandId = int.Parse(DropDownListBrand.SelectedValue);
            var proName = inputProName.Text;
            var desc = editor1.Text;
            var descShort = inputDescShort.Text;
            var price = inputPrice.Text;


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
                IsOutOfStock = false,
                Active = false,
                PriceAfter = null,
                Img = fulImgChinh.FileName
            };
            MyLibrary.Pro_BUS.Insert(pro1);

            foreach (var item in sizeColors)
            {
                var proDet = new ProDet
                {
                    ShpId = ShpId,
                    ProId = MyLibrary.Pro_BUS.GetMaxId(),
                    SizeId = item.Size.SizeId,
                    ColorId = item.Color.ColorId,
                    Qty = item.Qty
                };
                MyLibrary.ProDet_BUS.Insert(proDet);
            }

            SaveImgPrimary(pro1);
            SaveImgSlide(pro1);
            MyLibrary.Show("Bài đăng của bạn sẽ được kiểm duyệt trong 24 giờ! :) ");
            //Response.Redirect(Request.Url.PathAndQuery, true);
            phdPage.ClearTextBoxes();
        }

        protected void lbtnChon_Click(object sender, EventArgs e)
        {
            if (ddlColorSelected.Text == "" || ddlSizeSelected.Text == "")
            {
                MyLibrary.Show("Chưa chọn màu hoặc kích cỡ");
                return;
            }

            var sizeColor = new SizeColor();
            var size = MyLibrary.ProSize_BUS.GetById(int.Parse(ddlSizeSelected.SelectedValue));
            var color = MyLibrary.ProColor_BUS.GetById(int.Parse(ddlColorSelected.SelectedValue));
            sizeColor.Color = color;
            sizeColor.Size = size;
            if (sizeColors.Any(
                x => x.Size.SizeId == sizeColor.Size.SizeId && x.Color.ColorId == sizeColor.Color.ColorId))
                return;
            sizeColors.Add(sizeColor);
            LoadlvColoSize();
        }

        protected void lbtnColor_Click(object sender, EventArgs e)
        {
            lstProColor.Clear();
            foreach (ListItem li1 in ckbColor.Items)
                if (li1.Selected)
                {
                    var rs = (from a in MyLibrary.ProColor_BUS.GetAll()
                        where a.ColorName == li1.Text
                        select a).Single();
                    if (lstProColor.Select(x => x.ColorId).Contains(rs.ColorId)) return;

                    lstProColor.Add(rs);
                    LoadDdlColorSelected();
                }
        }

        protected void lbtnSize_Click(object sender, EventArgs e)
        {
            foreach (ListItem li1 in ckbSize.Items)
                if (li1.Selected)
                {
                    var rs = (from a in MyLibrary.ProSize_BUS.GetAll()
                        where a.SizeName == li1.Text
                        select a).Single();
                    if (lstProSize.Select(x => x.SizeId).Contains(rs.SizeId)) return;

                    lstProSize.Add(rs);
                    LoadDdlSizeSelected();
                }
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

        public void LoadDdlColorSelected()
        {
            ddlColorSelected.DataSource = lstProColor;
            ddlColorSelected.DataTextField = "ColorName";
            ddlColorSelected.DataValueField = "ColorId";
            ddlColorSelected.DataBind();
        }

        public void LoadDdlProBrand()
        {
            DropDownListBrand.DataSource = MyLibrary.ProBrand_BUS.GetAll();
            DropDownListBrand.DataTextField = "BrandName";
            DropDownListBrand.DataValueField = "BrandId";
            DropDownListBrand.DataBind();
        }

        public void LoadDdlProCat()
        {
            DropDownListCat.DataSource = MyLibrary.ProCat_BUS.GetAll();
            DropDownListCat.DataTextField = "CatName";
            DropDownListCat.DataValueField = "CatId";
            DropDownListCat.DataBind();
        }

        public void LoadDdlSizeSelected()
        {
            ddlSizeSelected.DataSource = lstProSize;
            ddlSizeSelected.DataTextField = "SizeName";
            ddlSizeSelected.DataValueField = "SizeId";
            ddlSizeSelected.DataBind();
        }

        public void LoadImgPrimary()
        {
            if (fulImgChinh.HasFile)
            {
                var pathImgChinh = Path.GetFileName(fulImgChinh.PostedFile.FileName);
                imgPrimary.Attributes["src"] = pathImgChinh.Replace(@"\\", @"\");
            }
        }

        public void LoadlvColoSize()
        {
            lvColoSize.DataSource = sizeColors;
            lvColoSize.DataBind();
        }

        protected void lvColoSize_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Sel")
            {
                var txtKl = (Label) e.Item.FindControl("lblKl");
                var txtSl = (TextBox) e.Item.FindControl("txtQty");
                var txtCl = (Label) e.Item.FindControl("lbColorName");
                var txtSz = (Label) e.Item.FindControl("lbSizeName");
                txtKl.Text = txtCl.Text + "(" + txtSl.Text + ")";

                var rs = (from sc in sizeColors
                    where sc.Size.SizeName == txtSz.Text && sc.Color.ColorName == txtCl.Text
                    select sc).FirstOrDefault();
                rs.Qty = int.Parse(txtSl.Text);
            }
            else if (e.CommandName == "Del")
            {
                sizeColors.RemoveAt(int.Parse(e.CommandArgument.ToString()));
                LoadlvColoSize();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sizeColors.Clear();
                phdPage.MerExpired();
                LoadDdlProCat();
                LoadDdlProBrand();
                LoadckbProColor();
                LoadCkbProSize();
            }
        }

        public void SaveImgPrimary(Pro pro)
        {
            var mer = MerchantSession.LoginMer;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            var shpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == mer.MerId).Select(x => x.ShpId)
                .FirstOrDefault();
            if (fulImgChinh.HasFile)
            {
                var pathImgChinh = Server.MapPath(fulImgChinh.FileName);
                MyLibrary.SaveProImgPath(pro, fulImgChinh);
            }
        }

        public void SaveImgSlide(Pro pro)
        {
            var proId = MyLibrary.Pro_BUS.GetAll().Where(x => x.ProName == inputProName.Text).Select(x => x.ProId)
                .FirstOrDefault();
            var mer = MerchantSession.LoginMer;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            var shpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == mer.MerId).Select(x => x.ShpId)
                .FirstOrDefault();
            if (fulImgPhu.HasFiles)
            {
                var i = 1;
                foreach (var postedFile in fulImgPhu.PostedFiles)
                {
                    var filename = Path.GetFileName(postedFile.FileName);
                    var pathImgSlide = Server.MapPath(postedFile.FileName);
                    var proSlide = new ProSlide
                    {
                        SlideId = i,
                        ProId = proId,
                        ShpId = shpId,
                        Img = filename
                    };
                    MyLibrary.ProSlide_BUS.Insert(proSlide);
                    MyLibrary.SaveProImgSlidePath(pro, postedFile);
                    i++;
                }
            }
        }

        public class SizeColor
        {
            public ProSize Size { get; set; }
            public ProColor Color { get; set; }
            public int Qty { get; set; }
        }
    }
}