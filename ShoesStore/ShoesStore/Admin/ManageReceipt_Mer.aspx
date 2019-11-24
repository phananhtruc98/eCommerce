<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageReceipt_Mer.aspx.cs" Inherits="ShoesStore.Admin.ManageReceipt_Mer" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Import Namespace="ShoesStore" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="TimKiem" class="container">
        <div class="btn btn-lg custom_bar row col-12">Danh sách hóa đơn bán gói dịch vụ</div>
        <div class="row">
            <div class="col-3">
                Lọc:
                <asp:DropDownList runat="server" ID="ddlPropFilter" AutoPostBack="True" OnSelectedIndexChanged="ddlPropFilter_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-4">
                <input type="text" runat="server" visible="false" clientidmode="Static" id="datepicker"/>
                <script type="text/javascript">

                    $(document).ready(function() {

                        $("#datepicker").datepicker($.datepicker.regional["vi"]);
                    });


                </script>
                <asp:LinkButton ID="lbtnTim" runat="server" OnClick="lbtnTim_Click" Visible="false">Tìm</asp:LinkButton>
                <asp:DropDownList runat="server" ID="ddlPropFilterDet" AutoPostBack="True" OnSelectedIndexChanged="ddlPropFilterDet_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-5">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
                <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click"/>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                Sắp xếp:
                <asp:DropDownList runat="server" ID="SortList">
                    <asp:ListItem Value="RcptSubId" Text="Mã hóa đơn" Selected="True"/>
                    <asp:ListItem Value="DateAdd" Text="Ngày đặt hàng"/>
                    <asp:ListItem Value="ShpName" Text="Cửa hàng"/>
                    <asp:ListItem Value="SumDay" Text="Tổng ngày"/>
                    <asp:ListItem Value="SumPrice" Text="Tổng tiền"/>
                </asp:DropDownList>
            </div>
            <div class="col-2">
                <asp:DropDownList runat="server" ID="DirectionList">
                    <asp:ListItem Value="ASC" Text="Tăng dần" Selected="True"/>
                    <asp:ListItem Value="DESC" Text="Giảm dần"/>
                </asp:DropDownList>
            </div>
            <div class="col-7">
                <asp:LinkButton runat="server" ID="lbtnSort" OnClick="lbtnSort_Click">
                    <i class="fas fa-sort-amount-down"></i>
                </asp:LinkButton>
            </div>
        </div>
        <div class="row">
            Chọn kiểu biểu đồ: 
            <asp:DropDownList ID="drlChartType" AutoPostBack="true" runat="server" Height="100%"
                              OnSelectedIndexChanged="drlChartType_OnSelectedIndexChanged">
            </asp:DropDownList>
            <asp:Chart ID="Chart1" runat="server">
                <series><asp:Series Name="Series1" ChartArea="ChartArea1" ChartType="Line">
                    <Points>
                        <asp:DataPoint AxisLabel="Mark" YValues="800" />
                        <asp:DataPoint AxisLabel="Steve" YValues="900" />
                        <asp:DataPoint AxisLabel="John" YValues="700" />
                        <asp:DataPoint AxisLabel="Mary" YValues="900" />
                        <asp:DataPoint AxisLabel="Ben" YValues="600" />
                    </Points>
                </asp:Series></series>
                <chartareas><asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Tháng">
                    </AxisX>
                    <AxisY Title="Doanh thu">
                    </AxisY>
                </asp:ChartArea></chartareas>
            </asp:Chart>
            <asp:ListView runat="server" OnItemDataBound="lvRcptSub_ItemDataBound" OnPagePropertiesChanging="lvRcptSub_PagePropertiesChanging" AllowPaging="true" ItemType="ShoesStore.DataAccessLogicLayer.RcptSub" OnItemCommand="lvRcptSub_ItemCommand" OnSelectedIndexChanged="lvRcptSub_SelectedIndexChanged" ID="lvRcptSub">
                <LayoutTemplate>
                    <table class="table table-border">
                        <tr>
                            <td>Xem chi tiết</td>
                            <td>Mã hóa đơn</td>
                            <td>Ngày đặt hàng</td>
                            <td>Cửa hàng</td>
                            <td>Tổng ngày</td>
                            <td>Tổng tiền</td>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"/>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton runat="server" ID="lbtnDetail" CommandName="Sel" CommandArgument="<%# Item.RcptSubId %>" CssClass="btn btn-icons btn-rounded btn-outline-warning">
                                <i class="fas fa-info"></i>
                            </asp:LinkButton>
                        </td>

                        <td>
                            <asp:Label runat="server" ID="lbRcptId" Text="<%# Item.RcptSubId %>"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="lbDateAdd" Text="<%# Item.Rcpt.DateAdd %>"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="lbShpName" Text="<%# Item.Mer.Shp.Select(x => x.ShpName).FirstOrDefault() %>"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="lbCusName" Text="<%# Item.RcptSubDet.Select(x => x.Sub.DurDay).Sum() %>"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label1" Text="<%# MyLibrary.SumRcptSubPrice(Item) %>"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                           PagedControlID="lvRcptSub">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True"
                                                ShowNextPageButton="False" ShowPreviousPageButton="true" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước"/>
                    <asp:NumericPagerField/>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                                                ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước"/>
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Content>