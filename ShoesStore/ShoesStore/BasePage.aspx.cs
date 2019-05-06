﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;
using System.Linq;
using ShoesStore.WebControls;

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
            var strSwitchViewRouteName = "AspNet.FriendlyUrls.SwitchView";
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
                if (wc.Item1 is Repeater)
                {
                    var rptWc = (Repeater)wc.Item1;
                    switch (wc.Item2)
                    {
                        case TableName.Pro:
                            {
                                if (rptWc is RepeaterTable)
                                {
                                    var rptTable = (RepeaterTable)rptWc;
                                    rptWc.DataSource = MyLibrary.Pro_BUS.GetAllActive().Where(m => rptTable.ShpId == 0 || m.ShpId == rptTable.ShpId);
                                }
                                else
                                    rptWc.DataSource = MyLibrary.Pro_BUS.GetAllActive();
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
                        case TableName.ProColor:
                            {
                                rptWc.DataSource = MyLibrary.ProColor_BUS.GetAll();
                                break;
                            }
                    }

                    rptWc.DataBind();
                }
        }
    }
}