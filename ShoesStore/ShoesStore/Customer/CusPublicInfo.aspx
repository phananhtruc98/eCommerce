<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CusPublicInfo.aspx.cs" Inherits="ShoesStore.Customer.CusPublicInfo" %>

<%@ Import Namespace="ShoesStore.BusinessLogicLayer" %>
<%@ Register Src="~/UserControls/UcCusCmt.ascx" TagPrefix="uc1" TagName="UcCusCmt" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UcCusCmt runat="server" ID="UcCusCmt" ObjCmt="MerCmt" />
</asp:Content>
