using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web.UI.HtmlControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class DS_SanPham : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                //rptProCat.DataBind();
                //listWc=new List<Tuple<Control, TableName>>()
                //{
                //new Tuple<Control, TableName>(rptPro,TableName.Pro),
                ////new Tuple<Control, TableName>(rptProCat,TableName.ProCat),
                //new Tuple<Control, TableName>(rptProBrand,TableName.ProBrand),
                //};
                //Bind();
            }
        }

        protected void smp1_ItemCreated(object sender, SiteMapNodeItemEventArgs e)
        {
            if (e.Item.ItemType == SiteMapNodeItemType.Root ||
                e.Item.ItemType == SiteMapNodeItemType.PathSeparator && e.Item.ItemIndex == 1)
                e.Item.Visible = false;
        }

        protected void btnFilter_OnClick(object sender, EventArgs e)
        {
            var colorIds = new List<int>();
            var brandIds = new List<int>();
            var proCatIds = new List<int>();
            var filterPriceFrom = Convert.ToInt32(priceFrom.Text);
            var filterPriceTo = Convert.ToInt32(priceTo.Text);
            //var vFilterPro = ((HtmlSelect)filterPro).SelectedIndex;
            int vFilterPro = Convert.ToInt32(((HtmlSelect)filterPro).Value);

            Func<Pro, long> funcFilter = null;

            switch(vFilterPro)
            {
                case 0: { funcFilter = pro => pro.Shp.RcptBuy.Count; break; }
                case 1: { funcFilter = pro =>Convert.ToInt32( pro.Price); break; }
                case 2: { funcFilter = pro => Convert.ToInt32(pro.Price); break; }//giam
                case 3: { funcFilter = pro => MyLibrary.Pro_BUS.AverageStar(pro); break; }
                case 4: { funcFilter = pro => MyLibrary.Pro_BUS.AverageStar(pro); break; }//giam
                default: { funcFilter = pro=>pro.DateAdd.Value.Ticks;break; }
            }


            foreach (RepeaterItem item in rptColors.Items)
            {
                //Collect ColorIds
                var chkColor = (CheckBox)item.FindControl("chkColor");
                if (chkColor.Checked)
                {
                    var hdfColorId = (HiddenField)item.FindControl("hdfColorId");
                    colorIds.Add(Convert.ToInt32(hdfColorId.Value));
                }
            }

            foreach (RepeaterItem item in rptProBrand.Items)
            {
                //Collect brandIds
                var chkBrand = (CheckBox)item.FindControl("chkBrand");
                if (chkBrand.Checked)
                {
                    var hdfBrandId = (HiddenField)item.FindControl("hdfBrandId");
                    brandIds.Add(Convert.ToInt32(hdfBrandId.Value));
                }
            }

            foreach (RepeaterItem item in rptProCat.Items)
            {
                //Collect ProCatIds
                var chkProCat = (CheckBox)item.FindControl("chkProCat");
                if (chkProCat.Checked)
                {
                    var hdfProCatId = (HiddenField)item.FindControl("hdfProCatId");
                    proCatIds.Add(Convert.ToInt32(hdfProCatId.Value));
                }
            }

            var willSource = MyLibrary.Pro_BUS.GetAllActive().
                Where(pro => pro.ProDet.Any(color => (colorIds.Count == 0 || colorIds.Contains(color.ColorId))) &&
                (brandIds.Count == 0 || brandIds.Contains(pro.BrandId)) &&
                (proCatIds.Count == 0 || proCatIds.Contains(pro.CatId)) &&
                (Convert.ToInt32(pro.Price) >= filterPriceFrom && Convert.ToInt32(pro.Price) <= filterPriceTo)
                );

            
            UcPro.RptPro.DataSource = (vFilterPro == 2 || vFilterPro == 4) ? willSource.OrderBy(funcFilter): willSource.OrderByDescending(funcFilter);
            UcPro.RptPro.DataBind();
        }



        protected void rptColors_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            var chkColor = (CheckBox)e.Item.FindControl("chkColor");
            chkColor.InputAttributes.Add("class", "input-check-color__input");
        }

        protected void rptProBrand_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var chkBrand = (CheckBox)e.Item.FindControl("chkBrand");
            chkBrand.InputAttributes.Add("class", "input-check__input");
        }

        protected void rptProCat_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var chkProCat = (CheckBox)e.Item.FindControl("chkProCat");
            chkProCat.InputAttributes.Add("class", "input-check__input");
        }

        protected void rptColors_Init(object sender, EventArgs e)
        {

            rptColors.DataSource = MyLibrary.ProColor_BUS.GetAll();
            rptColors.DataBind();


        }
        protected void rptProBrand_Init(object sender, EventArgs e)
        {
            rptProBrand.DataSource = MyLibrary.ProBrand_BUS.GetAll();
            rptProBrand.DataBind();
        }

        protected void rptProCat_Init(object sender, EventArgs e)
        {
            rptProCat.DataSource = MyLibrary.ProCat_BUS.GetAll();
            rptProCat.DataBind();
        }
    }
}