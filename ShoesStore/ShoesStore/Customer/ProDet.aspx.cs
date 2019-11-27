using System;
using System.Linq;
using System.Web.UI.WebControls;
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

                return (Pro)ViewState["_proDetView"];
            }
            set => ViewState["_proDetView"] = value;
        }
        private void Bind_CusReview()
        {
            rptCusReview.DataSource = MyLibrary.RcptBuyDet_BUS.GetProComments(_proDetView);
            if (MyLibrary.RcptBuyDet_BUS.GetProComments(_proDetView) != null && MyLibrary.RcptBuyDet_BUS.GetProComments(_proDetView).Count() > 0)
                lbNhanXet.Visible = false;
            else lbNhanXet.Visible = true;
            rptCusReview.DataBind();
        }

        private void Bind_Slides()
        {
            var proDetSlides = MyLibrary.ProSlide_BUS.GetProSlides(ProDetView);

            rptProSlidePresent.DataSource = rptProSlideCarousel.DataSource = proDetSlides;
            rptProSlideCarousel.DataBind();
            rptProSlidePresent.DataBind();
        }

        private void BindData()
        {
            DivWriteComment.DataBind();
        }

        protected void btnAddCart_OnClick(object sender, EventArgs e)
        {
            if (WebSession.LoginCus == null)
            {
                MyLibrary.Show("Bạn chưa đăng nhập");
                return;
            }

            var atLeastOneCheck = false;


            foreach (RepeaterItem pd in rptProDet.Items)
            {
                var hdfSizeId = (HiddenField)pd.FindControl("hdfSizeId");
                var hdfColorId = (HiddenField)pd.FindControl("hdfColorId");
                var txtQty = (TextBox)pd.FindControl("txtQty");
                var qty = txtQty.Text != "" ? Convert.ToInt32(txtQty.Text) : 0;
                if (txtQty.Text != "" && qty > 0)
                {
                    atLeastOneCheck = true;
                    _cartDetView = new CartDet
                    {
                        CartId = MyLibrary.Cart_BUS.GetMyCart().CartId,
                        ShpId = _proDetView.ShpId,
                        ProId = _proDetView.ProId,
                        ColorId = Convert.ToInt32(hdfColorId.Value),
                        SizeId = Convert.ToInt32(hdfSizeId.Value),
                        Qty = qty
                    };
                    if (!MyLibrary.CartDet_BUS.IsExist(_cartDetView))
                    {
                        MyLibrary.CartDet_BUS.Insert(_cartDetView);
                    }
                    else
                    {
                        var cartDet = MyLibrary.CartDet_BUS.GetAll().FirstOrDefault(m => m.CartId == _cartDetView.CartId
                                                                                         && m.ShpId ==
                                                                                         _cartDetView.ShpId
                                                                                         && m.ProId ==
                                                                                         _cartDetView.ProId
                                                                                         && m.ColorId ==
                                                                                         _cartDetView.ColorId
                                                                                         && m.SizeId ==
                                                                                         _cartDetView.SizeId);
                        var maxQty = MyLibrary.ProDet_BUS.ProDetLeft(cartDet.ProDet);
                        cartDet.Qty = _cartDetView.Qty + cartDet.Qty <= maxQty
                            ? cartDet.Qty + _cartDetView.Qty
                            : maxQty;
                        MyLibrary.CartDet_BUS.Update(cartDet);
                    }
                }
            }

            Master.LoadCartPreview();
            if (!atLeastOneCheck) MyLibrary.Show("Bạn cần chọn ít nhất 1 sản phẩm");
        }
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            var rcptBuyDetNotCommented =
                MyLibrary.RcptBuyDet_BUS.GetAllBy(ProDetView, WebSession.LoginCus).FirstOrDefault();
            if (rcptBuyDetNotCommented != null)
            {
                rcptBuyDetNotCommented.Cmt = review_text.Text;
                rcptBuyDetNotCommented.Point = int.Parse(review_stars.SelectedValue.Split(' ')[0]);
                MyLibrary.RcptBuyDet_BUS.Update(rcptBuyDetNotCommented);
                MyLibrary.Show("Đã gửi nhận xét", Request.RawUrl);
            }
        }

        private void CollectUrl()
        {
            _proDetView = MyLibrary.Pro_BUS.GetAll().ToList().FirstOrDefault(m =>
                TextHelper.UrlFriendly(m.Shp.ShpName) == RouteData.Values["shpName"].ToString()
                && TextHelper.UrlFriendly(m.ProName) == RouteData.Values["proName"].ToString());
        }

        public CartDet GetCartDet(ProDet proDet)
        {
            try
            {
                return new CartDet
                {
                    CartId = MyLibrary.Cart_BUS.GetMyCart().CartId,
                    ShpId = proDet.ShpId,
                    ProId = proDet.ProId,
                    ColorId = Convert.ToInt32(proDet.ColorId),
                    SizeId = Convert.ToInt32(proDet.SizeId)
                };
            }


            catch (Exception ex)
            {
                return null;
            }
        }

        private void lvColorName_Bind()
        {
            lvColorName.DataSource = MyLibrary.Pro_BUS.GetAvailableColors(_proDetView);
            lvColorName.DataBind();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                CollectUrl();
                if (_proDetView.IsOutOfStock.Value) Response.Redirect("~");
                Bind_Slides();
                Bind_CusReview();
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            lvColorName_Bind();
            rptProDet_Bind();
        }

        private void rptProDet_Bind()
        {
            rptProDet.DataSource = MyLibrary.ProDet_BUS.GetAllBy(_proDetView.ShpId, _proDetView.ProId);
            rptProDet.DataBind();
        }
    }
}