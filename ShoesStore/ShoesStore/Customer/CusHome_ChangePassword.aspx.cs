using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Customer
{
    public partial class CusHome_ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void lblThaydoi_Click(object sender, EventArgs e)
        {
            Usr usr = (Usr)WebSession.LoginUsr;
            Usr usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
            
            lbtnLuu.Visible = true;
            lbtnHuy.Visible = true;
            lblThaydoi.Visible = false;

            txtLogin.Visible = true;
            txtPassword.Visible = true;
            txtNewPassword.Visible = true;
            txtRePassword.Visible = true;
            txtLogin.Text = usr1.Login;
            txtPassword.Text = usr1.Password;

            lblUsrName.Visible = false;
            lblPhone.Visible = false;
            lblEmail.Visible = false;
            lblAddress.Visible = false;

        }

        protected void lbtnLuu_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnHuy_Click(object sender, EventArgs e)
        {
            lblThaydoi.Visible = true;
            lbtnLuu.Visible = false;
            lbtnHuy.Visible = false;

            txtLogin.Visible = false;
            txtPassword.Visible = false;
            txtNewPassword.Visible = false;
            txtRePassword.Visible = false;
            lblLogin.Visible = true;
            lblPassword.Visible = true;
            lblNewPassword.Visible = true;
            lblRePassword.Visible = true;
        }
    }
}