using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class SubGet : System.Web.UI.Page
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

        
    }
}