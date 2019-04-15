<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Mstr.aspx.cs" Inherits="ShoesStore.Admin.Login_Mstr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/frytyler/pen/EGdtg" />

<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>
<script src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>
<link rel="stylesheet" href="/Admin/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/Admin/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/Admin/vendors/css/vendor.bundle.addons.css">
<link rel="stylesheet" href="/Admin/css/logincss.css">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="login">
        <h1 class="fc-center">
            <img src="images/logo.png" width="200" /></h1>
        <form runat="server">
            <input type="text" name="u" placeholder="Tên đăng nhập" required="required" id="login_login" runat="server" />
            <asp:RequiredFieldValidator
                Display="Dynamic"
                ID="RequiredLoginUsername"
                runat="server"
                ErrorMessage="Chưa nhập tài khoản!"
                ControlToValidate="login_login"
                ValidationGroup="Login"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <input type="password" name="p" placeholder="Mật khẩu" required="required" id="login_pwd" runat="server" />
            <asp:RequiredFieldValidator
                Display="Dynamic"
                ID="RequiredLoginPassword"
                runat="server"
                ErrorMessage="Chưa nhập mật khẩu!"
                ControlToValidate="login_pwd"
                ValidationGroup="Login"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
            <asp:Button runat="server" type="submit" class="btn btn-primary btn-block btn-large" ValidationGroup="Login" Text="Đăng nhập" ID="btnLogin" OnClick="btnLogin_Click" />
        </form>
    </div>
</body>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script />
</html>
