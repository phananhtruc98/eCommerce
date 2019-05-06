<%@ Page Language="C#" Title="Trang Shop Cá Nhân" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MerShop.aspx.cs" Inherits="ShoesStore.Merchant.MerShop" %>

<%@ Import Namespace="ShoesStore" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register Src="~/UserControls/UcPro.ascx" TagPrefix="uc1" TagName="UcPro" %>
<%@ Register Src="~/UserControls/UcProCarousel.ascx" TagPrefix="uc1" TagName="UcProCarousel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Thông Tin Shop-->
    <div>

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
                    <!--
                <div class="col-md-6">
                    <h6>Recent badges</h6>
                    <a href="#" class="badge badge-dark badge-pill">html5</a>
                    <a href="#" class="badge badge-dark badge-pill">react</a>
                    <a href="#" class="badge badge-dark badge-pill">codeply</a>
                    <a href="#" class="badge badge-dark badge-pill">angularjs</a>
                    <a href="#" class="badge badge-dark badge-pill">css3</a>
                    <a href="#" class="badge badge-dark badge-pill">jquery</a>
                    <a href="#" class="badge badge-dark badge-pill">bootstrap</a>
                    <a href="#" class="badge badge-dark badge-pill">responsive-design</a>
                    <hr/>
                    <span class="badge badge-primary"><i class="fa fa-user"></i>900 Followers</span>
                    <span class="badge badge-success"><i class="fa fa-cog"></i>43 Forks</span>
                    <span class="badge badge-danger"><i class="fa fa-eye"></i>245 Views</span>
                </div>
                -->
                </div>
                <!--/row-->
            </div>
        </div>

    </div>
    <!--Thông Tin Shop/End-->
    <hr />
    <!--Featured Products-->

    <!-- .block-products -->
    <div class="block block-products block-products--layout--large-last">
        <div class="block block-products block-products--layout--large-last">
        <div class="container">
            <div class="block-header">
                <h3 class="block-header__title">Bán chạy</h3>
                <div class="block-header__divider"></div>
            </div>
            <div class="block-products__body">
                <div class="block-products__list">
                    <uc1:UcPro runat="server" ID="ucPro" PageSize="8" NumberOnRow="4"/>
                </div>
            </div>
            <div style="overflow: hidden;">
            </div>
        </div>
    </div>
</asp:Content>
