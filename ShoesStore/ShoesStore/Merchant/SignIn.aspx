﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="ShoesStore.Merchant.SignIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="UTF-8">
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/frytyler/pen/EGdtg" />
<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="/Admin/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/Admin/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/Admin/vendors/css/vendor.bundle.addons.css">
<link rel="stylesheet" href="/Admin/css/logincss.css">
<link rel="stylesheet" href="/Merchant/css/style.css">
<head runat="server">
    <webopt:BundleReference runat="server" Path="~/Content/css"/>
    <title></title>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
            </Scripts>
        </asp:ScriptManager>
        <!-- quickview-modal -->
        
        <div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                </div>
            </div>
        </div>
        <!-- quickview-modal / end -->
        <!-- Dang Ky modal-->
        <div id="DangKy" class="modal">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="modal-dialog modal-dialog-centered ">
                        <div class="modal-content  p-4 m-5 ">
                            <div class="modal-header">
                                <h3>Đăng ký</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <a href="#" data-dismiss="modal" class="float-right" data-toggle="modal" data-target="#DangNhap">Đăng nhập</a>
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control form-control-lg" name="uname1" id="email" runat="server" />
                                    <div class="mt-1">
                                        <asp:Button type="button" ID="btnActCodeSender" class="btn btn-primary" Text="Gửi mã xác minh" runat="server" OnClick="btnActCodeSender_Click" />
                                    </div>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredEmail" runat="server" ErrorMessage="Chưa nhập Email!" ControlToValidate="email" ValidationGroup="Register" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ErrorMessage="Email không đúng!" ControlToValidate="email" ForeColor="Red" ValidationGroup="Register" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label for="active_code">Mã xác minh</label>
                                    <input type="number" class="form-control form-control-lg" id="active_code" runat="server" />
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredActiveCode" runat="server" ErrorMessage="Chưa nhập mã xác minh!" ControlToValidate="active_code" ValidationGroup="Register" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Mã xác minh không đúng!" ControlToValidate="active_code" ValidationGroup="Register" ForeColor="Red" ValidationExpression="^(\d{4})$">
                                    </asp:RegularExpressionValidator>
                                    <asp:CustomValidator runat="server" ID="customValidator_ActivateCode" ErrorMessage="Mã kích hoạt không khớp" ControlToValidate="active_code" ValidationGroup="Register" ForeColor="Red" OnServerValidate="customValidator_ActivateCode_OnServerValidate">
                                    </asp:CustomValidator>
                                </div>
                                <div class="form-group">
                                    <label for="username">Họ và tên</label>
                                    <input type="text" class="form-control form-control-lg" id="username" runat="server" />
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFullname" runat="server" ErrorMessage="Chưa nhập họ tên!" ControlToValidate="username" ValidationGroup="Register" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="login">Tên đăng nhập</label>
                                    <input type="text" class="form-control form-control-lg" id="login" runat="server" />
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredUsername" runat="server" ErrorMessage="Chưa nhập tên đăng nhập!" ControlToValidate="login" ValidationGroup="Register" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="password">Mật khẩu</label>
                                    <input type="password" class="form-control form-control-lg" id="password" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredPassword" Display="Dynamic" runat="server" ErrorMessage="Chưa nhập mật khẩu!" ControlToValidate="password" ValidationGroup="Register" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Mật khẩu yếu" ControlToValidate="password" ValidationGroup="Register" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9 ]*$">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label for="re_password">Xác nhận mật khẩu</label>
                                    <input type="password" class="form-control form-control-lg" id="re_password" runat="server" />
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredRePassword" runat="server" ErrorMessage="Chưa nhập lại mật khẩu!" ControlToValidate="re_password" ValidationGroup="Register" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group py-4">
                                    <button class="btn btn-outline-secondary btn-lg custom_font" data-dismiss="modal" aria-hidden="true">Hủy</button>
                                    <asp:Button Text="Đăng ký" CssClass="btn btn-primary btn-lg float-right custom_font" ID="btnSignUp" runat="server" ValidationGroup="Register" OnClick="btnSignUp_Click" />
                                    <label id="lbStatus" style="color: red" runat="server"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <!--Đăng Nhập-->
        <div style="margin-top: -100px;" class="login">
            <h1 class="fc-center">
                <img src="/Admin/images/logo.png" width="200" />
            </h1>
            <input type="text" name="u" placeholder="Tên đăng nhập" required="required" id="login_login" runat="server" />
            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredLoginUsername" runat="server" ErrorMessage="Chưa nhập tài khoản!" ControlToValidate="login_login" ValidationGroup="Login" ForeColor="Red">
            </asp:RequiredFieldValidator>
            <input type="password" name="p" placeholder="Mật khẩu" required="required" id="login_pwd" runat="server" />
            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredLoginPassword" runat="server" ErrorMessage="Chưa nhập mật khẩu!" ControlToValidate="login_pwd" ValidationGroup="Login" ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:Button runat="server" class="btn btn-primary btn-block btn-large" ValidationGroup="Login" Text="Đăng nhập" ID="btnLogin" OnClick="btnLogin_Click" />
            <div id="usr_register" runat="server">
            <a href="#" data-toggle="modal" data-target="#DangKy">Đăng ký</a>
        </div>
        </div>
        <!--Đăng Nhập/END-->
        
    </form>
</body>
</html>
