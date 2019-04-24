<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerShop.aspx.cs" Inherits="ShoesStore.Merchant.MerShop" %>
<%@ Import Namespace="ShoesStore" %>
<%@ MasterType VirtualPath="~/Merchant/SiteMerchant.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
<!--Thông Tin Shop-->
<div>
    <div class="col-lg-4 order-lg-1 text-center">
        <img src="//placehold.it/150" class="mx-auto img-fluid img-circle d-block" alt="avatar"/>
        <h6 class="mt-2">Tên Merchant</h6>
        <label class="custom-file">
            <input type="file" id="file" class="custom-file-input"/>
            <span class="custom-file-control">Choose file</span>
        </label>
    </div>
    <div class="tab-content py-4">
        <div class="tab-pane active" id="profile">
            <h5 class="mb-3">Trang Shop Cá Nhân</h5>
            <div class="row">
                <div class="col-md-6">
                    <h6>About</h6>
                    <p>
                        Chi Tiết Của Shop
                    </p>
                    <h6>Categories</h6>
                    <p>
                        Male Sneakers, Casual and Sporty Sneakers
                    </p>
                </div>
                <div class="col-md-6">
                    <h6>Recent badges</h6>
                    <a href="#" class="badge badge-dark badge-pill">html5</a>
                    <a href="#" class="badge badge-dark badge-pill">react</a>
                    <a href="#" class="badge badge-dark badge-pill">codeply</a>
                    <a href="#" class="badge badge-dark badge-pill">angularjs</a>
                    <a href="#" class="badge badge-dark badge-pill">css3</a>
                    <a href="#" class="badge badge-dark badge-pill">jquery</a>
                    <a href="#" class="badge badge-dark badge-pill">bootstrap</a>
                    <a href="#" class="badge badge-dark badge-pill">responsive-design</a>
                    <hr/>
                    <span class="badge badge-primary"><i class="fa fa-user"></i>900 Followers</span>
                    <span class="badge badge-success"><i class="fa fa-cog"></i>43 Forks</span>
                    <span class="badge badge-danger"><i class="fa fa-eye"></i>245 Views</span>
                </div>
            </div>
            <!--/row-->
        </div>
    </div>
</div>
<!--Thông Tin Shop/End-->
<hr/>
<!--Featured Products-->
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
                <asp:Repeater runat="server" ID="featuredProducts">
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
                <asp:Repeater runat="server" ID="rptFeatureProducts">
                    <ItemTemplate>
                        <div class="block-products-carousel__cell">
                            <div class="product-card">
                                <div class="product-card__badges-list">
                                    <div class="product-card__badge product-card__badge--new">New</div>
                                </div>
                                <div class="product-card__image">
                                    <a href="product.html">
                                        <img src="<%# MyLibrary.ProImgPath(Container.DataItem) %>" alt="">
                                    </a>
                                </div>
                                <div class="product-card__info">
                                    <div class="product-card__name">
                                        <a href="product.html"><%#Eval("ProName") %></a>
                                    </div>
                                    <div class="product-card__rating">
                                        <div class="rating">
                                            <div class="rating__body">
                                                <svg class="rating__star rating__star--active" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                    <div class="product-card__prices"><%# Eval("Price") %></div>
                                    <div class="product-card__shop text-right small text-monospace">
                                        <a href="product.html"><%#Eval("Shp.ShpName") %></a>
                                    </div>
                                    <div class="product-card__buttons">
                                        <button class="btn btn-primary product-card__addtocart" type="button">
                                            Add To
                                            Cart
                                        </button>
                                        <button class="btn btn-secondary product-card__addtocart product-card__addtocart--list" type="button">
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
<!-- .block-products -->
<div class="block block-products block-products--layout--large-last">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Bán Chạy Nhất</h3>
            <div class="block-header__divider"></div>
        </div>
        <div class="block-products__body">
            <div class="block-products__list">
                <asp:Repeater runat="server" ID="rptBestSellers">
                    <ItemTemplate>
                        <div style="width: 212.667px;" class="block-products__list-item col-xs-6 col-sm-4 col-md-3 col-lg-2 ">
                            <div class="product-card">
                                <div class="product-card__badges-list">
                                    <div class="product-card__badge product-card__badge--hot">Hot</div>
                                </div>
                                <div class="product-card__image">
                                    <a href="product.html">
                                        <img src="<%# MyLibrary.ProImgPath(Container.DataItem) %>" alt="">
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
                                                <svg class="rating__star rating__star--active" width="13px" height="12px">
                                                    <g class="rating__fill">
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                                        <use href="images/sprite.svg#star-normal"></use>
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
                                            </div>
                                        </div>
                                        <div class="product-card__rating-legend">11 Reviews</div>
                                    </div>
                                </div>
                                <div class="product-card__actions">
                                    <div class="product-card__prices">$<%# Eval("Price") %></div>
                                    <div class="product-card__buttons">
                                        <button class="btn btn-primary product-card__addtocart" type="button">
                                            Add To Cart
                                        </button>
                                        <button class="btn btn-secondary product-card__addtocart product-card__addtocart--list" type="button">
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
            <asp:Repeater ID="rptPagingBestSellers" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="btnPage" Style="background: #ffa100; border: solid 1px #666; font: 8pt tahoma; margin: 2px; padding: 8px;" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server" ForeColor="White" Font-Bold="True">
                        <%# Container.DataItem %>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>
</asp:Content>