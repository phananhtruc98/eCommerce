using System;
using System.Web.UI;

namespace ShoesStore.Customer
{
    public partial class GioHang : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptCartDetCart.DataSource = Master.CartDetPreview.DataSource;
                rptCartDetCart.DataBind();

            }
        }
    }
}