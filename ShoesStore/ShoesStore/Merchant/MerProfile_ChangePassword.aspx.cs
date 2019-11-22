using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;
using Utilities;

namespace ShoesStore.Merchant
{
    public partial class MerProfile_ChangePassword : Page
    {
        protected void lbtnHuy_Click(object sender, EventArgs e)
        {
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
            trMatKhauHienTai.Visible = false;
            trMatKhauMoi.Visible = false;
            trNhapLaiMatKhau.Visible = false;
        }

        protected void lbtnLuu_Click(object sender, EventArgs e)
        {
            var mer = (Mer) MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            var rs1 = (from c in MyLibrary.Usr_BUS.GetAll()
                where c.UsrId == usr1.UsrId
                select c).FirstOrDefault();
            if (EncryptHelper.Encrypt(txtPassword.Text) == rs1.Password)
            {
                if (txtNewPassword.Text == txtRePassword.Text)
                {
                    rs1.Password = EncryptHelper.Encrypt(txtNewPassword.Text);
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

            rs1.UsrName = usr1.UsrName;
            rs1.Address = usr1.Address;
            rs1.Phone = usr1.Phone;
            rs1.Email = usr1.Email;
            rs1.DateEdit = DateTime.Now;
            rs1.DateAdd = usr1.DateAdd;
            rs1.Active = usr1.Active;
            rs1.Login = usr1.Login;
            rs1.Password = usr1.Password;
            MyLibrary.Usr_BUS.Update(rs1);
            txtPassword.Visible = true;
            txtNewPassword.Visible = true;
            txtRePassword.Visible = true;
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Cập nhật thành công')",
                true);
        }

        public void LoadThongTin()
        {
            var mer = (Mer) MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            lblLogin.Text = usr1.Login;
            txtPassword.Visible = true;
            txtNewPassword.Visible = true;
            txtRePassword.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadThongTin();
        }
    }
}