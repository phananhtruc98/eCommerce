using ShoesStore.BusinessLogicLayer;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataGridView();
        }
        private void BindDataGridView()
        {
            gvRcptSub.DataSource = (from rcptSub in rcptSub_BUS.GetAll_Join_Rcpt()
                                    select new
                                    {
                                        rcptSub.RcptSubId,
                                        rcptSub.Rcpt.DateAdd,
                                        rcptSub.Rcpt.DateEdit,
                                        rcptSub.Rcpt.UsrAdd,
                                        rcptSub.Rcpt.UsrEdit
                                    }).ToList();
            gvRcptSub.DataBind();
        }
    }
}