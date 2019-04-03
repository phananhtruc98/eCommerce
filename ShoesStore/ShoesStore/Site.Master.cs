using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.Interfaces.MasterPage;
using ShoesStore.Interfaces.Pages;
using ShoesStore.MyExtensions;
using Utilities;

namespace ShoesStore
{
    public partial class SiteMaster : MasterPage, IMaster
    {
        internal ProCat_BUS _proCat = new ProCat_BUS();
        private ProBrand_BUS _proBrand = new ProBrand_BUS();
        private Usr_BUS _usr = new Usr_BUS();
        private Cart_BUS _cart = new Cart_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProBrand pb=new ProBrand()
                {
                    BrandName = "HELLO"
                };
                _proBrand.Insert(pb);
            }
        }

        private void Page_Init(object sender, EventArgs e)
        {
            if (CheckLoginSession())
            {
                usr_login.Visible = false;
                usr_register.Visible = false;
                lbAccount.Text = $"Chào {(WebSession.LoginUsr as Usr).UsrName}";
                usr_logout.Visible = true;
            }


        }

        protected void rptProCat_Init(object sender, EventArgs e)
        {

            rptProCat.DataSource = _proCat.GetAll();
            rptProCat.DataBind();
        }

        protected void rptProBrand_Init(object sender, EventArgs e)
        {

            rptProBrand.DataSource = _proBrand.GetAll().ToList();
            rptProBrand.DataBind();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Usr loginUsr = _usr.Login(login_login.Value, login_pwd.Value);
                if (loginUsr == null) return;
                WebSession.LoginUsr = loginUsr;
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }



        }

        public bool IsValidLogin()
        {
            throw new NotImplementedException();
        }

        public bool IsValidRegister()
        {
            if (!Email.IsValidEmail(this.email.Value)) return false;
            //if (TextHelper.IsSpecialCharacters(this.username.Value)) return false;
            if (TextHelper.IsSpecialCharacters(this.login.Value)) return false;
            if (this.password.Value != this.re_password.Value) return false;

            return true;
        }

        public bool CheckLoginSession()
        {
            return (WebSession.LoginUsr == null) ? false : true;

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (!IsValidRegister()) return;
            Usr usr = new Usr()
            {
                UsrId = _usr.GetLastestId() + 1,
                UsrName = this.username.Value,
                Login = this.login.Value,
                Password = EncryptHelper.Encrypt(this.password.Value),
                DateAdd = DateTime.Now
            };
            if (_usr.IsExist(usr)) return;
            _usr.Insert(usr);
            _usr.CreateActCode(usr);


        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            WebSession.LoginUsr = null;
            Response.Redirect(Request.RawUrl);
        }
    }
}