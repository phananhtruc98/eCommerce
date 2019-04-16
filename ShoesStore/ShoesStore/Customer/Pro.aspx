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
                                                    <div class="filter-list">
                                                        <div class="filter-list__list">
                                                            <wcCustom:RepeaterTable runat="server" ID="rptProCat" TableName="ProCat">
                                                                <ItemTemplate>

                                                                    <label
                                                                        class="filter-list__item">
                                                                        <span
                                                                            class="filter-list__input input-check">
                                                                            <span
                                                                                class="input-check__body">
                                                                                <asp:HiddenField runat="server" Value='<%# Eval("CatId") %>' />
                                                                                <input runat="server" type="checkbox" id="chkProCat" class="input-check__input" />

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
                                                                                class="filter-list__title"><%# Eval("CatName") %></span><span
                                                                                    class="filter-list__counter"><%#ProCat_BUS.GetTotalPro(Eval("CatId")) %></span></label>
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
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
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
                                    <asp:Button Text="Lọc"
                                        CssClass="btn btn-primary btn-sm" ID="btnFilter" OnClick="btnFilter_OnClick" runat="server" />
                                    <button
                                        class="btn btn-secondary btn-sm ml-2">
                                        Reset
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="shop-layout__content">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <div class="block">
                                <div class="products-view">
                                    <div class="products-view__options">
                                        <div class="view-options">
                                            Trang <%:UcPro.RptPro.PageCurrent %> / <%:UcPro.RptPro.PageTotal %>
                                            <div class="view-options__legend"></div>
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

                                        </div>
                                    </div>
                                    <uc1:UcPro runat="server" ID="UcPro" RptPro-PageSize="2" />

                                </div>
                            </div>

                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

    </div>
    <!-- site__body / end -->
</asp:Content>
