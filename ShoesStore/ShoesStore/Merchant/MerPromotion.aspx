<%@ Page Language="C#" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="MerPromotion.aspx.cs" Inherits="ShoesStore.Merchant.MerPromotion" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <asp:PlaceHolder runat="server" ID="phdPromotion">
        <h3>Khuyến mãi</h3>
        <div class="container">
            <h4>Chọn sản phẩm muốn giảm giá</h4>
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
                                    <th>Giá</th>
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
                                    <asp:Label runat="server" ID="lbPrice" Text="<%#  MyLibrary.Pro_BUS.GetPriceFormat( Item) %>"></asp:Label></td>
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

            <div class="row">
                <div class="col-12 table-responsive">
                    <h4>Sản phẩm khuyến mãi</h4>
                    <asp:RadioButtonList ID="rdbtnPromoMode" Width="50%" runat="server">
                        <asp:ListItem Value="Percent">%</asp:ListItem>
                        <asp:ListItem Value="Direct">Trực tiếp</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:ListView ID="lvProPromo" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.Pro" OnItemCommand="lvProPromo_ItemCommand">
                        <LayoutTemplate>
                            <table class="table">
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá hiện tại</th>
                                    <th>Tiền giảm</th>
                                    <th>Giá sau giảm</th>
                                    <th>Xác nhận</th>
                                    <th>Xóa</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server" />
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdfShpId" runat="server" Value="<%# Item.ShpId %>" />
                                    <asp:Label runat="server" ID="lbProName" Text="<%# Item.ProName %>"></asp:Label></td>
                                <td>
                                    <asp:Label runat="server" ID="lbPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Label></td>
                                <td>
                                    <asp:TextBox Width="50%" min="1" TextMode="Number" ID="txtMoney" runat="server">
                                    </asp:TextBox><asp:LinkButton runat="server" ID="lbtnCheck" CommandName="Check" CommandArgument='<%# Item.ProId %>'><i class="far fa-arrow-alt-circle-right"></i></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lbPriceAfter"></asp:Label></td>
                                <td>
                                    <asp:LinkButton runat="server" ID="lbtnSubmit" CommandName="Submit" CommandArgument='<%# Item.ProId %>' CssClass="btn btn-outline-warning">OK</asp:LinkButton></td>
                                <td>
                                    <asp:LinkButton runat="server" ID="lbtnDelete" CommandName="Del" CommandArgument='<%# Item.ProId %>' CssClass="btn btn-outline-warning">X</asp:LinkButton></td>
                            </tr>
                        </ItemTemplate>

                    </asp:ListView>
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
