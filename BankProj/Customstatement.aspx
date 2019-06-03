<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customstatement.aspx.cs" Inherits="Customstatement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 186px">
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Account no:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    </div>
        <p>
            <asp:Label ID="Label2" runat="server" Text="From Date:"></asp:Label>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </p>
        <asp:Label ID="Label3" runat="server" Text="To Date:"></asp:Label>
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        </p>
    </form>
</body>
</html>
