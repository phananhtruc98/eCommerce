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

                return (Pro)ViewState["_proDetView"];
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
                //Bind_ProColors();
                //Bind_ProSizes();
            }
        }

        private void BindData()
        {
            DivWriteComment.DataBind();

        }

        //private void Bind_ProSizes()
        //{
        //    rptProSize.DataSource = MyLibrary.ProDet_BUS.GetAll()
        //        .Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId).DistinctBy(m => m.SizeId);
        //    rptProSize.DataBind();
        //}

        //private void Bind_ProColors()
        //{
        //    rptProColor.DataSource = MyLibrary.ProDet_BUS.GetAll()
        //        .Where(m => m.ShpId == _proDetView.ShpId && m.ProId == _proDetView.ProId).DistinctBy(m => m.ColorId);
        //    rptProColor.DataBind();
        //}

        private void Bind_CusReview()
        {
            rptCusReview.DataSource = MyLibrary.RcptBuyDet_BUS.GetProComments(_proDetView);
            rptCusReview.DataBind();
        }

        private void Bind_Slides()
        {
            var proDetSlides = MyLibrary.ProSlide_BUS.GetProSlides(ProDetView);

            rptProSlidePresent.DataSource = rptProSlideCarousel.DataSource = proDetSlides;
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

            foreach (RepeaterItem pd in rptProDet.Items)
            {

                HiddenField hdfSizeId = (HiddenField)pd.FindControl("hdfSizeId");
                HiddenField hdfColorId = (HiddenField)pd.FindControl("hdfColorId");
                TextBox txtQty = (TextBox)pd.FindControl("txtQty");
                int qty = txtQty.Text != "" ? Convert.ToInt32(txtQty.Text) : 0;
                if (txtQty.Text != "" && qty > 0)
                {

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
                        Master.LoadCartPreview();
                    }
                }

            }



        }

        //protected void rptProColor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if ((e.Item.ItemType == ListItemType.AlternatingItem) | (e.Item.ItemType == ListItemType.Item))
        //        {
        //            if (e.Item.ItemIndex == 0)
        //                ((RadioButton)e.Item.FindControl("rdbColor")).Checked = true;
        //            ((RadioButton)e.Item.FindControl("rdbColor")).Visible = true;
        //            ((RadioButton)e.Item.FindControl("rdbColor")).GroupName = "Color";
        //            var radioColor = (RadioButton)e.Item.FindControl("rdbColor");
        //            var scriptColor = "setExclusiveRadioButton('rptProColor.*Color', this)";
        //            radioColor.Attributes.Add("onclick", scriptColor);
        //        }

        //        // put the proper client-side handler for RadioButton
        //    }
        //    catch (Exception)
        //    {
        //        // ignored
        //    }
        //}

        //protected void rptProSize_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        if ((e.Item.ItemType == ListItemType.AlternatingItem) | (e.Item.ItemType == ListItemType.Item))
        //        {
        //            if (e.Item.ItemIndex == 0)
        //                ((RadioButton)e.Item.FindControl("rdbSize")).Checked = true;
        //            ((RadioButton)e.Item.FindControl("rdbSize")).Visible = true;
        //            ((RadioButton)e.Item.FindControl("rdbSize")).GroupName = "Size";
        //        }

        //        // put the proper client-side handler for RadioButton
        //        var radioSize = (RadioButton)e.Item.FindControl("rdbSize");
        //        var scriptSize = "setExclusiveRadioButton('rptProSize.*Size', this)";
        //        radioSize.Attributes.Add("onclick", scriptSize);
        //    }
        //    catch (Exception)
        //    {
        //        // ignored
        //    }
        //}

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
        }

        protected void rptProSize_Init(object sender, EventArgs e)
        {

        }

        private void rptProDet_Bind()
        {
            rptProDet.DataSource = MyLibrary.ProDet_BUS.GetAllBy(_proDetView.ShpId, _proDetView.ProId);
            rptProDet.DataBind();
        }

        private void lvColorName_Bind()
        {
            lvColorName.DataSource = MyLibrary.Pro_BUS.GetAvailableColors(_proDetView);
            lvColorName.DataBind();
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            lvColorName_Bind();
            rptProDet_Bind();
        }
    }
}