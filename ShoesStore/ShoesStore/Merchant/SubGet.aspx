﻿<%@ Page Language="C#" Title="Đăng Ký Gói Sub" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="SubGet.aspx.cs" Inherits="ShoesStore.Merchant.SubGet" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<%@ MasterType VirtualPath="SiteMerchant.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <!-- site__body -->
    <div class="h2">Bảng giá gói dịch vụ</div>
    <div class="container">
        <div class="row">
            <div class="col-12 table-responsive">
                <asp:ListView ID="lvSub" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.Sub" OnItemCommand="lvSub_ItemCommand" OnSelectedIndexChanged="lvSub_SelectedIndexChanged">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Mã gói</th>
                                <th>Tên gói dịch vụ</th>
                                <th>Số ngày</th>
                                <th>Giá</th>
                                <th>Số lượng gói</th>
                                <th>Đăng ký</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:HiddenField runat="server" ID="hdfSubId" Value="<%# Item.SubId %>"></asp:HiddenField>
                                <asp:Literal runat="server" ID="ltrSubId" Text="<%# Item.SubId %>"></asp:Literal></td>
                            <td>
                                <asp:Literal runat="server" ID="ltrSubContent" Text="<%# Item.SubContent %>"></asp:Literal></td>
                            <td>
                                <asp:Literal runat="server" ID="ltrDurday" Text="<%# Item.DurDay %>"></asp:Literal></td>
                            <td>
                                <asp:Literal runat="server" ID="ltrPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Literal></td>
                            <td>
                                <asp:TextBox runat="server" ID="Qty" Text="1" min="1" TextMode="Number"></asp:TextBox></td>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnThem" Text="Thêm" CommandName="sel" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <asp:HiddenField ID="myHiddenInput" runat="server" />
            </div>
        </div>
        <div class="h2">Dịch vụ đã chọn</div>
        <div class="row">
            <div class="col-12 table-responsive">
                <asp:ListView ID="lvSubSelected" runat="server" OnItemDeleting="lvSubSelected_ItemDeleting" OnItemDataBound="lvSubSelected_ItemDataBound" OnItemCommand="lvSubSelected_ItemCommand">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Tên gói dịch vụ</th>
                                <th>Số lượng gói</th>
                                <th>Tổng ngày</th>
                                <th>Tổng Giá</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:HiddenField runat="server" ID="lviID" />
                                <asp:Label runat="server" ID="lbTen" Text=""></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbSoLuongGoi" Text=""></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbTongNgay" Text=""></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbTongGia" Text=""></asp:Label></td>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnXoa" Text="Xóa" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:Label ID="lbEmptySelected" runat="server" Text="Không có gói dịch vụ nào " Visible="false" />

            </div>
        </div>
        <div class="row" style="float: right">
            <asp:Label runat="server" ID="lbTongTien" CssClass="h3"></asp:Label>
        </div>
        <div class="row">
            <asp:Label runat="server" ID="lbTongNgayMua" CssClass="h3"></asp:Label>
        </div>
        <div class="row" style="float: right">
            <asp:Button runat="server" ID="btnThanhToan" Text="Thanh toán" Visible="false" CssClass="btn btn-primary btn-lg  custom_font" />
        </div>
    </div>
</asp:Content>
