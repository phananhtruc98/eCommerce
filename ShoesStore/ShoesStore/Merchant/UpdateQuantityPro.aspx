<%@ Page Language="C#" MasterPageFile="~/Merchant/SiteMerchant.Master"  AutoEventWireup="true" CodeBehind="UpdateQuantityPro.aspx.cs" Inherits="ShoesStore.Merchant.UpdateQuantityPro" %>


<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
   <div class="container">
       <div class="row">
           <h3>Danh sách sản phẩm hết hạng</h3>
           <div class="col-12">
                <asp:ListView ID="lvPro" OnItemCommand="lvPro_ItemCommand" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.Pro" OnPagePropertiesChanging="lvPro_PagePropertiesChanging">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Xem chi tiết</th>
                                <th>Tên cửa hàng</th>
                                <th>Tên sản phẩm</th>
                                <th>Ảnh</th>
                                <th>Loại sản phẩm</th>
                                <th>Thương hiệu</th>
                                <th>Gía</th>
                                <th></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnDetail" CommandName="Sel" CommandArgument='<%# Item.ProId %>' CssClass="btn btn-icons btn-rounded btn-outline-warning"><i class="fas fa-info"></i></asp:LinkButton></td>
                            <td>
                                <asp:HiddenField ID="hdfShpId" runat="server" Value="<%# Item.ShpId %>" />
                                <asp:Label runat="server" ID="lbShpName" Text="<%# Item.Shp.ShpName %>"></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbProName" Text="<%# Item.ProName %>"></asp:Label></td>
                            <td>
                                <img width="50" height="50" class="img-listview-pro" src="<%# MyLibrary.ProImgPath(Item) %>" /></td>
                            <td>
                                <asp:Label runat="server" ID="lbCatName" Text="<%# Item.ProCat.CatName %>"></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbBrandName" Text="<%# Item.ProBrand.BrandName %>"></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lbPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Label></td>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnActive" CommandName="Submit" CommandArgument='<%# Item.ProId %>' CssClass="btn btn-outline-warning">Chọn</asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>

                </asp:ListView>
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                    PagedControlID="lvPro">
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