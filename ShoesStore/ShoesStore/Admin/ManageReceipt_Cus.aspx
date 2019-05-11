<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageReceipt_Cus.aspx.cs" Inherits="ShoesStore.Admin.ManageReceipt_Cus" %>

<%@ Import Namespace="ShoesStore.Admin" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="TimKiem" class="container">
        <div class="btn btn-lg custom_bar row col-12">Danh sách hóa đơn bán hàng</div>
        <div class="row">
            <div class="col-2">
                <asp:DropDownList runat="server" ID="ddlPropFilter" AutoPostBack="True" OnSelectedIndexChanged="ddlPropFilter_SelectedIndexChanged"></asp:DropDownList>
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
            <div class="col-6">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
                <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click" />
            </div>
        </div>
        <div class="row">
            <asp:ListView runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" OnSorting="lvRcptBuy_Sorting" OnItemCommand="lvRcptBuy_ItemCommand" OnSelectedIndexChanged="lvRcptBuy_SelectedIndexChanged" ID="lvRcptBuy">
                <LayoutTemplate>
                    <table class="table table-border">
                        <tr>
                            <td>Xem chi tiết</td>
                            <td>
                                <asp:LinkButton runat="server" ID="SortByRcptBuyIdButton"
                                    CommandName="Sort" Text="Mã hóa đơn"
                                    CommandArgument="RcptBuyId" />
                                <asp:Image runat="server" ID="SortImage1"
                                    ImageUrl="/images/ascending.png" Visible="false" /></td>
                            <td>
                                <asp:LinkButton runat="server" ID="SortByLastDateAddButton"
                                    CommandName="Sort" Text="Ngày đặt hàng"
                                    CommandArgument="DateAdd" />
                                <asp:Image runat="server" ID="SortImage2"
                                    ImageUrl="/images/ascending.png" Visible="false" />
                            </td>
                            <td>Cửa hàng</td>
                            <td>
                                <asp:LinkButton runat="server" ID="SortByUsrNameButton"
                                    CommandName="Sort" Text="Khách hàng"
                                    CommandArgument="UsrName" />
                                <asp:Image runat="server" ID="SortImage3"
                                    ImageUrl="/images/ascending.png" Visible="false" /></td>
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
