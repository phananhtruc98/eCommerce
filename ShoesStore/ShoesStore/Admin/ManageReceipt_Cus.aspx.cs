using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class ManageReceipt_Cus : System.Web.UI.Page
    {
        private readonly RcptSub_BUS rcptSub_bus = new RcptSub_BUS(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataGridView();
        }

        private void BindDataGridView()
        {
            gvRcptSub.DataSource = (from rcptSub in rcptSub_bus.GetAll()
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