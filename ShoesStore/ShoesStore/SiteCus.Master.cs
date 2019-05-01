using System;
using System.Web.UI;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore
{
    public partial class SiteCus : MasterPage
    {
        internal readonly Usr_BUS _usr = new Usr_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTenNguoiDung();
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            if (WebSession.LoginCus != null)
            {
               
            }
            else
            {
                Response.Redirect("/");
            }
        }

        public void LoadTenNguoiDung()
        {
            lbXinChao.Text = "Chào, " + (WebSession.LoginUsr as Usr)?.UsrName;
        }
    }
}