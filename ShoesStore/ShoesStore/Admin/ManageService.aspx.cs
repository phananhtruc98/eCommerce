using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Admin
{
    public partial class Manage_Services : Page
    {
        private readonly Sub_BUS sub_BUS = new Sub_BUS();

        private void BindGridViewData()
        {
            gvSub.DataSource = sub_BUS.GetAll();
            gvSub.DataBind();
        }

        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                gvSub.EditIndex = rowIndex;
                BindGridViewData();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var result = (from c in sub_BUS.GetAll()
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
                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
                var subId = Convert.ToInt32(e.CommandArgument);
                var subContent = ((TextBox) gvSub.Rows[rowIndex].FindControl("EditSubContent")).Text;
                var durDay = ((TextBox) gvSub.Rows[rowIndex].FindControl("EditDurDay")).Text;
                var price = ((TextBox) gvSub.Rows[rowIndex].FindControl("EditPrice")).Text;
                var result = (from c in sub_BUS.GetAll()
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
                var subContent = ((TextBox) gvSub.FooterRow.FindControl("InsertSubContent")).Text;
                var durDay = ((TextBox) gvSub.FooterRow.FindControl("InsertDurDay")).Text;
                var price = ((TextBox) gvSub.FooterRow.FindControl("InsertPrice")).Text;
                if (subContent == "" || durDay == "" || price == "") return;
                var newSub = new Sub {SubContent = subContent, DurDay = Convert.ToInt32(durDay), Price = price};
                sub_BUS.Insert(newSub);
                BindGridViewData();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGridViewData();
        }
    }
}