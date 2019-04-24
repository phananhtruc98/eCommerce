﻿<%@ Page Language="C#" AutoEventWireup="True" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Repeater Example</title>
    <script language="C#" runat="server">

        private void Page_Load(object Sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var values = new ArrayList();
                values.Add("Apple");
                values.Add("Orange");
                values.Add("Pear");
                values.Add("Banana");
                values.Add("Grape");
                Repeater1.DataSource = values;
                Repeater1.DataBind();
            }
        }

    </script>
</head>
<body>
<h3>Repeater Example</h3>
<form id="form1" runat="server">
    <asp:BulletedList ID="BulletedList1" runat="server">
    </asp:BulletedList>
    <b>Repeater1:</b>
    <br/>
    <asp:Repeater id="Repeater1" runat="server">
        <SeparatorTemplate>
            <tr>
                <td>
                    <b> ---------- </b> <br/>
                </td>
            </tr>
        </SeparatorTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Container.DataItem %> <br/>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:LoginName ID="LoginName1" runat="server"/>
    <br/>
</form>
</body>
</html>