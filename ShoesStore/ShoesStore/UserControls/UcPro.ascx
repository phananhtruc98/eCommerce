<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcPro.ascx.cs" Inherits="ShoesStore.UserControls.UcPro" %>
<%@ Import Namespace="ShoesStore" %>
<%@ Register TagPrefix="wcCustom" Namespace="ShoesStore.WebControls" Assembly="ShoesStore" %>


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


                            <%--PostBackUrl='  <%# ActionUrl(Eval("ProCat.CatName"),Eval("ProName")) %>'--%>

                            <%--    OnCommand="proImgLink_OnClick"
                                            CommandName="GuiLink"
                                            data-rider-catId ='<%#Eval("CatId") %>'
                                            data-rider-proId ='<%#Eval("ProId") %>'
                                            data-rider-shpId ='<%#Eval("ShpId") %>'--%>
                            <asp:LinkButton runat="server" ID="proImgLink"
                                PostBackUrl='<%#MyLibrary.ProDetUrl(Eval("ProCat.CatName"),Eval("ProName"),Eval("Shp.ShpName")) %>'>

                                <img src="<%#MyLibrary.ProImgPath(Eval("ShpId"),Eval("Img")) %>" alt="">
                            </asp:LinkButton>

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                            <ul class="product-card__features-list">
                                <li>Speed: 750 RPM</li>
                                <li>Power Source: Cordless-Electric</li>
                                <li>Battery Cell Type: Lithium</li>
                                <li>Voltage: 20 Volts</li>
                                <li>Battery Capacity: 2 Ah</li>
                            </ul>
                        </div>
                        <div class="product-card__actions">
                            <div class="product-card__availability">
                                Availability:
                        <span
                            class="text-success">In Stock
                        </span>
                            </div>
                            <div class="product-card__prices"><%# MyLibrary.ToFormatMoney(Eval("Price")) %></div>
                            <div class="product-card__buttons">
                                <button
                                    class="btn btn-primary product-card__addtocart"
                                    type="button">
                                    Add To Cart
                                </button>
                                <button
                                    class="btn btn-secondary product-card__addtocart product-card__addtocart--list"
                                    type="button">
                                    Add To Cart
                                </button>

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
        <li class="page-item disabled">
            <a class="page-link page-link--with-arrow"
                href="#" aria-label="Previous">
                <svg
                    class="page-link__arrow page-link__arrow--left" aria-hidden="true"
                    width="8px" height="13px">
                    <use href="images/sprite.svg#arrow-rounded-left-8x13"></use>
                </svg>
            </a>
        </li>

        <asp:Repeater runat="server" ID="rptProPage">

            <ItemTemplate>

                <asp:LinkButton runat="server" OnClick="MyBtnHandler" CssClass="page-link" CommandArgument='<%#Container.DataItem.ToString()%>' CommandName="ThisBtnClick" Text="<%#Container.ItemIndex +1 %>"></asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>





        <li class="page-item">
            <a class="page-link page-link--with-arrow" href="#"
                aria-label="Next">
                <svg class="page-link__arrow page-link__arrow--right"
                    aria-hidden="true" width="8px" height="13px">
                    <use href="images/sprite.svg#arrow-rounded-right-8x13"></use>
                </svg>
            </a>
        </li>
    </ul>
</div>
