using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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