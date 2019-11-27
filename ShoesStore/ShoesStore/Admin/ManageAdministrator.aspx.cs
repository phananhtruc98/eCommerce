using System;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using Utilities;
using Convert = System.Convert;

namespace ShoesStore.Admin
{
    public partial class Manage_Administrator : Page
    {
        private readonly Mstr_BUS mstr = new Mstr_BUS();
        private readonly MstrDet_BUS mstrDet_bus = new MstrDet_BUS();
        private readonly MstrRole_BUS mstrRole = new MstrRole_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();

        // Load bảng danh sách người quản trị
        private void BindDataGridView()
        {
            var rs = (from m in mstr.GetAll()
                join u in usr.GetAll() on m.MstrId equals u.UsrId
                join d in mstrDet_bus.GetAll() on m.MstrId equals d.MstrId
                join r in mstrRole.GetAll() on d.RoleId equals r.RoleId
                select m).Distinct();
            lvMaster.DataSource = rs.ToList();
            lvMaster.DataBind();
        }

        // Load bảng danh sách chức vụ
        private void BindDataGridViewMstrRole()
        {
            var rs = mstrRole.GetAll();
            gvMstrRole.DataSource = rs;
            gvMstrRole.DataBind();
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            CreateAdministrator();
        } 
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }
        public void CreateAdministrator()
        {
            var mstr = (Mstr) AdminSession.LoginAdmin;
            var mstrUsr = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mstr.MstrId);
            var roleid = mstrUsr.Mstr.MstrDet.Any(d => d.RoleId == 1);
            if (roleid)
            {
                if (!Only_Admin_Create_Administrator.Visible)
                    Only_Admin_Create_Administrator.Visible = true;
                else Only_Admin_Create_Administrator.Visible = false;

                var rs = (from r in mstrRole.GetAll()
                    select r).ToList();
                var rsId = (from r in mstrRole.GetAll()
                    select r.RoleId).ToString().ToList();

                var ddlRoleName = (DropDownList) Only_Admin_Create_Administrator.FindControl("InsertRoleName");
                ddlRoleName.DataSource = rs;
                ddlRoleName.DataTextField = "RoleName";
                ddlRoleName.DataValueField = "RoleId";
                ddlRoleName.DataBind();
            }
            else
            {
                MyLibrary.Show("Bạn không đủ quyền để thực hiện chức năng này!!!");
            }
        }

        // Sorting
        protected void gvAdmin_Sorting(object sender, GridViewSortEventArgs e)
        {
            var sortExpression = e.SortExpression; //Tên cột
            var direction = MyLibrary.GetSortDirection(); //Chiều (lấy theo viewstate)
            var rs = mstr.Get_Admin_Info().OrderBy(sortExpression + direction).ToList();
            lvMaster.DataSource = rs.ToList();
            lvMaster.DataBind();
        }

        // thêm xóa sửa bảng chức vụ
        protected void gvMstrRole_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                gvMstrRole.EditIndex = rowIndex;
                BindDataGridViewMstrRole();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var result = (from c in mstrRole.GetAll()
                    where c.RoleId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                mstrRole.Delete(result);
                BindDataGridViewMstrRole();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvMstrRole.EditIndex = -1;
                BindDataGridViewMstrRole();
            }
            else if (e.CommandName == "UpdateRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var subId = Convert.ToInt32(e.CommandArgument);
                var roleName = ((TextBox) gvMstrRole.Rows[rowIndex].FindControl("EditRoleName")).Text;
                var result = (from c in mstrRole.GetAll()
                    where c.RoleId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                if (result != null)
                {
                    result.RoleName = roleName;
                    mstrRole.Update(result);
                }

                gvMstrRole.EditIndex = -1;
                BindDataGridViewMstrRole();
            }
            else if (e.CommandName == "InsertRow")
            {
                var roleName = ((TextBox) gvMstrRole.FooterRow.FindControl("InsertRoleName")).Text;
                if (roleName == "") return;
                var newSub = new MstrRole {RoleName = roleName};
                mstrRole.Insert(newSub);
                BindDataGridViewMstrRole();
            }
        }
        public bool IsExists(string Login)
        {
            var kq = true;
            var data = (from u in usr.GetAll()
                where u.Login == Login
                select u.Login).ToList().Count;
            if (data == 0) kq = false;
            return kq;
        }


        // Thêm quản trị viên
        protected void lbtnTao_Click(object sender, EventArgs e)
        {
            var Avatar = "";
            var fileInsert = (FileUpload) Only_Admin_Create_Administrator.FindControl("fupava");
            var UsrName = (Only_Admin_Create_Administrator.FindControl("txtUsrName") as TextBox).Text;
            var Phone = (Only_Admin_Create_Administrator.FindControl("txtPhone") as TextBox).Text;
            var Address = (Only_Admin_Create_Administrator.FindControl("txtAddress") as TextBox).Text;
            var Email = (Only_Admin_Create_Administrator.FindControl("txtEmail") as TextBox).Text;
            var Login = (Only_Admin_Create_Administrator.FindControl("txtLogin") as TextBox).Text;
            var Password = (Only_Admin_Create_Administrator.FindControl("txtPassword") as TextBox).Text;
            var Repassword = (Only_Admin_Create_Administrator.FindControl("txtRepassword") as TextBox).Text;
            var DateAdd = DateTime.Now;
            var ddlRoleName = (DropDownList) Only_Admin_Create_Administrator.FindControl("InsertRoleName");

            if (fileInsert.HasFile)
            {
                var fname = fileInsert.FileName;
                var fpath = Server.MapPath("/Admin/Images/avatar/");
                fpath = fpath + @"/" + fileInsert.FileName;
                var getext = Path.GetExtension(fileInsert.PostedFile.FileName);
                var filename = Path.GetFileNameWithoutExtension(fileInsert.PostedFile.FileName);
                Avatar = filename;
                var strFilePath = filename + getext;
                if (getext != ".JPEG" && getext != ".jpeg" && getext != ".JPG" && getext != ".jpg" &&
                    getext != ".png" && getext != ".tif" && getext != ".tiff")
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "successfull",
                        "alert('Please upload only jpeg, jpg,png,tif,tiff'); window.location = 'ParivarRegistration.aspx';",
                        true);
                }
                else
                {
                    fileInsert.SaveAs(Server.MapPath(@"~/Admin/Images/avatar/" + strFilePath));
                    ViewState["fname"] = fname;
                    ViewState["fPath"] = @"~/Admin/Images/avatar/" + strFilePath;
                }
            }

            if (Password != Repassword) MyLibrary.Show("Nhập lại mật khẩu không đúng!");
            if (!MyLibrary.IsValidEmailAddress(Email))
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Email chưa đúng')",
                    true);
                return;
            }

            try
            {
                var result = new Usr
                {
                    Password = EncryptHelper.Encrypt(Password),
                    UsrName = UsrName,
                    Address = Address,
                    Login = Login,
                    Email = Email,
                    Phone = Phone,
                    DateEdit = null,
                    Active = true,
                    Avatar = fileInsert.FileName,
                    DateAdd = DateTime.Now
                };
                usr.Insert(result);
                var rs1 = new Mstr
                {
                    MstrId = usr.GetLastestId()
                };
                mstr.Insert(rs1);
                var mstrDet = new MstrDet
                {
                    MstrId = usr.GetLastestId(),
                    RoleId = ddlRoleName.SelectedIndex + 1,
                    AddDate = DateTime.Now,
                    AddBy = Master.UsrId1
                };

                mstrDet_bus.Insert(mstrDet);
                BindDataGridView();
            }

            catch (Exception)
            {
                MyLibrary.Show("Tên đăng nhập đã tồn tại");
            }
        }

        protected void lvMaster_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Detail")
            {
                var UsrId = int.Parse(e.CommandArgument.ToString());
                Response.Redirect("/Admin/Usr_Det.aspx?UsrId=" + UsrId);
            }
        }

        protected void lvMaster_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindDataGridView();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataGridView();
                BindDataGridViewMstrRole();
            }
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in MyLibrary.Mstr_BUS.GetAll().ToList()
                where a.MstrId.ToString().ContainsEx(search_key)
                      || a.Usr.UsrName.ContainsEx(search_key)
                      || a.MstrDet.Select(x => x.MstrRole.RoleName).FirstOrDefault().ContainsEx(search_key)
                      || a.Usr.Email.ContainsEx(search_key)
                      || a.Usr.DateAdd != null && a.Usr.DateAdd.ToString().ContainsEx(search_key)
                select a).ToList();
            lvMaster.DataSource = rs;
            lvMaster.DataBind();
        }
    }
}