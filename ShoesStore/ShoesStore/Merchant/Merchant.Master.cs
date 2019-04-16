using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using ShoesStore.Interfaces.Pages;
using Utilities;

namespace ShoesStore.Merchant
{
    public partial class Merchant1 : System.Web.UI.MasterPage
    {
        
        internal readonly ProCat_BUS _proCat = new ProCat_BUS();
        internal readonly ProBrand_BUS _proBrand = new ProBrand_BUS();
        internal readonly Usr_BUS _usr = new Usr_BUS();
        internal readonly WebInfo_BUS _webInfo = new WebInfo_BUS();
        internal readonly WebSlide_BUS _webSlide = new WebSlide_BUS();
        internal readonly Pro_BUS _pro = new Pro_BUS();
        private static string _actCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        private void Page_Init(object sender, EventArgs e)
        {
            if (WebSession.LoginUsr != null)
            {
                usr_login.Visible = false;
                usr_register.Visible = false;
                lbAccount.Text = $"Chào {(WebSession.LoginUsr as Usr)?.UsrName}";
                usr_logout.Visible = true;
            }
        }

        public void rptProCat_Init(object sender, EventArgs e)
        {
            
            rptProCat.DataSource = _proCat.GetAll();
            rptProCat.DataBind();
        }

        public HtmlForm FormMaster
        {
            set => formWebPage = value;
            get => formWebPage;
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
            if (active_code.Value != _actCode) return false;
            return password.Value == re_password.Value;
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
            Response.Redirect(Request.RawUrl);



        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            WebSession.LoginUsr = null;
            Response.Redirect(Request.RawUrl);
        }

        protected void btnActCodeSender_Click(object sender, EventArgs e)
        {
            RequiredEmail.Validate();
            RegularExpressionValidator.Validate();
            if (RegularExpressionValidator.IsValid && RequiredEmail.IsValid)
            {
                _actCode = TextHelper.RandomNumber(4);
                Email.SendGmail("nomad1234vn@gmail.com", "ma8635047", email.Value, "Mã kích hoạt đăng ký",
                    $"Mã kích hoạt của bạn là {_actCode}");
            }
        }

        }
    }