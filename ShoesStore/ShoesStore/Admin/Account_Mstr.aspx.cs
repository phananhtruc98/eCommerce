using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;
using Utilities;

namespace ShoesStore.Admin
{
    public partial class Account_Mstr : Page
    {
        private int accountId;
        private string avaimg = "";

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {
        }

        protected void lbtnHuy_Click(object sender, EventArgs e)
        {
        }

        protected void lbtnLuu_Click(object sender, EventArgs e)
        {
            var mstr = (Mstr) AdminSession.LoginAdmin;
            var mstrUsr = Master.usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mstr.MstrId);
            var rs1 = (from c in Master.usr_BUS.GetAll()
                where c.UsrId == mstrUsr.UsrId
                select c).FirstOrDefault();
            if (fupava.HasFile) rs1.Avatar = fupava.FileName;
            rs1.UsrName = txtUsrName.Text;
            rs1.Address = txtAddress.Text;
            rs1.Phone = txtPhone.Text;
            rs1.Email = txtEmail.Text;
            rs1.DateEdit = DateTime.Now;
            rs1.DateAdd = mstrUsr.DateAdd;
            rs1.Active = mstrUsr.Active;
            rs1.Login = mstrUsr.Login;
            rs1.Password = mstrUsr.Password;
            Master.usr_BUS.Update(rs1);
            Response.Redirect(Request.RawUrl);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Cập nhật thành công')",
                true);
        }

        protected void lbtnSave_Click(object sender, EventArgs e)
        {
            var mstr = (Mstr) AdminSession.LoginAdmin;
            var mstrUsr = Master.usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mstr.MstrId);
            var rs1 = (from c in Master.usr_BUS.GetAll()
                where c.UsrId == mstrUsr.UsrId
                select c).FirstOrDefault();
            if (EncryptHelper.Encrypt(txtPasswordOld.Text) == rs1.Password)
            {
                if (txtPassword.Text == txtRePassword.Text)
                {
                    rs1.Password = EncryptHelper.Encrypt(txtPassword.Text);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage",
                        "alert('Mật khẩu không khớp!!! Xin nhập lại')", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage",
                    "alert('Mật khẩu không đúng!!! Xin nhập lại')", true);
                return;
            }

            rs1.UsrName = mstrUsr.UsrName;
            rs1.Address = mstrUsr.Address;
            rs1.Phone = mstrUsr.Phone;
            rs1.Email = mstrUsr.Email;
            rs1.DateEdit = DateTime.Now;
            rs1.DateAdd = mstrUsr.DateAdd;
            rs1.Active = mstrUsr.Active;
            rs1.Login = mstrUsr.Login;
            rs1.Password = mstrUsr.Password;
            Master.usr_BUS.Update(rs1);
            Response.Redirect(Request.RawUrl);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Cập nhật thành công')",
                true);
        }

        public void LoadThongTin()
        {
            var mstr = (Mstr) AdminSession.LoginAdmin;
            var mstrUsr = Master.usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mstr.MstrId);
            accountId = mstrUsr.UsrId;
            txtUsrName.Text = mstrUsr.UsrName;
            txtAddress.Text = mstrUsr.Address;
            avaimg = mstrUsr.Avatar;
            txtEmail.Text = mstrUsr.Email;
            txtPhone.Text = mstrUsr.Phone;
            txtLogin.Text = mstrUsr.Login;
            txtPassword.Text = mstrUsr.Password;
            upava.Attributes["src"] = MyLibrary.AdminImgPath(mstr);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) LoadThongTin();
        }
    }
}