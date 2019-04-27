<%@ Page Language="C#" Title="Đăng Ký Gói Sub" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="SubGet.aspx.cs" Inherits="ShoesStore.Merchant.SubGet" %>

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
                                <asp:Literal runat="server" ID="ltrSubId" Text="<%# Item.SubId %>"></asp:Literal></td>
                            <td>
                                <asp:Literal runat="server" ID="ltrSubContent" Text="<%# Item.SubContent %>"></asp:Literal></td>
                            <td>
                                <asp:Literal runat="server" ID="ltrDurday" Text="<%# Item.DurDay %>"></asp:Literal></td>
                            <td>
                                <asp:Literal runat="server" ID="ltrPrice" Text="<%# Item.Price %>"></asp:Literal></td>
                            <td>
                                <asp:TextBox runat="server" ID="Qty" Text="1" TextMode="Number"></asp:TextBox></td>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnThem" Text="Thêm" CommandName="sel" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <asp:HiddenField ID="myHiddenInput" runat="server" />
            </div>
        </div>
    </div>
    <div class="h2">Dịch vụ đã chọn</div>
    <div class="container">
        <div class="row">
            <div class="col-12 table-responsive">
                <asp:ListView ID="lvSubSelected" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.Sub" OnItemDataBound="lvSubSelected_ItemDataBound">
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
                            <asp:HiddenField runat="server" ID="lviID" Value=""/>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lbTen" Text=""></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbSoLuongGoi" Text=""></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbTongNgay" Text=""></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbTongGia" Text=""></asp:Label></td>
                                <td><asp:LinkButton runat="server" ID="lbtnXoa" Text="Xóa"></asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </div>
        </div>
    </div>
    <br />

</asp:Content>
