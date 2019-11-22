<%@ Page Language="C#" Title="Quản lý người mua" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="ShoesStore.Admin.Manage_Customer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn btn-lg custom_bar">Danh sách người mua</div>
    <div id="TimKiem" class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
                <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click"/>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 table-responsive">
                <asp:ListView runat="server" ID="lvCus" OnPagePropertiesChanging="lvCus_PagePropertiesChanging" OnItemCommand="lvCus_ItemCommand" ItemType="ShoesStore.DataAccessLogicLayer.Cus">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Xem chi tiết</th>
                                <th>Mã người mua</th>
                                <th>Tên người mua</th>
                                <th>Email</th>
                                <th>Ngày thêm</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server"/>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnDetail" CommandName="Detail" CommandArgument="<%# Item.CusId %>" CssClass="btn btn-icons btn-rounded btn-outline-warning">
                                    <i class="fas fa-info"></i>
                                </asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbCusId" Text="<%# Item.CusId %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbUsrName" Text="<%# Item.Usr.UsrName %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbEmail" Text="<%# Item.Usr.Email %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbDateAdd" Text="<%# Item.Usr.DateAdd %>"></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                               PagedControlID="lvCus">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True"
                                                    ShowNextPageButton="False" ShowPreviousPageButton="true" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước"/>
                        <asp:NumericPagerField/>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                                                    ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước"/>
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </div>
</asp:Content>