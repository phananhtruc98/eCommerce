<%@ Page Language="C#" Title="Giỏ hàng" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Cart.aspx.cs" Inherits="ShoesStore.Customer.GioHang" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- site__body -->
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
                            <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                        </ol>
                    </nav>
                </div>
                <div class="page-header__title">
                    <h1>Giỏ hàng</h1>
                </div>
            </div>
        </div>
        <div class="cart block">
            <div class="container">
                <table class="cart__table cart-table">
                    <thead class="cart-table__head">
                    <tr class="cart-table__row">
                        <th class="cart-table__column cart-table__column--image">Ảnh</th>
                        <th class="cart-table__column cart-table__column--product">Sản phẩm</th>
                        <th class="cart-table__column cart-table__column--price">Đơn giá</th>
                        <th class="cart-table__column cart-table__column--quantity">Số lượng</th>
                        <th class="cart-table__column cart-table__column--total">Số tiền</th>
                        <th class="cart-table__column cart-table__column--remove"></th>
                    </tr>
                    </thead>
                    <tbody class="cart-table__body">
                    <tr class="cart-table__row">
                        <td class="cart-table__column cart-table__column--image">
                            <a href="#">
                                <img
                                    src="images/products/product-1.jpg" alt="">
                            </a>
                        </td>
                        <td class="cart-table__column cart-table__column--product">
                            <a href="#"
                               class="cart-table__product-name">
                                Electric Planer Brandix KL370090G 300 Watts
                            </a>
                            <ul class="cart-table__options">
                                <li>Color: Yellow</li>
                                <li>Material: Aluminium</li>
                            </ul>
                        </td>
                        <td class="cart-table__column cart-table__column--price" data-title="Price">$699.00</td>
                        <td class="cart-table__column cart-table__column--quantity" data-title="Quantity">
                            <div class="input-number">
                                <input class="form-control input-number__input"
                                       type="number" min="1" value="2">
                                <div class="input-number__add"></div>
                                <div class="input-number__sub"></div>
                            </div>
                        </td>
                        <td class="cart-table__column cart-table__column--total" data-title="Total">
                            $1,398.00
                        </td>
                        <td class="cart-table__column cart-table__column--remove">
                            <button type="button"
                                    class="btn btn-light btn-sm btn-svg-icon">
                                <svg width="12px" height="12px">
                                    <use xlink:href="images/sprite.svg#cross-12"></use>
                                </svg>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="cart__actions">
                    <a href="#" class="btn btn-secondary btn-lg custom_font">Tiếp tục mua sắm</a>
                    <a href="#" class="btn btn-primary cart__update-button btn-lg custom_font">Cập nhật giỏ hàng</a>
                </div>
                <div class="row justify-content-end pt-5">
                    <div class="col-12 col-md-7 col-lg-6 col-xl-5">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">Tổng giỏ hàng</h3>
                                <table class="cart__totals">
                                    <thead class="cart__totals-header">
                                    <tr>
                                        <th>Tổng con</th>
                                        <td>$5,877.00</td>
                                    </tr>
                                    </thead>
                                    <tbody class="cart__totals-body">
                                    <tr>
                                        <th>Phí vận chuyển</th>
                                        <td>
                                            $25.00
                                            <div class="cart__calc-shipping">
                                                <a href="#">Cách tính ship</a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot class="cart__totals-footer">
                                    <tr>
                                        <th>Tổng</th>
                                        <td>$5,902.00</td>
                                    </tr>
                                    </tfoot>
                                </table>
                                <a class="btn btn-primary btn-xl btn-block cart__checkout-button"
                                   href="checkout.html">
                                    Thanh toán
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- site__body / end -->
</asp:Content>