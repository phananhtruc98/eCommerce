<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="Default.aspx.cs" Inherits="ShoesStore.Admin.Admin1" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                <div class="card card-statistics">
                    <div class="card-body">
                        <div class="clearfix">
                            <div class="float-left">
                                <i class="mdi mdi-cube text-danger icon-lg"></i>
                            </div>
                            <div class="float-right">
                                <p class="mb-0 text-right">Tổng doanh thu</p>
                                <div class="fluid-container">
                                    <h3 class="font-weight-medium text-right mb-0">
                                        <asp:Label runat="server" ID="lbTotalPrice"></asp:Label></h3>
                                </div>
                            </div>
                        </div>
                        <p class="text-muted mt-3 mb-0">
                            <i class="mdi mdi-alert-octagon mr-1" aria-hidden="true"></i>65% lower growth
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                <div class="card card-statistics">
                    <div class="card-body">
                        <div class="clearfix">
                            <div class="float-left">
                                <i class="mdi mdi-receipt text-warning icon-lg"></i>
                            </div>
                            <div class="float-right">
                                <p class="mb-0 text-right">Tổng đơn hàng</p>
                                <div class="fluid-container">
                                    <h3 class="font-weight-medium text-right mb-0">
                                        <asp:Label runat="server" ID="lbTotalRcpt"></asp:Label></h3>
                                </div>
                            </div>
                        </div>
                        <p class="text-muted mt-3 mb-0">
                            <i class="mdi mdi-bookmark-outline mr-1" aria-hidden="true"></i>Product-wise sales
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                <div class="card card-statistics">
                    <div class="card-body">
                        <div class="clearfix">
                            <div class="float-left">
                                <i class="mdi mdi-poll-box text-success icon-lg"></i>
                            </div>
                            <div class="float-right">
                                <p class="mb-0 text-right">Tổng sản phẩm</p>
                                <div class="fluid-container">
                                    <h3 class="font-weight-medium text-right mb-0">
                                        <asp:Label runat="server" ID="lbTotalPro"></asp:Label></h3>
                                </div>
                            </div>
                        </div>
                        <p class="text-muted mt-3 mb-0">
                            <i class="mdi mdi-calendar mr-1" aria-hidden="true"></i>Weekly Sales
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                <div class="card card-statistics">
                    <div class="card-body">
                        <div class="clearfix">
                            <div class="float-left">
                                <i class="mdi mdi-account-location text-info icon-lg"></i>
                            </div>
                            <div class="float-right">
                                <p class="mb-0 text-right">Tổng người dùng</p>
                                <div class="fluid-container">
                                    <h3 class="font-weight-medium text-right mb-0">
                                        <asp:Label runat="server" ID="lbTotalMerCus"></asp:Label></h3>
                                </div>
                            </div>
                        </div>
                        <p class="text-muted mt-3 mb-0">
                            <i class="mdi mdi-reload mr-1" aria-hidden="true"></i>Product-wise sales
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Sản phẩm cần phê duyệt</h4>
                        <div class="table-responsive">
                            <asp:ListView ID="lvNeedToActive" ItemType="ShoesStore.DataAccessLogicLayer.Pro" runat="server" OnPagePropertiesChanging="lvNeedToActive_PagePropertiesChanging" OnItemCommand="lvNeedToActive_ItemCommand" OnSelectedIndexChanged="lvNeedToActive_SelectedIndexChanged">
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
                                            <th>Kích hoạt</th>
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
                                            <img class="img-listview-pro rounded" src="<%# MyLibrary.ProImgPath(Item) %>" /></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbCatName" Text="<%# Item.ProCat.CatName %>"></asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbBrandName" Text="<%# Item.ProBrand.BrandName %>"></asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Label></td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="lbtnActive" CommandName="Submit" CommandArgument='<%# Item.ProId %>' CssClass="btn btn-outline-warning">Duyệt</asp:LinkButton></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                                PagedControlID="lvNeedToActive">
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
            </div>
        </div>
        <div class="row">
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Bình luận gần đây</h5>
                        <asp:Label ID="lbEmpty2" runat="server" Text="Không có nhận xét nào" Visible="false"></asp:Label>
                        <asp:ListView ID="lvCmt" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet" runat="server">
                            <LayoutTemplate>
                                <table class="table">
                                    <tr>
                                        <th>Tên cửa hàng</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Màu</th>
                                        <%--  <th>Kích cỡ</th>
                                        <th>Nhận xét</th>
                                        <th>Đánh giá</th>--%>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server" />
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Item.ProDet.ProId %></td>
                                    <td><%# Item.ProDet.Pro.ProName %></td>
                                    <td><%#MyLibrary.DrawStar(MyLibrary.Pro_BUS.AverageStar(Item.ProDet.Pro))%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
