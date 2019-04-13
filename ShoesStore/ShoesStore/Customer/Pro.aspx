<%@ Page Language="C#" Title="Sản phẩm" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="~/Customer/Pro.aspx.cs" Inherits="ShoesStore.Customer.DS_SanPham" %>

<%@ Register TagPrefix="wcCustom" Namespace="ShoesStore.WebControls" Assembly="ShoesStore" %>
<%@ Register Src="~/UserControls/UcPro.ascx" TagPrefix="uc1" TagName="UcPro" %>


<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="ShoesStore.BusinessLogicLayer" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<Sagara:BreadCrumbControl id="breadcrumb" runat="Server" />--%>

    <asp:SiteMapPath runat="server" ID="smp1" OnItemCreated="smp1_ItemCreated"></asp:SiteMapPath>


    <div class="site__body">
        <div class="page-header">
            <div class="page-header__container container">
                <div class="page-header__breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">Home</a>
                                <svg class="breadcrumb-arrow"
                                    width="6px" height="9px">
                                    <use href="images/sprite.svg#arrow-rounded-right-6x9"></use>
                                </svg>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="#">Breadcrumb</a>
                                <svg class="breadcrumb-arrow"
                                    width="6px" height="9px">
                                    <use href="images/sprite.svg#arrow-rounded-right-6x9"></use>
                                </svg>
                            </li>
                            <li class="breadcrumb-item active">Screwdrivers</li>
                        </ol>
                    </nav>
                </div>
                <div class="page-header__title">
                    <h1>Sản phẩm</h1>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="shop-layout shop-layout--sidebar--start">
                <div class="shop-layout__sidebar">
                    <div class="block ">
                        <div class="block-sidebar__item">
                            <div class="widget-filters widget" data-collapse
                                data-collapse-opened-class="filter--opened">
                                <h4 class="widget__title">Bộ lọc</h4>
                                <div>
                                    <div class="widget-filters__item">
                                        <div class="filter filter--opened" data-collapse-item>
                                            <button type="button"
                                                class="filter__title" data-collapse-trigger>
                                                Danh mục
            <svg
                class="filter__arrow" width="12px" height="7px">
                <use href="images/sprite.svg#arrow-rounded-down-12x7">
                </use>
            </svg>
                                            </button>
                                            <div class="filter__body" data-collapse-content>
                                                <div class="filter__container">
                                                    <div>
                                                        <ul class="filter-categories__list">

                                                            <wcCustom:RepeaterTable runat="server" TableName="ProCat">
                                                                <ItemTemplate>
                                                                    <li
                                                                        class="filter-categories__item filter-categories__item--current">
                                                                        <a href="#"><%#Eval("CatName") %></a>
                                                                        <div class="filter-categories__counter"><%#ProCat_BUS.GetTotalPro(Eval("CatId")) %></div>
                                                                    </li>
                                                                </ItemTemplate>
                                                            </wcCustom:RepeaterTable>
                                              
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-filters__item">
                                        <div class="filter filter--opened" data-collapse-item>
                                            <button type="button"
                                                class="filter__title" data-collapse-trigger>
                                                Price
            <svg
                class="filter__arrow" width="12px" height="7px">
                <use href="images/sprite.svg#arrow-rounded-down-12x7">
                </use>
            </svg>
                                            </button>
                                            <div class="filter__body" data-collapse-content>
                                                <div class="filter__container">
                                                    <div class="filter-price" data-min="500" data-max="1500"
                                                        data-from="590" data-to="1130">
                                                        <div class="filter-price__slider"></div>
                                                        <div class="filter-price__title">
                                                            Khoảng giá: 
                        <span
                            class="filter-price__min-value"></span>– 
                        <span
                            class="filter-price__max-value"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-filters__item">
                                        <div class="filter filter--opened" data-collapse-item>
                                            <button type="button"
                                                class="filter__title" data-collapse-trigger>
                                                Thương hiệu
            <svg
                class="filter__arrow" width="12px" height="7px">
                <use href="images/sprite.svg#arrow-rounded-down-12x7">
                </use>
            </svg>
                                            </button>
                                            <div class="filter__body" data-collapse-content>
                                                <div class="filter__container">
                                                    <div class="filter-list">
                                                        <div class="filter-list__list">
                                                            <wcCustom:RepeaterTable runat="server" ID="rptProBrand" TableName="ProBrand">
                                                                <ItemTemplate>

                                                                    <label
                                                                        class="filter-list__item">
                                                                        <span
                                                                            class="filter-list__input input-check">
                                                                            <span
                                                                                class="input-check__body">
                                                                                <input
                                                                                    class="input-check__input"
                                                                                    type="checkbox">
                                                                                <span
                                                                                    class="input-check__box"></span>
                                                                                <svg
                                                                                    class="input-check__icon" width="9px"
                                                                                    height="7px">
                                                                                    <use
                                                                                        href="images/sprite.svg#check-9x7">
                                                                                    </use>
                                                                                </svg>
                                                                            </span>
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
                                                                                class="filter-list__title"><%# Eval("BrandName") %></span><span
                                                                                    class="filter-list__counter"><%# ProBrand_BUS.GetTotalPro(Eval("BrandId"))  %></span></label>
                                                                </ItemTemplate>
                                                            </wcCustom:RepeaterTable>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-filters__item">
                                        <div class="filter filter--opened" data-collapse-item>
                                            <button type="button"
                                                class="filter__title" data-collapse-trigger>
                                                Color
    <svg
        class="filter__arrow" width="12px" height="7px">
        <use href="images/sprite.svg#arrow-rounded-down-12x7">
        </use>
    </svg>
                                            </button>
                                            <div class="filter__body" data-collapse-content>
                                                <div class="filter__container">
                                                    <div class="filter-color">
                                                        <div class="filter-color__list">
                                                            <label
                                                                class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color input-check-color--white"
                                                                    style="color: #fff;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color input-check-color--light"
                                                                    style="color: #d9d9d9;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #b3b3b3;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #808080;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #666;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #4d4d4d;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #262626;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #ff4040;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox" checked="checked">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #ff8126;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color input-check-color--light"
                                                                    style="color: #ffd440;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color input-check-color--light"
                                                                    style="color: #becc1f;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #8fcc14;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox" checked="checked">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #47cc5e;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #47cca0;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #47cccc;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #40bfff;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox" disabled="disabled">
                                                                        <span class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #3d6dcc;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox" checked="checked">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #7766cc;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #b852cc;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                            <label class="filter-color__item">
                                                                <span
                                                                    class="filter-color__check input-check-color"
                                                                    style="color: #e53981;">
                                                                    <label
                                                                        class="input-check-color__body">
                                                                        <input
                                                                            class="input-check-color__input"
                                                                            type="checkbox">
                                                                        <span
                                                                            class="input-check-color__box"></span>
                                                                        <svg class="input-check-color__icon"
                                                                            width="12px" height="9px">
                                                                            <use
                                                                                href="images/sprite.svg#check-12x9">
                                                                            </use>
                                                                        </svg>
                                                                        <span
                                                                            class="input-check-color__stick"></span>
                                                                    </label>
                                                                </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-filters__actions d-flex">
                                    <button
                                        class="btn btn-primary btn-sm">
                                        Filter
                                    </button>
                                    <button
                                        class="btn btn-secondary btn-sm ml-2">
                                        Reset
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="block-sidebar__item d-none d-lg-block">
                            <div class="widget-products widget">
                                <h4 class="widget__title">Latest Products</h4>
                                <div class="widget-products__list">
                                    <div class="widget-products__item">
                                        <div class="widget-products__image">
                                            <a href="product.html">
                                                <img
                                                    src="images/products/product-1.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="widget-products__info">
                                            <div class="widget-products__name">
                                                <a href="product.html">Electric
                            Planer Brandix KL370090G 300 Watts
                                                </a>
                                            </div>
                                            <div class="widget-products__prices">$749.00</div>
                                        </div>
                                    </div>
                                    <div class="widget-products__item">
                                        <div class="widget-products__image">
                                            <a href="product.html">
                                                <img
                                                    src="images/products/product-2.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="widget-products__info">
                                            <div class="widget-products__name">
                                                <a href="product.html">Undefined Tool
                            IRadix DPS3000SY 2700 Watts
                                                </a>
                                            </div>
                                            <div class="widget-products__prices">$1,019.00</div>
                                        </div>
                                    </div>
                                    <div class="widget-products__item">
                                        <div class="widget-products__image">
                                            <a href="product.html">
                                                <img
                                                    src="images/products/product-3.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="widget-products__info">
                                            <div class="widget-products__name">
                                                <a href="product.html">Drill
                            Screwdriver Brandix ALX7054 200 Watts
                                                </a>
                                            </div>
                                            <div class="widget-products__prices">$850.00</div>
                                        </div>
                                    </div>
                                    <div class="widget-products__item">
                                        <div class="widget-products__image">
                                            <a href="product.html">
                                                <img
                                                    src="images/products/product-4.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="widget-products__info">
                                            <div class="widget-products__name">
                                                <a href="product.html">Drill Series 3
                            Brandix KSR4590PQS 1500 Watts
                                                </a>
                                            </div>
                                            <div class="widget-products__prices">
                                                <span
                                                    class="widget-products__new-price">$949.00
                                                </span>
                                                <span
                                                    class="widget-products__old-price">$1189.00
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-products__item">
                                        <div class="widget-products__image">
                                            <a href="product.html">
                                                <img
                                                    src="images/products/product-5.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="widget-products__info">
                                            <div class="widget-products__name">
                                                <a href="product.html">Brandix Router
                            Power Tool 2017ERXPK
                                                </a>
                                            </div>
                                            <div class="widget-products__prices">$1,700.00</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="shop-layout__content">
                    <div class="block">
                        <div class="products-view">
                            <div class="products-view__options">
                                <div class="view-options">
                                    <div class="view-options__layout">
                                        <div class="layout-switcher">
                                            <div class="layout-switcher__list">
                                                <button data-layout="grid-3-sidebar"
                                                    data-with-features="false" title="Grid" type="button"
                                                    class="layout-switcher__button layout-switcher__button--active">
                                                    <svg
                                                        width="16px" height="16px">
                                                        <use href="images/sprite.svg#layout-grid-16x16"></use>
                                                    </svg>
                                                </button>
                                                <button data-layout="grid-3-sidebar"
                                                    data-with-features="true" title="Grid With Features"
                                                    type="button" class="layout-switcher__button">
                                                    <svg width="16px"
                                                        height="16px">
                                                        <use
                                                            href="images/sprite.svg#layout-grid-with-details-16x16">
                                                        </use>
                                                    </svg>
                                                </button>
                                                <button data-layout="list"
                                                    data-with-features="false" title="List" type="button"
                                                    class="layout-switcher__button">
                                                    <svg width="16px" height="16px">
                                                        <use href="images/sprite.svg#layout-list-16x16"></use>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="view-options__legend">Showing 6 of 98 products</div>
                                    <div class="view-options__divider"></div>
                                    <div class="view-options__control">
                                        <label for="">Sắp xếp</label>
                                        <div>
                                            <select class="form-control form-control-sm" name="" id="">
                                                <option value="">Bán chạy nhất</option>
                                                <option value="">Tên: Từ A đến Z</option>
                                                <option value="">Tên: Từ Z đến A</option>
                                                <option value="">Giá: Thấp đến Cao</option>
                                                <option value="">Giá: Cao đến Thấp</option>
                                                <option value="">Rating: Cao đến Thấp</option>
                                                <option value="">Rating: Thấp đến Cao</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="view-options__control">
                                        <label for="">Show</label>
                                        <div>
                                            <select class="form-control form-control-sm" name="" id="">
                                                <option value="">12</option>
                                                <option value="">24</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <uc1:UcPro runat="server" ID="UcPro" />
                       <%--     <div class="products-view__list products-list" data-layout="grid-3-sidebar"
                                data-with-features="false">
                                <div class="products-list__body">

                                    <wcCustom:RepeaterTable runat="server" ID="rptPro" TableName="Pro">
                                        <ItemTemplate>
                                            <div class="products-list__item">
                                                <div class="product-card">

                                                    <div class="product-card__badges-list">
                                                        <div class="product-card__badge product-card__badge--new">New</div>
                                                    </div>
                                                    <div class="product-card__image">
                                                        <a href="#">
                                                            <img
                                                                src="<%#MyLibrary.ProImgPath(Eval("ShpId"),Eval("Img")) %>" alt="">
                                                        </a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                                                    <svg
                                                                        class="rating__star rating__star--active"
                                                                        width="13px" height="12px">
                                                                        <g class="rating__fill">
                                                                            <use href="images/sprite.svg#star-normal">
                                                                            </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                            <use
                                                                                href="images/sprite.svg#star-normal-stroke">
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
                                                                            <use href="images/sprite.svg#star-normal">
                                                                            </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                            <use
                                                                                href="images/sprite.svg#star-normal-stroke">
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
                                                                            <use href="images/sprite.svg#star-normal">
                                                                            </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                            <use
                                                                                href="images/sprite.svg#star-normal-stroke">
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
                                                                            <use href="images/sprite.svg#star-normal">
                                                                            </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                            <use
                                                                                href="images/sprite.svg#star-normal-stroke">
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
                                                                    <svg class="rating__star" width="13px"
                                                                        height="12px">
                                                                        <g class="rating__fill">
                                                                            <use href="images/sprite.svg#star-normal">
                                                                            </use>
                                                                        </g>
                                                                        <g class="rating__stroke">
                                                                            <use
                                                                                href="images/sprite.svg#star-normal-stroke">
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
                                                        <ul class="product-card__features-list">
                                                            <li>Speed: 750 RPM</li>
                                                            <li>Power Source: Cordless-Electric</li>
                                                            <li>Battery Cell Type: Lithium</li>
                                                            <li>Voltage: 20 Volts</li>
                                                            <li>Battery Capacity: 2 Ah</li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-card__actions">
                                                        <div class="product-card__availability">
                                                            Availability:
                        <span
                            class="text-success">In Stock
                        </span>
                                                        </div>
                                                        <div class="product-card__prices"><%# MyLibrary.ToFormatMoney(Eval("Price")) %></div>
                                                        <div class="product-card__buttons">
                                                            <button
                                                                class="btn btn-primary product-card__addtocart"
                                                                type="button">
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
                                    </wcCustom:RepeaterTable>

                                </div>
                            </div>
                            <div class="products-view__pagination">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item disabled">
                                        <a class="page-link page-link--with-arrow"
                                            href="#" aria-label="Previous">
                                            <svg
                                                class="page-link__arrow page-link__arrow--left" aria-hidden="true"
                                                width="8px" height="13px">
                                                <use href="images/sprite.svg#arrow-rounded-left-8x13"></use>
                                            </svg>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">2
                <span
                    class="sr-only">(current)
                </span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link page-link--with-arrow" href="#"
                                            aria-label="Next">
                                            <svg class="page-link__arrow page-link__arrow--right"
                                                aria-hidden="true" width="8px" height="13px">
                                                <use href="images/sprite.svg#arrow-rounded-right-8x13"></use>
                                            </svg>
                                        </a>
                                    </li>
                                </ul>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- site__body / end -->
</asp:Content>
