using System;
using System.Linq;
using System.Linq.Dynamic;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;
using Utilities;

namespace ShoesStore.Customer
{
    public partial class SanPham_ChiTiet : BasePage
    {
        protected Pro _proDet;
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CollectUrl();
                Bind_Slides();
            }
        }

        private void Bind_Slides()
        {
            rptProSlidePresent.DataSource = rptProSlideCarousel.DataSource = _proSlideImg.GetAll()
                .Where(m => m.ProId == _proDet.ProId && m.ShpId == _proDet.ShpId);
            rptProSlideCarousel.DataBind();
            rptProSlidePresent.DataBind();
        }
        private void CollectUrl()
        {
            _proDet = _pro.GetAll().ToList().FirstOrDefault(m =>
                TextHelper.UrlFriendly(m.Shp.ShpName) == RouteData.Values["shpName"].ToString()
                && TextHelper.UrlFriendly(m.ProName) == RouteData.Values["proName"].ToString());


        }

    }
}