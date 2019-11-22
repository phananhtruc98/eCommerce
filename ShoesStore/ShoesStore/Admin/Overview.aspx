<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="Overview.aspx.cs" Inherits="ShoesStore.Admin.Overview" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    Thống kê
    <div class="row">
        <div class="col-12">
            Chọn thời gian:
            <asp:DropDownList runat="server" ID="ddlMonth"></asp:DropDownList>
            <asp:DropDownList runat="server" ID="ddlYear"></asp:DropDownList>
            <asp:LinkButton runat="server" ID="lbtn" OnClick="lbtn_Click">Chọn</asp:LinkButton>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <asp:ListView ID="lvShp" ItemType="ShoesStore.DataAccessLogicLayer.Shp" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Mã CH</th>
                            <th>Tên CH</th>
                            <th>Ngày bắt đầu</th>
                            <th>Hóa đơn thành công</th>
                            <th>Tình trạng</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Item.ShpId %></td>
                        <td><%# Item.ShpName %></td>
                        <td><%# Item.DateStart %></td>
                        <td><%# MyLibrary.Shp_Bus.CountRcptBuySuccess(Item, int.Parse(ddlYear.SelectedValue)) %></td>
                        <td><%# MyLibrary.AlertShp(Item, int.Parse(ddlYear.SelectedValue)) %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <asp:ListView ID="lvShp2" ItemType="ShoesStore.DataAccessLogicLayer.Shp" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Mã CH</th>
                            <th>Tên CH</th>
                            <th>Ngày bắt đầu</th>
                            <th>Hóa đơn thành công</th>
                            <th>Tình trạng</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Item.ShpId %></td>
                        <td><%# Item.ShpName %></td>
                        <td><%# Item.DateStart %></td>
                        <td><%# MyLibrary.Shp_Bus.CountRcptBuySuccess(Item, int.Parse(ddlMonth.SelectedValue), int.Parse(ddlYear.SelectedValue)) %></td>
                        <td><%# MyLibrary.AlertShp(Item, int.Parse(ddlMonth.SelectedValue), int.Parse(ddlYear.SelectedValue)) %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>


</asp:Content>