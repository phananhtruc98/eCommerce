<%@ Page Language="C#" Title="Sản phẩm chi tiết" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProDet.aspx.cs" Inherits="ShoesStore.Customer.SanPham_ChiTiet" %>

<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="ShoesStore.DataAccessLogicLayer" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .alertBox {
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            left: 50%;
            margin-left: -250px;
            padding: 4px 8px;
            position: absolute;
            top: 100px;
            width: 500px;
        }
    </style>
    <script type="text/javascript" language="javascript">
        function setExclusiveRadioButton(name, current) {
            debugger;
            var regex = new RegExp(name);
            for (i = 0; i < document.forms[0].elements.length; i++) {
                var elem = document.forms[0].elements[i];
                if (elem.type == 'radio' && regex.test(elem.id)) {
                    elem.checked = false;
                }
            }
            current.checked = true;
        }
        function closeAlert(e) {
            e.preventDefault();
            this.parentNode.style.display = "none";
        }
    </script>
    <!-- site__body -->
    <div class="site__body">
        <div class="page-header">
            <div class="page-header__container container">
                <div class="page-header__breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/index.html">Home</a>
                                <svg class="breadcrumb-arrow" width="6px" height="9px">
                                    <use href="/images/sprite.svg#arrow-rounded-right-6x9"></use>
                                </svg>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/#">Sản phẩm</a>
                                <svg class="breadcrumb-arrow" width="6px" height="9px">
                                    <use href="/images/sprite.svg#arrow-rounded-right-6x9"></use>
                                </svg>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <%: _proDetView.ProName %>
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="block">
            <div class="container">
                <div class="product product--layout--standard" data-layout="standard">
                    <div class="product__content">
                        <!-- .product__gallery -->
                        <div class="product__gallery">
                            <div class="product-gallery">
                                <div class="product-gallery__featured">
                                    <div class="owl-carousel" id="product-image">
                                        <asp:Repeater runat="server" ID="rptProSlidePresent">
                                            <ItemTemplate>
                                                <a href="#" target="_blank">
                                                    <img src="<%# MyLibrary.ProSlidePath(Container.DataItem) %>" alt="">
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div class="product-gallery__carousel">
                                    <div class="owl-carousel" id="product-carousel">
                                        <asp:Repeater runat="server" ID="rptProSlideCarousel">
                                            <ItemTemplate>
                                                <a href="/#" class="product-gallery__carousel-item">
                                                    <img class="product-gallery__carousel-image" src="<%# MyLibrary.ProSlidePath(Container.DataItem) %>" alt="">
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- .product__gallery / end -->
                        <!-- .product__info -->
                        <div class="product__info">
                            <div class="product__wishlist-compare">
                                <button type="button" class="btn btn-sm btn-light btn-svg-icon" data-toggle="tooltip" data-placement="right" title="Wishlist">
                                    <svg width="16px" height="16px">
                                        <use href="/images/sprite.svg#wishlist-16"></use>
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-sm btn-light btn-svg-icon" data-toggle="tooltip" data-placement="right" title="Compare">
                                    <svg width="16px" height="16px">
                                        <use href="/images/sprite.svg#compare-16"></use>
                                    </svg>
                                </button>
                            </div>
                            <h1 class="product__name">
                                <%: _proDetView.ProName %>
                            </h1>
                            <div class="product__rating">
                                <div class="product__rating-stars">
                                    <div class="rating">
                                        <%= MyLibrary.DrawStar(MyLibrary.Pro_BUS.AverageStar(ProDetView)) %>
                                    </div>
                                </div>
                                <div class="product__rating-legend">
                                    <%: MyLibrary.RcptBuyDet_BUS.GetNumberReview(ProDetView) %><span>/</span>



                                    <b>Cửa hàng:</b> <a href='<%:MyLibrary.ShpUrl(ProDetView.Shp) %>'><%: ProDetView.Shp.ShpName %></a>
                                </div>
                            </div>
                            <div class="product__description">
                                <%: _proDetView.DescShort %>
                            </div>
                            <ul class="product__meta">
                                <li><b>Loại</b>: <%:_proDetView.ProCat.CatName %></li>
                                <li><b>Thương hiệu</b>: <a href="/#"><%: _proDetView.ProBrand.BrandName %></a></li>
                                <li class="product__meta-availability"><b>Tình trạng</b>:<span class="text-success">
                                    <%: MyLibrary.Pro_BUS.IsOutOfStock(_proDetView)?"Hết hàng":"Còn hàng" %>

                                </span>
                                </li>

                            </ul>
                        </div>
                        <!-- .product__info / end -->
                        <!-- .product__sidebar -->
                        <div class="product__sidebar">
                            <div class="product__availability">
                                Availability:
                <span class="text-success">In
                    Stock
                </span>
                            </div>




                            <div class="product__prices">

                                <%= MyLibrary.Pro_BUS.GetPriceFormat(ProDetView)%>
                            </div>


                            <div>
                                <b>Màu có sẵn</b>
                                <hr />
                                <asp:ListView runat="server" ID="lvColorName" ItemType="ShoesStore.DataAccessLogicLayer.ProColor">
                                    <LayoutTemplate>
                                        <table>
                                            <tr>
                                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>

                                    <ItemTemplate>
                                        <td>
                                            <div>
                                                <%# Item.ColorName %>
                                                <div style="background-color: #<%# Item.HexCode %>; width: 32px; margin: auto; height: 32px; border: black solid 1px" />

                                            </div>
                                        </td>
                                    </ItemTemplate>


                                </asp:ListView>
                            </div>
                            <!-- .product__options -->
                            <div class="product__options <%: MyLibrary.Pro_BUS.IsOutOfStock(_proDetView)?"disable-div":"" %>">
                                <div class="form-group product__option">

                                    <table class="table">
                                        <asp:Repeater runat="server" ID="rptProDet" ItemType="ShoesStore.DataAccessLogicLayer.ProDet">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Kích cỡ</th>
                                                        <th>Màu sắc</th>
                                                        <th>Số lượng</th>
                                                        <th>Tình trạng</th>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# (MyLibrary.CartDet_BUS.IsExist(GetCartDet(Item)))?"<i class='fa fa-shopping-cart'></i>":"" %>
                                                      
                                                    </td>


                                                    <td>
                                                        <asp:HiddenField runat="server" ID="hdfSizeId" Value='<%# Item.SizeId %>' />
                                                        <asp:Literal Visible='<%# ((List<ProDet>)rptProDet.DataSource).Where(m=>m.SizeId==Item.SizeId).IsFirst(Item)?true:false %>' runat="server" ID="Size" Text='<%# Item.ProSize.SizeName %>' /></td>
                                                    <td>
                                                        <asp:HiddenField runat="server" ID="hdfColorId" Value='<%# Item.ColorId %>' />
                                                        <div style="background-color: #<%# Item.ProColor.HexCode %>; height: 32px; width: 32px; border: black solid 1px" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txtQty" TextMode="Number" max='<%#MyLibrary.ProDet_BUS.ProDetLeft(Item) %>' Text="0" /><br />
                                                        <asp:RangeValidator min="0" oninput="validity.valid||(value='');" Display="Dynamic" ID="Rangevalidator1" ErrorMessage="Số lượng phải trong khoảng 0 - 99" ForeColor="Red" ControlToValidate="txtQty" MinimumValue="0" MaximumValue="99" runat="server" Type="Integer">
                                                        </asp:RangeValidator>

                                                    </td>

                                                    <td>
                                                        <asp:Literal runat="server" ID="IsOutOfStock" Text='<%# MyLibrary.ProDet_BUS.IsOutOfStock(Item)?"Hết hàng":MyLibrary.ProDet_BUS.ProDetLeft(Item)+"" %>'></asp:Literal></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                    <%--  </div>
                                    </div>--%>
                                </div>
                                <div class="form-group product__option">
                                    <%--   <label class="product__option-label" for="product-quantity">
                                        Số lượng
                                    </label>--%>
                                    <div class="product__actions">
                                        <%--        <div class="product__actions-item">
                                            <div class="input-number product__quantity">
                                                <input id="product_quantity" runat="server" class="input-number__input form-control form-control-lg" type="number" min="1" value="1" />
                                                <div class="input-number__add"></div>
                                                <div class="input-number__sub"></div>
                                            </div>
                                        </div>--%>
                                        <div class="product__actions-item product__actions-item--addtocart">

                                            <asp:Button runat="server" ID="btnAddCart" OnClick="btnAddCart_OnClick" CssClass="btn btn-primary btn-lg" Text="Thêm giỏ hàng"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- .product__options / end -->
                        </div>
                        <!-- .product__end -->

                    </div>
                </div>
                <div class="product-tabs">
                    <div class="product-tabs__list">
                        <a href="#tab-description" class="product-tabs__item product-tabs__item--active">Mô tả
                        </a>
                        <a href="#tab-reviews" class="product-tabs__item">Đánh giá
                        </a>
                    </div>
                    <div class="product-tabs__content">
                        <div class="product-tabs__pane product-tabs__pane--active" id="tab-description">
                            <div class="typography">
                                <h3>Chi tiết sản phẩm</h3>
                                <%= Server.HtmlDecode(_proDetView.Desc) %>
                            </div>
                        </div>

                        <div class="product-tabs__pane" id="tab-reviews">
                            <div class="reviews-view">
                                <div class="reviews-view__list">
                                    <h3 class="reviews-view__header">Người mua nhận xét </h3>
                                    <div class="reviews-list">
                                        <ol class="reviews-list__content">
                                            <asp:Repeater runat="server" ID="rptCusReview" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                                                <ItemTemplate>
                                                    <li class="reviews-list__item">
                                                        <div class="review">
                                                            <div class="review__avatar">
                                                                <img src="<%# MyLibrary.CusImgPath(Eval("RcptBuy.Cus")) %>" alt="">
                                                            </div>
                                                            <div class="review__content">
                                                                <div class="review__author"><%# Eval("RcptBuy.Cus.Usr.UsrName") %> </div>
                                                                <div class="review__rating">
                                                                    <div class="rating">
                                                                        <%#MyLibrary.DrawStar(Item.Point == null ? 0 : Item.Point.Value) %>
                                                                    </div>
                                                                </div>
                                                                <div class="review__text">
                                                                    <%# Eval("Cmt") %>
                                                                </div>
                                                                <div class="review__date"><%# Item.RcptBuy.Rcpt.DateAdd %></div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ol>
                                        <div class="reviews-list__pagination">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item disabled">
                                                    <a class="page-link page-link--with-arrow" href="/#" aria-label="Previous">
                                                        <svg class="page-link__arrow page-link__arrow--left" aria-hidden="true" width="8px" height="13px">
                                                            <use href="/images/sprite.svg#arrow-rounded-left-8x13">
                                                            </use>
                                                        </svg>
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="/#">1</a>
                                                </li>
                                                <li class="page-item active">
                                                    <a class="page-link" href="/#">2
                                        <span class="sr-only">(current)
                                        </span>
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="/#">3</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link page-link--with-arrow" href="/#" aria-label="Next">
                                                        <svg class="page-link__arrow page-link__arrow--right" aria-hidden="true" width="8px" height="13px">
                                                            <use href="/images/sprite.svg#arrow-rounded-right-8x13">
                                                            </use>
                                                        </svg>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel CssClass="reviews-view__form" runat="server" ID="DivWriteComment" Enabled='<%# MyLibrary.RcptBuyDet_BUS.GetCommentLeft(ProDetView)==0? false:true%>'>
                                    <h3 class="reviews-view__header">Viết đánh giá</h3>
                                    <div class="row">
                                        <div class="col-12 col-lg-9 col-xl-8">
                                            <div class="form-row">
                                                <div class="form-group col-md-4">
                                                    <label for="review-stars">
                                                        Chấm sao
                                                    </label>
                                                    <asp:DropDownList ID="review_stars" class="form-control" runat="server">
                                                        <asp:ListItem Value="5 Sao" />
                                                        <asp:ListItem Value="4 Sao" />
                                                        <asp:ListItem Value="3 Sao" />
                                                        <asp:ListItem Value="2 Sao" />
                                                        <asp:ListItem Value="1 Sao" />


                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">

                                                <label for="review-text">Nội dung đánh giá</label>
                                                <small>Số lượt đánh giá:
                                    <asp:Literal runat="server" ID="ltrCommentLeft" Text="<%#MyLibrary.RcptBuyDet_BUS.GetCommentLeft(ProDetView) %>" />
                                                </small>
                                                <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control" ID="review_text" Rows="6" />
                                            </div>
                                            <div class="form-group mb-0">
                                                <asp:Button runat="server" ID="btnSubmit" Text="Gửi đánh giá" OnClick="btnSubmit_OnClick" CssClass="btn btn-primary btn-lg" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- site__body / end -->
</asp:Content>
