<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Overview_Profit_W.aspx.cs" Inherits="ShoesStore.Admin.Overview_Profit_W" %>

<%@ Import Namespace="ShoesStore.MyExtensions" %>
<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">Thống kê lợi nhuận của Webmaster</div>
        </div>
        <div class="row">
            <div class="col-12">
                Chọn thời gian: 
            <asp:DropDownList runat="server" ID="ddlMonth"></asp:DropDownList>
                <asp:DropDownList runat="server" ID="ddlYear"></asp:DropDownList>
                <asp:LinkButton runat="server" ID="lbtn" OnClick="lbtn_Click">Chọn</asp:LinkButton>
            </div>
        </div>
        <div runat="server" id="result" class="col-12" visible="false">
            <table class="table table-warning table-responsive-lg">
                <tr>
                    <td colspan="2"><asp:Label runat="server" ID="dontneed">Tháng: </asp:Label><asp:Label runat="server" ID="lbMonthSelected"></asp:Label> Năm: <asp:Label runat="server" ID="lbYearSelected"></asp:Label></td>
                </tr>
                <tr>
                    <td>Tổng hóa đơn</td>
                    <td>Tổng doanh thu</td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" ID="lblRcptSubCount"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblSumPrice"></asp:Label></td>
                </tr>
            </table>
        </div>


    </div>

</asp:Content>
