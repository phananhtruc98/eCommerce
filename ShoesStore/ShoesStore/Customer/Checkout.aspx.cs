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
                rptCartDetCheckout.DataSource = MyLibrary.CartDet_BUS.ListCartPreview();
                rptCartDetCheckout.DataBind();

            }
        }

        protected void btnOrder_OnClick(object sender, EventArgs e)
        {
            if (checkout_terms.Checked)
            {

            }
        }
    }
}