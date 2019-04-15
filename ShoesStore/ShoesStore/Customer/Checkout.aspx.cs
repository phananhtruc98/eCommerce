using System;
using System.Web.UI;

namespace ShoesStore.Customer
{
    public partial class ThanhToan : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptCartDetCheckout.DataSource = Master.CartDetPreview.DataSource;
                rptCartDetCheckout.DataBind();

            }
        }
    }
}