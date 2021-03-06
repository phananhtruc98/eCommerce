﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.WebControls;

namespace ShoesStore
{
    public partial class BasePage : Page
    {
        public List<Tuple<Control, TableName>> listWc = new List<Tuple<Control, TableName>>();

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

                                    var IsColor = rptTable.ColorIds == null || rptTable.ColorIds.Count == 0;
                                    var IsBrand = rptTable.BrandIds == null || rptTable.BrandIds.Count == 0;
                                    var IsProCat = rptTable.ProCatIds == null || rptTable.ProCatIds.Count == 0;
                                    var priceFrom = rptTable.FilterPriceFrom;
                                    var priceTo = rptTable.FilterPriceTo;


                                    IEnumerable<Pro> willSource = new List<Pro>();
                                    if (rptTable.SearchText != "")
                                        willSource = MyLibrary.Pro_BUS.GetAllActive()
                                            .Where(m => (rptTable.ShpId == 0 || m.ShpId == rptTable.ShpId) &&
                                                        m.ProName.ToLower().Contains(rptTable.SearchText.ToLower()));
                                    else
                                    {
                                        if (MyLibrary.Pro_BUS.GetAllActive() != null)
                                            willSource = MyLibrary.Pro_BUS.GetAllActive()
                                                .Where(m => (rptTable.ShpId == 0 || m.ShpId == rptTable.ShpId)
                                                            && (rptTable.SearchText != "" && m.ProName.ToLower()
                                                                    .Contains(rptTable.SearchText.ToLower()) ||
                                                                (IsBrand || rptTable.BrandIds.Contains(m.BrandId))
                                                                && (IsProCat || rptTable.ProCatIds.Contains(m.CatId)) &&
                                                                double.Parse(MyLibrary.Pro_BUS.GetPrice(m)) >= priceFrom &&
                                                                double.Parse(MyLibrary.Pro_BUS.GetPrice(m)) <= priceTo && m
                                                                    .ProDet
                                                                    .Any(color =>
                                                                        IsColor || rptTable.ColorIds.Contains(color.ColorId))));
                                    }

                                    rptWc.DataSource = rptTable.VFilterPro == 1 || rptTable.VFilterPro == 4
                                    ? willSource.OrderBy(rptTable.FuncFilter)
                                    : willSource.OrderByDescending(rptTable.FuncFilter);
                                }
                                else
                                {
                                    rptWc.DataSource = MyLibrary.Pro_BUS.GetAllActive();
                                }

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

                    //rptWc.DataBind();
                }
        }

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
    }
}