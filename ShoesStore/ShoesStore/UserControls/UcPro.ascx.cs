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
using System.IO;
using System.Net.Http;
using System.Text;
using Flurl;
using ShoesStore.Customer;

namespace ShoesStore.UserControls
{
    public class RemotePost
    {
        private System.Collections.Specialized.NameValueCollection Inputs = new System.Collections.Specialized.NameValueCollection();
        public string Url = "";
        public string Method = "post";
        public string FormName = "form1";
        public void Add(string name, string value)
        {
            Inputs.Add(name, value);
        }
        public void Post()
        {
            System.Web.HttpContext.Current.Response.Clear();
            System.Web.HttpContext.Current.Response.Write("");
            System.Web.HttpContext.Current.Response.Write(string.Format("", FormName));
            System.Web.HttpContext.Current.Response.Write(string.Format("", FormName, Method, Url));
            for (int i = 0; i < Inputs.Keys.Count; i++)
            {
                System.Web.HttpContext.Current.Response.Write(string.Format("", Inputs.Keys[i], Inputs[Inputs.Keys[i]]));
            }
            System.Web.HttpContext.Current.Response.Write("");
            System.Web.HttpContext.Current.Response.Write("");
            System.Web.HttpContext.Current.Response.End();
        }
    }
    public partial class UcPro : System.Web.UI.UserControl
    {
        private Pro_BUS _pro = new Pro_BUS();


        public RepeaterTable RptPro
        {
            get => rptPro;
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




        //protected void rptProPage_ItemCreated(object sender, RepeaterItemEventArgs e)
        //{
        //    ScriptManager scriptMan = ScriptManager.GetCurrent(this.Page);
        //    LinkButton btn = e.Item.FindControl("lbPage") as LinkButton;
        //    if(btn != null)
        //    {
        //        btn.Click += MyBtnHandler;
        //        scriptMan.RegisterAsyncPostBackControl(btn);
        //    }
        //}
        private static readonly HttpClient client = new HttpClient();

        protected void proImgLink_OnClick(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "GuiLink")
            {



                //LinkButton btnSender = (LinkButton)sender;
                //var catId = btnSender.Attributes["data-rider-catId"];
                //var proId = btnSender.Attributes["data-rider-proId"];
                //var shpId = btnSender.Attributes["data-rider-shpId"];
                //Context.Items["catId"] = catId;
                //Context.Items["proId"] = proId;
                //Context.Items["shpId"] = shpId;
                //Server.Transfer("customer/prodet.aspx", true);
                ////// Do something here
                //RemotePost myremotepost = new RemotePost();
                //myremotepost.Url = Url.Combine(HttpContext.Current.Request.Url.Authority, "/san-pham/", $"/{catId}/",
                //    $"/{proId}/");

                //myremotepost.Add("field1", "Huckleberry");
                //myremotepost.Add("field2", "Finn");
                //myremotepost.Post();
            }
        }


    }
}