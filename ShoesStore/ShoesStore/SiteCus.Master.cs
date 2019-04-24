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

        public void LoadTenNguoiDung()
        {
            lbXinChao.Text = "Chào, " + (WebSession.LoginUsr as Usr)?.UsrName;
        }
    }
}