<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_Cmt.aspx.cs" Inherits="ShoesStore.Customer.CusHome_Cmt" %>
<%@ Import Namespace="ShoesStore" %>
<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row">
        <div class="col-12">
            <asp:Label ID="lbEmpty" runat="server" Text="Không có nhận xét nào" Visible="false"></asp:Label>
            <asp:ListView ID="ListView1" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Tên cửa hàng</th>
                            <th>Tên sản phẩm</th>
                            <th>Màu</th>
                            <th>Kích cỡ</th>
                            <th>Nhận xét</th>
                            <th>Đánh giá</th>
                            <%--<th>Ngày thêm</th>--Hiện đã bỏ cột DateAdd(Sẽ là ngày thêm của hóa đơn trong bảng Rcpt --%>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ShpName") %></td>
                        <td><%# Eval("ProName") %></td>
                        <td><%# Eval("ColorName") %></td>
                        <td><%# Eval("SizeName") %></td>
                        <td><%# Eval("Cmt") %></td>
                        <td><%#MyLibrary.DrawStar(int.Parse(Eval("Point") == null ? "0" : Eval("Point").ToString())) %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>