<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Withdraw.aspx.cs" Inherits="Withdraw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="accountNo" runat="server" Text="Account NO"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="account" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="amount" runat="server" Text="Amount"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="amt" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="withdra" runat="server" OnClick="withdra_Click" Text="Withdraw" />
        <br />
        <br />
        <asp:Label ID="Res" runat="server"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
