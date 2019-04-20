<%@ Page Language="C#" Title="Thanh toán" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Customer/Checkout.aspx.cs" Inherits="ShoesStore.Customer.ThanhToan" %>

<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
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
                                    <use href="images/sprite.svg#arrow-rounded-right-6x9" />
                                </svg>
                            </li>
                            <li class="breadcrumb-item active" <%--aria-current="page"--%>>Thanh toán</li>
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
                                            value="<%:WebSession.LoginCus.Usr.UsrName %>"
                                            id="checkout-first-name">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-last-name">
                                            Địa chỉ
                                        </label>
                                        <input type="text" class="form-control form-control-lg"
                                            value="<%:WebSession.LoginCus.Usr.Address %>"
                                            id="checkout-last-name">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-email">
                                            Email
                                        </label>
                                        <input type="email" class="form-control form-control-lg"
                                            value="<%:WebSession.LoginCus.Usr.Email %>"
                                            id="checkout-email">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="checkout-phone">Số điện thoại</label>
                                        <input type="text" class="form-control form-control-lg" id="checkout-phone"
                                            value="<%:WebSession.LoginCus.Usr.Phone %>">
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
                                            <th>Số lượng</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody class="checkout__totals-products">

                                        <asp:Repeater runat="server" ID="rptCartDetCheckout" ItemType="ShoesStore.DataAccessLogicLayer.CartDet">

                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Item.ProDet.Pro.ProName %></td>
                                                    <td><%# Item.Qty %></td>
                                                    <td><%# (Decimal.Parse(Item.ProDet.Pro.Price)*Item.Qty.Value).ToFormatMoney() %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                    <tbody class="checkout__totals-subtotals">
                                        <%--   <tr>
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
                                        </tr>--%>
                                    </tbody>
                                    <tfoot class="checkout__totals-footer">
                                        <tr>
                                            <th>Tổng</th>
                                            <td><%:MyLibrary.CartDet_BUS.SumCartDetPrice().ToFormatMoney() %></td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <div class="payment-methods">
                                    <ul class="payment-methods__list">

                                        <li class="payment-methods__item">
                                            <label
                                                class="payment-methods__item-header">
                                                <span
                                                    class="payment-methods__item-radio input-radio"><span
                                                        class="input-radio__body">
                                                        <input class="input-radio__input"
                                                            checked="checked"
                                                            name="checkout_payment_method" type="radio">
                                                        <span
                                                            class="input-radio__circle"></span></span></span><span
                                                                class="payment-methods__item-title">Thanh toán khi nhận hàng</span></label>
                                            <div class="payment-methods__item-container">
                                                <div class="payment-methods__item-description text-muted">Thành toán bằng tiền mặt khi nhận hàng</div>
                                            </div>
                                        </li>
                                       
                                    </ul>
                                </div>

                                <div class="checkout__agree form-group">
                                    <div class="form-check">
                                        <span class="form-check-input input-check">
                                            <span
                                                class="input-check__body">
                                                <input class="input-check__input" runat="server"
                                                    type="checkbox" id="checkout_terms" />
                                                <span
                                                    class="input-check__box"></span>
                                                <svg class="input-check__icon"
                                                    width="9px" height="7px">
                                                    <use href="images/sprite.svg#check-9x7"></use>
                                                </svg>
                                            </span>
                                        </span>
                                        <label class="form-check-label" for="checkout-terms">
                                            Tôi đã đọc và đồng ý với
                                            <a
                                                target="_blank" href="#">các điều khoản
                                            </a>của website THE SHUZ*
                                        </label>
                                    </div>
                                </div>
                                <asp:Button runat="server" Text="Đặt hàng" ID="btnOrder" OnClick="btnOrder_OnClick" CssClass="btn btn-primary btn-xl btn-block" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
