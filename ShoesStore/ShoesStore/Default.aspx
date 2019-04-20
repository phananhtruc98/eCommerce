<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoesStore.Default" %>

<%@ Register Src="~/UserControls/UcPro.ascx" TagPrefix="uc1" TagName="UcPro" %>
<%@ Register Src="~/ViewSwitcher.ascx" TagPrefix="friendlyUrls" TagName="ViewSwitcher" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <!-- site__body -->
    <!-- .block-slideshow -->
    <div class="block-slideshow block-slideshow--layout--full block">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="block-slideshow__body">
                        <div class="owl-carousel">
                            <asp:Repeater runat="server" ID="rptSlides" OnInit="rptSlides_Init">
                                <ItemTemplate>
                                    <a class="block-slideshow__slide" href="#">
                                        <div class="block-slideshow__slide-image block-slideshow__slide-image--desktop" style="<%# $"background-image: url('{MyLibrary.SlidePath(Eval("img"))}')" %>">
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- .block-slideshow / end -->
    <!-- .-->
    <div class="block block-features--layout--boxed">
        <div class="container">
            <div class="block-features__list">
                <div class="block-features__item">
                    <div class="block-features__icon">
                        <svg width="48px" height="48px">
                            <use href="images/sprite.svg#fi-free-delivery-48"></use>
                        </svg>
                    </div>
                    <div class="block-features__content">
                        <div class="block-features__title">Free Shipping</div>
                        <div class="block-features__subtitle">For orders from $50</div>
                    </div>
                </div>
                <div class="block-features__divider"></div>
                <div class="block-features__item">
                    <div class="block-features__icon">
                        <svg width="48px" height="48px">
                            <use href="images/sprite.svg#fi-24-hours-48"></use>
                        </svg>
                    </div>
                    <div class="block-features__content">
                        <div class="block-features__title">Support 24/7</div>
                        <div class="block-features__subtitle">Call us anytime</div>
                    </div>
                </div>
                <div class="block-features__divider"></div>
                <div class="block-features__item">
                    <div class="block-features__icon">
                        <svg width="48px" height="48px">
                            <use href="images/sprite.svg#fi-payment-security-48"></use>
                        </svg>
                    </div>
                    <div class="block-features__content">
                        <div class="block-features__title">100% Safety</div>
                        <div class="block-features__subtitle">Only secure payments</div>
                    </div>
                </div>
                <div class="block-features__divider"></div>
                <div class="block-features__item">
                    <div class="block-features__icon">
                        <svg width="48px" height="48px">
                            <use href="images/sprite.svg#fi-tag-48"></use>
                        </svg>
                    </div>
                    <div class="block-features__content">
                        <div class="block-features__title">Hot Offers</div>
                        <div class="block-features__subtitle">Discounts up to 90%</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ./ end -->
    <!-- .block-products-carousel -->
    <div class="block block-products-carousel" data-layout="grid-5">
        <div class="container">
            <div class="block-header">
                <h3 class="block-header__title">Featured Products</h3>
                <div class="block-header__divider"></div>
                <ul class="block-header__groups-list">
                    <li>
                        <button type="button"
                            class="block-header__group block-header__group--active">
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
                    <button
                        class="block-header__arrow block-header__arrow--left" type="button">
                        <svg width="7px"
                            height="11px">
                            <use href="images/sprite.svg#arrow-rounded-left-7x11"></use>
                        </svg>
                    </button>
                    <button class="block-header__arrow block-header__arrow--right"
                        type="button">
                        <svg width="7px" height="11px">
                            <use href="images/sprite.svg#arrow-rounded-right-7x11"></use>
                        </svg>
                    </button>
                </div>
            </div>
            <div class="block-products-carousel__slider">
                <div class="block-products-carousel__preloader"></div>
                <div class="owl-carousel">

                    <asp:Repeater runat="server" ID="rptFeatureProducts" OnInit="rptFeatureProducts_Init">
                        <ItemTemplate>

                            <div class="block-products-carousel__cell">
                                <div class="product-card">

                                    <div class="product-card__badges-list">
                                        <div class="product-card__badge product-card__badge--new">New</div>
                                    </div>
                                    <div class="product-card__image">
                                        <a href="product.html">
                                            <img
                                                src="<%# MyLibrary.ProImgPath(Container.DataItem) %>" alt="">
                                        </a>
                                    </div>
                                    <div class="product-card__info">
                                        <div class="product-card__name">
                                            <a href="product.html"><%#Eval("ProName") %></a>
                                        </div>

                                        <div class="product-card__rating">
                                            <div class="rating">
                                                <div class="rating__body">
                                                    <svg
                                                        class="rating__star rating__star--active" width="13px"
                                                        height="12px">
                                                        <g class="rating__fill">
                                                            <use href="images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                            <use href="images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                        </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div>
                                                    <svg class="rating__star rating__star--active"
                                                        width="13px" height="12px">
                                                        <g class="rating__fill">
                                                            <use href="images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                            <use href="images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                        </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div>
                                                    <svg class="rating__star rating__star--active"
                                                        width="13px" height="12px">
                                                        <g class="rating__fill">
                                                            <use href="images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                            <use href="images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                        </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div>
                                                    <svg class="rating__star rating__star--active"
                                                        width="13px" height="12px">
                                                        <g class="rating__fill">
                                                            <use href="images/sprite.svg#star-normal"></use>
                                                        </g>
                                                        <g class="rating__stroke">
                                                            <use href="images/sprite.svg#star-normal-stroke">
                                                            </use>
                                                        </g>
                                                    </svg>
                                                    <div
                                                        class="rating__star rating__star--only-edge rating__star--active">
                                                        <div class="rating__fill">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                        <div class="rating__stroke">
                                                            <div class="fake-svg-icon"></div>
                                                        </div>
                                                    </div>
                                                    <svg class="rating__star" width="13px" height="12px">
                                                        <g class="rating__fill">
                                                            <use href="images/sprite.svg#star-normal"></use>
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
                                            <div class="product-card__rating-legend">9 Reviews</div>
                                        </div>

                                    </div>
                                    <div class="product-card__actions">

                                        <div class="product-card__prices"><%#Eval("Price").ToFormatMoney() %></div>
                                        <div class="product-card__shop text-right small text-monospace">
                                            <a href="product.html"><%#Eval("Shp.ShpName") %></a>
                                        </div>
                                        <div class="product-card__buttons">
                                            <button
                                                class="btn btn-primary product-card__addtocart" type="button">
                                                Add To
                                            Cart
                                            </button>
                                            <button
                                                class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                                type="button">
                                                Add To Cart
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </div>
    <!-- .block-products-carousel / end -->
    <!-- .block-products -->
    <div class="block block-products block-products--layout--large-last">
        <div class="container">

          
                    <div class="block-header">
                        <h3 class="block-header__title">Bán chạy</h3>
                        <div class="block-header__divider"></div>
                    </div>

                    <div class="block-products__body">
                        <div class="block-products__list">

                            <asp:Repeater runat="server" ID="rptBestSellers" OnInit="rptBestSellers_Init">

                                <ItemTemplate>
                                    <div class="block-products__list-item col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="product-card">

                                            <div class="product-card__badges-list">
                                                <div class="product-card__badge product-card__badge--hot">Hot</div>
                                            </div>
                                            <div class="product-card__image">
                                                <a href="product.html">
                                                    <img
                                                        src="<%# MyLibrary.ProImgPath(Container.DataItem) %>" alt="">
                                                </a>

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
                                                            <svg class="rating__star rating__star--active"
                                                                width="13px" height="12px">
                                                                <g class="rating__fill">
                                                                    <use href="images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                    <use href="images/sprite.svg#star-normal-stroke">
                                                                    </use>
                                                                </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div>
                                                            <svg class="rating__star rating__star--active" width="13px"
                                                                height="12px">
                                                                <g class="rating__fill">
                                                                    <use href="images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                    <use href="images/sprite.svg#star-normal-stroke">
                                                                    </use>
                                                                </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div>
                                                            <svg class="rating__star rating__star--active" width="13px"
                                                                height="12px">
                                                                <g class="rating__fill">
                                                                    <use href="images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                    <use href="images/sprite.svg#star-normal-stroke">
                                                                    </use>
                                                                </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div>
                                                            <svg class="rating__star rating__star--active" width="13px"
                                                                height="12px">
                                                                <g class="rating__fill">
                                                                    <use href="images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                    <use href="images/sprite.svg#star-normal-stroke">
                                                                    </use>
                                                                </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div>
                                                            <svg class="rating__star rating__star--active" width="13px"
                                                                height="12px">
                                                                <g class="rating__fill">
                                                                    <use href="images/sprite.svg#star-normal"></use>
                                                                </g>
                                                                <g class="rating__stroke">
                                                                    <use href="images/sprite.svg#star-normal-stroke">
                                                                    </use>
                                                                </g>
                                                            </svg>
                                                            <div
                                                                class="rating__star rating__star--only-edge rating__star--active">
                                                                <div class="rating__fill">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                                <div class="rating__stroke">
                                                                    <div class="fake-svg-icon"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="product-card__rating-legend">11 Reviews</div>
                                                </div>

                                            </div>
                                            <div class="product-card__actions">

                                                <div class="product-card__prices">$<%# Eval("Price").ToFormatMoney() %></div>
                                                <div class="product-card__buttons">
                                                    <button
                                                        class="btn btn-primary product-card__addtocart" type="button">
                                                        Add To Cart
                                                    </button>
                                                    <button
                                                        class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                                        type="button">
                                                        Add To Cart
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>


                        </div>

                    </div>
                    <div style="overflow: hidden;">


                        <asp:Repeater ID="rptPagingBestSellers" runat="server" OnItemCommand="rptPagingBestSellers_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnPage"
                                    Style="padding: 8px; margin: 2px; background: #ffa100; border: solid 1px #666; font: 8pt tahoma;"
                                    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server" ForeColor="White" Font-Bold="True">
                            <%# Container.DataItem %>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
 
        </div>
    </div>
    <!-- .block-products / end -->
    <!-- .block-categories -->
    <div class="block block--highlighted block-categories--layout--compact">
        <div class="container">
            <div class="block-header">
                <h3 class="block-header__title">Loại giày phổ biến</h3>
                <div class="block-header__divider"></div>
            </div>
            <div class="block-categories__list">

                <asp:Repeater runat="server" ID="rptPopularCategories" OnInit="rptPopularCategories_Init" ItemType="ShoesStore.DataAccessLogicLayer.ProCat">

                    <ItemTemplate>
                        <div class="block-categories__item category-card category-card--layout--compact">
                            <div class="category-card__body">
                                <div class="category-card__image">
                                    <a href="#">
                                        <img
                                            src="<%# MyLibrary.ProCatImgPath(Item) %>" alt="">
                                    </a>

                                </div>
                                <div class="category-card__content">
                                    <div class="category-card__name">
                                        <a href="#"><%#Eval("CatName") %></a>
                                    </div>
                                    <div class="category-card__products"><%#Eval("Pro.Count") %> Sản phẩm</div>
                                </div>
                            </div>
                        </div>


                    </ItemTemplate>
                </asp:Repeater>


            </div>
        </div>
    </div>

    <div class="block block-brands">
        <div class="container">
            <div class="block-brands__slider">
                <div class="owl-carousel">

                    <asp:Repeater runat="server" ID="rptBrandLogos" OnInit="brandLogos_Init">
                        <ItemTemplate>
                            <div class="block-brands__item">
                                <a href="#">
                                    <img src="images/logos/<%# Eval("Img") %>" alt="">
                                </a>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </div>
    <!-- .block-brands / end -->
    <!-- site__body / end -->
</asp:Content>
