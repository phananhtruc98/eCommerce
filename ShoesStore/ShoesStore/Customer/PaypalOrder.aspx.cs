using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class PaypalOrder : System.Web.UI.Page
    {
        private List<CartDet> _listCartDet;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    _listCartDet = MyLibrary.CartDet_BUS.ListCartPreview();
            //    string strAdd = "";

            //    int i = 0;
            //    foreach (CartDet cd in _listCartDet)
            //    {
            //        ++i;
            //        strAdd = $@"<input type='hidden' value='{cd.ProDet.Pro.ProName}' name='item_name_{i}'>";
            //        plHej.Controls.Add(new System.Web.UI.LiteralControl(strAdd));
            //        strAdd = $@"<input type='hidden' value='{i}' name='item_number_{i}'>";
            //        plHej.Controls.Add(new System.Web.UI.LiteralControl(strAdd));
            //        strAdd = $@"<input type='hidden' value='{cd.ProDet.Pro.Price}' name='amount_{i}'>";
            //        plHej.Controls.Add(new System.Web.UI.LiteralControl(strAdd));
            //        strAdd = $@"<input type='hidden' value='{cd.Qty}' name='quantity_{i}'>";
            //        plHej.Controls.Add(new System.Web.UI.LiteralControl(strAdd));

            //    }
            //}

        }



    }

}