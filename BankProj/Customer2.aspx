﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customer2.aspx.cs" Inherits="Customer2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="accountNo" runat="server" Text="AccountNo:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="account" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Fund Transfer"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="fundTransfer" runat="server" OnClick="fundTransfer_Click" Text="FundTransfer" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Mini Statement"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="miniStatement" runat="server" OnClick="miniStatement_Click" Text="Mini Statement" />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Change Password"></asp:Label>
        &nbsp;&nbsp;
        <asp:Button ID="changePassword" runat="server" Text="Change Password" OnClick="changePassword_Click" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Balance Enquiry"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="balanceEnquiry" runat="server" Text="Balance Enquiry" OnClick="balanceEnquiry_Click" />
        <br />
        <br />
        <asp:Label ID="Balance" runat="server"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
