using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ShoesStore.Interfaces.Pages;
using Utilities;

namespace ShoesStore
{
    public partial class SiteMaster : MasterPage, IMaster
    {
        internal readonly ProCat_BUS _proCat = new ProCat_BUS();
        internal readonly ProBrand_BUS _proBrand = new ProBrand_BUS();
        internal readonly Usr_BUS _usr = new Usr_BUS();
        internal readonly Cus_BUS _cus = new Cus_BUS();
        internal readonly WebInfo_BUS _webInfo = new WebInfo_BUS();
        internal readonly WebSlide_BUS _webSlide = new WebSlide_BUS();
        internal readonly Pro_BUS _pro = new Pro_BUS();
        internal readonly CartDet_BUS _cartDet = new CartDet_BUS();
        internal readonly Cart_BUS _cart = new Cart_BUS();
        private static string _actCode = "";

        private List<CartDet> _listCartDetPreview = new List<CartDet>();
        private Cart cusCart;


        public string SumCartDetPrice
        {
            get { return MyLibrary.ToFormatMoney(_cartDet.SumCartDetPrice()); }
        }
        public Cart CusCart
        {
            get
            {
                LoadCartPreview();
                return cusCart;
            }
        }
        public Repeater CartDetPreview
        {
            get
            {
                LoadCartPreview();
                return rptCartDetPreview;
            }
        }
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
                lbtnCusHome.Visible = true;
                LoadCartPreview();
                GetCurrentCartItemsNumber();
            }
        }

        public void rptProCat_Init(object sender, EventArgs e)
        {

            rptProCat.DataSource = _proCat.GetAll();
            rptProCat.DataBind();
        }


        public int GetCurrentCartItemsNumber()
        {
            if (_listCartDetPreview != null)
                return _listCartDetPreview.Count;
            return 0;
        }

        public void LoadCartPreview()
        {
            Cus cus = _cus.GetAll().FirstOrDefault(m => m.CusId == (WebSession.LoginUsr as Usr)?.UsrId);
            cusCart = _cart.GetAll().FirstOrDefault(m => cus != null && m.CusId == cus.CusId);
            _listCartDetPreview = _cartDet.GetAll().Where(m => cusCart != null && m.CartId == cusCart.CartId).ToList();
            rptCartDetPreview.DataSource = _listCartDetPreview;
            rptCartDetPreview.DataBind();
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
            if (active_code.Value != _actCode) {return false;}
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
            if (_usr.IsExist(usr)) {lbStatus.InnerText="Đã tồn tại";return;}
            _usr.Insert(usr);
            _cus.Insert(new Cus(){CusId = usr.UsrId});
            _usr.CreateActCode(usr);
            Response.Redirect(Request.RawUrl);



        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            WebSession.LoginUsr = null;
            Response.Redirect(Request.RawUrl);
        }

        protected void lbtnCusHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/CusHome.aspx");
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

                Alert($"alert('Đã gửi mã kích hoạt đến {email.Value}')");

            }
        }
        public void Alert(string message)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alertMessage", message, true);
        }
        protected void btnCartDetPreviewClose_OnCommand(object sender, CommandEventArgs e)
        {

            string[] primaryKeys = e.CommandArgument.ToString().Split(',');
            _cartDet.Delete(_cartDet.GetAll().FirstOrDefault(
                                m =>
                                    m.CartId == System.Convert.ToInt32(primaryKeys[0])
                                   && m.ShpId == System.Convert.ToInt32(primaryKeys[1])
                                    && m.ProId == System.Convert.ToInt32(primaryKeys[2])
                                    && m.ColorId == System.Convert.ToInt32(primaryKeys[3])
                                    && m.SizeId == System.Convert.ToInt32(primaryKeys[4])
            ));
            LoadCartPreview();
        }

        protected void customValidator_ActivateCode_OnServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != _actCode)
            {
                args.IsValid = false;
            }
            else args.IsValid = true;
        }
    }
}