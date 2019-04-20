<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_RcptSuccess.aspx.cs" Inherits="ShoesStore.Customer.CusHome_RcptSuccess" %>

<%@ MasterType VirtualPath="~/SiteCus.Master" %>

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
                        <td><%# Eval("Sum")%></td>
                        <td>
                            <asp:LinkButton ID="Link1" runat="server" CommandName="sel" CommandArgument='<%#Eval("RcptBuyId1")%>'
                                Text="Select" /></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <asp:Label ID="TestLabel" runat="server" />
        </div>
    </div>

    <div class="row">
        <asp:Label runat="server" Text="Chi tiết đơn hàng" ID="lbDonHangChiTiet" CssClass="h3" Visible="false"></asp:Label>
        <div class="col-12">
            <asp:ListView ID="lvRcptBuyDet" runat="server" Visible="false">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <td colspan="4"><%# Eval("RcptBuyId")%></td>
                        </tr>
                        <tr>
                            <td colspan="4"><%# Eval("DateAddRcpt")%></td>
                        </tr>
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
                        <td><%# Eval("RcptBuyId")%></td>
                        <td><%# Eval("ProName")%></td>
                        <td><%# Eval("Quantity")%></td>
                        <td><%# Eval("SubPrice")%></td>
                        <td><%# Eval("Img")%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
