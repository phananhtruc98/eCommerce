<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_Cmt.aspx.cs" Inherits="ShoesStore.Customer.CusHome_Cmt" %>

<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row">
        <div class="col-12">
            <asp:ListView ID="ListView1" runat="server">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <th>Tên cửa hàng</th>
                            <th>Tên sản phẩm</th>
                            <th>Nhận xét</th>
                            <th>Đánh giá</th>
                            <th>Ngày thêm</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ShpId")%></td>
                        <td><%# Eval("ProName")%></td>
                        <td><%# Eval("Cmt")%></td>
                        <td><%#MyLibrary.DrawStar(int.Parse(Eval("Point").ToString())) %></td>
                        <td><%# Eval("DateAdd")%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
