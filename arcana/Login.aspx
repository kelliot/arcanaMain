<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="opticallwebsite.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadTextBox ID="txtusername" runat="server" EmptyMessage="enter username"></telerik:RadTextBox>
        <telerik:RadTextBox ID="txtpassword" runat="server" EmptyMessage="enter password"   TextMode="Password"></telerik:RadTextBox>
        <telerik:RadButton ID="RadLogin" runat="server" Text="Login" OnClick="RadLogin_Click"></telerik:RadButton> 
        <telerik:RadButton ID="RadCreateUser" runat="server" Text="Create Account" OnClick="RadCreateUser_Click"></telerik:RadButton>
        <asp:Label runat="server" Text="" BackColor="Red" Visible="false" ID="lblincorrect"></asp:Label>
    </div>
    </form>
</body>
</html>
