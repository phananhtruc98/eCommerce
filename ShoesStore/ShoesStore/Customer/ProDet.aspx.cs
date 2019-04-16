using System;
using System.Linq;
using System.Linq.Dynamic;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.WebControls;
using Utilities;

namespace ShoesStore.Customer
{
    public partial class SanPham_ChiTiet : BasePage
    {
        protected Pro _proDetView;

        private CartDet _cartDetView;
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
            rptProSize.DataSource = _proDet.GetAll().Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId);
            rptProSize.DataBind();
        }
        private void Bind_ProColors()
        {
            rptProColor.DataSource = _proDet.GetAll().Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId);
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
            Cart myCart = Master.CusCart;

            string value;
            int colorId = 0;
            int sizeId = 0;
            foreach (RepeaterItem item in rptProColor.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rdbColor= (RadioButton)item.FindControl("rdbColor");
                    if (rdbColor.Checked)
                    {
                        colorId = System.Convert.ToInt32(((HiddenField) item.FindControl("hdfColorId")).Value);
                    }
                  
                }
            }
            foreach (RepeaterItem item in rptProSize.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                   
                    var rdbSize= (MyRadioButton)item.FindControl("rdbSize");
                    if (rdbSize.Checked)
                    {
                        sizeId = System.Convert.ToInt32(((HiddenField) item.FindControl("hdfSizeId")).Value);
                    }
                  
                }
            }
            _cartDetView = new CartDet()
            {
              CartId = myCart.CartId,
              ShpId = _proDetView.ShpId,
              ProId = _proDetView.ProId,
              ColorId = colorId,
              SizeId = sizeId,
              Qty = System.Convert.ToInt32(product_quantity.Value)
             
            };
            _cartDet.Insert(_cartDetView);
        }

        protected void rptProColor_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.AlternatingItem | e.Item.ItemType == ListItemType.Item)
                {
                 
                        ((RadioButton)e.Item.FindControl("rdbColor")).Visible = true;
                        ((RadioButton) e.Item.FindControl("rdbColor")).GroupName = "Color";

                }

                // put the proper client-side handler for RadioButton
                RadioButton radio = (RadioButton)e.Item.FindControl("rdbColor");
                string script = "setExclusiveRadioButton('rptProColor.*Color', this)";

                radio.Attributes.Add("onclick", script);
            }
            catch (Exception ex)
            {
            }
        }
    }
}