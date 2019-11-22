<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="RcptBuy_Det.aspx.cs" Inherits="ShoesStore.Admin.RcptBuy_Det" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
                    <td>Thông tin cửa hàng: </td>
                    <td>
                        Tên cửa hàng:<br/>
                        <br/>
                        Địa chỉ:<br/>
                        <br/>
                        Số điện thoại:
                    </td>
                    <td colspan="5">
                        <asp:Label ID="lbShpName" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbAddress" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbPhone" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Thông tin khách hàng: </td>
                    <td>
                        Cửa hàng:<br/>
                        <br/>
                        Địa chỉ:<br/>
                        <br/>
                        Số điện thoại:<br/>
                        <br/>
                        Email:
                    </td>
                    <td colspan="5">
                        <asp:Label ID="lbCusName" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbAddressCus" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbPhoneCus" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th class="">Ảnh </th>
                    <th class="">Tên sản phẩm</th>
                    <th class="">Màu</th>
                    <th class="">Kích cỡ</th>
                    <th class="">Số lượng</th>
                    <th class="">Giá</th>
                </tr>
                </thead>
                <tbody>
                <asp:Repeater ID="rptRcptShp" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="rptRcptShp_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="hdfShpId" Value="<%# Item.ShpId %>"/>
                        <asp:Repeater runat="server" ID="rptRcptShpDet" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet" OnItemDataBound="rptRcptShpDet_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:HiddenField runat="server" ID="hdfProId" Value="<%# Item.ProId %>"/>
                                        <a runat="server" id="a1" onserverclick="a1_ServerClick">
                                            <img class="rounded" style="height: 200px; width: 200px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                        </a>
                                    </td>
                                    <td><%# Item.ProDet.Pro.ProName %></td>
                                    <td>
                                        <%# Item.ProDet.ProColor.ColorName %>
                                        <div style="background-color: #<%# Item.ProDet.ProColor.HexCode %>; border: black solid 1px; display: inline-block; float: right; height: 32px; width: 32px;"/>
                                    </td>
                                    <td><%# Item.ProDet.ProSize.SizeName %></td>
                                    <td><%# Item.Quantity %></td>
                                    <td><%# (Item.Quantity * int.Parse(MyLibrary.Pro_BUS.GetPrice(Item.ProDet.Pro))).ToFormatMoney() %></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="lbtnDanhGia" Visible="false" Text="ĐÁNH GIÁ" PostBackUrl="<%#MyLibrary.ProDetUrl(Item.ProDet.Pro) %>"></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td colspan="7" style="font-size: 30px; text-align: right;">Tổng cộng: <%# MyLibrary.RcptBuy_BUS.SumPrice(Item).ToFormatMoney() %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>