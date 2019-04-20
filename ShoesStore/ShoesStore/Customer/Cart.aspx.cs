using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
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
            HiddenField hdfPrimaryKeys = (HiddenField)thisRptItem.FindControl("hdfPrimaryKeys");
            string[] key = hdfPrimaryKeys.Value.Split(',');
            Literal ltrPrice = (Literal)thisRptItem.FindControl("ltrPrice");
            Literal ltrObjSumPrice = (Literal)thisRptItem.FindControl("ltrObjSumPrice");

            ltrObjSumPrice.Text = (Convert.ToDouble(ltrPrice.Text) * Convert.ToDouble(qty.Text)).ToFormatMoney();

            RepeaterItem thisRptItem_Parent_Item = (RepeaterItem)thisRptItem.NamingContainer.NamingContainer;
            Repeater thisRptItem_Parent = (Repeater)thisRptItem.NamingContainer.NamingContainer.NamingContainer;

            Literal ltrSumPerShp = (Literal)thisRptItem_Parent.Items[thisRptItem_Parent_Item.ItemIndex].FindControl("ltrSumPerShp");
            ltrSumPerShp.Text = SumPerShp(thisRpt).ToFormatMoney();
            UpdateSum(thisRptItem_Parent);
            //string price = thisRptItem.FindControl("");
        }

        private void UpdateSum(Repeater rptParent)
        {
            decimal sumPerShp = 0;
            foreach (RepeaterItem rptParent_Item in rptParent.Items)
            {

                Literal ltrSumPerShp = (Literal)rptParent_Item.FindControl("ltrSumPerShp");
                sumPerShp += Convert.ToDecimal(ltrSumPerShp.Text.Replace(",", ""));

            }

            Literal rptCartDetShp_Sum = (Literal)rptParent.FindControlInFooter("rptCartDetShp_Sum");
            rptCartDetShp_Sum.Text = sumPerShp.ToFormatMoney().ToFormatMoney();
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
                    obj.Qty = Convert.ToInt32(qty.Text);
                    _cartDet.Update(obj);
                }

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
            //rptCartDetCart_Bind();
            rptCartDetShp_Bind();
        }

        protected void rptCartDetCart_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {

                Literal ltrSumPerShp = (Literal)e.Item.FindControl("ltrSumPerShp");
                //ltrSumPerShp.Text=rptCartDetCart.Items.
            }
        }

        private int sumParent = 0;

        protected void rptCartDetShp_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                Literal ltrSumPerShp = (Literal)e.Item.FindControl("ltrSumPerShp");
                Repeater rptCartDetCart = (Repeater)e.Item.FindControl("rptCartDetCart");
                sumParent += Convert.ToInt32(ltrSumPerShp.Text.Replace(",", ""));
                rptCartDetCart.DataSource = MyLibrary.CartDet_BUS.ListCartPreview().Where(m => m.ShpId + "" == hdfShpId.Value);
                rptCartDetCart.DataBind();
                //get the person object that is bound to the current row.
                // access person here
            }
        }


    }
}