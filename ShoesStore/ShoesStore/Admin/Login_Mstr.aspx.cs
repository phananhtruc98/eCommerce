using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;

namespace ShoesStore.Admin
{
    public partial class Login_Mstr : System.Web.UI.Page
    {

        internal readonly Usr_BUS _usr = new Usr_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Mstr loginUsr = _usr.LoginAdmin(login_login.Value, login_pwd.Value);
                if (loginUsr == null) return;
                AdminSession.LoginAdmin = loginUsr;
                Response.Redirect("~/quan-tri");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }
        }
        
    }
}