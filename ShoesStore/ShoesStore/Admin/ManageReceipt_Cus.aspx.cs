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
        private readonly RcptBuy_BUS rcptBuy_bus = new RcptBuy_BUS(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataGridView();
        }

        private void BindDataGridView()
        {
            gvRcptBuy.DataSource = (from rcptBuy in rcptBuy_bus.GetAll()
                                   select new
                                   {
                                       rcptBuy.CusId,
                                       rcptBuy.RcptBuyId,
                                       rcptBuy.Rcpt.DateAdd,
                                       rcptBuy.Rcpt.DateEdit,
                                       rcptBuy.Rcpt.UsrAdd,
                                       rcptBuy.Rcpt.UsrEdit
                                   }).ToList();
            gvRcptBuy.DataBind();
        }
    }
}