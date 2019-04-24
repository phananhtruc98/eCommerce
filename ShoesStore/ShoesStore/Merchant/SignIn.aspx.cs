using System;
using System.Web.UI;
using ShoesStore.BusinessLogicLayer;

namespace ShoesStore.Merchant
{
    public partial class SignIn : Page
    {
        internal readonly Usr_BUS _usr = new Usr_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                var loginUsr = _usr.LoginMerchant(login_login.Value, login_pwd.Value);
                if (loginUsr == null) return;
                MerchantSession.LoginMerchant = loginUsr;
                Response.Redirect("MerHome.aspx");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }
        }
    }
}