using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.WebControls;

using System.Collections.Specialized;
using System.ComponentModel;
using System.IO;
using System.Net.Http;
using System.Text;
using Flurl;
using ShoesStore.Customer;

namespace ShoesStore.UserControls
{

    public partial class UcPro : System.Web.UI.UserControl
    {
        private Pro_BUS _pro = new Pro_BUS();


        public RepeaterTable RptPro
        {
            get => rptPro;
        }

        public int PageSize
        {
            set { rptPro.PageSize = value; }
        }

        public int GetCurrent()
        {
            return rptPro.Items.Count;
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Page.LoadComplete += Page_LoadComplete;
            }


        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            List<int> listPage = new List<int>();

            for (int i = 1; i <= rptPro.PageTotal; i++)
                listPage.Add(i);

            rptProPage.DataSource = listPage;
            rptProPage.DataBind();
        }


        protected void MyBtnHandler(Object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            switch (btn.CommandName)
            {
                case "ThisBtnClick":

                    int page = Convert.ToInt32(btn.CommandArgument);
                    rptPro.PageCurrent = page;
                    rptPro.DataBind();
                    break;
                case "ThatBtnClick":

                    break;
            }
        }

        protected void rptProPage_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
            if (e.Item.ItemType == ListItemType.Footer)
            {
                LinkButton btnPagingLast =  (LinkButton)e.Item.FindControl("btnPagingLast");
                btnPagingLast.CommandArgument = rptProPage.Items.Count+"";

            }
        }
    }
}