using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;
using ShoesStore.BusinessLogicLayer;

namespace ShoesStore
{


    public partial class BasePage : Page
    {
        public List<Tuple<Control, TableName>> listWc = new List<Tuple<Control, TableName>>();

        internal readonly ProCat_BUS _proCat = new ProCat_BUS();
        internal readonly ProBrand_BUS _proBrand = new ProBrand_BUS();
        internal readonly ProDet_BUS _proDet = new ProDet_BUS();
        internal readonly CartDet_BUS _cartDet = new CartDet_BUS();
        internal readonly Usr_BUS _usr = new Usr_BUS();
        internal readonly WebInfo_BUS _webInfo = new WebInfo_BUS();
        internal readonly WebSlide_BUS _webSlide = new WebSlide_BUS();
        internal readonly Pro_BUS _pro = new Pro_BUS();
        internal readonly ProColor_BUS _proColor = new ProColor_BUS();
        internal readonly ProSlide_BUS _proSlideImg = new ProSlide_BUS();
        internal readonly RcptBuyDet_BUS _rpcptBuyDet = new RcptBuyDet_BUS();
        internal  readonly Shp_BUS _shp = new Shp_BUS();
        protected virtual void Page_Load(object sender, EventArgs e)
        {
            // Determine current view
            var isMobile = WebFormsFriendlyUrlResolver.IsMobileView(new HttpContextWrapper(Context));
            var CurrentView = isMobile ? "Mobile" : "Desktop";

            // Determine alternate view
            var AlternateView = isMobile ? "Desktop" : "Mobile";

            string strSwitchViewRouteName = "AspNet.FriendlyUrls.SwitchView";
            var SwitchViewRoute = RouteTable.Routes;
            if (SwitchViewRoute == null)
            {
                // Friendly URLs is not enabled or the name of the switch view route is out of sync
                Visible = false;
                return;
            }
            // Create switch URL from the route, e.g. ~/__FriendlyUrls_SwitchView/Mobile?ReturnUrl=/Page
            var url = GetRouteUrl(strSwitchViewRouteName, new
            {
                view = AlternateView,
                __FriendlyUrls_SwitchViews = true
            });
            url += "?ReturnUrl=" + HttpUtility.UrlEncode(Request.RawUrl);
            var SwitchUrl = url;
        }

        public void Bind()
        {
            foreach (var wc in listWc)
            {
                if (wc.Item1 is Repeater)
                {
                    Repeater rptWc = (Repeater)wc.Item1;
                    switch (wc.Item2)
                    {
                        case TableName.Pro:
                            {
                                rptWc.DataSource = _pro.GetAll();
                                break;
                            }
                        case TableName.ProCat:
                            {
                                rptWc.DataSource = _proCat.GetAll();
                                break;
                            }
                        case TableName.ProBrand:
                            {
                                rptWc.DataSource = _proBrand.GetAll();
                                break;
                            }
                    }


                    rptWc.DataBind();
                }
            }
        }

    }
}