<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_Mstr.aspx.cs" Inherits="ShoesStore.Admin.Login_Mstr" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="UTF-8">
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico"/>
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111"/>
<link rel="canonical" href="https://codepen.io/frytyler/pen/EGdtg"/>
<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="/Admin/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/Admin/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/Admin/vendors/css/vendor.bundle.addons.css">
<link rel="stylesheet" href="/Admin/css/logincss.css">
<head runat="server">
    <title></title>
</head>
<body>
<form runat="server">
    <div class="login">
        <h1 class="fc-center">
            <img src="/Admin/images/logo.png" width="200"/>
        </h1>
        <input type="text" name="u" placeholder="Tên đăng nhập" required="required" id="login_login" runat="server"/>
        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredLoginUsername" runat="server" ErrorMessage="Chưa nhập tài khoản!" ControlToValidate="login_login" ValidationGroup="Login" ForeColor="Red">
        </asp:RequiredFieldValidator>
        <input type="password" name="p" placeholder="Mật khẩu" required="required" id="login_pwd" runat="server"/>
        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredLoginPassword" runat="server" ErrorMessage="Chưa nhập mật khẩu!" ControlToValidate="login_pwd" ValidationGroup="Login" ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:Button runat="server" class="btn btn-primary btn-block btn-large" ValidationGroup="Login" Text="Đăng nhập" ID="btnLogin" OnClick="btnLogin_Click"/>
    </div>
</form>
</body>
</html>