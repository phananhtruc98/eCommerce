<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="RcptSub_Det.aspx.cs" Inherits="ShoesStore.Admin.RcptSub_Det" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" runat="server" visible="false" id="rowRcptSubDet">
        <asp:Label runat="server" Text="Chi tiết đơn hàng" ID="Label1" CssClass="h3" Visible="false"></asp:Label>
        <div class="col-12">
            <table class="table">
                <thead>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptSubId" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptSubDate" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <td>Thông tin người mua: </td>
                    <td>
                        Tên người mua:
                        <br/>
                        <br/>
                        Địa chỉ:<br/>
                        <br/>
                        Số điện thoại:<br/>
                        <br/>
                        Email:
                    </td>
                    <td colspan="5">
                        <asp:Label ID="lbMerName" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbAddressMer" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbPhoneMer" runat="server"></asp:Label><br/>
                        <br/>
                        <asp:Label ID="lbEmail" runat="server"></asp:Label>
                    </td>
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
                </thead>
                <tbody>
                <asp:ListView ID="lvRcptSubDet" runat="server" OnItemDataBound="lvRcptSubDet_ItemDataBound" ItemType="ShoesStore.DataAccessLogicLayer.RcptSubDet">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <td>Xem chi tiết</td>
                                <th>Tên gói thường niên</th>
                                <th>Số lượng</th>
                                <th>Số ngày</th>
                                <th>Số tiền</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server"/>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnDetail" CommandName="Detail" CommandArgument="<%# Item.SubId %>" CssClass="btn btn-icons btn-rounded btn-outline-warning">
                                    <i class="fas fa-info"></i>
                                </asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbCusId" Text="<%# Item.Sub.SubContent %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbUsrName" Text="<%# Item.Quantity %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbEmail" Text="<%# Item.Quantity * Item.Sub.DurDay %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbDateAdd" Text="<%# double.Parse(Item.Quantity.ToString()) * double.Parse(Item.Sub.Price) %>"></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <tr>
                    <td colspan="7" style="font-size: 30px; text-align: right;">Tổng cộng:<asp:Label runat="server" ID="lbTotalPrice"></asp:Label></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>