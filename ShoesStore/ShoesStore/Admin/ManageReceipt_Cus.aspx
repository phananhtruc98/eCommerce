<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageReceipt_Cus.aspx.cs" Inherits="ShoesStore.Admin.ManageReceipt_Cus" %>

<%@ Import Namespace="ShoesStore.Admin" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="TimKiem" class="container">
        <div class="btn btn-lg custom_bar row col-12">Danh sách hóa đơn bán hàng</div>
        <div class="row">
            <div class="col-3">
               Lọc:  <asp:DropDownList runat="server" ID="ddlPropFilter" AutoPostBack="True" OnSelectedIndexChanged="ddlPropFilter_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-4">
                <input type="text" runat="server" visible="false" clientidmode="Static" id="datepicker" />
                <script type="text/javascript">

                    $(document).ready(function () {

                        $("#datepicker").datepicker($.datepicker.regional["vi"]);
                    });


                </script>
                <asp:LinkButton ID="lbtnTim" runat="server" OnClick="lbtnTim_Click" Visible="false">Tìm</asp:LinkButton>
                <asp:DropDownList runat="server" ID="ddlPropFilterDet" AutoPostBack="True" OnSelectedIndexChanged="ddlPropFilterDet_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-5">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
                <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click" />
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                Sắp xếp:
                <asp:DropDownList runat="server" ID="SortList">
                    <asp:ListItem Value="RcptBuyId" Text="Mã hóa đơn" Selected="True" />
                    <asp:ListItem Value="DateAdd" Text="Ngày đặt hàng" />
                    <asp:ListItem Value="ShpName" Text="Cửa hàng" />
                    <asp:ListItem Value="CusName" Text="Khách hàng" />
                </asp:DropDownList>
            </div>
            <div class="col-2">
                <asp:DropDownList runat="server" ID="DirectionList">
                    <asp:ListItem Value="ASC" Text="Tăng dần" Selected="True" />
                    <asp:ListItem Value="DESC" Text="Giảm dần" />
                </asp:DropDownList>
            </div>
            <div class="col-7">
                <asp:LinkButton runat="server" ID="lbtnSort" OnClick="lbtnSort_Click"><i class="fas fa-sort-amount-down"></i></asp:LinkButton>
            </div>
        </div>
        <div class="row">
            <asp:ListView runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" OnItemCommand="lvRcptBuy_ItemCommand" OnSelectedIndexChanged="lvRcptBuy_SelectedIndexChanged" ID="lvRcptBuy">
                <LayoutTemplate>
                    <table class="table table-border">
                        <tr>
                            <td>Xem chi tiết</td>
                            <td>Mã hóa đơn</td>
                            <td>Ngày đặt hàng</td>
                            <td>Cửa hàng</td>
                            <td>Khách hàng</td>
                        </tr>
                        <tr id="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton runat="server" ID="lbtnDetail" CommandName="Sel" CommandArgument='<%# Item.RcptBuyId %>' CssClass="btn btn-icons btn-rounded btn-outline-warning"><i class="fas fa-info"></i></asp:LinkButton></td>

                        <td>
                            <asp:Label runat="server" ID="lbRcptId" Text="<%# Item.RcptBuyId %>"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="lbDateAdd" Text="<%# Item.Rcpt.DateAdd %>"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="lbShpName" Text="<%# Item.Shp.ShpName %>"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="lbCusName" Text="<%# Item.Cus.Usr.UsrName %>"></asp:Label></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>


</asp:Content>
