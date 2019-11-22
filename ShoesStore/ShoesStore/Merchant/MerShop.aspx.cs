using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Merchant
{
    public partial class MerShop : Page
    {
        protected static Pro _proDetView;
        protected static Shp _shpView;

        private void CollectUrl()
        {
            if (RouteData.Values["shpName"] != null && RouteData.Values["shpName"].ToString() != "WebResource.axd")
            {
                var ShpNameCode = RouteData.Values["shpName"].ToString();
                _shpView = MyLibrary.Shp_Bus.GetShp(ShpNameCode);
            }
        }

        /*
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                return 0;
            }
            set => ViewState["PageNumber"] = value;
        }
        */
        public void LoadThongTin()
        {
            //var mer = (Mer)MerchantSession.LoginMerchant;
            //var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            var shp = MyLibrary.Shp_Bus.GetAll().FirstOrDefault(m => m.ShpId == _shpView?.ShpId);
            if (shp == null) return;
            //these code below cannot be reached if shp is null
            lblShpName.Text = shp.ShpName;
            lblDateStart.Text = shp.DateStart.ToString();
            lblDesc.Text = shp.Desc;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (MerchantSession.LoginMerchant == null) return;
                CollectUrl();
                LoadThongTin();
                var a = new Usr().UsrName.GetName();
                //đọc url -> lấy được ShpName //Tham khảo trang ProDet

                // Từ ShpName lấy ra đối tượng Shp //Có hàm trong Shp_BUS
                var ShpId = _shpView?.ShpId;
                UcCusCmt.Shp = MyLibrary.Shp_Bus.GetAll().FirstOrDefault(m => m.ShpId == ShpId);
                if (ShpId != null)
                {
                    ucPro.ShpId = ShpId.Value;
                    ucPro.Reload();
                }
                //Từ đối tượng Shp lấy ra mã Shp 

                //Từ mã Shp gán vào UcPro trong aspx -> Ucpro.ShpId={}
            }
        }


        /*
        protected void rptProCat_Init(object sender, EventArgs e)
        {
            //rptProCat.DataSource = MyLibrary._proCat.GetAll();
            //rptProCat.DataBind();
        }
        
        protected void rptSlides_Init(object sender, EventArgs e)
        {
            rptSlides.DataSource = MyLibrary.WebSlide_BUS.GetAll();
            rptSlides.DataBind();
        }

        protected void rptPopularCategories_Init(object sender, EventArgs e)
        {
            rptPopularCategories.DataSource = MyLibrary.ProCat_BUS.GetAll();
            rptPopularCategories.DataBind();
        }

        protected void brandLogos_Init(object sender, EventArgs e)
        {
            rptBrandLogos.DataSource = MyLibrary.ProBrand_BUS.GetAll();
            rptBrandLogos.DataBind();
        }
        */
    }
}