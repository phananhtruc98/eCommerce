﻿<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageReceipt_Mer.aspx.cs" Inherits="ShoesStore.Admin.ManageReceipt_Mer" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn btn-lg custom_bar">Danh sách hóa đơn bán gói dịch vụ</div>
    <div id="TimKiem" class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem" ></asp:TextBox>
               <asp:Button runat="server" ID="btnTimKiem" Text="Tìm"  CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click" />
            </div>
        </div>
    </div>
<%--    Thêm cột tình trạng đơn hàng hiện tại--%>
    <div class="row">
        <div class="col-12 table-responsive-sm table-responsive-xl">
            <asp:GridView ID="gvRcptSub" ShowFooter="True" runat="server" OnRowCommand="gvSub_RowCommand" AutoGeneratedColumns="false" BackColor="White" BorderColor="#CC9966" BorderWidth="1px" BorderStyle="None" AutoGenerateColumns="False" AllowPaging="True" Style="margin-top: 0px" OnSelectedIndexChanged="gvRcptSub_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lblSelect" CommandArgument='<%# Eval("RcptSubId") %>' CommandName="Select" ForeColor="#8C4510" runat="server">Chọn</asp:LinkButton>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("RcptSubId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("RcptSubId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("RcptSubId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                            <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("RcptSubId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
                        </FooterTemplate>
                        <FooterStyle Wrap="False" />
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mã hóa đơn">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="rcptsubid" Text='<%# Eval("RcptSubId") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditSupId" Text='<%# Bind("RcptSubId") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" type="number" ID="InsertSupId" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày thêm">
                        <ItemTemplate>
                            <%# Eval("Rcpt.DateAdd") %>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="InsertDateAdd" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày sửa">
                        <ItemTemplate>
                            <%# Eval("Rcpt.DateEdit") %>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="InsertDateEdit" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Người thêm">
                        <ItemTemplate>
                            <%# Eval("Rcpt.UsrAdd") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditUsrAdd" Text='<%# Bind("Rcpt.UsrAdd") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="InsertUsrAdd" Text=' <%# Bind("Rcpt.UsrAdd") %>' />
                            <asp:RequiredFieldValidator ID="rfvEditUsrAdd"
                                runat="server"
                                ErrorMessage="Chưa nhập người thêm"
                                ControlToValidate="InsertUsrAdd"
                                Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Người chỉnh sửa">
                        <ItemTemplate>
                            <%# Eval("Rcpt.UsrEdit") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditUsrEdit" Text='<%# Bind("Rcpt.UsrEdit") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="InsertUsrEdit" Text=' <%# Bind("Rcpt.UsrEdit") %>' />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="false" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"  Wrap="false" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099"  Wrap="false"/>
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="False" ForeColor="#990000" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                <EmptyDataTemplate>
                    <table>
                        <tr style="background-color: #990000; font-weight: bold; color: #FFFFCC">
                            <td></td>
                            <td>Mã hóa đơn</td>
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
                                <asp:Label runat="server" ID="EInsertDateAdd" /></td>
                            <td>
                                <asp:TextBox runat="server" type="date" ID="EInsertDateEdit" Text='<%# Bind("DateEdit") %>' />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="EInsertUsrAdd" Text=' <%# Bind("UsrAdd") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditUsrAdd"
                                    runat="server"
                                    ErrorMessage="Chưa nhập người thêm"
                                    ControlToValidate="EInsertUsrAdd"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator></td>
                            <td>
                                <asp:TextBox runat="server" ID="EInsertUsrEdit" Text=' <%# Bind("UsrEdit") %>' /></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:ValidationSummary ID="ValidationRcptSubId" ValidationGroup="Insert"
                ForeColor="Red" runat="server" />
        </div>
    </div>
    <div><br /></div>
    <div id="cthd" runat="server" class="btn btn-lg custom_bar ">Chi tiết hóa đơn</div>
    <div class="row">
        <div class="col-12 table-responsive">
                <asp:GridView ID="gvRcptSubDet" CssClass="table table-responsive table-striped" runat="server" HtmlEncode="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="gvRcptSubDet_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Mã hóa đơn">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("RcptId") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Wrap="False" />
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên cửa hàng">
                            <ItemTemplate>
                                <%# Eval("ShpName") %>
                            </ItemTemplate>
                            <FooterStyle Wrap="False" />
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên người mua">
                            <ItemTemplate>
                                <%# Eval("UsrName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên gói">
                            <ItemTemplate>
                                <%# Eval("SubContent") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Đơn giá">
                            <ItemTemplate>
                                <%# Eval("Price","{0:N0}") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số lượng gói">
                            <ItemTemplate>
                                <%# Eval("Quantity") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số lượng ngày">
                            <ItemTemplate>
                                <%# Eval("Days") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                Tổng tiền:
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Giá">
                            <ItemTemplate>
                                 <asp:Label ID="lbl" runat="server" Text='<%# Eval("Subprice","{0:N0}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label runat="server" ID="sumprice2" Text=""></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            <div  Class="text-right h2" id="sumprice" runat="server">Tổng tiền: <asp:Label runat="server" ID="sumprice2" Text=""></asp:Label></div>
            </div>
    </div>
    <div class="btn btn-lg custom_bar">Tình trạng đơn hàng</div>
</asp:Content>
