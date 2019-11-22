<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCus.Master" CodeBehind="CusHome_Rcpt_Det.aspx.cs" Inherits="ShoesStore.Customer.CusHome_Rcpt_Det" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<%@ MasterType VirtualPath="~/SiteCus.Master" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="row" runat="server" visible="false" id="rowRcptBuyDet">
        <asp:Label runat="server" Text="Chi tiết đơn hàng" ID="Label1" CssClass="h3" Visible="false"></asp:Label>
        <div class="col-12">
            <table class="table">
                <thead>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptBuyId" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptBuyDate" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th colspan="7">
                        <asp:Label ID="lbRcptBuySta" runat="server"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <td>Thông tin cửa hàng: </td>
                    <td colspan="6">
                        Tên cửa hàng:
                        <asp:Label ID="lbShpName" runat="server"></asp:Label><br/>
                        Địa chỉ:
                        <asp:Label ID="lbAddress" runat="server"></asp:Label><br/>
                        Số điện thoại:
                        <asp:Label ID="lbPhone" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Thông tin khách hàng: </td>
                    <td colspan="6">
                        Cửa hàng:
                        <asp:Label ID="lbCusName" runat="server"></asp:Label><br/>
                        Địa chỉ:
                        <asp:Label ID="lbAddressCus" runat="server"></asp:Label><br/>
                        Số điện thoại:
                        <asp:Label ID="lbPhoneCus" runat="server"></asp:Label><br/>
                        Số điện thoại:
                        <asp:Label ID="lbEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th class="">Ảnh </th>
                    <th class="">Tên sản phẩm</th>
                    <th class="">Màu</th>
                    <th class="">Kích cỡ</th>
                    <th class="">Số lượng</th>
                    <th class="">Giá</th>
                    <th class="">Đánh giá</th>
                </tr>
                </thead>
                <tbody>
                <asp:Repeater ID="rptRcptShp" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" runat="server" OnItemDataBound="rptRcptShp_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="hdfShpId" Value="<%# Item.ShpId %>"/>
                        <asp:Repeater runat="server" ID="rptRcptShpDet" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuyDet" OnItemDataBound="rptRcptShpDet_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <a href="<%# MyLibrary.ProDetUrl(Item.ProDet.Pro) %>">
                                            <img style="height: 200px; width: 200px;" src="<%# MyLibrary.ProImgPath(Item.ProDet.Pro) %>" alt="">
                                        </a>
                                    </td>
                                    <td><%# Item.ProDet.Pro.ProName %></td>
                                    <td><%# Item.ProDet.ProColor.ColorName %></td>
                                    <td><%# Item.ProDet.ProSize.SizeName %></td>
                                    <td><%# Item.Quantity %></td>
                                    <td>
                                        <%#     MyLibrary.Pro_BUS.IsSale(Item.ProDet.Pro) ?
                                                    MyLibrary.GetPriceFormat(Item.Quantity * int.Parse(Item.ProDet.Pro.Price), Item.Quantity * int.Parse(MyLibrary.Pro_BUS.GetPrice(Item.ProDet.Pro)))
                                                    : (Item.Quantity * int.Parse(Item.ProDet.Pro.Price)).ToFormatMoney() %>
                                    </td>
                                    <td>
                                        <%--<asp:LinkButton runat="server" ID="lbtnDanhGia" Visible="false" Text="ĐÁNH GIÁ" PostBackUrl="<%#MyLibrary.ProDetUrl(Item.ProDet.Pro) %>"></asp:LinkButton>--%>
                                        <%# Item.MerCmt %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td colspan="7" style="font-size: 30px; text-align: right;">
                                Tổng cộng: <%# MyLibrary.RcptBuy_BUS.SumPrice(Item) == MyLibrary.RcptBuy_BUS.SumPriceNoDiscount(Item)
                                                   ? MyLibrary.RcptBuy_BUS.SumPrice(Item).ToFormatMoney()
                                                   : MyLibrary.GetPriceFormat(MyLibrary.RcptBuy_BUS.SumPriceNoDiscount(Item), MyLibrary.RcptBuy_BUS.SumPrice(Item)) %>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                </tbody>
            </table>
        </div>
        <div class="col-12">
            <asp:Panel CssClass="reviews-view__form" runat="server" ID="DivWriteComment">
                <h3 class="reviews-view__header">Viết đánh giá</h3>
                <div class="row">
                    <div class="col-12 col-lg-9 col-xl-8">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="review-stars">
                                    Chấm sao
                                </label>
                                <asp:DropDownList ID="review_stars" class="form-control" runat="server">
                                    <asp:ListItem Value="5 Sao"/>
                                    <asp:ListItem Value="4 Sao"/>
                                    <asp:ListItem Value="3 Sao"/>
                                    <asp:ListItem Value="2 Sao"/>
                                    <asp:ListItem Value="1 Sao"/>


                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">

                            <label for="review-text">Nội dung đánh giá</label>

                            <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control" ID="review_text" Rows="6"/>
                        </div>
                        <div class="form-group mb-0">
                            <asp:Button runat="server" ID="btnSubmit" Text="Gửi đánh giá" OnClick="btnSubmit_OnClick" CssClass="btn btn-primary btn-lg"/>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>