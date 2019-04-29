using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Merchant
{
    public partial class SiteMerchant : MasterPage
    {
        internal readonly Usr_BUS _usr = new Usr_BUS();
        private static readonly string _actCode = "";
        private readonly Mer_BUS mer_BUS = new Mer_BUS();
        private string Address = "";
        private string Avatar = "";
        private string Email = "";
        private string login1 = "";
        private string password1 = "";
        private string Phone = "";
        public Usr_BUS usr_BUS = new Usr_BUS();
        private int UsrId;
        private string UsrName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void Page_Init(object sender, EventArgs e)
        {
            if (MerchantSession.LoginMerchant != null)
            {
                var mer = (Mer) MerchantSession.LoginMerchant;
                var merUsr = usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
                UsrId = merUsr.UsrId;
                UsrName = merUsr.UsrName;
                Address = merUsr.Address;
                Avatar = merUsr.Avatar;
                Email = merUsr.Email;
                Phone = merUsr.Phone;
                login1 = merUsr.Login;
                password1 = merUsr.Password;
                var avaImg = Avatar;
                Label1.Text = "Chào " + UsrName;
                avaImg2.Attributes["src"] = "/Merchant/images/avatar/" + avaImg;
            }
            else
            {
                Response.Redirect("~/merchant/dang-nhap");
            }
        }

        public void rptProCat_Init(object sender, EventArgs e)
        {
            rptProCat.DataSource = MyLibrary.ProCat_BUS.GetAll();
            rptProCat.DataBind();
        }

        public int GetCurrentCartItemsNumber()
        {
            return MyLibrary.CartDet_BUS.ListCartPreviewNumber();
        }

        protected void rptProBrand_Init(object sender, EventArgs e)
        {
            rptProBrand.DataSource = MyLibrary.ProBrand_BUS.GetAll().ToList();
            rptProBrand.DataBind();
        }

/*
protected void btnLogin_Click(object sender, EventArgs e)
{
try
{
Usr loginUsr = MyLibrary.Usr_BUS.Login(login_login.Value, login_pwd.Value);
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
*/
/*
public bool IsValidRegister()
{
if (!Email.IsValidEmail(email.Value)) return false;
//if (TextHelper.IsSpecialCharacters(this.username.Value)) return false;
if (TextHelper.IsSpecialCharacters(login.Value)) return false;
if (active_code.Value != _actCode) { return false; }
return password.Value == re_password.Value;
}
*/
/*
protected void btnSignUp_Click(object sender, EventArgs e)
{
if (!IsValidRegister()) return;
var usr = new Usr()
{
UsrId = MyLibrary.Usr_BUS.GetLastestId() + 1,
UsrName = username.Value,
Login = login.Value,
Password = EncryptHelper.Encrypt(password.Value),
DateAdd = DateTime.Now
};
if (MyLibrary.Usr_BUS.IsExist(usr)) { lbStatus.InnerText = "Đã tồn tại"; return; }
MyLibrary.Usr_BUS.Insert(usr);
MyLibrary.Cus_BUS.Insert(new Cus() { CusId = usr.UsrId });
MyLibrary.Usr_BUS.CreateActCode(usr);
Response.Redirect(Request.RawUrl);
}
*/
        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            MerchantSession.LoginMerchant = null;
            Response.Redirect("~/merchant/dang-nhap");
        }

        protected void lbtnCusHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/CusHome.aspx");
        }

        protected void lbtnAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/merchant/trang-thong-tin");
        }

/*
protected void btnActCodeSender_Click(object sender, EventArgs e)
{
RequiredEmail.Validate();
RegularExpressionValidator.Validate();
if (RegularExpressionValidator.IsValid && RequiredEmail.IsValid)
{
_actCode = TextHelper.RandomNumber(4);
Email.SendGmail("nomad1234vn@gmail.com", "ma8635047", email.Value, "Mã kích hoạt đăng ký",
$"Mã kích hoạt của bạn là {_actCode}");
Alert($"alert('Đã gửi mã kích hoạt đến {email.Value}')");
}
}
*/
        public void Alert(string message)
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "alertMessage", message, true);
        }

        protected void customValidator_ActivateCode_OnServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != _actCode)
                args.IsValid = false;
            else args.IsValid = true;
        }
    }
}