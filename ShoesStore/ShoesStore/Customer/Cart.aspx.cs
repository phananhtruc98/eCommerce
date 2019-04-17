using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class GioHang : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                rptCartDetCart_Bind();
            }
        }

        private void rptCartDetCart_Bind()
        {
            rptCartDetCart.DataSource = Master.CartDetPreview.DataSource;
            rptCartDetCart.DataBind();
        }
        protected void txtQty_OnTextChanged(object sender, EventArgs e)
        {


            TextBox qty = (TextBox)sender;
            RepeaterItem thisRptItem = ((RepeaterItem)(qty.NamingContainer));
            HiddenField hdfPrice = (HiddenField)thisRptItem.FindControl("hdfPrice");
            Literal ltrObjSumPrice = (Literal)thisRptItem.FindControl("ltrObjSumPrice");

            ltrObjSumPrice.Text = MyLibrary.ToFormatMoney(Convert.ToDouble(hdfPrice.Value) * Convert.ToDouble(qty.Text));

            //string price = thisRptItem.FindControl("");
        }

        protected void btnUpdateCart_OnClick(object sender, EventArgs e)
        {
            foreach (RepeaterItem rptItem in rptCartDetCart.Items)
            {
                HiddenField hdfPrimaryKeys = (HiddenField)rptItem.FindControl("hdfPrimaryKeys");

                string[] key = hdfPrimaryKeys.Value.Split(',');
                CartDet obj = _cartDet.GetAll().FirstOrDefault(m => m.CartId + "" == key[0]
                                                                    && m.ShpId + "" == key[1]
                                                                    && m.ProId + "" == key[2]
                                                                    && m.ColorId + "" == key[3]
                                                                    && m.SizeId + "" == key[4]
                );
                TextBox qty = (TextBox)rptItem.FindControl("txtQty");
                obj.Qty = Convert.ToInt32(qty.Text);
                _cartDet.Update(obj);
            }
        }

        protected void btnCartDetPreviewClose_OnCommand(object sender, CommandEventArgs e)
        {

            string[] primaryKeys = e.CommandArgument.ToString().Split(',');
            _cartDet.Delete(_cartDet.GetAll().FirstOrDefault(
                m =>
                    m.CartId == System.Convert.ToInt32(primaryKeys[0])
                    && m.ShpId == System.Convert.ToInt32(primaryKeys[1])
                    && m.ProId == System.Convert.ToInt32(primaryKeys[2])
                    && m.ColorId == System.Convert.ToInt32(primaryKeys[3])
                    && m.SizeId == System.Convert.ToInt32(primaryKeys[4])
            ));
            Master.LoadCartPreview();
            rptCartDetCart_Bind();
        }
    }
}