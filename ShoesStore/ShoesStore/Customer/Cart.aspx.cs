using System;
using System.Linq;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Customer
{
    public partial class GioHang : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                rptCartDetShp_Bind();
            }
        }

        private void rptCartDetShp_Bind()
        {
            
            
            rptCartDetShp.DataSource = MyLibrary.CartDet_BUS.ListCartPreview_Shop();
            rptCartDetShp.DataBind();
        }
        protected void txtQty_OnTextChanged(object sender, EventArgs e)
        {


            TextBox qty = (TextBox)sender;
            RepeaterItem thisRptItem = ((RepeaterItem)(qty.NamingContainer));
            Repeater thisRpt = (Repeater)thisRptItem.NamingContainer;
            Literal ltrPrice = (Literal)thisRptItem.FindControl("ltrPrice");
            Literal ltrObjSumPrice = (Literal)thisRptItem.FindControl("ltrObjSumPrice");

            ltrObjSumPrice.Text = (Convert.ToDouble(ltrPrice.Text) * Convert.ToDouble(qty.Text)).ToFormatMoney();

            RepeaterItem thisRptItemParentItem = (RepeaterItem)thisRptItem.NamingContainer.NamingContainer;
            Repeater thisRptItemParent = (Repeater)thisRptItem.NamingContainer.NamingContainer.NamingContainer;

            Literal ltrSumPerShp = (Literal)thisRptItemParent.Items[thisRptItemParentItem.ItemIndex].FindControl("ltrSumPerShp");
            ltrSumPerShp.Text = SumPerShp(thisRpt).ToFormatMoney();
            UpdateSum(thisRptItemParent);
            //string price = thisRptItem.FindControl("");
        }

        private void UpdateSum(Repeater rptParent)
        {
            decimal sumPerShp = 0;
            foreach (RepeaterItem rptParentItem in rptParent.Items)
            {

                Literal ltrSumPerShp = (Literal)rptParentItem.FindControl("ltrSumPerShp");
                sumPerShp += Convert.ToDecimal(ltrSumPerShp.Text.Replace(",", ""));

            }

            Literal rptCartDetShpSum = (Literal)rptParent.FindControlInFooter("rptCartDetShp_Sum");
            rptCartDetShpSum.Text = sumPerShp.ToFormatMoney().ToFormatMoney();
        }
        private string SumPerShp(Repeater rptShp)
        {
            decimal sumShpPro = 0;
            foreach (RepeaterItem rptProduct in rptShp.Items)
            {
                Literal ltrObjSumPrice = (Literal)rptProduct.FindControl("ltrObjSumPrice");
                sumShpPro += Convert.ToDecimal(ltrObjSumPrice.Text);
            }

            return sumShpPro.ToString();
        }

        protected void btnUpdateCart_OnClick(object sender, EventArgs e)
        {
            foreach (RepeaterItem rptCartDetShpItem in rptCartDetShp.Items)
            {
                Repeater rptCartDetCart = (Repeater)rptCartDetShpItem.FindControl("rptCartDetCart");
                foreach (RepeaterItem rptCartDetItem in rptCartDetCart.Items)
                {
                    HiddenField hdfPrimaryKeys = (HiddenField)rptCartDetItem.FindControl("hdfPrimaryKeys");

                    string[] key = hdfPrimaryKeys.Value.Split(',');
                    CartDet obj = _cartDet.GetAll().FirstOrDefault(m => m.CartId + "" == key[0]
                                                                        && m.ShpId + "" == key[1]
                                                                        && m.ProId + "" == key[2]
                                                                        && m.ColorId + "" == key[3]
                                                                        && m.SizeId + "" == key[4]
                    );
                    TextBox qty = (TextBox)rptCartDetItem.FindControl("txtQty");
                    if (obj != null)
                    {
                        obj.Qty = Convert.ToInt32(qty.Text);
                        _cartDet.Update(obj);
                    }
                }

            }
        }

        protected void btnCartDetPreviewClose_OnCommand(object sender, CommandEventArgs e)
        {

            string[] primaryKeys = e.CommandArgument.ToString().Split(',');
            _cartDet.Delete(_cartDet.GetAll().FirstOrDefault(
                m =>
                    m.CartId == Convert.ToInt32(primaryKeys[0])
                    && m.ShpId == Convert.ToInt32(primaryKeys[1])
                    && m.ProId == Convert.ToInt32(primaryKeys[2])
                    && m.ColorId == Convert.ToInt32(primaryKeys[3])
                    && m.SizeId == Convert.ToInt32(primaryKeys[4])
            ));
            Master.LoadCartPreview();
            //rptCartDetCart_Bind();
            rptCartDetShp_Bind();
        }

        protected void rptCartDetCart_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                //ltrSumPerShp.Text=rptCartDetCart.Items.
            }
        }

        protected void rptCartDetShp_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                Repeater rptCartDetCart = (Repeater)e.Item.FindControl("rptCartDetCart");
                rptCartDetCart.DataSource = MyLibrary.CartDet_BUS.ListCartPreview().Where(m => m.ShpId + "" == hdfShpId.Value);
                rptCartDetCart.DataBind();
                //get the person object that is bound to the current row.
                // access person here
            }
        }


    }
}