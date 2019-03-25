using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Manage_Services : System.Web.UI.Page
    {
        Sub_BUS sub_BUS = new Sub_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridViewData();
            }
        }

        private void BindGridViewData()
        {
            gvSub.DataSource = sub_BUS.GetAll();
            gvSub.DataBind();
        }

        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                gvSub.EditIndex = rowIndex;
                BindGridViewData();
            }
            else if (e.CommandName == "DeleteRow")
            {
                Sub result = (from c in sub_BUS.GetAll()
                              where c.SubId == Convert.ToInt32(e.CommandArgument)
                              select c).FirstOrDefault();
                sub_BUS.Delete(result);
                BindGridViewData();
            }
            //else if (e.CommandName == "CancelUpdate")
            //{
            //    gvSub.EditIndex = -1;
            //    BindGridViewData();
            //}
            //else if (e.CommandName == "UpdateRow")
            //{
            //    int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

            //    int employeeId = Convert.ToInt32(e.CommandArgument);
            //    string name = ((TextBox)gvSub.Rows[rowIndex].FindControl("TextBox1")).Text;
            //    string gender = ((DropDownList)gvSub.Rows[rowIndex].FindControl("DropDownList1")).SelectedValue;
            //    string city = ((TextBox)gvSub.Rows[rowIndex].FindControl("TextBox3")).Text;

            //    EmployeeDataAccessLayer.UpdateEmployee(employeeId, name, gender, city);

            //    gvSub.EditIndex = -1;
            //    BindGridViewData();
            //}
            //else if (e.CommandName == "InsertRow")
            //{
            //    string name = ((TextBox)gvSub.FooterRow.FindControl("txtName")).Text;
            //    string gender = ((DropDownList)gvSub.FooterRow.FindControl("ddlGender")).SelectedValue;
            //    string city = ((TextBox)gvSub.FooterRow.FindControl("txtCity")).Text;

            //    EmployeeDataAccessLayer.InsertEmployee(name, gender, city);

            //    BindGridViewData();
            //}
        }
    }
}