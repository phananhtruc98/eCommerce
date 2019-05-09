<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ReviewProductDetail.aspx.cs" Inherits="ShoesStore.Admin.ReviewProductDetail" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="System.Text" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn btn-lg custom_bar">Chi tiết sản phẩm</div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div>
                            <table class="table table-bordered">
                                <tr>
                                    <td>Cửa hàng </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbShpName"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Loại sản phẩm</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbCatName"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Thương hiệu</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbBrandName"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Tên sản phẩm </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbProName"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Giá</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbPrice"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Chi tiết số lượng</td>
                                    <td>
                                        <asp:ListView ID="lvSizeColorQty" ItemType="ShoesStore.DataAccessLogicLayer.ProDet" runat="server">
                                            <LayoutTemplate>
                                                <table>
                                                    <tr>
                                                        <th>Kích thước</th>
                                                        <th>Màu sắc</th>
                                                        <th>Số lượng</th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server" />
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbSize" Text="<%# Item.ProSize.SizeName %>"></asp:Label></td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbColor" Text="<%# Item.ProColor.ColorName %>"></asp:Label></td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbQty" Text="<%# Item.Qty %>"></asp:Label></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ảnh dại diện</td>
                                    <td>
                                        <asp:Image CssClass="rounded"  runat="server" Style="width: 300px; height: 300px" ID="imgPrimary" /></td>
                                </tr>

                                <tr>
                                    <td>Ảnh chi tiết</td>
                                    <td>
                                        <asp:ListView ID="lvImgSlide" ItemType="ShoesStore.DataAccessLogicLayer.ProSlide" runat="server">
                                            <ItemTemplate>

                                                <img class="rounded" style="width: 100px; height: 100px" src="<%# MyLibrary.ProSlidePath(Item) %>" />

                                            </ItemTemplate>
                                        </asp:ListView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mổ tả ngắn gọn </td>
                                    <td style="white-space: normal">
                                        <asp:Label runat="server" ID="lbDescShort"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Mô tả chi tiết </td>
                                    <td style="white-space: normal">
                                        <asp:Label runat="server" ID="lbDesc"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
