using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;

namespace ShoesStore.UserControls
{
    public partial class UcPro : System.Web.UI.UserControl
    {   int numberOfObject = 1;
        private Pro_BUS _pro = new Pro_BUS();
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

            for (int i = 1; i <= (int) Math.Ceiling((double) rptPro.Items.Count / numberOfObject); i++)
                listPage.Add(i);
            rptPro.DataSource = _pro.GetAll().Skip(0).Take(numberOfObject);
            rptPro.DataBind();
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
                    rptPro.DataSource = _pro.GetAll().Skip(numberOfObject * (page-1)).Take(numberOfObject);
                    rptPro.DataBind();
                    break;
                case "ThatBtnClick":

                    break;
            }
        }

    }
}