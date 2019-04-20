<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoesStore.Default" %>

<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register Src="~/UserControls/UcPro.ascx" TagPrefix="uc1" TagName="UcPro" %>
<%@ Register Src="~/UserControls/UcProCarousel.ascx" TagPrefix="uc1" TagName="UcProCarousel" %>


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
    <uc1:UcProCarousel runat="server" id="ucProCarousel" PageSize="8"/>
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

                    <uc1:UcPro runat="server" ID="ucPro" PageSize="8" NumberOnRow="4" />
                    


                </div>

            </div>
            <div style="overflow: hidden;">
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
