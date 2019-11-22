<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcCusCmt.ascx.cs" Inherits="ShoesStore.UserControls.UcCusCmt" %>
<div>Điểm uy tín: <asp:Label runat="server" id="averagePoint"></asp:Label> </div>
<asp:Repeater runat="server" ID="rptCusCmt" ItemType="ShoesStore.DataAccessLogicLayer.RcptBuy" OnItemDataBound="rptCusCmt_OnItemDataBound">

    <HeaderTemplate>
        <table class="table table-bordered">
        <tr>
            <th>
                <asp:Label runat="server" ID="CmtFrom"></asp:Label>
            </th>
            <th>
                Điểm
            </th>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <asp:HiddenField runat="server" ID="hdfRcptBuyId" Value="<%# Item.RcptBuyId %>"/>
        <tr>
            <td>
                <asp:Label runat="server" ID="MessageFrom"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="PointFrom"></asp:Label>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
</asp:Repeater>