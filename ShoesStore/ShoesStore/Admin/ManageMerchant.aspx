﻿<%@ Page Language="C#" Title="Quản lý người bán" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageMerchant.aspx.cs" Inherits="ShoesStore.Admin.Manage_User" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn btn-lg custom_bar">Danh sách người bán</div>
    <div id="TimKiem" class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem" ></asp:TextBox>
               <asp:Button runat="server" ID="btnTimKiem" Text="Tìm"  CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click" />
            </div>
        </div>
    </div>
    <%--    Thêm cột: Tên shop vô gridview --%>
    <div class="container">
        <div class="row">
            <div class="col-12 table table-responsive">
                <asp:GridView ID="gvMerchant" ShowFooter="False" runat="server" AutoGeneratedColumns="false" BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" OnRowCommand="gvSub_RowCommand" BorderStyle="None" AutoGenerateColumns="False" AllowPaging="True" Style="margin-top: 0px" OnRowDataBound="gvMerchant_RowDataBound" OnPageIndexChanging="gvMerchant_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>Mã người bán</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("UsrId") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên người bán">
                            <HeaderTemplate>Tên người bán</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("UsrName") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditUsrName" Text='<%# Bind("UsrName") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertUsrName" Text=' <%# Bind("UsrName") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditUsrName"
                                    runat="server"
                                    ErrorMessage="Chưa nhập tên người bán"
                                    ControlToValidate="InsertUsrName"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tài khoản">
                            <HeaderTemplate>Tài khoản</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Login") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditLogin" Text='<%# Bind("Login") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertLogin" Text=' <%# Bind("Login") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditLogin"
                                    runat="server"
                                    ErrorMessage="Chưa nhập tài khoản"
                                    ControlToValidate="InsertLogin"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mật khẩu">
                            <HeaderTemplate>Mật khẩu</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Password") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditPassword" Text='<%# Bind("Password") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertPassword" Text='<%# Bind("Password") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditPassword"
                                    runat="server"
                                    ErrorMessage="Chưa nhập mật khẩu"
                                    ControlToValidate="InsertPassword"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <HeaderTemplate>Email</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Email") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditEmail" Text='<%# Bind("Email") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="email" ID="InsertEmail" Text='<%# Bind("Email") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditEmail"
                                    runat="server"
                                    ErrorMessage="Chưa nhập email"
                                    ControlToValidate="InsertEmail"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Địa chỉ">
                            <HeaderTemplate>Địa chỉ</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Address") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditAddress" Text='<%# Bind("Address") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertAddress" Text='<%# Bind("Address") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditAddress"
                                    runat="server"
                                    ErrorMessage="Chưa nhập địa chỉ"
                                    ControlToValidate="InsertAddress"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số điện thoại">
                            <HeaderTemplate>Số điện thoại</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Phone") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditPhone" Text='<%# Bind("Phone") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="number" ID="InsertPhone" Text='<%# Bind("Phone") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditPhone"
                                    runat="server"
                                    ErrorMessage="Chưa nhập số điện thoại"
                                    ControlToValidate="InsertPhone"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày thêm">
                            <HeaderTemplate>Ngày thêm</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("DateAdd") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditDateAdd" Text='<%# Bind("DateAdd") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="date" ID="InsertDateAdd" Text='<%# Bind("DateAdd") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditDateAdd"
                                    runat="server"
                                    ErrorMessage="Chưa nhập địa chỉ"
                                    ControlToValidate="InsertDateAdd"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày sửa">
                            <HeaderTemplate>Ngày sửa</HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("DateEdit") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditDateEdit" Text='<%# Bind("DateEdit") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="date" ID="InsertDateEdit" Text='<%# Bind("DateEdit") %>' />
                                <asp:RequiredFieldValidator ID="rfvEditDateEdit"
                                    runat="server"
                                    ErrorMessage="Chưa nhập số điện thoại"
                                    ControlToValidate="InsertDateEdit"
                                    Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kích hoạt">
                            <ItemTemplate>
                                <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("Active") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox runat="server" ID="EditActive" Checked='<%# Bind("Active") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:CheckBox runat="server" ID="InsertActive" Text='<%# Bind("Active") %>' />
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="false" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" Wrap="false" />
                    <RowStyle BackColor="White" ForeColor="#330099" Wrap="false" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert"
                    ForeColor="Red" runat="server" />
            </div>
        </div>
    </div>
    <div class="btn btn-lg custom_bar">Chặn đăng bài ở đây</div>
    <div class="btn btn-lg custom_bar">Chặn người dùng ở đây</div>
    <div class="btn btn-lg custom_bar">Gửi thông báo cho người dùng ở đây</div>
</asp:Content>
