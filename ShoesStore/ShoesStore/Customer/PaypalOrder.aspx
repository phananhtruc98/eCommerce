<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaypalOrder.aspx.cs" Inherits="ShoesStore.Customer.PaypalOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thanh Toan Paypal</title>
    <style type="text/css">
        body {
            background: #F5F5F5;
            text-align: center
        }
    </style>
    <script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
    <script>paypal.Buttons().render('body');</script>
</head>
<body <%--onload="document.paypal.submit()"--%>>
    <form action="<%:ConfigurationManager.AppSettings["urlSubmitPayment"] %>" method="post">
        <h1>Giỏ hàng của bạn đang được chuyển tới dịch vụ thanh toán Paypal</h1>
        <input type="image" src="../Images/Design/installation_progress.gif" name="submit" alt="Please wait..!" />
        <input type="hidden" name="cmd" value="_cart" />
        <input type="hidden" name="business" value="<%:ConfigurationManager.AppSettings["accountBusiness"] %>" />
        <input type="hidden" name="upload" value="1" />
        <input type="hidden" name="return" value="<%:ConfigurationManager.AppSettings["urlReturn"] %>"/>
    



        <asp:PlaceHolder ID="plHej" runat="server"></asp:PlaceHolder>
        <input style='float: right; margin-right: 80px;' type='image' name='submit'
            src='https://www.paypalobjects.com/webstatic/en_US/i/btn/png/blue-rect-paypalcheckout-60px.png'
            alt='PayPal - The safer, easier way to pay online' />
    </form>
</body>
</html>
