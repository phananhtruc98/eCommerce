<%@ Page Language="C#" Title="Giỏ hàng" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Customer/Cart.aspx.cs" Inherits="ShoesStore.Customer.GioHang" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
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
                                    <use href="images/sprite.svg#arrow-rounded-right-6x9"></use>
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

                    <asp:Repeater runat="server" ID="rptCartDetShp" ItemType="ShoesStore.DataAccessLogicLayer.Shp" OnItemDataBound="rptCartDetShp_OnItemDataBound">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hdfShpId" Value="<%# Item.ShpId %>"/>

                            <tr>
                                <td class="cart-table__column--shop">
                                    Shop : <%# Item.ShpName %>
                                </td>
                            </tr>
                            <asp:Repeater runat="server" ID="rptCartDetCart" ItemType="ShoesStore.DataAccessLogicLayer.CartDet" OnItemDataBound="rptCartDetCart_OnItemDataBound">
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hdfPrimaryKeys" Value='<%# $"{Item.CartId},{Item.ShpId},{Item.ProId},{Item.ColorId},{Item.SizeId}" %>'/>
                                    <tr class="cart-table__row">

                                        <td class="cart-table__column cart-table__column--image">
                                            <a href="#">
                                                <img
                                                    src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                            </a>
                                        </td>
                                        <td class="cart-table__column cart-table__column--product">
                                            <a href="#"
                                               class="cart-table__product-name">
                                                <%# Item.ProDet.Pro.ProName %>
                                            </a>
                                            <ul class="cart-table__options">
                                                <li>Màu: <%# Item.ProDet.ProColor.ColorName %></li>
                                                <li>Kích cỡ: <%# Item.ProDet.ProSize.SizeName %></li>

                                            </ul>
                                        </td>
                                        <td class="cart-table__column cart-table__column--price" data-title="Price">
                                            <asp:Literal runat="server" Text="<%# Item.ProDet.Pro.Price.ToFormatMoney() %>" ID="ltrPrice"/>
                                        </td>
                                        <td class="cart-table__column cart-table__column--quantity" data-title="Quantity">
                                            <div class="input-number">
                                                <asp:TextBox runat="server" type="number" ID="txtQty" CssClass="form-control input-number__input"
                                                             OnTextChanged="txtQty_OnTextChanged" AutoPostBack="True" min="1" value="<%# Item.Qty %>">
                                                </asp:TextBox>

                                                <div class="input-number__add"></div>
                                                <div class="input-number__sub"></div>
                                            </div>
                                        </td>
                                        <td class="cart-table__column cart-table__column--total" data-title="Total">
                                            <asp:Literal runat="server" ID="ltrObjSumPrice" Text=" <%# (Convert.ToDouble(Item.ProDet.Pro.Price) * Convert.ToDouble(Item.Qty.ToString())).ToFormatMoney() %>">


                                            </asp:Literal>


                                        </td>
                                        <td class="cart-table__column cart-table__column--remove">
                                            <asp:LinkButton runat="server"
                                                            ID="btnCartDetPreviewClose"
                                                            CommandArgument='<%# $"{Item.CartId},{Item.ShpId},{Item.ProId},{Item.ColorId},{Item.SizeId},{Item}" %>'
                                                            OnCommand="btnCartDetPreviewClose_OnCommand"
                                                            CssClass="dropcart__product-remove btn btn-light btn-sm btn-svg-icon">
                                                <svg
                                                    width="10px" height="10px">
                                                    <use href="/images/sprite.svg#cross-10"></use>
                                                </svg>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                            <tr class="cart-table__row">
                                <td colspan="6" class="cart-table__column cart-table__column--total" data-title="Total">
                                    Tổng tiền:
                                    <asp:Literal runat="server" ID="ltrSumPerShp" Text="<%# (MyLibrary.CartDet_BUS.SumCartDetPrice_Shop(Item.ShpId)).ToFormatMoney() %>"/>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <tr>
                                <td>
                                    Tổng cha:
                                    <asp:Literal runat="server" ID="rptCartDetShp_Sum" Text='<%#(MyLibrary.CartDet_BUS.SumCartDetPrice()).ToFormatMoney() %>'/>
                                </td>
                            </tr>
                        </FooterTemplate>
                        <SeparatorTemplate>
                            <tr>
                                <td colspan="6">
                                    <hr/>
                                </td>
                            </tr>
                        </SeparatorTemplate>
                    </asp:Repeater>

                    </tbody>
                </table>
                <div class="cart__actions">
                    <a href="/san-pham" class="btn btn-secondary btn-lg custom_font">Tiếp tục mua sắm</a>

                    <asp:Button runat="server" Text="Cập nhật giỏ hàng" ID="btnUpdateCart" OnClick="btnUpdateCart_OnClick" CssClass="btn btn-primary cart__update-button btn-lg custom_font"/>

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
                                        <td><%: MyLibrary.CartDet_BUS.SumCartDetPrice() %></td>
                                    </tr>
                                    </tfoot>
                                </table>

                                <a class="btn btn-primary btn-xl btn-block cart__checkout-button"
                                   href="/gio-hang/thanh-toan">
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