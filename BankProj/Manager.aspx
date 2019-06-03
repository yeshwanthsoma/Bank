<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label5" runat="server" Text="Manager"></asp:Label>
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="Withdraw"></asp:Label>
    
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="WIthdraw" />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Deposit"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Deposit" runat="server" OnClick="Deposit_Click" Text="Deposit" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Customer"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Customer" runat="server" OnClick="Customer_Click" Text="Customer" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Account"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Account" runat="server" OnClick="Account_Click" Text="Account" />
        <br />
    
    </div>
    </form>
</body>
</html>
