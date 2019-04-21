﻿using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Utilities;

namespace ShoesStore.Merchant
{
    public partial class Merchant1 : System.Web.UI.MasterPage
    {
        private readonly Mer_BUS mer_BUS = new Mer_BUS();

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
        int UsrId = 0;
        string UsrName = "";
        string Address = "";
        string Avatar = "";
        string Email = "";
        string Phone = "";
        string login1 = "";
        string password1 = "";

        public int UsrId1 { get => UsrId; set => UsrId = value; }
        public string UsrName1 { get => UsrName; set => UsrName = value; }
        public string Address1 { get => Address; set => Address = value; }
        public string Avatar1 { get => Avatar; set => Avatar = value; }
        public string Email1 { get => Email; set => Email = value; }
        public string Phone1 { get => Phone; set => Phone = value; }
        public string Login { get => login1; set => login1 = value; }
        public string Password { get => password1; set => password1 = value; }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (MerchantSession.LoginMerchant != null)
            {
                Mer mer = (Mer)MerchantSession.LoginMerchant;
                Usr merUsr = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
                UsrId = merUsr.UsrId;
                UsrName = merUsr.UsrName;
                Address = merUsr.Address;
                Avatar = merUsr.Avatar;
                Email = merUsr.Email;
                Phone = merUsr.Phone;
                login1 = merUsr.Login;
                password1 = merUsr.Password;
                string avaImg = Avatar;
                lbAccount.Text = $"Chào " + UsrName; 
                //avaImg1.Attributes["src"] = "/Merchant/images/avatar/" + avaImg;
                
                var rs = (from m in mer_BUS.GetAll()
                          where m.MerId == UsrId
                          select new
                          {
                              MerId = m.MerId
                          }).FirstOrDefault();
                //lbrolename.Text = rs.MerId.ToString();
            }
            else
            {
                Response.Redirect("~/nguoi-dung/dang-nhap");
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

        



        
        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            WebSession.LoginUsr = null;
            Response.Redirect(Request.RawUrl);
        }

        

    }
}