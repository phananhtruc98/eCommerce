using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI.WebControls;
namespace ShoesStore.Admin
{
    public partial class Manage_Services : System.Web.UI.Page
    {
        readonly Sub_BUS sub_BUS = new Sub_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
            else if (e.CommandName == "CancelUpdate")
            {
                gvSub.EditIndex = -1;
                BindGridViewData();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int subId = Convert.ToInt32(e.CommandArgument);
                string subContent = ((TextBox)gvSub.Rows[rowIndex].FindControl("EditSubContent")).Text;
                string durDay = ((TextBox)gvSub.Rows[rowIndex].FindControl("EditDurDay")).Text;
                string price = ((TextBox)gvSub.Rows[rowIndex].FindControl("EditPrice")).Text;
                Sub result = (from c in sub_BUS.GetAll()
                              where c.SubId == Convert.ToInt32(e.CommandArgument)
                              select c).FirstOrDefault();
                if (result != null)
                {
                    result.SubContent = subContent;
                    result.DurDay = Convert.ToInt32(durDay);
                    result.Price = price;
                    sub_BUS.Update(result);
                }
                gvSub.EditIndex = -1;
                BindGridViewData();
            }
            else if (e.CommandName == "InsertRow")
            {
                string subContent = ((TextBox)gvSub.FooterRow.FindControl("InsertSubContent")).Text;
                string durDay = ((TextBox)gvSub.FooterRow.FindControl("InsertDurDay")).Text;
                string price = ((TextBox)gvSub.FooterRow.FindControl("InsertPrice")).Text;
                if (subContent == "" || durDay == "" || price == "")
                {
                    return;
                }
                Sub newSub = new Sub {SubContent = subContent, DurDay = Convert.ToInt32(durDay), Price = price};
                sub_BUS.Insert(newSub);
                BindGridViewData();
            }
        }
    }
}