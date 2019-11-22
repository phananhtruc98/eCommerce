<%@ Page Language="C#" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="DisableProduct.aspx.cs" Inherits="ShoesStore.Merchant.DisableProduct" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">

    <div class="container">
        <h3>Danh sách sản phẩm</h3>
        <div class="row">
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
                            <tr id="itemPlaceholder" runat="server"/>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnDetail" CommandName="Sel" CommandArgument="<%# Item.ProId %>" CssClass="btn btn-icons btn-rounded btn-outline-warning">
                                    <i class="fas fa-info"></i>
                                </asp:LinkButton>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdfShpId" runat="server" Value="<%# Item.ShpId %>"/>
                                <asp:Label runat="server" ID="lbShpName" Text="<%# Item.Shp.ShpName %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbProName" Text="<%# Item.ProName %>"></asp:Label>
                            </td>
                            <td>
                                <img width="50" height="50" class="img-listview-pro" src="<%# MyLibrary.ProImgPath(Item) %>"/>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbCatName" Text="<%# Item.ProCat.CatName %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbBrandName" Text="<%# Item.ProBrand.BrandName %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Label>
                            </td>
                            <td>
                                <asp:LinkButton runat="server" ID="lbtnActive" CommandName="Submit" CommandArgument="<%# Item.ProId %>" CssClass="btn btn-outline-warning">Chọn</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:ListView>
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                               PagedControlID="lvPro">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True"
                                                    ShowNextPageButton="False" ShowPreviousPageButton="true" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước"/>
                        <asp:NumericPagerField/>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                                                    ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước"/>
                    </Fields>
                </asp:DataPager>
                <asp:Label runat="server" ID="lbEmpty" Text="Không có sản phẩm cần duyệt" Visible="false"></asp:Label>
            </div>
        </div>
        <h3>Sản phẩm đã chọn</h3>
        <div class="row">
            <div class="col-12">
                <asp:Label runat="server" ID="lbEmpty2" Visible="false" Text="Không có sản phẩm được chọn"></asp:Label>
                <asp:ListView ID="lvOutofStock" OnItemCommand="lvOutofStock_ItemCommand" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.Pro" OnPagePropertiesChanging="lvOutofStock_PagePropertiesChanging">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Tên cửa hàng</th>
                                <th>Tên sản phẩm</th>
                                <th>Ảnh</th>
                                <th>Loại sản phẩm</th>
                                <th>Thương hiệu</th>
                                <th>Gía</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server"/>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:HiddenField ID="hdfShpId" runat="server" Value="<%# Item.ShpId %>"/>
                                <asp:Label runat="server" ID="lbShpName" Text="<%# Item.Shp.ShpName %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbProName" Text="<%# Item.ProName %>"></asp:Label>
                            </td>
                            <td>
                                <img width="50" height="50" class="img-listview-pro" src="<%# MyLibrary.ProImgPath(Item) %>"/>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbCatName" Text="<%# Item.ProCat.CatName %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbBrandName" Text="<%# Item.ProBrand.BrandName %>"></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:ListView>
                <asp:DataPager ID="DataPager2" runat="server" PageSize="5"
                               PagedControlID="lvOutofStock">
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
        <div>
            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="lbtnIsOutOfStock" OnClick="lbtnIsOutOfStock_Click" Text="Hết hàng" Visible="false"></asp:LinkButton>
        </div>
    </div>
</asp:Content>