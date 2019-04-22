using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace ShoesStore
{


    public partial class BasePage : Page
    {
        public List<Tuple<Control, TableName>> listWc = new List<Tuple<Control, TableName>>();

  
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
                                rptWc.DataSource = MyLibrary.Pro_BUS.GetAll();
                                break;
                            }
                        case TableName.ProCat:
                            {
                                rptWc.DataSource = MyLibrary.ProCat_BUS.GetAll();
                                break;
                            }
                        case TableName.ProBrand:
                            {
                                rptWc.DataSource = MyLibrary.ProBrand_BUS.GetAll();
                                break;
                            }
                    }


                    rptWc.DataBind();
                }
            }
        }

    }
}