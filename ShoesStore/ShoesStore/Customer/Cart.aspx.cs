using System;
using System.Collections.Generic;
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

                rptCartDetShp_Bind();
            }
        }

        private void rptCartDetShp_Bind()
        {
            int[] shopIds = Master.ListCartDetPreview.Select(m => m.ShpId).OrderBy(x => x).Distinct().ToArray();
            List<Shp> listShp = _shp.GetAll().Where(m => shopIds.Contains(m.ShpId)).ToList();
            rptCartDetShp.DataSource = listShp;
            rptCartDetShp.DataBind();
        }
        protected void txtQty_OnTextChanged(object sender, EventArgs e)
        {


            TextBox qty = (TextBox)sender;
            RepeaterItem thisRptItem = ((RepeaterItem)(qty.NamingContainer));
            HiddenField ltrPrice = (HiddenField)thisRptItem.FindControl("ltrPrice");
            Literal ltrObjSumPrice = (Literal)thisRptItem.FindControl("ltrObjSumPrice");

            ltrObjSumPrice.Text = MyLibrary.ToFormatMoney(Convert.ToDouble(ltrPrice.Value) * Convert.ToDouble(qty.Text));

            //string price = thisRptItem.FindControl("");
        }

        protected void btnUpdateCart_OnClick(object sender, EventArgs e)
        {
            foreach (Repeater rptCartDetCart in rptCartDetShp.Items)
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
            int sumMoney = 0;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                Literal ltrSumPerShp = (Literal)e.Item.FindControl("ltrSumPerShp");
                Repeater rptCartDetCart = (Repeater)e.Item.FindControl("rptCartDetCart");
                sumParent += Convert.ToInt32(ltrSumPerShp.Text.Replace(",", ""));
                rptCartDetCart.DataSource = Master.ListCartDetPreview.Where(m => m.ShpId + "" == hdfShpId.Value);
                rptCartDetCart.DataBind();
                //get the person object that is bound to the current row.
                // access person here
            }
        }
    }
}