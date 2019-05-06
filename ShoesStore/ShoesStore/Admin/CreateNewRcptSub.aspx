<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="CreateNewRcptSub.aspx.cs" Inherits="ShoesStore.Admin.CreateNewRcptSub" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:MultiView runat="server" ID="MultiView1">
            <asp:View ID="ViewInfoSub" runat="server">
                <div class="h2">Bảng giá gói dịch vụ</div>

                <div class="row">
                    <div class="col-12 table-responsive">
                        <asp:ListView ID="lvSub" runat="server" ItemType="ShoesStore.DataAccessLogicLayer.Sub" OnItemCommand="lvSub_ItemCommand">
                            <LayoutTemplate>
                                <table class="table">
                                    <tr>
                                        <th>Mã gói</th>
                                        <th>Tên gói dịch vụ</th>
                                        <th>Số ngày</th>
                                        <th>Giá</th>
                                        <th>Số lượng gói</th>
                                        <th>Đăng ký</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server" />
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:HiddenField runat="server" ID="hdfSubId" Value="<%# Item.SubId %>"></asp:HiddenField>
                                        <asp:Literal runat="server" ID="ltrSubId" Text="<%# Item.SubId %>"></asp:Literal></td>
                                    <td>
                                        <asp:Literal runat="server" ID="ltrSubContent" Text="<%# Item.SubContent %>"></asp:Literal></td>
                                    <td>
                                        <asp:Literal runat="server" ID="ltrDurday" Text="<%# Item.DurDay %>"></asp:Literal></td>
                                    <td>
                                        <asp:Literal runat="server" ID="ltrPrice" Text="<%# Item.Price.ToFormatMoney() %>"></asp:Literal></td>
                                    <td>
                                        <asp:TextBox runat="server" ID="Qty" Text="1" min="1" TextMode="Number"></asp:TextBox></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="lbtnThem" Text="Thêm" CommandName="sel" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>

                        <asp:HiddenField ID="myHiddenInput" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="h2">Dịch vụ đã chọn</div>
                    <div class="col-12 table-responsive">
                        <asp:ListView ID="lvSubSelected" runat="server" OnItemDeleting="lvSubSelected_ItemDeleting" OnItemDataBound="lvSubSelected_ItemDataBound" OnItemCommand="lvSubSelected_ItemCommand">
                            <LayoutTemplate>
                                <table class="table">
                                    <tr>
                                        <th>Tên gói dịch vụ</th>
                                        <th>Số lượng gói</th>
                                        <th>Tổng ngày</th>
                                        <th>Tổng Giá</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server" />
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:HiddenField runat="server" ID="lviID" />
                                        <asp:Label runat="server" ID="lbTen" Text=""></asp:Label></td>
                                    <td>
                                        <asp:Label runat="server" ID="lbSoLuongGoi" Text=""></asp:Label></td>
                                    <td>
                                        <asp:Label runat="server" ID="lbTongNgay" ></asp:Label></td>
                                    <td>
                                        <asp:Label runat="server" ID="lbTongGia"></asp:Label></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="lbtnXoa" Text="Xóa" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:Label ID="lbEmptySelected" runat="server" Text="Không có gói dịch vụ nào " Visible="false" />

                    </div>
                </div>
                <div class="row" style="float: right">
                    <asp:Label Text="Tổng tiền: " CssClass="h3" runat="server"></asp:Label><asp:Label runat="server" ID="lbTongTien" CssClass="h3" Text="0"></asp:Label>
                </div>
                <div class="row">
                    <asp:Label Text="Tổng ngày: " CssClass="h3"  runat="server"></asp:Label><asp:Label runat="server" ID="lbTongNgayMua" CssClass="h3" Text="0"></asp:Label>
                </div>
                <div class="row">
                    <div class="col-12">
                        <asp:Button runat="server" ID="btnTiep" Text="Tiếp tục" OnClick="btnTiep_Click" Visible="false" CssClass="btn btn-primary btn-lg  custom_font" />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="ViewInfoMerchant" runat="server">
                <div class="row">
                    <h3>Thông tin người mua gói dịch vụ</h3>
                </div>
                <div class="row">
                    <table class="table">
                        <tr>
                            <td>Người mua
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddtMerName" AutoPostBack="true" OnSelectedIndexChanged="ddtMerName_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Tên shop
                            </td>
                            <td>
                               <asp:Label runat="server" ID="lbShpName"></asp:Label>
                            </td>
                        </tr>
                          <tr>
                            <td>Tổng ngày</td>
                            <td><asp:Label runat="server" ID="lbTotalDay"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Tổng tiền</td>
                            <td><asp:Label runat="server" ID="lbTotalPrice"></asp:Label></td>
                        </tr>
                    </table>
                </div>

                <div class="row">
                    <div class="col-2">
                        <asp:Button runat="server" ID="btnBack" Text="Trở về" OnClick="btnBack_Click" Visible="true" CssClass="col-12 btn btn-primary btn-lg  custom_font" />
                    </div>
                     <div class="col-2 float-right">
                        <asp:Button runat="server" ID="btnSubmit" Text="Thanh toán" OnClick="btnSubmit_Click" Visible="true" CssClass="col-12 btn btn-primary btn-lg  custom_font" />
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
