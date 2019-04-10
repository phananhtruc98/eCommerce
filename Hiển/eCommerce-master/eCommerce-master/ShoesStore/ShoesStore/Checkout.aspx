<%@ Page Language="C#" Title="Thanh toán" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ShoesStore.ThanhToan" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="site__body">
        <div class="page-header">
            <div class="page-header__container container">
                <div class="page-header__breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Trang chủ</a>
                                <svg class="breadcrumb-arrow"
                                    width="6px" height="9px">
                                    <use xlink:href="images/sprite.svg#arrow-rounded-right-6x9"></use>
                                </svg></li>
                            <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
                        </ol>
                    </nav>
                </div>
                <div class="page-header__title">
                    <h1>Thanh toán</h1>
                </div>
            </div>
        </div>
        <div class="checkout block">
            <div class="container">
                <div class="row">
                    <div class="col-12 mb-3">
                        <div class="alert alert-lg alert-primary">
                            Đăng nhập <a href="#">Tại đây</a>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6 col-xl-7">
                        <div class="card mb-lg-0">
                            <div class="card-body">
                                <h3 class="card-title">Thông tin người mua</h3>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-first-name">
                                            Họ và tên
                                        </label>
                                        <input type="text" class="form-control form-control-lg"
                                            id="checkout-first-name">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-last-name">
                                            Địa chỉ</label>
                                        <input type="text" class="form-control form-control-lg" 
                                            id="checkout-last-name">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-country">Thành phố</label>
                                        <select
                                            id="checkout-country" class="form-control form-control-lg">
                                            <option>--Chọn thành phố--</option>
                                            <option>Hồ Chí Minh</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-email">
                                            Email</label>
                                        <input type="email" class="form-control form-control-lg"
                                            id="checkout-email" >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-phone">Số điện thoại</label>
                                        <input type="text" class="form-control form-control-lg" id="checkout-phone">
                                    </div>
                                </div>

                            </div>
                            <div class="card-divider"></div>
                            <div class="card-body">
                                <h3 class="card-title">Thông tin vận chuyển</h3>

                                <div class="form-group">
                                    <label for="checkout-comment">
                                        Lời nhắn
                                    </label>
                                    <textarea id="checkout-comment" class="form-control" rows="4"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6 col-xl-5 mt-4 mt-lg-0">
                        <div class="card mb-0">
                            <div class="card-body">
                                <h3 class="card-title">Hóa đơn</h3>
                                <table class="checkout__totals">
                                    <thead class="checkout__totals-header">
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Tổng</th>
                                        </tr>
                                    </thead>
                                    <tbody class="checkout__totals-products">
                                        <tr>
                                            <td>Electric Planer Brandix KL370090G 300 Watts × 2</td>
                                            <td>$1,398.00</td>
                                        </tr>
                                        <tr>
                                            <td>Undefined Tool IRadix DPS3000SY 2700 watts × 1</td>
                                            <td>$849.00</td>
                                        </tr>
                                        <tr>
                                            <td>Brandix Router Power Tool 2017ERXPK × 3</td>
                                            <td>$3,630.00</td>
                                        </tr>
                                    </tbody>
                                    <tbody class="checkout__totals-subtotals">
                                        <tr>
                                            <th>Tổng con</th>
                                            <td>$5,877.00</td>
                                        </tr>
                                        <tr>
                                            <th>Tổng giảm</th>
                                            <td>$-20.00</td>
                                        </tr>
                                        <tr>
                                            <th>Tiền ship</th>
                                            <td>$25.00</td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="checkout__totals-footer">
                                        <tr>
                                            <th>Tổng</th>
                                            <td>$5,882.00</td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <div class="checkout__agree form-group">
                                    <div class="form-check">
                                        <span class="form-check-input input-check"><span
                                            class="input-check__body">
                                            <input class="input-check__input"
                                                type="checkbox" id="checkout-terms">
                                            <span
                                                class="input-check__box"></span>
                                            <svg class="input-check__icon"
                                                width="9px" height="7px">
                                                <use xlink:href="images/sprite.svg#check-9x7"></use>
                                            </svg>
                                        </span></span>
                                        <label class="form-check-label" for="checkout-terms">   Tôi đã đọc và đồng ý với <a
                                                target="_blank" href="#">các điều khoản</a> của website THE SHUZ*</label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-xl btn-block">
                                   Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
