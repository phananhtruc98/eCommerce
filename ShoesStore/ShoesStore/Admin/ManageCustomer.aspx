﻿<%@ Page Language="C#" Title="Quản lý người mua" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="ShoesStore.Admin.Manage_Customer" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn btn-lg custom_bar">Danh sách người mua</div>
    <div id="TimKiem" class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-9">
                <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
                <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click"/>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 table-responsive">
                <asp:GridView ID="gvCustomer" ShowFooter="False" runat="server" AutoGeneratedColumns="false" BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="2" BorderStyle="None" AutoGenerateColumns="False" AllowPaging="True" Style="margin-top: 0px" OnPageIndexChanging="gvCustomer_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Mã người bán">
                            <ItemTemplate>
                                <%# Eval("UsrId") %>
                            </ItemTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên người bán">
                            <ItemTemplate>
                                <%# Eval("UsrName") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditUsrName" Text='<%# Bind("UsrName") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertUsrName" Text=' <%# Bind("UsrName") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditUsrName" runat="server" ErrorMessage="Chưa nhập tên người bán" ControlToValidate="InsertUsrName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tài khoản">
                            <ItemTemplate>
                                <%# Eval("Login") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditLogin" Text='<%# Bind("Login") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertLogin" Text=' <%# Bind("Login") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditLogin" runat="server" ErrorMessage="Chưa nhập tài khoản" ControlToValidate="InsertLogin" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mật khẩu">
                            <ItemTemplate>
                                <%# Eval("Password") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditPassword" Text='<%# Bind("Password") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertPassword" Text='<%# Bind("Password") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditPassword" runat="server" ErrorMessage="Chưa nhập mật khẩu" ControlToValidate="InsertPassword" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%# Eval("Email") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditEmail" Text='<%# Bind("Email") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="email" ID="InsertEmail" Text='<%# Bind("Email") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ErrorMessage="Chưa nhập email" ControlToValidate="InsertEmail" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Địa chỉ">
                            <ItemTemplate>
                                <%# Eval("Address") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditAddress" Text='<%# Bind("Address") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" ID="InsertAddress" Text='<%# Bind("Address") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditAddress" runat="server" ErrorMessage="Chưa nhập địa chỉ" ControlToValidate="InsertAddress" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số điện thoại">
                            <ItemTemplate>
                                <%# Eval("Phone") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditPhone" Text='<%# Bind("Phone") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="number" ID="InsertPhone" Text='<%# Bind("Phone") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditPhone" runat="server" ErrorMessage="Chưa nhập số điện thoại" ControlToValidate="InsertPhone" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày thêm">
                            <ItemTemplate>
                                <%# Eval("DateAdd") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditDateAdd" Text='<%# Bind("DateAdd") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="date" ID="InsertDateAdd" Text='<%# Bind("DateAdd") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditDateAdd" runat="server" ErrorMessage="Chưa nhập địa chỉ" ControlToValidate="InsertDateAdd" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày sửa">
                            <ItemTemplate>
                                <%# Eval("DateEdit") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="EditDateEdit" Text='<%# Bind("DateEdit") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox runat="server" type="date" ID="InsertDateEdit" Text='<%# Bind("DateEdit") %>'/>
                                <asp:RequiredFieldValidator ID="rfvEditDateEdit" runat="server" ErrorMessage="Chưa nhập số điện thoại" ControlToValidate="InsertDateEdit" Text="*" ForeColor="Red" ValidationGroup="Insert">
                                </asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <FooterStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kích hoạt">
                            <ItemTemplate>
                                <asp:Checkbox Enabled="false" runat="server" checked='<%# Eval("Active") %>'/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Checkbox runat="server" ID="EditActive" checked='<%# Bind("Active") %>'/>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Checkbox runat="server" ID="InsertActive" Text='<%# Bind("Active") %>'/>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"/>
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"/>
                    <PagerSettings FirstPageText="Trang đầu" LastPageText="Trang cuối" Mode="NextPreviousFirstLast" NextPageText="Trang kế" PreviousPageText="Trang trước"/>
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"/>
                    <RowStyle BackColor="White" ForeColor="#330099"/>
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"/>
                    <SortedAscendingCellStyle BackColor="#FEFCEB"/>
                    <SortedAscendingHeaderStyle BackColor="#AF0101"/>
                    <SortedDescendingCellStyle BackColor="#F6F0C0"/>
                    <SortedDescendingHeaderStyle BackColor="#7E0000"/>
                </asp:GridView>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert" ForeColor="Red" runat="server"/>
            </div>
        </div>
    </div>
</asp:Content>