<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="~/CusHome.aspx.cs" Inherits="ShoesStore.Customer.CusHome" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="site__body">
        <div class="page-header">
            <div class="page-header__container container">
                <div class="page-header__breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">Trang chủ</a>
                                <svg class="breadcrumb-arrow"
                                     width="6px" height="9px">
                                    <use xlink:href="images/sprite.svg#arrow-rounded-right-6x9"></use>
                                </svg>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Tài khoản của tôi</li>
                        </ol>
                    </nav>
                </div>
                <div class="page-header__title">
                    <h1>Tài khoản</h1>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="shop-layout shop-layout--sidebar--start">
                <div class="shop-layout__sidebar">
                    <div class="block block-sidebar">
                        <div class="block-sidebar__item">
                            <div class="widget-filters widget" data-collapse
                                 data-collapse-opened-class="filter--opened">
                                <h4 class="widget__title">Xin chào, Tên người dùng</h4>
                                <div class="widget-filters__list">
                                    <div class="widget-filters__item">
                                        <div class="filter filter--opened" data-collapse-item>
                                            <button type="button"
                                                    class="filter__title" data-collapse-trigger>
                                                Quản lý tài khoản
                                                <svg
                                                    class="filter__arrow" width="12px" height="7px">
                                                    <use xlink:href="images/sprite.svg#arrow-rounded-down-12x7">
                                                    </use>
                                                </svg>
                                            </button>
                                            <div class="filter__body" data-collapse-content>
                                                <div class="filter__container">
                                                    <div class="filter-categories">
                                                        <ul class="filter-categories__list">
                                                            <li class="filter-categories__item filter-categories__item--parent">
                                                                <a href="#">Thông tin cá nhân</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--parent">
                                                                <a href="#">Sổ địa chỉ</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--child">
                                                                <a href="#">Tùy chọn thanh toán</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--child">
                                                                <a href="#">Mã giảm giá</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--current">
                                                                <a href="#">Đơn hàng của tôi</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--child">
                                                                <a href="#">Đơn hàng đổi trả</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--child">
                                                                <a href="#">Đơn hàng hủy</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--current">
                                                                <a href="#">Nhận xét của tôi</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--current">
                                                                <a href="#">Sản phẩm yêu thích</a>
                                                            </li>
                                                            <li class="filter-categories__item filter-categories__item--current">
                                                                <a href="#">Đơn hàng đang theo dõi</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>