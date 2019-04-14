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
        private readonly MstrDet_BUS mstrDet = new MstrDet_BUS();
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
                      join d in mstrDet.GetAll() on m.MstrId equals d.MstrId
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
                MstrDet mstrDetDel = mstrDet.GetAll().FirstOrDefault(m => m.MstrId == System.Convert.ToInt32(e.CommandArgument));

                Mstr mstrDel = mstr.GetAll().FirstOrDefault(m => m.MstrId == System.Convert.ToInt32(e.CommandArgument));

                Usr usrDel = (from c in usr.GetAll()
                              where c.UsrId == System.Convert.ToInt32(e.CommandArgument)
                              select c).FirstOrDefault();
                mstrDet.Delete(mstrDetDel);
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
                string Password = EncryptHelper.Encrypt(((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditPassword")).Text);
                string AddBy = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditAddBy")).Text;
                int RoleId = Int32.Parse(((Label)gvAdmin.Rows[rowIndex].FindControl("RoleID_Present")).Text);
                string Address = ((TextBox)gvAdmin.Rows[rowIndex].FindControl("EditAddress")).Text;
                // SỬA CODE Ở ĐÂY1
                Usr result = (from c in usr.GetAll()
                              where c.UsrId == System.Convert.ToInt32(e.CommandArgument)
                              select c).FirstOrDefault();
                if (result != null)
                {
                    result.Password = Password;
                    result.UsrName = UsrName;
                    result.Address = Address;
                    usr.Update(result);
                }
                MstrDet mstrdet = (from c in mstrDet.GetAll()
                                    where c.MstrId == System.Convert.ToInt32(e.CommandArgument)
                                    && c.RoleId == RoleId
                                    select c).FirstOrDefault();
                if (mstrdet != null)
                {
                    mstrdet.AddBy = Int32.Parse(AddBy);
                    mstrDet.Update(mstrdet);
                }
                gvAdmin.EditIndex = -1;
                BindDataGridView();
            }
            //else if (e.CommandName == "InsertRow")
            //{
            //    // SỬA CODE Ở ĐÂY
            //    string dateAdd = DateTime.Now.ToString();
            //    string usrAdd = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertUsrAdd")).Text;
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
    }
}

