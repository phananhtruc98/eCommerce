<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MerShop.aspx.cs" Inherits="ShoesStore.Merchant.MerShop" %>

<%@ Import Namespace="ShoesStore" %>

<%@ Register Src="~/UserControls/UcPro.ascx" TagPrefix="uc1" TagName="UcPro" %>
<%@ Register Src="~/UserControls/UcProCarousel.ascx" TagPrefix="uc1" TagName="UcProCarousel" %>
<%@ Register Src="~/UserControls/UcCusCmt.ascx" TagPrefix="uc1" TagName="UcCusCmt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Thông Tin Shop-->
    

        <div class="tab-content py-4">
            <div class="tab-pane active" id="profile">
                <h5 runat="server" class="mb-3">Shop : 
                <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="lblShpName"></asp:Label>
                </h5>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <h6>About</h6>
                        <p>
                            <asp:Label runat="server" CssClass="form-control-lg txt-by-truc" ID="Label1"></asp:Label>
                        </p>
                        <h6>Categories</h6>
                        <p>
                            Male Sneakers, Casual and Sporty Sneakers
                        </p>
                    </div>

                </div>
            </div>

        </div>

        <hr />

        <div class="block block-products block-products--layout--large-last">
            <div class="block block-products block-products--layout--large-last">
                <div class="container">
                    <div class="block-header">
                        <h3 class="block-header__title">Sản Phẩm</h3>
                        <div class="block-header__divider"></div>
                    </div>
                    <div class="block-products__body">
                        <div class="block-products__list">
                            <uc1:UcPro runat="server" ID="ucPro" PageSize="28" NumberPerRow="4" />
                        </div>
                    </div>
                    <div style="overflow: hidden;">
                    </div>
                </div>
            </div>
        </div>
    <uc1:UcCusCmt runat="server" ID="UcCusCmt" ObjCmt="CusCmt" />

</asp:Content>
