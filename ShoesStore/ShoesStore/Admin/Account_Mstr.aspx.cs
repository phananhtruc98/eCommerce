using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Account_Mstr : System.Web.UI.Page
    {
        int accountId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadThongTin();
            }
        }

        public void LoadThongTin()
        {
            string avaimg = "";
            Mstr mstr = (Mstr)AdminSession.LoginAdmin;
            Usr mstrUsr = Master.usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mstr.MstrId);
            
            txtUsrName.Text = mstrUsr.UsrName;
            txtAddress.Text = mstrUsr.Address;
            avaimg = mstrUsr.Avatar;
            txtEmail.Text = mstrUsr.Email;
            txtPhone.Text = mstrUsr.Phone;
            txtLogin.Text = mstrUsr.Login;
            txtPassword.Text = mstrUsr.Password;
            
            
            upava.Attributes["src"] = "/Admin/images/avatar/" + Master.Avatar1 + ".jpg";
        }
    }
}