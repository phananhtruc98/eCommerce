using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.WebControls;
using Utilities;

namespace ShoesStore.Merchant
{
    public partial class MerShop : Page
    {
        protected static Pro _proDetView;
        protected static Shp _shpView;
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

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //đọc url -> lấy được ShpName //Tham khảo trang ProDet
                CollectUrl();
                // Từ ShpName lấy ra đối tượng Shp //Có hàm trong Shp_BUS
                var ShpId = _shpView.ShpId;

                ucPro.ShpId = ShpId;

                //Từ đối tượng Shp lấy ra mã Shp 

                //Từ mã Shp gán vào UcPro trong aspx -> Ucpro.ShpId={}
            }
        }
        private void CollectUrl()
        {
            var ShpNameCode = RouteData.Values["shpName"].ToString();
            _shpView = MyLibrary.Shp_Bus.GetShp(ShpNameCode);
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