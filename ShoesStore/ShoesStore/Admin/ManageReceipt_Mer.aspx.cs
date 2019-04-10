using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class ManageReceipt_Mer : Page
    {
        private readonly RcptSub_BUS rcptSub_BUS = new RcptSub_BUS();
        private readonly Rcpt_BUS rcpt_BUS = new Rcpt_BUS();
        private readonly RcptSubDet_BUS rcptSubDet_BUS = new RcptSubDet_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridViewgvRcptSub();
                
            }
        }
        private void BindGridViewgvRcptSub()
        {
            gvRcptSub.DataSource = rcptSub_BUS.GetAll().ToList();
            gvRcptSub.DataBind();
            if(rcptSub_BUS.GetAll().ToList().Count == 0)
            {
            }
        }
        private void BindDetailsViewRcptSubDet(int RcptSubId)
        {
            dtviewRcptSubDet.DataSource = rcptSubDet_BUS.SelectedRowById(RcptSubId);
            dtviewRcptSubDet.DataBind();
        }
        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                gvRcptSub.EditIndex = rowIndex;
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "DeleteRow")
            {
                RcptSubDet result2 = rcptSubDet_BUS.GetAll().FirstOrDefault(m => m.RcptSubId == Convert.ToInt32(e.CommandArgument));

                RcptSub result = rcptSub_BUS.GetAll().FirstOrDefault(m => m.RcptSubId == Convert.ToInt32(e.CommandArgument));

                Rcpt result1 = (from c in rcpt_BUS.GetAll()
                                where c.RcptId == Convert.ToInt32(e.CommandArgument)
                                select c).FirstOrDefault();
                rcptSubDet_BUS.Delete(result2);
                rcptSub_BUS.Delete(result);
                rcpt_BUS.Delete(result1);
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvRcptSub.EditIndex = -1;
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                string UsrEdit = ((TextBox)gvRcptSub.Rows[rowIndex].FindControl("EditUsrEdit")).Text;
                // SỬA CODE Ở ĐÂY
                RcptSub result = (from c in rcptSub_BUS.GetAll()
                                  where c.RcptSubId == Convert.ToInt32(e.CommandArgument)
                                  select c).FirstOrDefault();
                if (result != null)
                {
                    // SỬA CODE Ở ĐÂY
                    
                    result.Rcpt.DateEdit = DateTime.Now;
                    result.Rcpt.UsrEdit = Convert.ToInt32(UsrEdit);
                    rcptSub_BUS.Update(result);
                }

                gvRcptSub.EditIndex = -1;
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "InsertRow")
            {
                // SỬA CODE Ở ĐÂY
                string dateAdd = DateTime.Now.ToString();
                string usrAdd = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertUsrAdd")).Text;
                string usrEdit = null;
                if (usrEdit == null)
                {
                    usrEdit = "0";
                }

                if (usrAdd == "")
                {
                    return;
                }


                Rcpt rcpt = new Rcpt
                {
                    DateAdd = DateTime.Now,
                    DateEdit = null,
                    UsrAdd = Int32.Parse(usrAdd),
                    UsrEdit = null
                };

                rcpt_BUS.Insert(rcpt);
                RcptSub newRcptSub = new RcptSub
                {
                    RcptSubId = rcpt_BUS.getMaxRcptId() 
                };

                rcptSub_BUS.Insert(newRcptSub);
                BindGridViewgvRcptSub();
            }
            else if(e.CommandName=="EInsertRow")
            {
                string dateAdd = DateTime.Now.ToString(); 
                string usrAdd = ((TextBox)gvRcptSub.Controls[0].Controls[0].FindControl("EInsertUsrAdd")).Text;
                string usrEdit = null;
                if (usrEdit == null)
                {
                    usrEdit = "0";
                }

                if (usrAdd == "")
                {
                    return;
                }


                Rcpt rcpt = new Rcpt
                {
                    DateAdd = DateTime.Now,
                    DateEdit = null,
                    UsrAdd = Int32.Parse(usrAdd),
                    UsrEdit = null
                };

                rcpt_BUS.Insert(rcpt);
                RcptSub newRcptSub = new RcptSub
                {
                    RcptSubId = rcpt_BUS.getMaxRcptId()
                };

                rcptSub_BUS.Insert(newRcptSub);

                BindGridViewgvRcptSub();
            }
        }
        
        protected void gvRcptSub_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rcptSubId = Int32.Parse((gvRcptSub.SelectedRow.FindControl("rcptsubid") as Label).Text);
            BindDetailsViewRcptSubDet(rcptSubId);
        }
    }
}