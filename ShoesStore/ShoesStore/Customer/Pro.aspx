<%@ Page Language="C#" Title="Sản phẩm" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="~/Customer/Pro.aspx.cs" Inherits="ShoesStore.Customer.DS_SanPham" %>
<%@ Import Namespace="ShoesStore.BusinessLogicLayer" %>

<%@ Register Src="~/UserControls/UcPro.ascx" TagPrefix="uc1" TagName="UcPro" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


<%--
	<Sagara:BreadCrumbControl id="breadcrumb" runat="Server" />--%>

<div class="site__body">
<div class="page-header">
    <div class="page-header__container container">
        <div class="page-header__breadcrumb">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="/">Trang chủ</a>
                        <svg class="breadcrumb-arrow" width="6px" height="9px">
                            <use href="images/sprite.svg#arrow-rounded-right-6x9"></use>
                        </svg>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="#">Sản phẩm</a>
                    </li>
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
            <div class="widget-filters widget" data-collapse data-collapse-opened-class="filter--opened">
                <h4 class="widget__title">Bộ lọc</h4>
                <div>
                    <div class="widget-filters__item input-group ">
                        <input runat="server" id="txtSearch" type="text" class="form-control" placeholder="Nhập tên sản phẩm" aria-label="Recipient's username" aria-describedby="basic-addon2">
                    </div>
                    <div class="widget-filters__item">
                        <div class="filter filter--opened" data-collapse-item>
                            <button type="button" class="filter__title" data-collapse-trigger>
                                Danh mục


                                <svg class="filter__arrow" width="12px" height="7px">
                                    <use href="images/sprite.svg#arrow-rounded-down-12x7"></use>
                                </svg>
                            </button>
                            <div class="filter__body" data-collapse-content>
                                <div class="filter__container">
                                    <div class="filter-list">
                                        <div class="filter-list__list">
                                            <asp:Repeater runat="server" ID="rptProCat" OnInit="rptProCat_Init" OnItemDataBound="rptProCat_ItemDataBound">
                                                <ItemTemplate>
                                                    <label class="filter-list__item">
                                                        <span class="filter-list__input input-check">
                                                            <span class="input-check__body">
                                                                <asp:HiddenField runat="server" ID="hdfProCatId" Value='
																					<%# Eval("CatId") %>'/>
                                                                <asp:CheckBox runat="server" ID="chkProCat"/>
                                                                <span class="input-check__box"></span>
                                                                <svg class="input-check__icon" width="9px" height="7px">
                                                                    <use href="images/sprite.svg#check-9x7"></use>
                                                                </svg>
                                                            </span>
                                                        </span>
                                                        <span class="filter-list__title">
                                                            <%# Eval("CatName") %>
                                                        </span>
                                                        <span class="filter-list__counter">
                                                            <%#ProCat_BUS.GetTotalPro(Eval("CatId")) %>
                                                        </span>
                                                    </label>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget-filters__item">
                        <div class="filter filter--opened" data-collapse-item>
                            <button type="button" class="filter__title" data-collapse-trigger>
                                Khoảng giá


                                <svg class="filter__arrow" width="12px" height="7px">
                                    <use href="images/sprite.svg#arrow-rounded-down-12x7"></use>
                                </svg>
                            </button>
                            <div class="filter__body" data-collapse-content>
                                <div class="filter__container">
                                    <div class="filter-price" data-min="500" data-max="1500" data-from="590" data-to="1130">
                                        <%--<div class="filter-price__slider"></div>--%>
                                        <div class="filter-price__title row">
                                            <div class="col-5">
                                                <asp:TextBox ID="priceFrom" runat="server" onkeyup="" Width="100%" CssClass="filter-price__min-value" Text="0"></asp:TextBox>

                                            </div>

                                            <div class="col-2 text-center">
                                                -
                                            </div>
                                            <div class="col-5">
                                                <asp:TextBox ID="priceTo" runat="server" Width="100%" CssClass="filter-price__max-value" Text="9999999"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget-filters__item">
                        <div class="filter filter--opened" data-collapse-item>
                            <button type="button" class="filter__title" data-collapse-trigger>
                                Thương hiệu


                                <svg class="filter__arrow" width="12px" height="7px">
                                    <use href="images/sprite.svg#arrow-rounded-down-12x7"></use>
                                </svg>
                            </button>
                            <div class="filter__body" data-collapse-content>
                                <div class="filter__container">
                                    <div class="filter-list">
                                        <div class="filter-list__list">
                                            <asp:Repeater runat="server" ID="rptProBrand" OnInit="rptProBrand_Init" ItemType="ShoesStore.DataAccessLogicLayer.ProBrand" OnItemDataBound="rptProBrand_ItemDataBound">
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="hdfBrandId" Value="
																			<%# Item.BrandId %>"/>
                                                    <label class="filter-list__item">
                                                        <span class="filter-list__input input-check">
                                                            <span class="input-check__body">
                                                                <asp:CheckBox runat="server" ID="chkBrand"/>
                                                                <span class="input-check__box"></span>
                                                                <svg class="input-check__icon" width="9px" height="7px">
                                                                    <use href="images/sprite.svg#check-9x7"></use>
                                                                </svg>
                                                            </span>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                        </span>
                                                        <span class="filter-list__title">
                                                            <%# Item.BrandName %>
                                                        </span>
                                                        <span class="filter-list__counter">
                                                            <%# ProBrand_BUS.GetTotalPro(Item.BrandId) %>
                                                        </span>
                                                    </label>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget-filters__item">
                        <div class="filter filter--opened" data-collapse-item>
                            <button type="button" class="filter__title" data-collapse-trigger>
                                Màu


                                <svg class="filter__arrow" width="12px" height="7px">
                                    <use href="images/sprite.svg#arrow-rounded-down-12x7"></use>
                                </svg>
                            </button>
                            <div class="filter__body" data-collapse-content>
                                <div class="filter__container">
                                    <div class="filter-color">
                                        <div class="filter-color__list">

                                            <asp:Repeater runat="server" ID="rptColors" ItemType="ShoesStore.DataAccessLogicLayer.ProColor" OnInit="rptColors_Init" OnItemDataBound="rptColors_ItemDataBound">
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="hdfColorId" Value="
																				<%# Item.ColorId %>"/>
                                                    <label runat="server" class="filter-color__item">
                                                        <span class="filter-color__check input-check-color input-check-color--white" style="color: #<%# Item.HexCode %>">
                                                            <label class="input-check-color__body">
                                                                <asp:CheckBox runat="server" ID="chkColor"/>
                                                                <span class="input-check-color__box"></span>
                                                                <svg class="input-check-color__icon" width="12px" height="9px">
                                                                    <use href="images/sprite.svg#check-12x9"></use>
                                                                </svg>
                                                                <span class="input-check-color__stick"></span>
                                                            </label>
                                                        </span>
                                                    </label>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="widget-filters__actions d-flex">
                    <asp:Button Text="Lọc" CssClass="btn btn-primary btn-sm" ID="btnFilter" OnClick="btnFilter_OnClick" runat="server"/>
                    <button class="btn btn-secondary btn-sm ml-2" id="Reset" runat="server" onserverclick="Reset_ServerClick">
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
                            Trang<%-- <%: UcPro.RptPro.PageCurrent %> / <%: UcPro.RptPro.PageTotal %>--%>
                            <div class="view-options__legend"></div>
                            <div class="view-options__divider"></div>
                            <div class="view-options__control">
                                <label for="">Sắp xếp</label>
                                <div>

                                    <select class="form-control form-control-sm" runat="server" id="filterPro">
                                        <option value="-1" selected>Chọn loại kiểu sắp xếp</option>
                                        <option value="0">Bán chạy nhất</option>
                                        <option value="1">Giá: Thấp đến Cao</option>
                                        <option value="2">Giá: Cao đến Thấp</option>
                                        <option value="3">Rating: Cao đến Thấp</option>
                                        <option value="4">Rating: Thấp đến Cao</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>


                    <uc1:UcPro runat="server" ID="UcPro" PageSize="20" NumberPerRow="3"/>
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