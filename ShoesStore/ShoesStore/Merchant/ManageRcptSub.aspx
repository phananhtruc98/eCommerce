<%@ Page Language="C#" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="ManageRcptSub.aspx.cs" Inherits="ShoesStore.Merchant.ManageRcptSub" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="container">
        <h2>Lịch sử mua gói thường niên</h2>
        <div class="row">
            <div class="col-12">
                <asp:ListView ID="lvRcptSub" OnItemCommand="lvRcptSub_ItemCommand" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptSub" OnPagePropertiesChanging="lvRcptSub_PagePropertiesChanging" OnItemDataBound="lvRcptSub_ItemDataBound">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Mã hóa đơn</th>
                                <th>Tên gói thường niên</th>
                                <th>Số lượng gói</th>
                                <th>Ngày mua</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:HiddenField runat="server" ID="hdfRcptSubId" Value="<%# Item.RcptSubId %>" />
                                <asp:Label runat="server" ID="lbProName" Text="<%# Item.RcptSubId %>"></asp:Label></td>
                            <td>
                                <asp:ListView ID="lvEachSub" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.RcptSubDet">
                                    <ItemTemplate>
                                            <td>
                                                <asp:Label runat="server" ID="lbSubName" Text="<%# Item.Sub.SubContent %>"></asp:Label>
                                            </td>
                                        <td>
                                            <asp:Label runat="server" ID="lbQty" Text="<%# Item.Quantity %>"></asp:Label></td>
                                    </ItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbPrice" Text="<%# Item.Rcpt.DateAdd %>"></asp:Label></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                    PagedControlID="lvRcptSub">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True"
                            ShowNextPageButton="False" ShowPreviousPageButton="true" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                            ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước" />
                    </Fields>
                </asp:DataPager>
                <asp:Label runat="server" ID="lbEmpty" Text="Không có sản phẩm cần duyệt" Visible="false"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
