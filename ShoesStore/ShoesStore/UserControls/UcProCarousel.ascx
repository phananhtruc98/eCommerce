<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcProCarousel.ascx.cs" Inherits="ShoesStore.UserControls.UcProCarousel" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Register TagPrefix="wcCustom" Namespace="ShoesStore.WebControls" Assembly="ShoesStore" %>
<div class="block block-products-carousel" data-layout="grid-5">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Featured Products</h3>
            <div class="block-header__divider"></div>
            <ul class="block-header__groups-list">
                <li>
                    <button type="button" class="block-header__group block-header__group--active">
                        Tất cả
                    </button>
                </li>
                <asp:Repeater runat="server" ID="featuredProducts" OnInit="featuredProducts_Init">
                    <ItemTemplate>
                        <li>
                            <button type="button" class="block-header__group"><%#Eval("CatName") %></button>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="block-header__arrows-list">
                <button class="block-header__arrow block-header__arrow--left" type="button">
                    <svg width="7px" height="11px">
                        <use href="images/sprite.svg#arrow-rounded-left-7x11"></use>
                    </svg>
                </button>
                <button class="block-header__arrow block-header__arrow--right" type="button">
                    <svg width="7px" height="11px">
                        <use href="images/sprite.svg#arrow-rounded-right-7x11"></use>
                    </svg>
                </button>
            </div>
        </div>
        <div class="block-products-carousel__slider">
            <div class="block-products-carousel__preloader"></div>
            <div class="owl-carousel">
                <wccustom:repeatertable runat="server" id="rptPro" allowpage="True" tablename="Pro">
                    <ItemTemplate>
                        <div class="block-products-carousel__cell">
                            <div class="product-card">
                                <div class="product-card__badges-list">
                                    <div class="product-card__badge product-card__badge--new">New</div>
                                </div>
                                <div class="product-card__image">
                                    <asp:LinkButton runat="server" ID="proImgLink" PostBackUrl="<%#MyLibrary.ProDetUrl(Container.DataItem) %>">
                                        <img src="<%#MyLibrary.ProImgPath(Container.DataItem) %>" alt="">
                                    </asp:LinkButton>
                                </div>
                                <div class="product-card__info">
                                    <div class="product-card__name">
                                        <a href="product.html">
                                            <%# Eval("ProName") %>
                                        </a>
                                    </div>
                                    <div class="product-card__rating">
                                        <div class="rating">
                                            <div class="rating__body">
                                                <svg class="rating__star rating__star--active" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                        <use href="images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                    </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star rating__star--active" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                        <use href="images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                    </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star rating__star--active" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                        <use href="images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                    </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star rating__star--active" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                        <use href="images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                    </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>
                                                    </g>
                                                    <g class="rating__stroke">
                                                        <use href="images/sprite.svg#star-normal-stroke">
                                                        </use>
                                                    </g>
                                                </svg>
                                                <div class="rating__star rating__star--only-edge">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-card__rating-legend">9 Đánh giá</div>
                                    </div>
                                </div>
                                <div class="product-card__actions">
                                    <div class="product-card__availability">
                                        Availability:
                                        <span class="text-success">
                                            In Stock
                                        </span>
                                    </div>
                                    <div class="product-card__prices"><%# Eval("Price").ToFormatMoney() %></div>
                                    <div class="product-card__shop text-right small text-monospace">
                                        <a href="product.html"><%#Eval("Shp.ShpName") %></a>
                                    </div>
                                    <div class="product-card__buttons">
                                        <asp:LinkButton runat="server" PostBackUrl="<%#MyLibrary.ProDetUrl(Container.DataItem) %>" ID="addToCart" Text="Xem sản phẩm" CssClass="btn btn-primary product-card__addtocart"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </wccustom:repeatertable>
            </div>
        </div>
    </div>
</div>