using ShoesStore.DataAccessLogicLayer;
using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace ShoesStore.Customer
{
    public partial class CusHome : Page
    {
        string avaimgstr = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            LoadThongTin();

        }
        public void LoadThongTin()
        {
            Usr usr = (Usr)WebSession.LoginUsr;
            Usr usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
            lblUsrName.Text = usr1.UsrName;
            lblAddress.Text = usr1.Address;
            avaimgstr = usr1.Avatar;
            lblEmail.Text = usr1.Email;
            lblPhone.Text = usr1.Phone;
            avaimg.Attributes["src"] = "/Admin/images/avatar/" + usr1.Avatar;
        }
        protected void lbtnLuu_Click(object sender, EventArgs e)
        {
            Usr usr = (Usr)WebSession.LoginUsr;
            Usr usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
            Usr rs1 = (from c in Master._usr.GetAll()
                       where c.UsrId == usr1.UsrId
                       select c).FirstOrDefault();
            if (fupava.HasFile)
            {
                string fname = fupava.FileName;
                string fpath = Server.MapPath("/Admin/Images/avatar/");
                fpath = fpath + @"/" + fupava.FileName;
                string getext = Path.GetExtension(fupava.PostedFile.FileName);
                string filename = Path.GetFileNameWithoutExtension(fupava.PostedFile.FileName);
                string strFilePath = filename + getext;
                avaimgstr = strFilePath;

                if (getext != ".JPEG" && getext != ".jpeg" && getext != ".JPG" && getext != ".jpg" && getext != ".png" && getext != ".tif" && getext != ".tiff")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Chọn ảnh!!')", true);
                    return;
                }
                else
                {
                    fupava.SaveAs(Server.MapPath(@"~/Admin/Images/avatar/" + strFilePath));
                    ViewState["fname"] = fname;
                    ViewState["fPath"] = @"~/Admin/Images/avatar/" + strFilePath;
                    avaimg.Attributes["src"] = "/Admin/images/avatar/" + avaimgstr;
                    rs1.Avatar = avaimgstr;
                }
               
            }
            else if (avaimgstr == usr1.Avatar)
            {
                avaimgstr = usr1.Avatar;
            }
            rs1.UsrName = txtUsrName.Text;
            rs1.Address = txtAddress.Text;
            rs1.Phone = txtPhone.Text;
            rs1.Email = txtEmail.Text;
            rs1.DateEdit = DateTime.Now;
            rs1.DateAdd = usr1.DateAdd;
            rs1.Active = usr1.Active;
            rs1.Login = usr1.Login;
            rs1.Password = usr1.Password;
            
            Master._usr.Update(rs1);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Cập nhật thành công')", true);
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
            fupava.Visible = false;
            Response.Redirect(Request.RawUrl);

        }

        protected void lbtnHuy_Click(object sender, EventArgs e)
        {
            fupava.Visible = true;

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

        protected void lblThaydoi_Click(object sender, EventArgs e)
        {
            Usr usr = (Usr)WebSession.LoginUsr;
            Usr usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
            fupava.Visible = true;

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
    }
}