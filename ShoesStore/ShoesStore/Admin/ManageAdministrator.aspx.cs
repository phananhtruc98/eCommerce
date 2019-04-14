using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using ShoesStore.MyExtensions;
using ShoesStore.DataAccessLogicLayer;
using Utilities;

namespace ShoesStore.Admin
{
    public partial class Manage_Administrator : Page
    {
        string tmp = "";
        private readonly MstrRole_BUS mstrRole = new MstrRole_BUS();
        private readonly Mstr_BUS mstr = new Mstr_BUS();
        private readonly MstrDet_BUS mstrDet_bus = new MstrDet_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataGridView();
            }
        }

        private void BindDataGridView()
        {
            var rs = (from u in usr.GetAll()
                      join m in mstr.GetAll() on u.UsrId equals m.MstrId
                      join d in mstrDet_bus.GetAll() on m.MstrId equals d.MstrId
                      join r in mstrRole.GetAll() on d.RoleId equals r.RoleId
                      select new
                      {
                          UsrId = u.UsrId,
                          UsrName = u.UsrName,
                          RoleName = r.RoleName,
                          RoleId = r.RoleId,
                          Login = u.Login,
                          Password = u.Password,
                          Email = u.Email,
                          Address = u.Address,
                          Phone = u.Phone,
                          DateAdd = u.DateAdd,
                          DateEdit = u.DateEdit,
                          Active = u.Active,
                          AddBy = d.AddBy
                      }).ToList();
            gvAdmin.DataSource = rs;
            gvAdmin.DataBind();
        }

        // Btn Tìm kiếm 
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in mstr.Get_Admin_Info().ToList()
                      where a.UsrId.ToString().ContainsEx((search_key))
                            || a.UsrName.ContainsEx(search_key)
                            || a.RoleName.ContainsEx(search_key)
                            || a.Login.ContainsEx(search_key)
                            || a.Password.ContainsEx(search_key)
                            || a.Phone.ContainsEx(search_key)
                            || (a.DateAdd != null && a.DateAdd.ToString().ContainsEx(search_key))
                            || (a.DateAdd != null && a.DateEdit.ToString().ContainsEx(search_key))
                            || a.Address.ContainsEx(search_key)
                      select a).ToList();
            gvAdmin.DataSource = rs;
            gvAdmin.DataBind();
        }

        // Sorting
        protected void gvAdmin_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;//Tên cột
            string direction = MyLibrary.GetSortDirection();//Chiều (lấy theo viewstate)
            var rs = mstr.Get_Admin_Info().OrderBy(sortExpression + direction).ToList();
            gvAdmin.DataSource = rs.ToList();
            gvAdmin.DataBind();
        }

        // Ràng buộc + thêm xóa sửa
        protected void gvAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                gvAdmin.EditIndex = rowIndex;
                BindDataGridView();
            }
            else if (e.CommandName == "DeleteRow")
            {
                MstrDet mstrDetDel = mstrDet_bus.GetAll().FirstOrDefault(m => m.MstrId == System.Convert.ToInt32(e.CommandArgument));

                Mstr mstrDel = mstr.GetAll().FirstOrDefault(m => m.MstrId == System.Convert.ToInt32(e.CommandArgument));

                Usr usrDel = (from c in usr.GetAll()
                              where c.UsrId == System.Convert.ToInt32(e.CommandArgument)
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

                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                string UsrName = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditUsrName")).Text;
                string Login = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditLogin")).Text;
                string Phone = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditPhone")).Text;
                string Password = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditPassword")).Text;
                string AddBy = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditAddBy")).Text;
                int RoleId = Int32.Parse(((Label)gvAdmin.Rows[rowIndex].FindControl("RoleID_Present")).Text);
                string Address = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditAddress")).Text;
                string Email = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditEmail")).Text;
                string LoginOld = ((HiddenField)gvAdmin.Rows[rowIndex].FindControl("LoginOld")).Value;
                string PasswordOld = ((HiddenField)gvAdmin.Rows[rowIndex].FindControl("PasswordOld")).Value;
                bool Active = ((CheckBox)gvAdmin.Rows[rowIndex].FindControl("EditActive")).Checked;

                // kiểm tra password nếu thay đổi thì mới encrypt
                if (Password != PasswordOld)
                {
                    Password = EncryptHelper.Encrypt(Password);
                }
                // kiểm tra tồn tại login trùng thì ko được update
                if (Login != LoginOld)
                {
                    if (IsExists(Login))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bị trùng')", true);
                        return;
                    }
                }

                // update vô Usr trước
                Usr result = (from c in usr.GetAll()
                              where c.UsrId == System.Convert.ToInt32(e.CommandArgument)
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
                    usr.Update(result);
                }

                // Update vô MstrDet
                MstrDet mstrdet = (from c in mstrDet_bus.GetAll()
                                   where c.MstrId == System.Convert.ToInt32(e.CommandArgument)
                                   && c.RoleId == RoleId
                                   select c).FirstOrDefault();
                if (mstrdet != null)
                {
                    mstrdet.AddBy = Int32.Parse(AddBy);
                    mstrDet_bus.Update(mstrdet);
                }
                gvAdmin.EditIndex = -1;
                BindDataGridView();
            }
            else if (e.CommandName == "InsertRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                string UsrName = ((TextBox)gvAdmin.FooterRow.FindControl("InsertUsrName")).Text;
                string Login = ((TextBox)gvAdmin.FooterRow.FindControl("InsertLogin")).Text;
                string Phone = ((TextBox)gvAdmin.FooterRow.FindControl("InsertPhone")).Text;
                string Password = EncryptHelper.Encrypt(((TextBox)gvAdmin.FooterRow.FindControl("InsertPassword")).Text);
                string AddBy = ((TextBox)gvAdmin.FooterRow.FindControl("InsertAddBy")).Text;
                int RoleId = Int32.Parse(((DropDownList)gvAdmin.FooterRow.FindControl("InsertRoleName")).SelectedValue);
                string Address = ((TextBox)gvAdmin.FooterRow.FindControl("InsertAddress")).Text;
                string Email = ((TextBox)gvAdmin.FooterRow.FindControl("InsertEmail")).Text;
                bool Active = ((CheckBox)gvAdmin.FooterRow.FindControl("InsertActive")).Checked;

                if (UsrName == "")
                {
                    return;
                }
                if (AddBy == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Chưa thêm người thêm')", true);
                    return;
                }

                Usr result = new Usr
                {
                    Password = Password,
                    UsrName = UsrName,
                    Address = Address,
                    Login = Login,
                    Email = Email,
                    Phone = Phone,
                    DateEdit = DateTime.Now,
                    Active = Active
                };
                usr.Insert(result);
                Mstr mstr = new Mstr
                {
                    MstrId = usr.GetLastestId() + 1
                };

                MstrDet mstrDet = new MstrDet
                {
                    MstrId = usr.GetLastestId() + 1,
                    RoleId = RoleId,
                    AddDate = DateTime.Now,
                    AddBy = Int32.Parse(AddBy)
                };

                mstrDet_bus.Insert(mstrDet);
                BindDataGridView();
            }
            //else if (e.CommandName == "EInsertRow")
            //{
            //    string dateAdd = DateTime.Now.ToString();
            //    string usrAdd = ((TextBox)gvRcptSub.Controls[0].Controls[0].FindControl("EInsertUsrAdd")).Text;
            //    string usrEdit = null;
            //    if (usrEdit == null)
            //    {
            //        usrEdit = "0";
            //    }

            //    if (usrAdd == "")
            //    {
            //        return;
            //    }


            //    Rcpt rcpt1 = new Rcpt
            //    {
            //        DateAdd = DateTime.Now,
            //        DateEdit = null,
            //        UsrAdd = Int32.Parse(usrAdd),
            //        UsrEdit = null
            //    };

            //    rcpt.Insert(rcpt1);
            //    RcptSub newRcptSub = new RcptSub
            //    {
            //        RcptSubId = rcpt.getMaxRcptId()
            //    };

            //    rcptsub.Insert(newRcptSub);

            //    BindGridViewgvRcptSub();
            //}
        }

        protected void gvAdmin_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            var rs = (from r in mstrRole.GetAll()
                      select r).ToList();
            var rsId = (from r in mstrRole.GetAll()
                        select r.RoleId).ToString().ToList();
            if (e.Row.RowType == DataControlRowType.Footer && gvAdmin.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlRoleName = (DropDownList)e.Row.FindControl("InsertRoleName");
                ddlRoleName.DataSource = rs;
                ddlRoleName.DataTextField = "RoleName";
                ddlRoleName.DataValueField = "RoleId";
                ddlRoleName.DataBind();
            }

        }

        public bool IsExists(string Login)
        {
            bool kq = true;
            var data = (from u in usr.GetAll()
                        where u.Login == Login
                        select u.Login).ToList().Count;
            if (data == 0)
            {
                kq = false;
            }
            return kq;
        }
    }
}

