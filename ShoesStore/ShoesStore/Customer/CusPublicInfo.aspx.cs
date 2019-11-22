using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class CusPublicInfo : Page
    {
        protected Cus _cus;

        private void CollectUrl()
        {
            var cusLogin = RouteData.Values["CusLogin"].ToString();
            _cus = MyLibrary.Cus_BUS.GetAll().FirstOrDefault(m => m.Usr.Login.ToLower() == cusLogin.ToLower());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CollectUrl();
            UcCusCmt.Cus = _cus;
            lbHoTen.Text = _cus.Usr.UsrName;
        }
    }
}