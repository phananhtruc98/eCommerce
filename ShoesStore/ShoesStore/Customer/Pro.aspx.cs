using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.WebControls;

namespace ShoesStore.Customer
{
    public partial class DS_SanPham : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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

        protected void smp1_ItemCreated(object sender, System.Web.UI.WebControls.SiteMapNodeItemEventArgs e)
        {
            if (e.Item.ItemType == SiteMapNodeItemType.Root ||
                (e.Item.ItemType == SiteMapNodeItemType.PathSeparator && e.Item.ItemIndex == 1))
            {
                e.Item.Visible = false;
            }
        }

        protected void btnFilter_OnClick(object sender, EventArgs e)
        {
            UcPro.RptPro.PageCurrent = 5;
        }
    }
}