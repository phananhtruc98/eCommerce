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
    public partial class ManageReceipt_Mer : System.Web.UI.Page
    {
        private readonly RcptSub_BUS rcptSub_BUS = new RcptSub_BUS();
        private readonly Rcpt_BUS rcpt_BUS = new Rcpt_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridViewData();
        }
        private void BindGridViewData()
        {
            gvRcptSub.DataSource = rcptSub_BUS.GetAll().ToList();
            gvRcptSub.DataBind();
        }

        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                gvRcptSub.EditIndex = rowIndex;
                BindGridViewData();
            }
            else if (e.CommandName == "DeleteRow")
            {
                RcptSub result = rcptSub_BUS.GetAll().FirstOrDefault(m=>m.RcptSubId==Convert.ToInt32(e.CommandArgument));
               
                Rcpt result1 = (from c in rcpt_BUS.GetAll()
                                where c.RcptId == Convert.ToInt32(e.CommandArgument)
                                select c).FirstOrDefault();
                rcptSub_BUS.Delete(result);
                rcpt_BUS.Delete(result1);
                BindGridViewData();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvRcptSub.EditIndex = -1;
                BindGridViewData();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int RcptSubId = Convert.ToInt32(e.CommandArgument);
                string rcptSubId = ((TextBox)gvRcptSub.Rows[rowIndex].FindControl("EditRcptSubId")).Text;
                string DateAdd = ((TextBox)gvRcptSub.Rows[rowIndex].FindControl("EditDateAdd")).Text;
                string DateEdit = ((TextBox)gvRcptSub.Rows[rowIndex].FindControl("EditDateEdit")).Text;
                string UsrAdd = ((TextBox)gvRcptSub.Rows[rowIndex].FindControl("EditUsrAdd")).Text;
                string UsrEdit = ((TextBox)gvRcptSub.Rows[rowIndex].FindControl("EditUsrEdit")).Text;
                // SỬA CODE Ở ĐÂY
                RcptSub result = (from c in rcptSub_BUS.GetAll()
                                  where c.RcptSubId == Convert.ToInt32(e.CommandArgument)
                                  select c).FirstOrDefault();
                if (result != null)
                {
                    // SỬA CODE Ở ĐÂY
                    result.RcptSubId = RcptSubId;
                    result.Rcpt.DateAdd = Convert.ToDateTime(DateAdd);
                    result.Rcpt.DateEdit = Convert.ToDateTime(DateEdit);
                    result.Rcpt.UsrAdd = Convert.ToInt32(UsrAdd);
                    result.Rcpt.UsrEdit = Convert.ToInt32(UsrEdit);
                    rcptSub_BUS.Update(result);
                }

                gvRcptSub.EditIndex = -1;
                BindGridViewData();
            }
            else if (e.CommandName == "InsertRow")
            {
                // SỬA CODE Ở ĐÂY
                string rcptSubId = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertSupId")).Text;
                string dateAdd = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertDateAdd")).Text;
                string dateEdit = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertDateEdit")).Text;
                string usrAdd = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertUsrAdd")).Text;
                string usrEdit = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertUsrEdit")).Text;
                if (dateAdd == "" || usrAdd == "")
                {
                    return;
                }


                Rcpt rcpt = new Rcpt
                {
                    RcptId = Convert.ToInt32(rcptSubId),
                    DateAdd = Convert.ToDateTime(dateAdd),
                    DateEdit = Convert.ToDateTime(dateEdit),
                    UsrAdd = Convert.ToInt32(usrAdd),
                    UsrEdit = Convert.ToInt32(usrEdit)
                };

                RcptSub newRcptSub = new RcptSub
                {
                    RcptSubId = Convert.ToInt32(rcptSubId)
                };



                rcptSub_BUS.Insert(newRcptSub);
                rcpt_BUS.Insert(rcpt);


                BindGridViewData();
            }
        }
    }
}