<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Overview_RcptSub.aspx.cs" Inherits="ShoesStore.Admin.Overview_RcptSub" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">Thống kê thu chi của Merchant</div>
        </div>
        <div class="row">
            <div class="col-6">
                Chọn cửa hàng:
                <asp:DropDownList runat="server" ID="ddlShpName" AutoPostBack="True"  OnSelectedIndexChanged="ddlShpName_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-6">
                Chọn thời gian:
                <asp:DropDownList runat="server" AutoPostBack="True"  ID="ddlMonth"></asp:DropDownList>
                <asp:DropDownList runat="server" AutoPostBack="True"  ID="ddlYear"></asp:DropDownList>
                <asp:LinkButton runat="server" ID="lbtn" OnClick="lbtn_Click">Chọn</asp:LinkButton>
            </div>
        </div>
        <div runat="server" id="name" class="row">
            <asp:ListView ID="lvMerProfit" ItemType="ShoesStore.DataAccessLogicLayer.Shp" OnItemDataBound="lvMerProfit_ItemDataBound" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Mã cửa hàng</th>
                            <th>Tên cửa hàng</th>
                            <th>Tổng thu</th>
                            <th>Tổng chi</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:Label runat="server" ID="lbShpId" Text='<%# Item.ShpId %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lbShpName" Text='<%# Item.ShpName %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lbSumIn" Text='<%# MyLibrary.SumIn(Item) %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lbSumOut" Text='<%# MyLibrary.SumOut(Item) %>'></asp:Label></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div runat="server" id="date" class="row">
            <asp:ListView ID="lvDate" ItemType="ShoesStore.DataAccessLogicLayer.Shp" OnItemDataBound="lvMerProfit_ItemDataBound" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <th>Mã cửa hàng</th>
                            <th>Tên cửa hàng</th>
                            <th>Tổng thu</th>
                            <th>Tổng chi</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:Label runat="server" ID="lbShpId" Text='<%# Item.ShpId %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lbShpName" Text='<%# Item.ShpName %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lbSumIn" Text='<%# MyLibrary.SumIn(Item.ShpId,Int32.Parse(ddlMonth.SelectedValue),Int32.Parse(ddlYear.SelectedValue)) %>'></asp:Label></td>
                        <td><asp:Label runat="server" ID="lbSumOut" Text='<%# MyLibrary.SumOut(Item.ShpId,Int32.Parse(ddlMonth.SelectedValue),Int32.Parse(ddlYear.SelectedValue)) %>'></asp:Label></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
