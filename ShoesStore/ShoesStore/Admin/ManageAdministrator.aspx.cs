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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataGridView();
                BindDataGridViewMstrRole();
            }
        }

// Load bảng danh sách người quản trị
        private void BindDataGridView()
        {
            var rs = (from u in usr.GetAll()
                join m in mstr.GetAll() on u.UsrId equals m.MstrId
                join d in mstrDet_bus.GetAll() on m.MstrId equals d.MstrId
                join r in mstrRole.GetAll() on d.RoleId equals r.RoleId
                select new
                {
                    u.UsrId,
                    u.UsrName,
                    r.RoleName,
                    r.RoleId,
                    u.Login,
                    u.Password,
                    u.Email,
                    u.Address,
                    u.Phone,
                    u.DateAdd,
                    u.DateEdit,
                    u.Active,
                    d.AddBy,
                    u.Avatar
                }).ToList();
//var rs = mstr.GetAll();
            gvAdmin.DataSource = rs;
            gvAdmin.DataBind();
        }

// Load bảng danh sách chức vụ
        private void BindDataGridViewMstrRole()
        {
            var rs = mstrRole.GetAll();
            gvMstrRole.DataSource = rs;
            gvMstrRole.DataBind();
        }

// Btn Tìm kiếm 
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in mstr.Get_Admin_Info().ToList()
                where a.UsrId.ToString().ContainsEx(search_key)
                      || a.UsrName.ContainsEx(search_key)
                      || a.RoleName.ContainsEx(search_key)
                      || a.Login.ContainsEx(search_key)
                      || a.Password.ContainsEx(search_key)
                      || a.Phone.ContainsEx(search_key)
                      || a.DateAdd != null && a.DateAdd.ToString().ContainsEx(search_key)
                      || a.DateAdd != null && a.DateEdit.ToString().ContainsEx(search_key)
                      || a.Address.ContainsEx(search_key)
                select a).ToList();
            gvAdmin.DataSource = rs;
            gvAdmin.DataBind();
        }

// Sorting
        protected void gvAdmin_Sorting(object sender, GridViewSortEventArgs e)
        {
            var sortExpression = e.SortExpression; //Tên cột
            var direction = MyLibrary.GetSortDirection(); //Chiều (lấy theo viewstate)
            var rs = mstr.Get_Admin_Info().OrderBy(sortExpression + direction).ToList();
            gvAdmin.DataSource = rs.ToList();
            gvAdmin.DataBind();
        }

// Ràng buộc + thêm xóa sửa
        protected void gvAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                gvAdmin.EditIndex = rowIndex;
                BindDataGridView();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var mstrDetDel = mstrDet_bus.GetAll()
                    .FirstOrDefault(m => m.MstrId == Convert.ToInt32(e.CommandArgument));
                var mstrDel = mstr.GetAll().FirstOrDefault(m => m.MstrId == Convert.ToInt32(e.CommandArgument));
                var usrDel = (from c in usr.GetAll()
                    where c.UsrId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                mstrDet_bus.Delete(mstrDetDel);
                mstr.Delete(mstrDel);
                usr.Delete(usrDel);
                BindDataGridView();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvAdmin.EditIndex = -1;
                BindDataGridView();
            }
            else if (e.CommandName == "UpdateRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var file = (FileUpload) gvAdmin.Rows[rowIndex].FindControl("fuploadEdit");
                var UsrName = ((TextBox) gvAdmin.Rows[rowIndex].FindControl("EditUsrName")).Text;
                var Login = ((TextBox) gvAdmin.Rows[rowIndex].FindControl("EditLogin")).Text;
                var Phone = ((TextBox) gvAdmin.Rows[rowIndex].FindControl("EditPhone")).Text;
                var Password = ((TextBox) gvAdmin.Rows[rowIndex].FindControl("EditPassword")).Text;
                var RoleId = int.Parse(((Label) gvAdmin.Rows[rowIndex].FindControl("RoleID_Present")).Text);
                var Address = ((TextBox) gvAdmin.Rows[rowIndex].FindControl("EditAddress")).Text;
                var Email = ((TextBox) gvAdmin.Rows[rowIndex].FindControl("EditEmail")).Text;
                var LoginOld = ((HiddenField) gvAdmin.Rows[rowIndex].FindControl("LoginOld")).Value;
                var PasswordOld = ((HiddenField) gvAdmin.Rows[rowIndex].FindControl("PasswordOld")).Value;
                var Active = ((CheckBox) gvAdmin.Rows[rowIndex].FindControl("EditActive")).Checked;
                var Avatar = "";
                var avaold = (HiddenField) gvAdmin.Rows[rowIndex].FindControl("EditAvatar");
                var AvatarOld = "";
                if (avaold == null)
                    AvatarOld = "";
                else
                    AvatarOld = avaold.Value;
                if (file.HasFile)
                {
                    var fname = file.FileName;
                    var fpath = Server.MapPath("/Admin/Images/avatar/");
                    fpath = fpath + @"/" + file.FileName;
                    var getext = Path.GetExtension(file.PostedFile.FileName);
                    var filename = Path.GetFileNameWithoutExtension(file.PostedFile.FileName);
                    var strFilePath = filename + getext;
                    Avatar = strFilePath;
                    if (getext != ".JPEG" && getext != ".jpeg" && getext != ".JPG" && getext != ".jpg" &&
                        getext != ".png" && getext != ".tif" && getext != ".tiff")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Chọn ảnh!!')",
                            true);
                        return;
                    }

                    file.SaveAs(Server.MapPath(@"~/Admin/Images/avatar/" + strFilePath));
                    ViewState["fname"] = fname;
                    ViewState["fPath"] = @"~/Admin/Images/avatar/" + strFilePath;
                }
                else if (Avatar == AvatarOld)
                {
                    Avatar = AvatarOld;
                }
                else if (Avatar == "")
                {
                    Avatar = "default.jpg";
                }

// kiểm tra password nếu thay đổi thì mới encrypt
                if (Password != PasswordOld) Password = EncryptHelper.Encrypt(Password);
// kiểm tra tồn tại login trùng thì ko được update
                if (Login != LoginOld)
                    if (IsExists(Login))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Bị trùng')",
                            true);
                        return;
                    }

// update vô Usr trước
                var result = (from c in usr.GetAll()
                    where c.UsrId == Convert.ToInt32(e.CommandArgument)
                    select c).FirstOrDefault();
                if (result != null)
                {
                    result.Password = Password;
                    result.UsrName = UsrName;
                    result.Address = Address;
                    result.Login = Login;
                    result.Email = Email;
                    result.Phone = Phone;
                    result.DateEdit = DateTime.Now;
                    result.Active = Active;
                    result.Avatar = Avatar;
                    usr.Update(result);
                }

// Update vô MstrDet
                var mstrdet = (from c in mstrDet_bus.GetAll()
                    where c.MstrId == Convert.ToInt32(e.CommandArgument)
                          && c.RoleId == RoleId
                    select c).FirstOrDefault();
                if (mstrdet != null)
                {
                    mstrdet.AddBy = Master.UsrId1;
                    mstrDet_bus.Update(mstrdet);
                }

                gvAdmin.EditIndex = -1;
                BindDataGridView();
                Response.Redirect(Request.RawUrl);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Thành công')", true);
            }
            else if (e.CommandName == "InsertRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var fileInsert = (FileUpload) gvAdmin.FooterRow.FindControl("fuploadInsert");
                var UsrName = ((TextBox) gvAdmin.FooterRow.FindControl("InsertUsrName")).Text;
                var Login = ((TextBox) gvAdmin.FooterRow.FindControl("InsertLogin")).Text;
                var Phone = ((TextBox) gvAdmin.FooterRow.FindControl("InsertPhone")).Text;
                var Password = EncryptHelper.Encrypt(((TextBox) gvAdmin.FooterRow.FindControl("InsertPassword")).Text);
                var AddBy = ((TextBox) gvAdmin.FooterRow.FindControl("InsertAddBy")).Text;
                var RoleId = int.Parse(((DropDownList) gvAdmin.FooterRow.FindControl("InsertRoleName")).SelectedValue);
                var Address = ((TextBox) gvAdmin.FooterRow.FindControl("InsertAddress")).Text;
                var Email = ((TextBox) gvAdmin.FooterRow.FindControl("InsertEmail")).Text;
                var Active = ((CheckBox) gvAdmin.FooterRow.FindControl("InsertActive")).Checked;
                if (UsrName == "" || Address == "" || Phone == "" || Email == "" || Password == "" || Login == "" ||
                    AddBy == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage",
                        "alert('Chưa nhập đủ thông tin')", true);
                    return;
                }

                var Avatar = "";
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

                if (Avatar == "") Avatar = "default";
                if (!MyLibrary.IsValidEmailAddress(Email))
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Email chưa đúng')",
                        true);
                    return;
                }

                var result = new Usr
                {
                    Password = Password,
                    UsrName = UsrName,
                    Address = Address,
                    Login = Login,
                    Email = Email,
                    Phone = Phone,
                    DateEdit = null,
                    Active = Active,
                    Avatar = Avatar,
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
                    RoleId = RoleId,
                    AddDate = DateTime.Now,
                    AddBy = Master.UsrId1
                };
                mstrDet_bus.Insert(mstrDet);
                BindDataGridView();
            }
        }

// Sắp xếp từng cột
        protected void gvAdmin_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            var rs = (from r in mstrRole.GetAll()
                select r).ToList();
            var rsId = (from r in mstrRole.GetAll()
                select r.RoleId).ToString().ToList();
            if (e.Row.RowType == DataControlRowType.Footer && gvAdmin.EditIndex == e.Row.RowIndex)
            {
                var ddlRoleName = (DropDownList) e.Row.FindControl("InsertRoleName");
                ddlRoleName.DataSource = rs;
                ddlRoleName.DataTextField = "RoleName";
                ddlRoleName.DataValueField = "RoleId";
                ddlRoleName.DataBind();
            }
        }

// Kiểm tra tên đăng nhặp tồn tại
        public bool IsExists(string Login)
        {
            var kq = true;
            var data = (from u in usr.GetAll()
                where u.Login == Login
                select u.Login).ToList().Count;
            if (data == 0) kq = false;
            return kq;
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

//Phân trang
        protected void gvAdmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAdmin.PageIndex = e.NewPageIndex;
            BindDataGridView();
        }
    }
}