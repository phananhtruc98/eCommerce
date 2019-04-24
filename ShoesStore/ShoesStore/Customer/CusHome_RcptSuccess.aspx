<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_RcptSuccess.aspx.cs" Inherits="ShoesStore.Customer.CusHome_RcptSuccess" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
<div class="container">
<ul class="nav nav-tabs">
    <li runat="server" class="nav-item" id="tab1">
        <a class="nav-link" data-toggle="tab" href="#home">Chờ thanh toán</a>
    </li>
    <li runat="server" class="nav-item" id="tab2">
        <a class="nav-link" data-toggle="tab" href="#menu1">Chờ lấy hàng</a>
    </li>
    <li runat="server" class="nav-item" id="tab3">
        <a class="nav-link" data-toggle="tab" href="#menu2">Đang giao</a>
    </li>
    <li runat="server" class="nav-item" id="tab4">
        <a class="nav-link" data-toggle="tab" href="#menu3">Đã giao</a>
    </li>
    <li runat="server" class="nav-item" id="tab5">
        <a class="nav-link" data-toggle="tab" href="#menu4">Đã hủy</a>
    </li>
</ul>
<div class="tab-content">
<div id="home" class="tab-pane fade in active">
    <h3>Chờ thanh toán</h3>
    <div class="row">
        <div class="col-12">
            <asp:Label ID="lbEmpty2" runat="server" Text="Không có đơn hàng nào" Visible="false"></asp:Label>
            <asp:ListView ID="lvChoThanhToan" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="lvChoThanhToan_ItemDataBound" OnItemCommand="lvChoThanhToan_ItemCommand">
                <LayoutTemplate>
                    <table class="table">
                        <tr class="">
                            <th class="">Mã đơn hàng </th>
                            <th class="">Ngày đặt hàng</th>
                            <th class="">Sản phẩm</th>
                            <th class="">Tổng tiền</th>
                            <th class="">Thao tác</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hdfRcptBuyId" runat="server" Value="<%# Item.RcptBuyId %>"/>
                    <tr>
                        <td><%# Item.RcptBuyId %></td>
                        <td><%# Item.Rcpt.DateAdd %></td>
                        <td>
                            <asp:ListView ID="lvChoThanhToanDet" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                                <ItemTemplate>
                                    <img style="height: 100px; width: 100px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                    <br/>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td><%#  MyLibrary.RcptBuyDet_BUS.SumRcptBuyPrice_Shop(Item.ShpId).ToFormatMoney() %></td>
                        <td>
                            <asp:LinkButton ID="lbtnChiTiet" runat="server" CommandName="sel" CommandArgument="<%# Item.RcptBuyId %>" Text="CHI TIẾT"/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</div>
<div id="menu1" class="tab-pane fade">
    <h3>Chờ lấy hàng</h3>
    <div class="row">
        <div class="col-12">
            <asp:Label ID="lbEmpty3" runat="server" Text="Không có đơn hàng nào" Visible="false"></asp:Label>
            <asp:ListView ID="lvChoLayHang" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="lvChoLayHang_ItemDataBound" OnItemCommand="lvChoLayHang_ItemCommand">
                <LayoutTemplate>
                    <table class="table">
                        <tr class="">
                            <th class="">Mã đơn hàng </th>
                            <th class="">Ngày đặt hàng</th>
                            <th class="">Sản phẩm</th>
                            <th class="">Tổng tiền</th>
                            <th class="">Thao tác</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hdfRcptBuyId" runat="server" Value="<%# Item.RcptBuyId %>"/>
                    <tr>
                        <td><%# Item.RcptBuyId %></td>
                        <td><%# Item.Rcpt.DateAdd %></td>
                        <td>
                            <asp:ListView ID="lvChoLayHangDet" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                                <ItemTemplate>
                                    <img style="height: 100px; width: 100px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                    <br/>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td><%#  MyLibrary.RcptBuyDet_BUS.SumRcptBuyPrice_Shop(Item.ShpId).ToFormatMoney() %></td>
                        <td>
                            <asp:LinkButton ID="lbtnChiTiet" runat="server" CommandName="sel" CommandArgument="<%# Item.RcptBuyId %>" Text="CHI TIẾT"/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</div>
<div id="menu2" class="tab-pane fade">
    <h3>Đang giao</h3>
    <div class="row">
        <div class="col-12">
            <asp:Label ID="lbEmpty4" runat="server" Text="Không có đơn hàng nào" Visible="false"></asp:Label>
            <asp:ListView ID="lvDangGiao" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="lvDangGiao_ItemDataBound" OnItemCommand="lvDangGiao_ItemCommand">
                <LayoutTemplate>
                    <table class="table">
                        <tr class="">
                            <th class="">Mã đơn hàng </th>
                            <th class="">Ngày đặt hàng</th>
                            <th class="">Sản phẩm</th>
                            <th class="">Tổng tiền</th>
                            <th class="">Thao tác</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hdfRcptBuyId" runat="server" Value="<%# Item.RcptBuyId %>"/>
                    <tr>
                        <td><%# Item.RcptBuyId %></td>
                        <td><%# Item.Rcpt.DateAdd %></td>
                        <td>
                            <asp:ListView ID="lvDangGiaoDet" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                                <ItemTemplate>
                                    <img style="height: 100px; width: 100px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                    <br/>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td><%#  MyLibrary.RcptBuyDet_BUS.SumRcptBuyPrice_Shop(Item.ShpId).ToFormatMoney() %></td>
                        <td>
                            <asp:LinkButton ID="lbtnChiTiet" runat="server" CommandName="sel" CommandArgument="<%# Item.RcptBuyId %>" Text="CHI TIẾT"/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</div>
<div id="menu3" class="tab-pane fade">
    <h3>Đã giao</h3>
    <div class="row">
        <asp:Label runat="server" Text="Đơn hàng gần đây" ID="lbDonHang" CssClass="h3"></asp:Label>
        <div class="col-12">
            <asp:Label ID="lbEmpty" runat="server" Text="Không có đơn hàng nào" Visible="false"></asp:Label>
            <asp:ListView ID="lvRcptBuy" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="lvRcptBuy_ItemDataBound" OnItemCommand="lvRcptBuy_ItemCommand">
                <LayoutTemplate>
                    <table class="table">
                        <tr class="">
                            <th class="">Mã đơn hàng </th>
                            <th class="">Ngày đặt hàng</th>
                            <th class="">Sản phẩm</th>
                            <th class="">Tổng tiền</th>
                            <th class="">Thao tác</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hdfRcptBuyId" runat="server" Value="<%# Item.RcptBuyId %>"/>
                    <tr>
                        <td><%# Item.RcptBuyId %></td>
                        <td><%# Item.Rcpt.DateAdd %></td>
                        <td>
                            <asp:ListView ID="lvRcptBuyDet" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                                <ItemTemplate>
                                    <img style="height: 100px; width: 100px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                    <br/>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td><%#  MyLibrary.RcptBuyDet_BUS.SumRcptBuyPrice_Shop(Item.ShpId).ToFormatMoney() %></td>
                        <td>
                            <asp:LinkButton ID="lbtnChiTiet" runat="server" CommandName="sel" CommandArgument="<%# Item.RcptBuyId %>" Text="CHI TIẾT"/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</div>
<div id="menu4" class="tab-pane fade">
    <h3>Đã hủy</h3>
    <div class="row">
        <div class="col-12">
            <asp:Label ID="lbEmpty5" runat="server" Text="Không có đơn hàng nào" Visible="false"></asp:Label>
            <asp:ListView ID="lvDaHuy" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="lvDaHuy_ItemDataBound" OnItemCommand="lvDaHuy_ItemCommand">
                <LayoutTemplate>
                    <table class="table">
                        <tr class="">
                            <th class="">Mã đơn hàng </th>
                            <th class="">Ngày đặt hàng</th>
                            <th class="">Sản phẩm</th>
                            <th class="">Tổng tiền</th>
                            <th class="">Thao tác</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hdfRcptBuyId" runat="server" Value="<%# Item.RcptBuyId %>"/>
                    <tr>
                        <td><%# Item.RcptBuyId %></td>
                        <td><%# Item.Rcpt.DateAdd %></td>
                        <td>
                            <asp:ListView ID="lvDaHuyDet" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                                <ItemTemplate>
                                    <img style="height: 100px; width: 100px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                    <br/>
                                </ItemTemplate>
                            </asp:ListView>
                        </td>
                        <td><%#  MyLibrary.RcptBuyDet_BUS.SumRcptBuyPrice_Shop(Item.ShpId).ToFormatMoney() %></td>
                        <td>
                            <asp:LinkButton ID="lbtnChiTiet" runat="server" CommandName="sel" CommandArgument="<%# Item.RcptBuyId %>" Text="CHI TIẾT"/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</div>
</div>
</div>
</asp:Content>