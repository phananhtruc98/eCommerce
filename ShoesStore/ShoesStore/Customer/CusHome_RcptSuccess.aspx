﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_RcptSuccess.aspx.cs" Inherits="ShoesStore.Customer.CusHome_RcptSuccess" %>

<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row">
        <asp:Label runat="server" Text="Đơn hàng gần đây" ID="lbDonHang" CssClass="h3"></asp:Label>
        <div class="col-12">
            <asp:ListView ID="lvRcptBuy" runat="server" OnItemCommand="lvRcptBuy_ItemCommand">
                <LayoutTemplate>
                    <table class="table">
                        <tr class="">
                            <th class="">Mã đơn hàng </th>
                            <th class="">Ngày đặt hàng</th>
                            <th class="">Sản phẩm</th>
                            <th class="">Tổng tiền</th>
                            <th class=""></th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("RcptBuyId1")%></td>
                        <td><%# Eval("DateAddRcpt")%></td>
                        <td><%# MyLibrary.DisplayImg((List<string>)Eval("ImgPro"))%></td>
                        <td><%# Eval("Sum").ToFormatMoney()%></td>
                        <td>
                            <asp:LinkButton ID="Link1" runat="server" CommandName="sel" CommandArgument='<%#Eval("RcptBuyId1")%>'
                                Text="Select" /></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <asp:Label ID="TestLabel" runat="server" />
        </div>
    </div>

    <%--<div class="row">
        <asp:Label runat="server" Text="Chi tiết đơn hàng" ID="lbDonHangChiTiet" CssClass="h3" Visible="false"></asp:Label>
        <div class="col-12">
            <asp:ListView ID="lvRcptBuyDet" runat="server" Visible="false" OnDataBound="lvRcptBuyDet_DataBound">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <td colspan="4">
                                <asp:Label runat="server" ID="lbRcptId"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Label runat="server" ID="lbDateAdd"></asp:Label></td>
                        </tr>
                        <tr class="">
                            <th class="">Ảnh </th>
                            <th class="">Tên sản phẩm</th>
                            <th class="">Số lượng</th>
                            <th class="">Giá</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Img")%></td>
                        <td><%# Eval("ProName")%></td>
                        <td><%# Eval("Quantity")%></td>
                        <td><%# Eval("SubPrice").ToFormatMoney()%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>--%>

    <div class="row">
        <asp:Label runat="server" Text="Chi tiết đơn hàng" ID="Label1" CssClass="h3" Visible="false"></asp:Label>
        <div class="col-12">
            <table class="table">
                <thead>
                    <tr>
                        <td colspan="4">
                        <th class="">Ảnh </th>
                        <th class="">Tên sản phẩm</th>
                        <th class="">Số lượng</th>
                        <th class="">Giá</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptRcptShp" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ShpName")%></td>
                            </tr>
                            <asp:Repeater runat="server" ID="rptRcptShpDet">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Img")%></td>
                                        <td><%# Eval("ProName")%></td>
                                        <td><%# Eval("Quantity")%></td>
                                        <td><%# Eval("SubPrice").ToFormatMoney()%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>

                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
