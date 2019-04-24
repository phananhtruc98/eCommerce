using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
namespace ShoesStore
{
    public partial class SiteCus : System.Web.UI.MasterPage
    {
        internal readonly Usr_BUS _usr = new Usr_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTenNguoiDung();
        }
        public void LoadTenNguoiDung()
        {
            lbXinChao.Text="Chào, " + (WebSession.LoginUsr as Usr)?.UsrName;
        }
    }
}