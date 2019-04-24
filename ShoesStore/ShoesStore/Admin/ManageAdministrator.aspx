﻿<%@ Page Language="C#" Title="Quản lý người mua" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageAdministrator.aspx.cs" Inherits="ShoesStore.Admin.Manage_Administrator" %>
<%@ MasterType VirtualPath="~/Admin/Admin.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="btn btn-lg custom_bar">Danh sách quản trị viên</div>
<div id="TimKiem" class="container">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-9">
            <asp:TextBox runat="server" placeholder="Gõ vào đây..." ID="txtTimKiem"></asp:TextBox>
            <asp:Button runat="server" ID="btnTimKiem" Text="Tìm" CssClass="btn btn-inverse-dark" OnClick="btnTimKiem_Click"/>
        </div>
    </div>
</div>
<%--cột chức vụ là combobox--%>
<div class="container">
    <div class="row">
        <div class="col-12 table-responsive">
            <asp:GridView ID="gvAdmin" ItemType="ShoesStore.DataAccessLogicLayer.Mstr" ShowFooter="True" runat="server" AutoGeneratedColumns="true" BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None" AutoGenerateColumns="False" AllowPaging="True" Style="margin-top: 0" AllowSorting="True" OnSorting="gvAdmin_Sorting" OnRowCommand="gvAdmin_RowCommand" OnRowDataBound="gvAdmin_RowDataBound" OnPageIndexChanging="gvAdmin_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("UsrId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("UsrId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" CommandArgument="<%# Item.MstrId %>" CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                            <asp:LinkButton ID="lbCancel" CommandArgument="<%# Item.MstrId %>" CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
                        </FooterTemplate>
                        <FooterStyle Wrap="False"/>
                        <HeaderStyle Wrap="False"/>
                        <ItemStyle Wrap="False"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mã người bán" SortExpression="UsrId">
                        <ItemTemplate>
                            <%# Item.MstrId %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên người bán" SortExpression="UsrName">
                        <ItemTemplate>
                            <%# Item.Usr.UsrName %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditUsrName" Text="<%# Item.Usr.UsrName %>"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="InsertUsrName" Text=" <%# Item.Usr.UsrName %>"/>
                            <asp:RequiredFieldValidator ID="rfvEditUsrName" runat="server" ErrorMessage="Chưa nhập tên người bán" ControlToValidate="InsertUsrName" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Chức vụ" SortExpression="RoleName">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdfMstrId" runat="server" Value="<%# Item.MstrId %>"/>
                            <asp:Label Text='<%# Bind("RoleName") %>' runat="server" ID="RoleName_Present"/>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList runat="server" ID="InsertRoleName"></asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("RoleId") %>' runat="server" ID="RoleID_Present"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tài khoản" SortExpression="Login">
                        <ItemTemplate>
                            <%# Eval("Login") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditLogin" Text='<%# Bind("Login") %>'/>
                            <asp:HiddenField ID="LoginOld" runat="server" Value='<%# Eval("Login") %>'></asp:HiddenField>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="InsertLogin" Text=' <%# Bind("Login") %>'/>
                            <asp:RequiredFieldValidator ID="rfvEditLogin" runat="server" ErrorMessage="Chưa nhập tài khoản" ControlToValidate="InsertLogin" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mật khẩu">
                        <ItemTemplate>
                            <%# Eval("Password") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditPassword" Text='<%# Bind("Password") %>'/>
                            <asp:HiddenField ID="PasswordOld" runat="server" Value='<%# Eval("Password") %>'></asp:HiddenField>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="InsertPassword" Text='<%# Bind("Password") %>'/>
                            <asp:RequiredFieldValidator ID="rfvEditPassword" runat="server" ErrorMessage="Chưa nhập mật khẩu" ControlToValidate="InsertPassword" Text="*" ForeColor="Red" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
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
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Địa chỉ" SortExpression="Address">
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
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số điện thoại" SortExpression="Phone">
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
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày thêm" SortExpression="DateAdd">
                        <ItemTemplate>
                            <%# Eval("DateAdd") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditDateAdd" Text='<%# Bind("DateAdd") %>'/>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày sửa" SortExpression="DateEdit">
                        <ItemTemplate>
                            <%# Eval("DateEdit") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Người thêm" SortExpression="AddBy">
                        <ItemTemplate>
                            <%# Eval("AddBy") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ảnh đại diện" SortExpression="Avatar">
                        <ItemTemplate>
                            <%# Eval("Avatar") %>
                            <asp:HiddenField runat="server" ID="EditAvatar" Value='<%# Eval("Avatar") %>'/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuploadEdit" runat="server"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:FileUpload ID="fuploadInsert" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Kích hoạt" SortExpression="Active">
                        <ItemTemplate>
                            <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("Active") %>'/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox runat="server" ID="EditActive" Checked='<%# Bind("Active") %>'/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:CheckBox runat="server" ID="InsertActive" Text='<%# Bind("Active") %>'/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Wrap="false"/>
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" Wrap="false"/>
                <PagerSettings FirstPageText="Trang đầu" LastPageText="Trang cuối" Mode="NumericFirstLast" NextPageText="Trang kế" PreviousPageText="Trang trước"/>
                <PagerStyle BackColor="#FFFFCC" ForeColor="Red" HorizontalAlign="Left" VerticalAlign="Middle"/>
                <RowStyle BackColor="White" ForeColor="#330099" Wrap="false"/>
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
<div class="btn btn-lg custom_bar">Tạo bảng chức vụ</div>
<div class="row">
    <div class="col-12">
        <asp:GridView ID="gvMstrRole" ShowFooter="True" runat="server" AutoGeneratedColumns="false" BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None" AutoGenerateColumns="False" OnRowCommand="gvMstrRole_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("RoleId") %>' CommandName="EditRow" ForeColor="#8C4510" runat="server">Sửa</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("RoleId") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Xóa</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("RoleId") %>' CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Cập nhật</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("RoleId") %>' CommandName="CancelUpdate" ForeColor="#8C4510" runat="server" CausesValidation="false">Hủy</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" ValidationGroup="Insert" runat="server" CommandName="InsertRow" ForeColor="#8C4510">Thêm</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mã gói">
                    <ItemTemplate>
                        <%# Eval("RoleId") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên chức vụ">
                    <ItemTemplate>
                        <%# Eval("RoleName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="EditRoleName" Text='<%# Bind("RoleName") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox runat="server" ID="InsertRoleName" Text=' <%# Bind("RoleName") %>'/>
                        <asp:RequiredFieldValidator ID="rfvRoleName" runat="server" ErrorMessage="Chưa nhập tên gói dịch vụ" ControlToValidate="InsertRoleName" Text="*" ForeColor="Red" ValidationGroup="Role">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"/>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"/>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"/>
            <RowStyle BackColor="White" ForeColor="#330099"/>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"/>
            <SortedAscendingCellStyle BackColor="#FEFCEB"/>
            <SortedAscendingHeaderStyle BackColor="#AF0101"/>
            <SortedDescendingCellStyle BackColor="#F6F0C0"/>
            <SortedDescendingHeaderStyle BackColor="#7E0000"/>
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="Role" ForeColor="Red" runat="server"/>
    </div>
</div>
</asp:Content>