<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcProCarousel.ascx.cs" Inherits="ShoesStore.UserControls.UcProCarousel" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Register TagPrefix="wcCustom" Namespace="ShoesStore.WebControls" Assembly="ShoesStore" %>
<div class="block block-products-carousel" data-layout="grid-5">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Sản phẩm ngẫu nhiên</h3>
            <div class="block-header__divider"></div>

        </div>
        <div class="block-products-carousel__slider">
            <div class="block-products-carousel__preloader"></div>
            <div class="owl-carousel">
                <wcCustom:RepeaterTable runat="server" ID="rptPro" AllowPage="True" ItemType="ShoesStore.DataAccessLogicLayer.Pro">
                    <ItemTemplate>
                        <div class="block-products-carousel__cell">
                            <div class="product-card">
                                <div class="product-card__badges-list">
                                    <div class="product-card__badge product-card__badge--<%# MyLibrary.Pro_BUS.IsSale(Item) ? "sale" : "new" %>"><%# MyLibrary.Pro_BUS.IsSale(Item) ? "Giảm giá" : "Mới" %></div>
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
                                            <%# MyLibrary.DrawStar(MyLibrary.Pro_BUS.AverageStar(Item)) %>
                                        </div>
                                        <div class="product-card__rating-legend"><%# MyLibrary.RcptBuyDet_BUS.GetNumberReview(Item) %> Đánh giá</div>
                                    </div>
                                </div>
                                <div class="product-card__actions">
                                    <div class="product-card__availability">
                                        Availability:
                                        <span class="text-success">
                                            In Stock
                                        </span>
                                    </div>
                                    <div class="product-card__prices"><%# MyLibrary.Pro_BUS.GetPriceFormat(Item) %></div>
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
                </wcCustom:RepeaterTable>
            </div>
        </div>
    </div>
</div>