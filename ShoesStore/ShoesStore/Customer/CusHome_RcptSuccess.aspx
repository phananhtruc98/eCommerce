<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_RcptSuccess.aspx.cs" Inherits="ShoesStore.Customer.CusHome_RcptSuccess" %>

<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row">
        <asp:Label runat="server" Text="Đơn hàng gần đây" ID="lbDonHang" CssClass="h3"></asp:Label>
        <div class="col-12">
            <asp:Label ID="lbEmpty" runat="server" Text="Không có đơn hàng nào" Visible="false"></asp:Label>
            <asp:ListView ID="lvRcptBuy" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemCommand="lvRcptBuy_ItemCommand" OnItemDataBound="lvRcptBuy_ItemDataBound">
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
                     <asp:HiddenField ID="hdfRcptBuyId" runat="server" Value="<%# Item.RcptBuyId %>" />
                    <tr>
                        <td><%# Item.RcptBuyId %></td>
                        <td><%# Item.Rcpt.DateAdd %></td>
                        <asp:ListView ID="lvRcptBuyDet" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                            <ItemTemplate>
                                <td>
                                    <img style="width: 80px; height: 80px"
                                        src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                </td>
                            </ItemTemplate>
                        </asp:ListView>
                        <%--<td><%# Eval("Sum").ToFormatMoney()%></td>--%>
                        <td>
                            <asp:LinkButton ID="Link1" runat="server" CommandName="sel" CommandArgument='<%# Item.RcptBuyId%>'
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
                        <th class="">Ảnh </th>
                        <th class="">Tên sản phẩm</th>
                        <th class="">Số lượng</th>
                        <th class="">Giá</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptRcptShp" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="rptRcptShp_ItemDataBound">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hdfShpId" Value="<%# Item.ShpId %>" />
                            <tr>
                                <td colspan="4"><%# Item.Shp.ShpName%></td>
                            </tr>
                            <asp:Repeater runat="server" ID="rptRcptShpDet" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet">
                                <ItemTemplate>
                                    <tr>
                                        <td><a href="#">
                                            <img style="width: 80px; height: 80px"
                                                src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                        </a></td>
                                        <td><%# Item.ProDet.Pro.ProName %></td>
                                        <td><%# Item.Quantity%></td>
                                        <td><%# (Item.Quantity * Int32.Parse(Item.ProDet.Pro.Price)).ToFormatMoney() %></td>
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
