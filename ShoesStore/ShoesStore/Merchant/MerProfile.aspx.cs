﻿using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Merchant
{
    public partial class MerProfile : Page
    {
        private string avaimgstr = "";


        protected void lblThaydoi_Click(object sender, EventArgs e)
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            lbtnLuu.Visible = true;
            lbtnHuy.Visible = true;
            lblThaydoi.Visible = false;
            txtUsrName.Visible = true;
            txtPhone.Visible = true;
            txtAddress.Visible = true;
            txtEmail.Visible = true;
            txtUsrName.Text = usr1.UsrName;
            txtPhone.Text = usr1.Phone;
            txtEmail.Text = usr1.Email;
            txtAddress.Text = usr1.Address;
            lblUsrName.Visible = false;
            lblPhone.Visible = false;
            lblEmail.Visible = false;
            lblAddress.Visible = false;
        }

        protected void lbtnHuy_Click(object sender, EventArgs e)
        {
            lblThaydoi.Visible = true;
            lbtnLuu.Visible = false;
            lbtnHuy.Visible = false;
            txtUsrName.Visible = false;
            txtPhone.Visible = false;
            txtAddress.Visible = false;
            txtEmail.Visible = false;
            lblUsrName.Visible = true;
            lblPhone.Visible = true;
            lblEmail.Visible = true;
            lblAddress.Visible = true;
        }

        protected void lbtnLuu_Click(object sender, EventArgs e)
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            var rs1 = (from c in MyLibrary.Usr_BUS.GetAll()
                       where c.UsrId == usr1.UsrId
                       select c).FirstOrDefault();
            avaimgstr = usr1.Avatar;
            rs1.UsrName = txtUsrName.Text;
            rs1.Address = txtAddress.Text;
            rs1.Phone = txtPhone.Text;
            rs1.Email = txtEmail.Text;
            rs1.DateEdit = DateTime.Now;
            rs1.DateAdd = usr1.DateAdd;
            rs1.Active = usr1.Active;
            rs1.Login = usr1.Login;
            rs1.Password = usr1.Password;
            MyLibrary.Usr_BUS.Update(rs1);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Cập nhật thành công')",
                true);
            lblThaydoi.Visible = true;
            lbtnLuu.Visible = false;
            lbtnHuy.Visible = false;
            txtUsrName.Visible = false;
            txtPhone.Visible = false;
            txtAddress.Visible = false;
            txtEmail.Visible = false;
            lblUsrName.Visible = true;
            lblPhone.Visible = true;
            lblEmail.Visible = true;
            lblAddress.Visible = true;
            Response.Redirect(Request.RawUrl);
        }


        public void LoadThongTin()
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            lblUsrName.Text = usr1.UsrName;
            lblAddress.Text = usr1.Address;
            avaimgstr = usr1.Avatar;
            lblEmail.Text = usr1.Email;
            lblPhone.Text = usr1.Phone;
            avaimg.Attributes["src"] = "/Admin/images/avatar/" + ((usr1.Avatar == null) ? "avatar-4.jpg" : usr1.Avatar);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadThongTin();
        }
    }
}