﻿using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using Utilities;

namespace ShoesStore.Merchant
{
    public partial class SignIn : Page
    {
        private static string _actCode = "";
        internal readonly Usr_BUS _usr = new Usr_BUS();

        public void Alert(string message)
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "alertMessage", message, true);
        }

        protected void btnActCodeSender_Click(object sender, EventArgs e)
        {
            RequiredEmail.Validate();
            RegularExpressionValidator.Validate();
            if (RegularExpressionValidator.IsValid && RequiredEmail.IsValid)
            {
                if (MyLibrary.Usr_BUS.GetBy(email.Value) != null)
                {
                    MyLibrary.ShowInUploadPannel("Email này đã được đăng ký");
                    return;
                }

                _actCode = TextHelper.RandomNumber(4);
                Email.SendGmail(email.Value, "Mã kích hoạt đăng ký",
                    $"Mã kích hoạt của bạn là {_actCode}");
                Alert($"alert('Đã gửi mã kích hoạt đến {email.Value}')");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                var loginUsr = _usr.LoginMerchant(login_login.Value, login_pwd.Value);
                if (loginUsr == null) return;
                MerchantSession.LoginMerchant = loginUsr;
                Response.Redirect("/nguoi-ban");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                MyLibrary.Show("Đăng nhập không chính xác");
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (!IsValidRegister()) return;
            var usr = new Usr
            {
                UsrId = MyLibrary.Usr_BUS.GetLastestId() + 1,
                UsrName = username.Value,
                Login = login.Value,
                Password = EncryptHelper.Encrypt(password.Value),
                DateAdd = DateTime.Now,
                Email = email.Value
            };

            if (MyLibrary.Usr_BUS.IsExist(usr))
            {
                lbStatus.InnerText = "Đã tồn tại";
                return;
            }

            MyLibrary.Usr_BUS.Insert(usr);
            MyLibrary.Mer_BUS.Insert(new Mer {MerId = usr.UsrId});
            MyLibrary.Usr_BUS.CreateActCode(usr);

            MyLibrary.ShowInUploadPannel("Bạn đã đăng ký thành công", Request.RawUrl);
        }

        protected void customValidator_ActivateCode_OnServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != _actCode)
                args.IsValid = false;
            else args.IsValid = true;
        }

        public bool IsValidRegister()
        {
            if (!Email.IsValidEmail(email.Value)) return false;
            //if (TextHelper.IsSpecialCharacters(this.username.Value)) return false;
            if (TextHelper.IsSpecialCharacters(login.Value)) return false;
            if (active_code.Value != _actCode) return false;
            return password.Value == re_password.Value;
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            WebSession.LoginUsr = null;
            Response.Redirect("/");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}