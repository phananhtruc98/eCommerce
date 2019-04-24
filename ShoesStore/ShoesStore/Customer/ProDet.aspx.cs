using System;
using System.Linq;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using ShoesStore.DataAccessLogicLayer;
using Utilities;
using Convert = System.Convert;

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
                {
                    CollectUrl();
                    return _proDetView;
                }

                return (Pro) ViewState["_proDetView"];
            }
            set => ViewState["_proDetView"] = value;
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                CollectUrl();
                Bind_Slides();
                Bind_CusReview();
                Bind_ProColors();
                Bind_ProSizes();
            }
        }

        private void BindData()
        {
            ltrCommentLeft.DataBind();
        }

        private void Bind_ProSizes()
        {
            rptProSize.DataSource = MyLibrary.ProDet_BUS.GetAll()
                .Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId).DistinctBy(m => m.SizeId);
            rptProSize.DataBind();
        }

        private void Bind_ProColors()
        {
            rptProColor.DataSource = MyLibrary.ProDet_BUS.GetAll()
                .Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId).DistinctBy(m => m.ColorId);
            rptProColor.DataBind();
        }

        private void Bind_CusReview()
        {
            rptCusReview.DataSource = MyLibrary.RcptBuyDet_BUS.GetProComments(_proDetView);
            rptCusReview.DataBind();
        }

        private void Bind_Slides()
        {
            rptProSlidePresent.DataSource = rptProSlideCarousel.DataSource = MyLibrary.ProSlide_BUS.GetAll()
                .Where(m => m.ProId == _proDetView.ProId && m.ShpId == _proDetView.ShpId);
            rptProSlideCarousel.DataBind();
            rptProSlidePresent.DataBind();
        }

        private void CollectUrl()
        {
            _proDetView = MyLibrary.Pro_BUS.GetAll().ToList().FirstOrDefault(m =>
                TextHelper.UrlFriendly(m.Shp.ShpName) == RouteData.Values["shpName"].ToString()
                && TextHelper.UrlFriendly(m.ProName) == RouteData.Values["proName"].ToString());
        }

        protected void btnAddCart_OnClick(object sender, EventArgs e)
        {
            if (WebSession.LoginCus == null)
            {
                MyLibrary.Show("Bạn chưa đăng nhập");
                return;
            }

            var colorId = 0;
            var sizeId = 0;
            foreach (RepeaterItem item in rptProColor.Items)
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rdbColor = (RadioButton) item.FindControl("rdbColor");
                    if (rdbColor.Checked)
                        colorId = Convert.ToInt32(((HiddenField) item.FindControl("hdfColorId")).Value);
                }

            foreach (RepeaterItem item in rptProSize.Items)
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rdbSize = (RadioButton) item.FindControl("rdbSize");
                    if (rdbSize.Checked) sizeId = Convert.ToInt32(((HiddenField) item.FindControl("hdfSizeId")).Value);
                }

            _cartDetView = new CartDet
            {
                CartId = MyLibrary.Cart_BUS.GetMyCart().CartId,
                ShpId = _proDetView.ShpId,
                ProId = _proDetView.ProId,
                ColorId = colorId,
                SizeId = sizeId,
                Qty = Convert.ToInt32(product_quantity.Value)
            };
            if (!MyLibrary.CartDet_BUS.IsExist(_cartDetView))
            {
                MyLibrary.CartDet_BUS.Insert(_cartDetView);
                Master.LoadCartPreview();
            }
        }

        protected void rptProColor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if ((e.Item.ItemType == ListItemType.AlternatingItem) | (e.Item.ItemType == ListItemType.Item))
                {
                    if (e.Item.ItemIndex == 0)
                        ((RadioButton) e.Item.FindControl("rdbColor")).Checked = true;
                    ((RadioButton) e.Item.FindControl("rdbColor")).Visible = true;
                    ((RadioButton) e.Item.FindControl("rdbColor")).GroupName = "Color";
                    var radioColor = (RadioButton) e.Item.FindControl("rdbColor");
                    var scriptColor = "setExclusiveRadioButton('rptProColor.*Color', this)";
                    radioColor.Attributes.Add("onclick", scriptColor);
                }

// put the proper client-side handler for RadioButton
            }
            catch (Exception)
            {
// ignored
            }
        }

        protected void rptProSize_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if ((e.Item.ItemType == ListItemType.AlternatingItem) | (e.Item.ItemType == ListItemType.Item))
                {
                    if (e.Item.ItemIndex == 0)
                        ((RadioButton) e.Item.FindControl("rdbSize")).Checked = true;
                    ((RadioButton) e.Item.FindControl("rdbSize")).Visible = true;
                    ((RadioButton) e.Item.FindControl("rdbSize")).GroupName = "Size";
                }

// put the proper client-side handler for RadioButton
                var radioSize = (RadioButton) e.Item.FindControl("rdbSize");
                var scriptSize = "setExclusiveRadioButton('rptProSize.*Size', this)";
                radioSize.Attributes.Add("onclick", scriptSize);
            }
            catch (Exception)
            {
// ignored
            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
        }
    }
}