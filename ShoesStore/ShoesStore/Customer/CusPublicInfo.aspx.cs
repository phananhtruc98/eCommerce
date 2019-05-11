using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class CusPublicInfo : System.Web.UI.Page
    {
        protected Cus _cus;
        protected void Page_Load(object sender, EventArgs e)
        {
            CollectUrl();
            UcCusCmt.Cus = _cus;
        }
        private void CollectUrl()
        {
            string cusLogin = RouteData.Values["CusLogin"].ToString();
            _cus = MyLibrary.Cus_BUS.GetAll().FirstOrDefault(m => m.Usr.Login.ToLower() == cusLogin.ToLower());
        }
    }
}