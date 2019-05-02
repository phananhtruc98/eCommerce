using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI;

namespace ShoesStore.Merchant
{
    public partial class MerShop : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadThongTin();
        }
        public void LoadThongTin()
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            var shp1 = MyLibrary.Shp_Bus.GetAll().FirstOrDefault(n => n.MerId == mer.MerId);
            lblShpName.Text = usr1.UsrName;
            //lblAddress.Text = usr1.Address;
            //avaimgstr = usr1.Avatar;
            //lblEmail.Text = usr1.Email;
            //lblPhone.Text = usr1.Phone;
            //avaimg.Attributes["src"] = "/Admin/images/avatar/" + usr1.Avatar;
        }
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //}
        //public int PageNumber
        //{
        //get
        //{
        //if (ViewState["PageNumber"] != null)
        //{
        //return Convert.ToInt32(ViewState["PageNumber"]);
        //}
        //else
        //{
        //return 0;
        //}
        //}
        //set { ViewState["PageNumber"] = value; }
        //}
        //protected void rptProCat_Init(object sender, EventArgs e)
        //{
        ////rptProCat.DataSource = Master._proCat.GetAll();
        ////rptProCat.DataBind();
        //}
        //protected void featuredProducts_Init(object sender, EventArgs e)
        //{
        ////featuredProducts.DataSource = Master._proCat.GetAll();
        ////featuredProducts.DataBind();
        //}
        //protected void rptFeatureProducts_Init(object sender, EventArgs e)
        //{
        //rptFeatureProducts.DataSource = Master._pro.GetAll();
        //rptFeatureProducts.DataBind();
        //}
        //protected void rptBestSellers_Init(object sender, EventArgs e)
        //{
        //BindRepeater();
        ////rptBestSellers.DataSource = Master._pro.GetAll();// se sua thanh getBestSeller
        ////rptBestSellers.DataBind();
        //}
        //private void BindRepeater()
        //{
        ////Do your database connection stuff and get your data
        //// se sua thanh getBestSeller
        //PagedDataSource pgitems = new PagedDataSource();
        //pgitems.DataSource = Master._pro.GetAll();
        //pgitems.AllowPaging = true;
        ////Control page size from here 
        //pgitems.PageSize = 4;
        //pgitems.CurrentPageIndex = PageNumber;
        //if (pgitems.PageCount > 1)
        //{
        //rptPagingBestSellers.Visible = true;
        //ArrayList pages = new ArrayList();
        //for (int i = 0; i <= pgitems.PageCount - 1; i++)
        //{
        //pages.Add((i + 1).ToString());
        //}
        //rptPagingBestSellers.DataSource = pages;
        //rptPagingBestSellers.DataBind();
        //}
        //else
        //{
        //rptPagingBestSellers.Visible = false;
        //}
        ////Finally, set the datasource of the repeater
        //rptBestSellers.DataSource = pgitems;
        //rptBestSellers.DataBind();
        //}
        //protected void rptPagingBestSellers_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        //BindRepeater();
        //}
    }
}