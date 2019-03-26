using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Manage_User : System.Web.UI.Page
    {
        Mer_BUS mer_BUS = new Mer_BUS();
        Usr_BUS usr_BUS = new Usr_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridViewData();
            }
        }

        private void BindGridViewData()
        {
            var result = mer_BUS.GetAll()
                .Join(usr_BUS.GetAll(), m => m.MerId,
                u => u.UsrId, (Mer, Usr) => new
                {
                    MerId = Mer.MerId,
                    MerName = Usr.UsrName
                });
            gvMerchant.DataSource = result;
            gvMerchant.DataBind();
        }
        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }
    }
}