using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

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
                //    new Tuple<Control, TableName>(rptPro,TableName.Pro),
                //    //new Tuple<Control, TableName>(rptProCat,TableName.ProCat),
                //    new Tuple<Control, TableName>(rptProBrand,TableName.ProBrand),
                //};
                //Bind();
            }
        }

        protected void smp1_ItemCreated(object sender, SiteMapNodeItemEventArgs e)
        {
            if (e.Item.ItemType == SiteMapNodeItemType.Root ||
                (e.Item.ItemType == SiteMapNodeItemType.PathSeparator && e.Item.ItemIndex == 1))
            {
                e.Item.Visible = false;
            }
        }

        protected void btnFilter_OnClick(object sender, EventArgs e)
        {
            List<int> colorIds = new List<int>();
            List<int> brandIds = new List<int>();
            List<int> proCatIds = new List<int>();
            string filterPriceFrom = priceFrom.InnerText;
            string filterPriceTo = priceTo.InnerText;
            foreach (RepeaterItem item in rptColors.Items)
            {
                //Collect ColorIds
                CheckBox chkColor = (CheckBox)item.FindControl("chkColor");
                if (chkColor.Checked)
                {
                    HiddenField hdfColorId = (HiddenField)item.FindControl("hdfColorId");
                    colorIds.Add(Convert.ToInt32(hdfColorId.Value));
                }
                //Collect brandIds
                CheckBox chkBrand = (CheckBox)item.FindControl("chkBrand");
                if (chkBrand.Checked)
                {
                    HiddenField hdfBrandId = (HiddenField)item.FindControl("hdfBrandId");
                    brandIds.Add(Convert.ToInt32(hdfBrandId.Value));
                }
                //Collect ProCatIds
                CheckBox chkProCat = (CheckBox)item.FindControl("chkProCat");
                if (chkProCat.Checked)
                {
                    HiddenField hdfProCatId = (HiddenField)item.FindControl("hdfProCatId");
                    proCatIds.Add(Convert.ToInt32(hdfProCatId.Value));
                }
            }
            foreach (RepeaterItem item in rptProBrand.Items)
            {
            }
            foreach (RepeaterItem item in rptColors.Items)
            {
            }
        }

        protected void rptColors_Init(object sender, EventArgs e)
        {
            rptColors.DataSource = MyLibrary.ProColor_BUS.GetAll();
            rptColors.DataBind();
        }

        protected void rptColors_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            CheckBox chkColor = (CheckBox)e.Item.FindControl("chkColor");
            chkColor.InputAttributes.Add("class", "input-check-color__input");
        }

        protected void rptProBrand_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            CheckBox chkBrand = (CheckBox)e.Item.FindControl("chkBrand");
            chkBrand.InputAttributes.Add("class", "input-check__input");

        }

        protected void rptProCat_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            CheckBox chkProCat = (CheckBox)e.Item.FindControl("chkProCat");
            chkProCat.InputAttributes.Add("class", "input-check__input");
        }
    }
}