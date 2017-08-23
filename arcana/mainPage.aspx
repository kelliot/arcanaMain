<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="mainPage.aspx.cs" Inherits="arcana.mainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<telerik:RadTextBox ID="RadTextBox1" runat="server"></telerik:RadTextBox><telerik:RadButton ID="RadButton1" runat="server" Text="RadButton" OnClick="RadButton1_Click"></telerik:RadButton>
</asp:Content>

