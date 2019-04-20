using System;
using System.Linq;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using ShoesStore.DataAccessLogicLayer;
using Utilities;

namespace ShoesStore.Customer
{
    public partial class SanPham_ChiTiet : BasePage
    {
        protected static Pro _proDetView;

        private CartDet _cartDetView;
        public Pro ProDetView
        {
            get
            {
                if (ViewState["_proDetView"] == null)
                    return _proDetView;

                return (Pro)ViewState["_proDetView"];
            }
            set { ViewState["_proDetView"] = value; }
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CollectUrl();
                Bind_Slides();
                Bind_CusReview();
                Bind_ProColors();
                Bind_ProSizes();
            }
        }

        private void Bind_ProSizes()
        {
            rptProSize.DataSource = _proDet.GetAll().Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId).DistinctBy(m => m.SizeId);
            rptProSize.DataBind();
        }
        private void Bind_ProColors()
        {
            rptProColor.DataSource = _proDet.GetAll().Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId).DistinctBy(m => m.ColorId);
            rptProColor.DataBind();
        }
        private void Bind_CusReview()
        {
            rptCusReview.DataSource = _rpcptBuyDet.GetAll().Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId);
            rptCusReview.DataBind();
        }
        private void Bind_Slides()
        {
            rptProSlidePresent.DataSource = rptProSlideCarousel.DataSource = _proSlideImg.GetAll()
                .Where(m => m.ProId == _proDetView.ProId && m.ShpId == _proDetView.ShpId);
            rptProSlideCarousel.DataBind();
            rptProSlidePresent.DataBind();
        }
        private void CollectUrl()
        {
            _proDetView = _pro.GetAll().ToList().FirstOrDefault(m =>
                TextHelper.UrlFriendly(m.Shp.ShpName) == RouteData.Values["shpName"].ToString()
                && TextHelper.UrlFriendly(m.ProName) == RouteData.Values["proName"].ToString());
        }

        protected void btnAddCart_OnClick(object sender, EventArgs e)
        {



            int colorId = 0;
            int sizeId = 0;
            foreach (RepeaterItem item in rptProColor.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rdbColor = (RadioButton)item.FindControl("rdbColor");
                    if (rdbColor.Checked)
                    {
                        colorId = System.Convert.ToInt32(((HiddenField)item.FindControl("hdfColorId")).Value);
                    }

                }
            }
            foreach (RepeaterItem item in rptProSize.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    var rdbSize = (RadioButton)item.FindControl("rdbSize");
                    if (rdbSize.Checked)
                    {
                        sizeId = System.Convert.ToInt32(((HiddenField)item.FindControl("hdfSizeId")).Value);
                    }

                }
            }
            _cartDetView = new CartDet()
            {
                CartId = MyLibrary.Cart_BUS.GetMyCart().CartId,
                ShpId = _proDetView.ShpId,
                ProId = _proDetView.ProId,
                ColorId = colorId,
                SizeId = sizeId,
                Qty = System.Convert.ToInt32(product_quantity.Value)

            };
            if (!_cartDet.IsExist(_cartDetView))
            {
                _cartDet.Insert(_cartDetView);
                Master.LoadCartPreview();
                MessageBoxShow("Đã thêm");
            }
            else
            {
                MessageBoxShow("Đã tồn tại, mời bạn vào giỏ hàng để cập nhật số lượng");

            }

        }

        protected void rptProColor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.AlternatingItem | e.Item.ItemType == ListItemType.Item)
                {
                    if (e.Item.ItemIndex == 0)
                        ((RadioButton)e.Item.FindControl("rdbColor")).Checked = true;
                    ((RadioButton)e.Item.FindControl("rdbColor")).Visible = true;
                    ((RadioButton)e.Item.FindControl("rdbColor")).GroupName = "Color";

                    RadioButton radioColor = (RadioButton)e.Item.FindControl("rdbColor");

                    string scriptColor = "setExclusiveRadioButton('rptProColor.*Color', this)";

                    radioColor.Attributes.Add("onclick", scriptColor);
                }

                // put the proper client-side handler for RadioButton



            }
            catch (Exception)
            {
            }
        }
        protected void rptProSize_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.AlternatingItem | e.Item.ItemType == ListItemType.Item)
                {

                    if (e.Item.ItemIndex == 0)
                        ((RadioButton)e.Item.FindControl("rdbSize")).Checked = true;
                    ((RadioButton)e.Item.FindControl("rdbSize")).Visible = true;
                    ((RadioButton)e.Item.FindControl("rdbSize")).GroupName = "Size";

                }

                // put the proper client-side handler for RadioButton

                RadioButton radioSize = (RadioButton)e.Item.FindControl("rdbSize");


                string scriptSize = "setExclusiveRadioButton('rptProSize.*Size', this)";

                radioSize.Attributes.Add("onclick", scriptSize);

            }
            catch (Exception)
            {
            }
        }
        private void MessageBoxShow(string message)
        {


        }
    }
}