<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="ShoesStore.Customer.Test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Repeater Example</title>
    <script type="text/javascript">

        function X() {
            alert(123);
        }
        function HookUpControl(curObj, validatorClientID) {
            
            event.stopPropagation();
            var validationControl = document.getElementById(validatorClientID);
            validationControl.controltovalidate = curObj.id;
            validationControl.clientvalidationfunction = "validatetextbox";
            validationControl.validateemptytext = "true";
            ValidatorHookupControl(curObj, validationControl);


        }
        function validatetextbox(sender, args) {

            if (args.Value == "") {
                sender.errormessage = "<b>Required Field Missing</b><br />This is required.";
                sender.innerHTML = "<b>Required Field Missing</b><br />This is required.";
                args.IsValid = false;
                return;
            }

        }
    </script>
</head>
<body>
    <h3>Repeater Example</h3>
    <form id="form1" runat="server">

        <asp:TextBox runat="server" ID="txt1" />
        <asp:TextBox runat="server" ID="txt2" />
        <asp:TextBox runat="server" ID="txt3" />
        <asp:TextBox runat="server" ID="txt4" />
        <asp:CustomValidator runat="server" ID="CustomValidator1" />

    </form>
</body>
</html>
