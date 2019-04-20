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
                lbtnCusHome.Visible = true;
                LoadCartPreview();
                GetCurrentCartItemsNumber();
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

        public void LoadCartPreview()
        {
            rptCartDetPreview.DataSource = MyLibrary.CartDet_BUS.ListCartPreview();
            rptCartDetPreview.DataBind();
        }

        protected void rptProBrand_Init(object sender, EventArgs e)
        {

            rptProBrand.DataSource = MyLibrary.ProBrand_BUS.GetAll().ToList();
            rptProBrand.DataBind();
        }

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

        public bool IsValidRegister()
        {
            if (!Email.IsValidEmail(email.Value)) return false;
            //if (TextHelper.IsSpecialCharacters(this.username.Value)) return false;
            if (TextHelper.IsSpecialCharacters(login.Value)) return false;
            if (active_code.Value != _actCode) { return false; }
            return password.Value == re_password.Value;
        }



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
            MyLibrary.CartDet_BUS.Delete(MyLibrary.CartDet_BUS.GetAll().FirstOrDefault(
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