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
                                    <h3 class="font-weight-medium text-right mb-0">$65,650</h3>
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
                                <p class="mb-0 text-right">Đơn hàng</p>
                                <div class="fluid-container">
                                    <h3 class="font-weight-medium text-right mb-0">3455</h3>
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
                                    <h3 class="font-weight-medium text-right mb-0">5693</h3>
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
                                <p class="mb-0 text-right">Tổng sản phẩm</p>
                                <div class="fluid-container">
                                    <h3 class="font-weight-medium text-right mb-0">246</h3>
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
                                        <td><asp:LinkButton runat="server" ID="lbtnDetail"  CommandName="Sel"  CommandArgument='<%# Item.ProId %>' CssClass="btn btn-icons btn-rounded btn-outline-warning"><i class="fas fa-info"></i></asp:LinkButton></td>
                                        <td>
                                            <asp:HiddenField ID="hdfShpId" runat="server" Value="<%# Item.ShpId %>" />
                                            <asp:Label runat="server" ID="lbShpName" Text="<%# Item.Shp.ShpName %>"></asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lbProName" Text="<%# Item.ProName %>"></asp:Label></td>
                                        <td>
                                            <img class="img-listview-pro" src="<%# MyLibrary.ProImgPath(Item) %>" /></td>
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
                        <h5 class="card-title mb-4">Manage Tickets</h5>
                        <div class="fluid-container">
                            <div class="row ticket-card mt-3 pb-2 border-bottom pb-3 mb-3">
                                <div class="col-md-1">
                                    <img class="img-sm rounded-circle mb-4 mb-md-0" src="images/faces/face1.jpg" alt="profile image">
                                </div>
                                <div class="ticket-details col-md-9">
                                    <div class="d-flex">
                                        <p class="text-dark font-weight-semibold mr-2 mb-0 no-wrap">James :</p>
                                        <p class="text-primary mr-1 mb-0">[#23047]</p>
                                        <p class="mb-0 ellipsis">Donec rutrum congue leo eget malesuada.</p>
                                    </div>
                                    <p class="text-gray ellipsis mb-2">
                                        Donec rutrum congue leo eget malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim
                                vivamus.
                                    </p>
                                    <div class="row text-gray d-md-flex d-none">
                                        <div class="col-4 d-flex">
                                            <small class="mb-0 mr-2 text-muted text-muted">Last responded :</small>
                                            <small class="Last-responded mr-2 mb-0 text-muted text-muted">3 hours ago</small>
                                        </div>
                                        <div class="col-4 d-flex">
                                            <small class="mb-0 mr-2 text-muted text-muted">Due in :</small>
                                            <small class="Last-responded mr-2 mb-0 text-muted text-muted">2 Days</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="ticket-actions col-md-2">
                                    <div class="btn-group dropdown">
                                        <button type="button" class="btn btn-success dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Manage
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-reply fa-fw"></i>Quick reply
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-history fa-fw"></i>Another action
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-check text-success fa-fw"></i>Resolve Issue
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-times text-danger fa-fw"></i>Close Issue
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row ticket-card mt-3 pb-2 border-bottom pb-3 mb-3">
                                <div class="col-md-1">
                                    <img class="img-sm rounded-circle mb-4 mb-md-0" src="images/faces/face2.jpg" alt="profile image">
                                </div>
                                <div class="ticket-details col-md-9">
                                    <div class="d-flex">
                                        <p class="text-dark font-weight-semibold mr-2 mb-0 no-wrap">Stella :</p>
                                        <p class="text-primary mr-1 mb-0">[#23135]</p>
                                        <p class="mb-0 ellipsis">Curabitur aliquet quam id dui posuere blandit.</p>
                                    </div>
                                    <p class="text-gray ellipsis mb-2">
                                        Pellentesque in ipsum id orci porta dapibus. Sed porttitor lectus nibh. Curabitur non nulla sit amet
                                nisl.
                                    </p>
                                    <div class="row text-gray d-md-flex d-none">
                                        <div class="col-4 d-flex">
                                            <small class="mb-0 mr-2 text-muted">Last responded :</small>
                                            <small class="Last-responded mr-2 mb-0 text-muted">3 hours ago</small>
                                        </div>
                                        <div class="col-4 d-flex">
                                            <small class="mb-0 mr-2 text-muted">Due in :</small>
                                            <small class="Last-responded mr-2 mb-0 text-muted">2 Days</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="ticket-actions col-md-2">
                                    <div class="btn-group dropdown">
                                        <button type="button" class="btn btn-success dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Manage
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-reply fa-fw"></i>Quick reply
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-history fa-fw"></i>Another action
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-check text-success fa-fw"></i>Resolve Issue
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-times text-danger fa-fw"></i>Close Issue
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row ticket-card mt-3">
                                <div class="col-md-1">
                                    <img class="img-sm rounded-circle mb-4 mb-md-0" src="images/faces/face3.jpg" alt="profile image">
                                </div>
                                <div class="ticket-details col-md-9">
                                    <div class="d-flex">
                                        <p class="text-dark font-weight-semibold mr-2 mb-0 no-wrap">John Doe :</p>
                                        <p class="text-primary mr-1 mb-0">[#23246]</p>
                                        <p class="mb-0 ellipsis">Mauris blandit aliquet elit, eget tincidunt nibh pulvinar.</p>
                                    </div>
                                    <p class="text-gray ellipsis mb-2">Nulla quis lorem ut libero malesuada feugiat. Proin eget tortor risus. Lorem ipsum dolor sit amet.</p>
                                    <div class="row text-gray d-md-flex d-none">
                                        <div class="col-4 d-flex">
                                            <small class="mb-0 mr-2 text-muted">Last responded :</small>
                                            <small class="Last-responded mr-2 mb-0 text-muted">3 hours ago</small>
                                        </div>
                                        <div class="col-4 d-flex">
                                            <small class="mb-0 mr-2 text-muted">Due in :</small>
                                            <small class="Last-responded mr-2 mb-0 text-muted">2 Days</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="ticket-actions col-md-2">
                                    <div class="btn-group dropdown">
                                        <button type="button" class="btn btn-success dropdown-toggle btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Manage
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-reply fa-fw"></i>Quick reply
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-history fa-fw"></i>Another action
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-check text-success fa-fw"></i>Resolve Issue
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fa fa-times text-danger fa-fw"></i>Close Issue
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
