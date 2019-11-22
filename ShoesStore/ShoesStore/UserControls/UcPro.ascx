<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcPro.ascx.cs" Inherits="ShoesStore.UserControls.UcPro" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Register TagPrefix="wcCustom" Namespace="ShoesStore.WebControls" Assembly="ShoesStore" %>
<div style="width: 100%">
    <asp:UpdatePanel runat="server" ID="updatePanel">
        <ContentTemplate>
            <div class="products-view__list products-list" data-layout="grid-3-sidebar" data-with-features="false">
                <div class="products-list__body">
                    <wcCustom:RepeaterTable runat="server" ID="rptPro" AllowPage="True" TableName="Pro" ItemType="ShoesStore.DataAccessLogicLayer.Pro">
                        <ItemTemplate>
                            <div class="products-list__item col-<%: 12 / NumberPerRow %> <%# NumberPerRow == 5 && (Container.ItemIndex + 5) % 5 == 0 ? "col-xs-offset-1" : "" %>">
                                <div class="product-card">
                                    <div class="product-card__badges-list">
                                        <div class="product-card__badge product-card__badge--<%# MyLibrary.Pro_BUS.IsSale(Item) ? "sale" : "new" %>"><%# MyLibrary.Pro_BUS.IsSale(Item) ? "Giảm giá" : "Mới" %></div>
                                    </div>
                                    <div class="product-card__image">
                                        <asp:LinkButton runat="server" ID="proImgLink" PostBackUrl="<%#MyLibrary.ProDetUrl(Container.DataItem) %>">
                                            <img src="<%#MyLibrary.ProImgPath(Container.DataItem) %>" alt="">
                                        </asp:LinkButton>
                                    </div>
                                    <div class="product-card__info">
                                        <div class="product-card__name">
                                            <a href="<%#MyLibrary.ProDetUrl(Container.DataItem) %>">
                                                <%# Eval("ProName") %>
                                            </a>
                                        </div>
                                        <div class="product-card__rating">
                                            <div class="rating">
                                                <%# MyLibrary.DrawStar(MyLibrary.Pro_BUS.AverageStar(Item)) %>
                                            </div>
                                            <div class="product-card__rating-legend"><%# MyLibrary.RcptBuyDet_BUS.GetNumberReview(Item) %> Đánh giá</div>
                                        </div>
                                    </div>
                                    <div class="product-card__actions">
                                        <div class="product-card__availability">
                                            Availability:
                                            <span class="text-success">
                                                In Stock
                                            </span>
                                        </div>
                                        <div class="product-card__prices">

                                            <%# MyLibrary.Pro_BUS.GetPriceFormat(Item) %>
                                        </div>
                                        <div class="product-card__shop text-right small text-monospace">
                                            <a href="<%#MyLibrary.ShpUrl(Item.Shp) %>"><%#Eval("Shp.ShpName") %></a>
                                        </div>
                                        <div class="product-card__buttons">
                                            <asp:LinkButton runat="server" PostBackUrl="<%#MyLibrary.ProDetUrl(Container.DataItem) %>" ID="addToCart" Text="Xem sản phẩm" CssClass="btn btn-primary product-card__addtocart"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </wcCustom:RepeaterTable>
                </div>
            </div>
            <div class="products-view__pagination">
                <ul class="pagination justify-content-center">
                    <asp:Repeater runat="server" ID="rptProPage" OnItemDataBound="rptProPage_ItemDataBound">
                        <HeaderTemplate>
                            <li class="page-item">
                                <asp:LinkButton runat="server" ID="btnPagingFirst" OnClick="MyBtnHandler" CssClass="page-link" CommandArgument="1" CommandName="ThisBtnClick" Text="Về đầu">
                                </asp:LinkButton>
                            </li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" OnClick="MyBtnHandler" CssClass="page-link" CommandArgument="<%#Container.DataItem.ToString() %>" CommandName="ThisBtnClick" Text="<%#Container.ItemIndex + 1 %>"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <li class="page-item">
                                <asp:LinkButton runat="server" ID="btnPagingLast" OnClick="MyBtnHandler" CssClass="page-link" CommandName="ThisBtnClick" Text="Về cuối">
                                </asp:LinkButton>
                            </li>
                        </FooterTemplate>
                    </asp:Repeater>
                </ul>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</div>