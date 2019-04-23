<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master"   CodeBehind="CusHome_RcptSuccess_Det.aspx.cs" Inherits="ShoesStore.Customer.CusHome_RcptSuccess_Det" %>

<%@ MasterType VirtualPath="~/SiteCus.Master" %>

<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row">
        <div class="col-12">
            <asp:Table runat="server" ID="rcpt" class="table">
                <thead class="">
                    <tr class="">
                        <th class="">Mã đơn hàng </th>
                        <th class="">Ngày đặt hàng</th>
                        <th class="">Sản phẩm</th>
                        <th class="">Tổng tiền</th>
                        <th class=""></th>
                    </tr>
                </thead>
                <tbody class="cart-table__body">
                    <asp:ListView ID="lvRcptBuy" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("RcptBuyId1")%></td>
                                <td><%# Eval("DateAddRcpt")%></td>
                                <td><%# MyLibrary.DisplayImg((List<string>)Eval("ImgPro"))%></td>
                                <td><%# Eval("Sum")%></td>
                                <td><a href="<%= ResolveUrl("~/Customer/CusHome_RcptSuccess_Det.aspx?RcptId="+Eval("RcptBuyId1")+"") %>">CHI TIẾT</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </tbody>
            </asp:Table>
        </div>
    </div>
</asp:Content>
