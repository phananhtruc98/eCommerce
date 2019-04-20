<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcPro.ascx.cs" Inherits="ShoesStore.UserControls.UcPro" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Register TagPrefix="wcCustom" Namespace="ShoesStore.WebControls" Assembly="ShoesStore" %>

<asp:UpdatePanel runat="server" ID="updatePanel">
    <ContentTemplate>
        <div class="products-view__list products-list" data-layout="grid-3-sidebar"
            data-with-features="false">
            <div class="products-list__body">

                <wcCustom:RepeaterTable runat="server" ID="rptPro" AllowPage="True" TableName="Pro">
                    <ItemTemplate>
                        <div class="products-list__item">

                            <div class="product-card">

                                <div class="product-card__badges-list">
                                    <div class="product-card__badge product-card__badge--new">New</div>
                                </div>
                                <div class="product-card__image">
                                    <asp:LinkButton runat="server" ID="proImgLink"
                                        PostBackUrl='<%#MyLibrary.ProDetUrl(Container.DataItem) %>'>

                                 <img src="<%#MyLibrary.ProImgPath(Container.DataItem) %>" alt="">
                                    </asp:LinkButton>


                                </div>
                                <div class="product-card__info">
                                    <div class="product-card__name">
                                        <a href="product.html">
                                            <%# Eval("ProName") %>
                                        </a>
                                    </div>
                                    <div class="product-card__rating">
                                        <div class="rating">
                                            <div class="rating__body">
                                                <svg
                                                    class="rating__star rating__star--active"
                                                    width="13px" height="12px">

                                                    <g class="rating__fill">

                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>

                                                    </g>

                                                    <g class="rating__stroke">

                                                        <use
                                                            href="images/sprite.svg#star-normal-stroke">
                                                        </use>

                                                    </g>

                                                </svg>
                                                <div
                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star rating__star--active"
                                                    width="13px" height="12px">

                                                    <g class="rating__fill">

                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>

                                                    </g>

                                                    <g class="rating__stroke">

                                                        <use
                                                            href="images/sprite.svg#star-normal-stroke">
                                                        </use>

                                                    </g>

                                                </svg>
                                                <div
                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star rating__star--active"
                                                    width="13px" height="12px">

                                                    <g class="rating__fill">

                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>

                                                    </g>

                                                    <g class="rating__stroke">

                                                        <use
                                                            href="images/sprite.svg#star-normal-stroke">
                                                        </use>

                                                    </g>

                                                </svg>
                                                <div
                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star rating__star--active"
                                                    width="13px" height="12px">

                                                    <g class="rating__fill">

                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>

                                                    </g>

                                                    <g class="rating__stroke">

                                                        <use
                                                            href="images/sprite.svg#star-normal-stroke">
                                                        </use>

                                                    </g>

                                                </svg>
                                                <div
                                                    class="rating__star rating__star--only-edge rating__star--active">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                                <svg class="rating__star" width="13px"
                                                    height="12px">

                                                    <g class="rating__fill">

                                                        <use href="images/sprite.svg#star-normal">
                                                        </use>

                                                    </g>

                                                    <g class="rating__stroke">

                                                        <use
                                                            href="images/sprite.svg#star-normal-stroke">
                                                        </use>

                                                    </g>

                                                </svg>
                                                <div class="rating__star rating__star--only-edge">
                                                    <div class="rating__fill">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                    <div class="rating__stroke">
                                                        <div class="fake-svg-icon"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-card__rating-legend">9 Reviews</div>
                                    </div>

                                </div>
                                <div class="product-card__actions">
                                    <div class="product-card__availability">
                                        Availability:
                         <span
                             class="text-success">In Stock
                         </span>
                                    </div>
                                    <div class="product-card__prices"><%# Eval("Price").ToFormatMoney() %></div>
                                    <div class="product-card__shop text-right small text-monospace">
                                        <a href="product.html"><%#Eval("Shp.ShpName") %></a>
                                    </div>
                                    <div class="product-card__buttons">

                                        <asp:LinkButton runat="server"
                                                        PostBackUrl='<%#MyLibrary.ProDetUrl(Container.DataItem) %>'
                                                        ID="addToCart" Text="Xem sản phẩm" CssClass="btn btn-primary product-card__addtocart" />

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

                        <asp:LinkButton runat="server" OnClick="MyBtnHandler" CssClass="page-link" CommandArgument='<%#Container.DataItem.ToString()%>' CommandName="ThisBtnClick" Text="<%#Container.ItemIndex +1 %>"></asp:LinkButton>
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
