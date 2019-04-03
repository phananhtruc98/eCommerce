using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.Interfaces.Pages;
using Utilities;

namespace ShoesStore
{
    public partial class SiteMaster : MasterPage, IMaster
    {
        public readonly ProCat_BUS _proCat = new ProCat_BUS();
        private readonly ProBrand_BUS _proBrand = new ProBrand_BUS();
        private readonly Usr_BUS _usr = new Usr_BUS();

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
                lbAccount.Text = $"Chào {(WebSession.LoginUsr as Usr)?.UsrName}";
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
            if (!Email.IsValidEmail(email.Value)) return false;
            //if (TextHelper.IsSpecialCharacters(this.username.Value)) return false;
            if (TextHelper.IsSpecialCharacters(login.Value)) return false;
            return password.Value == re_password.Value;
        }

        public bool CheckLoginSession()
        {
            return (WebSession.LoginUsr != null);

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (!IsValidRegister()) return;
            var usr = new Usr()
            {
                UsrId = _usr.GetLastestId() + 1,
                UsrName = username.Value,
                Login = login.Value,
                Password = EncryptHelper.Encrypt(password.Value),
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