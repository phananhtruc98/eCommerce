﻿<%@ Page Language="C#" MasterPageFile="~/Merchant/SiteMerchant.Master" AutoEventWireup="true" CodeBehind="ManageRcpt.aspx.cs" Inherits="ShoesStore.Merchant.ManageRcpt" %>

<%@ Import Namespace="ShoesStore" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">


    <div class="btn btn-lg custom_bar">Danh sách hóa đơn bán hàng</div>
    <div id="TimKiem" class="container">

        <!-- Lọc kết quả -->
        <div class="row">
            <div class="col-3">
                Lọc:
                <asp:DropDownList runat="server" ID="ddlPropFilter" AutoPostBack="True" OnSelectedIndexChanged="ddlPropFilter_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-4">
                <input type="text" runat="server" visible="false" clientidmode="Static" id="datepicker" />
                <script type="text/javascript">

                    $(document).ready(function () {

                            $("[id*='datepicker'").datepicker($.datepicker.regional["vi"]);
                    });


                </script>
                <asp:LinkButton ID="lbtnTim" runat="server" OnClick="lbtnTim_Click" Visible="false">Tìm</asp:LinkButton>
                <asp:DropDownList runat="server" ID="ddlPropFilterDet" AutoPostBack="True" OnSelectedIndexChanged="ddlPropFilterDet_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-3"></div>
            <div class="col-9">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
                <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 ">
            <asp:GridView ID="gvRcptBuy" AllowSorting="True" OnRowDataBound="gvRcptBuy_RowDataBound" runat="server" OnRowCommand="gvBuy_RowCommand" AutoGeneratedColumns="false" BackColor="White" Width="300px" Overflow="auto" BorderColor="#CC9966" BorderWidth="1px" BorderStyle="None" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvRcptBuy_PageIndexChanging" Style="margin-top: 0px" OnSelectedIndexChanged="gvRcptBuy_SelectedIndexChanged" PageSize="5">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lblSelect" CommandArgument='<%# Eval("RcptBuyId") %>' CommandName="Select" ForeColor="#8C4510" runat="server">Chọn</asp:LinkButton>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("RcptBuyId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("RcptBuyId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                            <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("RcptBuyId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                        </EditItemTemplate>

                        <FooterStyle Wrap="False" />
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mã hóa đơn">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="rcptbuyid" Text='<%# Eval("RcptBuyId") %>' />
                        </ItemTemplate>

                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Ngày thêm">
                        <ItemTemplate>
                            <%# Eval("DateAdd") %>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày sửa">
                        <ItemTemplate>
                            <%# Eval("DateEdit") %>
                        </ItemTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField ItemStyle-Width="40px" HeaderText="Người mua">
                        <ItemTemplate>
                            <%# Eval("UsrName") %>
                        </ItemTemplate>

                        <ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="40px" HeaderText="Mã Tình Trạng">
                        <ItemTemplate>
                            <%# MyLibrary.RcptBuyStaDet_BUS.GetMaxExist(Convert.ToInt32(Eval("RcptBuyId"))).StepId %>
                        </ItemTemplate>

                        <ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField ItemStyle-Width="40px" HeaderText="Tình Trạng">
                        <ItemTemplate>
                            <%# MyLibrary.RcptBuyStaDet_BUS.GetMaxExist(Convert.ToInt32(Eval("RcptBuyId"))).StepCont %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:HiddenField runat="server" ID="stepId" />
                            <asp:HiddenField runat="server" ID="rcptBuyId1" Value='<%# Eval("RcptBuyId") %>' />
                            <asp:DropDownList OnSelectedIndexChanged="drpcategory1_SelectedIndexChanged" AutoPostBack="true" ID="drpcategory1" AppendDataBoundItems="True" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>

                        <ItemStyle Width="40px"></ItemStyle>
                    </asp:TemplateField>


                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="false" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false" />
                <PagerSettings FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Trang Tiếp Theo" PreviousPageText="Trang Trước" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" Wrap="false" />

                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="False" ForeColor="#990000" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                <EmptyDataTemplate>
                    <table>
                        <tr style="background-color: #990000; color: #FFFFCC; font-weight: bold;">
                            <td></td>
                            <td>Mã hóa đơn</td>
                            <td>Tên Shop</td>
                            <td>Ngày thêm</td>
                            <td>Ngày sửa</td>
                            <td>Người thêm</td>
                            <td>Người sửa</td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:Label runat="server" Text="Không có dữ liệu"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="EInsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label runat="server" type="number" ID="EInsertSupId" />
                            <td>
                                <asp:Label runat="server" ID="EInsertDateAdd" />
                            </td>
                            <td>
                                <asp:TextBox runat="server" type="date" ID="EInsertDateEdit" Text='<%# Bind("DateEdit") %>' />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="EInsertUsrAdd" Text=' <%# Bind("UsrAdd") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditUsrAdd" runat="server" ErrorMessage="Chưa nhập người thêm" ControlToValidate="EInsertUsrAdd" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="EInsertUsrEdit" Text=' <%# Bind("UsrEdit") %>' />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="EInsertCusId" Text=' <%# Bind("UsrAdd") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập người thêm" ControlToValidate="EInsertCusId" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:ValidationSummary ID="ValidationRcptSubId" ValidationGroup="Insert" ForeColor="Red" runat="server" />
        </div>
    </div>
    <!-- Phân Trang -->
    <%--<asp:DataPager ID="DataPager1" runat="server" PageSize="5"
                    PagedControlID="gvRcptBuy">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True"
                            ShowNextPageButton="False" ShowPreviousPageButton="true" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True"
                            ShowNextPageButton="true" ShowPreviousPageButton="False" FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Kế" PreviousPageText="Trước" />
                    </Fields>
                </asp:DataPager>--%>
    <!-- Phân Trang/END -->
    <div id="cthd" runat="server" class="btn btn-lg custom_bar ">Chi tiết hóa đơn</div>
    <div class="row">
        <div class="col-12 table-responsive">
            <asp:GridView ID="gvRcptBuyDet" CssClass="table table-responsive table-striped" runat="server" HtmlEncode="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="gvRcptBuyDet_RowDataBound1">
                <Columns>
                    <asp:TemplateField HeaderText="Mã hóa đơn">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("RcptId") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterStyle Wrap="False" />
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên người mua">
                        <ItemTemplate>
                            <%# Eval("UsrName") %>
                        </ItemTemplate>
                        <FooterStyle Wrap="False" />
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên cửa hàng">
                        <ItemTemplate>
                            <%# Eval("ShpName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên sản phẩm">
                        <ItemTemplate>
                            <%# Eval("ProName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đơn giá">
                        <ItemTemplate>
                            <%# Eval("Price", "{0:N0}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <%# Eval("Quantity") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Giá">
                        <ItemTemplate>
                            <asp:Label ID="lbl" runat="server" Text='<%# Eval("Subprice", "{0:N0}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="sumprice2" Text=""></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerSettings FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Trang Kế" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <div class="text-right h2" id="sumprice" runat="server">
                Tổng tiền:
            <asp:Label runat="server" ID="sumprice2" Text=""></asp:Label>                
            </div>
            <br />
            <div id="statistic">
                <h2>Thống kê doanh thu của cửa hàng</h2> <asp:LinkButton ID="lbtnExportExcel" runat="server" OnClick="lbtnExportExcel_Click">Xuất file excel</asp:LinkButton>
            <asp:GridView ID="incomeStatistic" PageSize="5" CssClass="table table-responsive table-striped" runat="server" HtmlEncode="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="incomeStatistic_RowDataBound" ShowFooter="True">
            <Columns>
                    <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                            <%# Eval("OrderNumber") %>
                        </ItemTemplate>
                        <FooterStyle Wrap="False" />
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sản phẩm">
                        <ItemTemplate>
                            <%# Eval("ProName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đơn giá">
                        <ItemTemplate>
                            <%# Eval("PriceWhenBuy", "{0:N0}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <%# Eval("Quantity") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thành tiền">
                        <ItemTemplate>
                            <asp:Label ID="lbl" runat="server" Text='<%# Eval("Subprice", "{0:N0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerSettings FirstPageText="Đầu" LastPageText="Cuối" NextPageText="Trang Kế" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" /> 
            </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
