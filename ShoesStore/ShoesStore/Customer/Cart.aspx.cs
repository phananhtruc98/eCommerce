using System;
using System.Linq;
using System.Web.UI.WebControls;
using ShoesStore.MyExtensions;

namespace ShoesStore.Customer
{
    public partial class GioHang : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carDetails.DataBind();
                rptCartDetShp_Bind();
                if (WebSession.LoginCus == null)
                    carDetails.InnerText = "Không có sản phẩm trong giỏ hàng!";
            }
        }

        private void rptCartDetShp_Bind()
        {
            rptCartDetShp.DataSource = MyLibrary.CartDet_BUS.ListCartPreview_Shop();
            rptCartDetShp.DataBind();
        }

        protected void txtQty_OnTextChanged(object sender, EventArgs e)
        {
            var qty = (TextBox)sender;
            var thisRptItem = (RepeaterItem)qty.NamingContainer;
            var thisRpt = (Repeater)thisRptItem.NamingContainer;
            var hdfPrice = (HiddenField)thisRptItem.FindControl("hdfPrice");
            var ltrObjSumPrice = (Literal)thisRptItem.FindControl("ltrObjSumPrice");
            ltrObjSumPrice.Text = (Convert.ToDouble(hdfPrice.Value) * Convert.ToDouble(qty.Text)).ToFormatMoney();
            var thisRptItemParentItem = (RepeaterItem)thisRptItem.NamingContainer.NamingContainer;
            var thisRptItemParent = (Repeater)thisRptItem.NamingContainer.NamingContainer.NamingContainer;
            var ltrSumPerShp =
                (Literal)thisRptItemParent.Items[thisRptItemParentItem.ItemIndex].FindControl("ltrSumPerShp");
            ltrSumPerShp.Text = SumPerShp(thisRpt).ToFormatMoney();
            UpdateSum(thisRptItemParent);
            //string price = thisRptItem.FindControl("");
        }

        private void UpdateSum(Repeater rptParent)
        {
            decimal sumPerShp = 0;
            foreach (RepeaterItem rptParentItem in rptParent.Items)
            {
                var ltrSumPerShp = (Literal)rptParentItem.FindControl("ltrSumPerShp");
                sumPerShp += Convert.ToDecimal(ltrSumPerShp.Text.Replace(",", ""));
            }

            var rptCartDetShpSum = (Literal)rptParent.FindControlInFooter("rptCartDetShp_Sum");
            rptCartDetShpSum.Text = sumPerShp.ToFormatMoney().ToFormatMoney();
        }

        private string SumPerShp(Repeater rptShp)
        {
            decimal sumShpPro = 0;
            foreach (RepeaterItem rptProduct in rptShp.Items)
            {
                var ltrObjSumPrice = (Literal)rptProduct.FindControl("ltrObjSumPrice");
                sumShpPro += Convert.ToDecimal(ltrObjSumPrice.Text);
            }

            return sumShpPro.ToString();
        }

        protected void btnUpdateCart_OnClick(object sender, EventArgs e)
        {
            foreach (RepeaterItem rptCartDetShpItem in rptCartDetShp.Items)
            {
                var rptCartDetCart = (Repeater)rptCartDetShpItem.FindControl("rptCartDetCart");
                foreach (RepeaterItem rptCartDetItem in rptCartDetCart.Items)
                {
                    var hdfPrimaryKeys = (HiddenField)rptCartDetItem.FindControl("hdfPrimaryKeys");
                    var key = hdfPrimaryKeys.Value.Split(',');
                    var obj = MyLibrary.CartDet_BUS.GetAll().FirstOrDefault(m => m.CartId + "" == key[0]
                                                                                 && m.ShpId + "" == key[1]
                                                                                 && m.ProId + "" == key[2]
                                                                                 && m.ColorId + "" == key[3]
                                                                                 && m.SizeId + "" == key[4]);
                    var qty = (TextBox)rptCartDetItem.FindControl("txtQty");
                    if (obj != null)
                    {
                        obj.Qty = Convert.ToInt32(qty.Text);
                        MyLibrary.CartDet_BUS.Update(obj);
                    }
                }
            }

            ltrSumAll.Text = MyLibrary.CartDet_BUS.SumCartDetPrice() != MyLibrary.CartDet_BUS.SumCartDetPriceNoDiscount() ? MyLibrary.GetPriceFormat(MyLibrary.CartDet_BUS.SumCartDetPriceNoDiscount().ToFormatMoney(), MyLibrary.CartDet_BUS.SumCartDetPrice()) : MyLibrary.CartDet_BUS.SumCartDetPrice();
        }

        protected void btnCartDetPreviewClose_OnCommand(object sender, CommandEventArgs e)
        {
            var primaryKeys = e.CommandArgument.ToString().Split(',');
            MyLibrary.CartDet_BUS.Delete(MyLibrary.CartDet_BUS.GetAll().FirstOrDefault(
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
                var hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                var rptCartDetCart = (Repeater)e.Item.FindControl("rptCartDetCart");
                rptCartDetCart.DataSource =
                    MyLibrary.CartDet_BUS.ListCartPreview().Where(m => m.ShpId + "" == hdfShpId.Value);
                rptCartDetCart.DataBind();
                //get the person object that is bound to the current row.
                // access person here
            }
        }
    }
}