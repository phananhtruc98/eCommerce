<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_Rcpt_Det.aspx.cs" Inherits="ShoesStore.Customer.CusHome_Rcpt_Det" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row" runat="server" visible="false" id="rowRcptBuyDet">
        <asp:Label runat="server" Text="Chi tiết đơn hàng" ID="Label1" CssClass="h3" Visible="false"></asp:Label>
        <div class="col-12">
            <table class="table">
                <thead>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptBuyId" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptBuyDate" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptBuySta" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th class="">Ảnh </th>
                    <th class="">Tên sản phẩm</th>
                    <th class="">Màu</th>
                    <th class="">Kích cỡ</th>
                    <th class="">Số lượng</th>
                    <th class="">Giá</th>
                    <th class="">Đánh giá</th>
                </tr>
                </thead>
                <tbody>
                <asp:Repeater ID="rptRcptShp" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="rptRcptShp_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="hdfShpId" Value="<%# Item.ShpId %>"/>
                        <tr>
                            <td colspan="7">Cửa hàng: <%# Item.Shp.ShpName %></td>
                        </tr>
                        <asp:Repeater runat="server" ID="rptRcptShpDet" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet" OnItemDataBound="rptRcptShpDet_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <a href="#">
                                            <img style="height: 200px; width: 200px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                        </a>
                                    </td>
                                    <td><%# Item.ProDet.Pro.ProName %></td>
                                    <td><%# Item.ProDet.ProColor.ColorName %></td>
                                    <td><%# Item.ProDet.ProSize.SizeName %></td>
                                    <td><%# Item.Quantity %></td>
                                    <td><%# (Item.Quantity * int.Parse(Item.ProDet.Pro.Price)).ToFormatMoney() %></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="lbtnDanhGia" Visible="false" Text="ĐÁNH GIÁ" PostBackUrl="<%#MyLibrary.ProDetUrl(Item.ProDet.Pro) %>"></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td colspan="7" style="font-size: 30px; text-align: right;">Tổng cộng: <%# MyLibrary.RcptBuyDet_BUS.SumRcptBuyPrice_Shop(Item.ShpId).ToFormatMoney() %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>