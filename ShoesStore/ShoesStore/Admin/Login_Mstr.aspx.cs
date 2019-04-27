using System;
using System.Web.UI;
using ShoesStore.BusinessLogicLayer;

namespace ShoesStore.Admin
{
    public partial class Login_Mstr : Page
    {
        internal readonly Usr_BUS _usr = new Usr_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                var loginUsr = _usr.LoginAdmin(login_login.Value, login_pwd.Value);
                if (loginUsr == null) return;
                AdminSession.LoginAdmin = loginUsr;
                Response.Redirect("~/quan-tri");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                MyLibrary.Show("Sai tên đăng nhập hoặc mật khẩu");
            }
        }
    }
}